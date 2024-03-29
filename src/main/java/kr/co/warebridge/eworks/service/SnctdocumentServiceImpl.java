package kr.co.warebridge.eworks.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.warebridge.admin.organization.dao.DepartmentSystemDAO;
import kr.co.warebridge.board.exception.BoardException;
import kr.co.warebridge.board.exception.ServiceException;
//import kr.co.warebridge.board.exception.ServiceException;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.eworks.dao.SnctdocumentDAO;
import kr.co.warebridge.eworks.dao.SnctlineNdetailDAO;
import kr.co.warebridge.eworks.dao.SnctstatusDAO;
import kr.co.warebridge.vo.SnctdetailVO;
import kr.co.warebridge.vo.SnctdocumentVO;
import kr.co.warebridge.vo.SnctformVO;
import kr.co.warebridge.vo.SnctlineVO;
import kr.co.warebridge.vo.SnctstatusVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class SnctdocumentServiceImpl implements SnctdocumentService {

	private final SnctdocumentDAO dao;
	private final SnctlineNdetailDAO ldDao;
	private final SnctstatusDAO ssDao;
	
	
	@Override
	public SnctdocumentVO retrieveNewDoc(SnctdocumentVO newDoc) {
		//SdcSfId 가지고 form setting
		String SdcSfId = newDoc.getSdcSfId();
		SnctformVO sf = dao.selectNewForm(SdcSfId);
		newDoc.setSnctform(sf);
		String empNo = newDoc.getSdcEmpNo();
		List<SnctlineVO> usedLines = ldDao.selectUsedSnctlines(empNo);
		//null이면 빈 List 담아주도록...?
		if (usedLines == null) {
			usedLines = new ArrayList<>();
	    }
		newDoc.setUsedSnctlines(usedLines);
		return newDoc;
	}

	@Override
	public SnctdocumentVO retrieveOne(String sdcId) {
		return dao.selectOne(sdcId);
	}

	@Override
	public List<SnctdocumentVO> retrieveMyList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectMyList(paging);
	}

	@Override
	public ServiceResult create(SnctdocumentVO sdc) {
		//1. 결재선 저장
		SnctlineVO sl = sdc.getSnctline();
		//1-1. 최초 사용하는 결재선
		//Snctdetails이 비어있지 않고 SlId가 비어있으면 사용한 적 없는 결재선, detail 내용을 insert 해줌
		if(!sl.getSnctdetails().isEmpty() && sl.getSlId().isEmpty()) { 
			//결재선Snctline insert, insert시 slId가 생성되고 VO의 setter에서 snctdetail의 sdcSlId도 같이 설정됨
			ldDao.insertLine(sl);
			sdc.setSdcSlId();//Snctline의 SlId를 가져와서 설정하도록 함(VO내부 > 파라미터 없을 때)
			//결재선sl에 들어있는 세부사항을 Snctdetail테이블에 insert
			List<SnctdetailVO> snctdetails = sl.getSnctdetails();
			for(SnctdetailVO detail : snctdetails) {
				ldDao.insertDetail(detail);
			}
		}
		
		if(sl.getSnctdetails().isEmpty()) throw new BoardException("결재선을 설정해주세요");
		
		//1-2. 사용한 적 있는 결재선
		//slId는 있고 Snctdetail은 비어있음 >> 그대로 저장하면 됨
		//2. 결재문서 저장(slId가 설정된 경우 slId를 포함하여 저장함)
		int cnt = dao.insert(sdc);
		
		//문서 상신인 경우(임시저장이 아님) Snctdetail을 Snctstatus에 저장함
		//	>> 결재권자의 문서함으로 조회할 수 있게 함
		if("N".equals(sdc.getSdcTempyn())) {
		//*****(미구현)1-2. 사용한 적 있는 결재선의 경우 Snctdetail은 비어있음 >> 해당하는 Snctdetail을 불러온다
			//상신된 결재선 snctstatus에 저장해줌 > snctstatus에 있는 순서대로 결재문서 가져올예정...
			sl.setSnctstatuses(sdc.getSdcId());//문서 insert시 생성된 snctdocumentId 넣어줘야함
			sl.getSnctstatuses().forEach(s -> {
			    if (sl.getSnctstatuses().indexOf(s) == 0) {
			        s.setSsStatus(0);
			    } else {
			        s.setSsStatus(1);
			    }
			    ssDao.insert(s);
			});
		}
		return cnt > 0 ?  ServiceResult.OK : ServiceResult.FAIL	;
	}

	@Override
	public ServiceResult remove(String sdcId) {
		int cnt = dao.delete(sdcId);
		return cnt > 0 ?  ServiceResult.OK : ServiceResult.FAIL	;
	}

	@Override
	public ServiceResult modify(SnctdocumentVO sdc) {
		int cnt = dao.update(sdc);
		return cnt > 0 ?  ServiceResult.OK : ServiceResult.FAIL	;
	}

	@Override
	public List<SnctdocumentVO> retrieveWaitingList(PaginationInfo paging) {
		int totalRecord = dao.selectWaitingListTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectWaitingList(paging);
	}
	
	public Map<String, String> approve(SnctstatusVO status, String approve, boolean arbit) {
		//Controller로 넘어올 때 ssSdtOrder와 ssStatus가 없어서 조회해옴
		//status : ssSdcId O, ssSlId X, ssSdtOrder X, ssEmpNo O, ssType X, ssSnctdat X, ssStatus X, ***ssRemark O
		//statusBefore : ssSdcId O, ***ssSlId O, ***ssSdtOrder O, ssEmpNo O, ssType O, ssSnctdat X, ***ssStatus O, ssRemark X
		Map<String, String> snctResult = new HashMap<>();
		SnctstatusVO statusBefore = ssDao.selectForAtrz(status);
		String pre = statusBefore.getSsStatus() == 0 ? "N": "Y"; //선결여부
		String post = "G".equals(statusBefore.getSsType()) ? "Y" : "N"; //후결인경우 Type G로 설정됨
		snctResult.put("pre", pre);
		snctResult.put("post", post);
		
		
		log.info("선결여부 체크 ======= statusBefore.getSsStatus() : {}, pre : {}, post : {}", statusBefore.getSsStatus(), pre, post);
		
		//4-0. 문서 결재 완료 처리를 위한 객체 생성
		SnctdocumentVO sdc = new SnctdocumentVO();
		String sdcId = status.getSsSdcId();
		snctResult.put("sdcId", sdcId);
		sdc.setSdcId(sdcId);
		sdc.setSdcResult(approve); //Y/N setting
		
		//1. 전 결재자 설정 : 선결인 경우만 해당
		if("Y".equalsIgnoreCase(pre)) {
			if("N".equals(approve)) { //선결, 반려
				int cnt = ssDao.setBeforeAtrzN(statusBefore);
				if(cnt < 1) {
					throw new ServiceException("후결(반려) 결재자 설정 안됨");
				}
			} else {
				//선결, 승인인 경우 동일 처리
				int cnt = ssDao.setBeforeAtrzY(statusBefore);
				if(cnt < 1) {
					throw new ServiceException("후결(승인) 결재자 설정 안됨");
				}
			}
		}
		
		//2. 본 결재자의 결재 처리
		//2-1. 경우에 수에 따른 결재타입 ssType 설정
		if("Y".equalsIgnoreCase(post)) status.setSsType("G"); //후결
		else {
			if("N".equalsIgnoreCase(pre)) {
				if("Y".equals(approve) && !arbit) status.setSsType("A"); //선결X 전결X 승인
				else if("N".equals(approve)) status.setSsType("B"); //선결X 전결X 반려
				else status.setSsType("C"); //선결X 전결O (승인)
			} else if("Y".equalsIgnoreCase(pre)) {
				if("Y".equals(approve) && !arbit) status.setSsType("D"); //선결O 전결X 승인
				else if("N".equals(approve)) status.setSsType("E"); //선결O 전결X 반려
				else status.setSsType("F"); //선결O 전결O 승인
			}
		}
		//snctstatus insert
		//status : ssSdcId O, ssSlId X, ssSdtOrder X, ssEmpNo O, ssType O, ssSnctdat O, ssStatus O(2), ssRemark O
		//statusBefore : ssSdcId O, ssSlId O, ssSdtOrder O, ssEmpNo O, ssType O/X, ssSnctdat X, ssStatus O, ssRemark X
		int cnt = ssDao.approve(status);
		if(cnt < 1) {
			throw new ServiceException(String.format("사번 %s 결재 처리 안됨", status.getSsSdcId()));
		}
		
		//3. 후순위 결재자의 처리 >> 승인 > 전결O/X, 반려 
		//후결인 경우 후순위 결재자 처리 및 문서 전체 처리 필요없음
		if("N".equalsIgnoreCase(post)) {
			SnctstatusVO next = ssDao.selectNextAtrz(statusBefore);
			//3-1. 전결이 아닌 승인인 경우 다음 결재자를 순서로 지정해주고 알림 보내줌
			if("Y".equals(approve)){
				if(!arbit) {
					if(next != null && next.getSsEmpNo() != null) { //다음 순서 결재자가 있는 경우
						String nextEmpNo = next.getSsEmpNo(); 
						/**
						 * 일단 사번만 받아옴,
						 * 알림 보내는 로직 추가 예정
						 */
						snctResult.put("receiver", nextEmpNo);
						snctResult.put("message", "결재문서가 도착했습니다.");
						//다음 결재자의 결재상태(ssStatus)를 0으로 바꿔준다
						cnt = ssDao.setNextAtrz(next);
						if(cnt < 1) {
							throw new ServiceException(String.format("사번 %s 다음 결재자로 등록 안됨", status.getSsEmpNo()));
						}
					}else { //4-1. 다음 결재자가 없는 경우 문서 완료 처리 해줌
						cnt = dao.complete(sdc);
						SnctdocumentVO completeSdc = dao.selectAfter(sdcId);
						snctResult.put("receiver", completeSdc.getSdcEmpNo());
						snctResult.put("message", completeSdc.getSdcTitle()+" 문서가 승인되었습니다.");
					}
				}else if(arbit){
					cnt = ssDao.setNextAtrzForArbit(statusBefore);
					if(cnt < 1) {
						throw new ServiceException(String.format("다음 결재자 전결 승인처리 실패", status.getSsSdcId()));
					}
				}
			}else { //반려인 경우
				if(next != null && next.getSsEmpNo() != null) {
					cnt = ssDao.setNextAtrzN(statusBefore);
					if(cnt < 1) {
						throw new ServiceException(String.format("다음 결재자 반려 처리 실패", status.getSsSdcId()));
					}
				}
			}
			
			//4. 문서 전체 처리
			//후결 결재는 문서 처리 필요없음, 전결 아닌 일반 승인은 문서 처리 완료함
			//4-2. 전결
			if(arbit) {
				cnt = dao.complete(sdc);
				SnctdocumentVO completeSdc = dao.selectAfter(sdcId);
				snctResult.put("receiver", completeSdc.getSdcEmpNo());
				snctResult.put("message", completeSdc.getSdcTitle()+" 문서가 승인되었습니다.");
			//4-3. 반려
			}else if("N".equals(sdc.getSdcResult())) {
				cnt = dao.reject(sdc);
				SnctdocumentVO rejectedSdc = dao.selectAfter(sdcId);
				snctResult.put("receiver", rejectedSdc.getSdcEmpNo());
				snctResult.put("message", rejectedSdc.getSdcTitle()+" 문서가 반려되었습니다.");
			}
		}
		return snctResult;
	}
}
