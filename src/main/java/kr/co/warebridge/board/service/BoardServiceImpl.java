package kr.co.warebridge.board.service;

import java.io.File;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.warebridge.board.exception.BoardException;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.mybatis.mappers.AtchmnflMapper;
import kr.co.warebridge.mybatis.mappers.CompanyBoardMapper;
import kr.co.warebridge.vo.AtchmnflVO;
import kr.co.warebridge.vo.CompanyBoardVO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private CompanyBoardMapper mapper;
	
	@Inject
	private AtchmnflMapper atchMapper;
	@Value("#{appInfo.boPath}")
	private Resource boPath;

	private void processBoFiles(CompanyBoardVO board) {
		MultipartFile[] boFiles = board.getBoFiles();
		if(boFiles==null) return;
		for(MultipartFile single : boFiles) {
			if(single.isEmpty()) continue;
			// 파일 메타데이터 저장
			AtchmnflVO atch = new AtchmnflVO(single);
			atch.setAtchCbNo(board.getCbSeq());
			atchMapper.insertAttatch(atch);
			// 파일 이진데이터 저장
			String saveName = atch.getAtchSavename();
			try {
				File saveFile = boPath.createRelative(saveName).getFile();
				FileUtils.copyInputStreamToFile(single.getInputStream(), saveFile);
			}catch (IOException e) {
				throw new UncheckedIOException(e);
			}
		}
	}
	
	@Override
	public List<CompanyBoardVO> retrieveBoardList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectList(paging);
	}

	@Override
	public CompanyBoardVO retrieveBoard(int cbNo) {
		mapper.boardView(cbNo);
		CompanyBoardVO board = mapper.select(cbNo);
		if(board==null)
			throw new BoardException(String.format("%d 번 글 없음.", cbNo));
		log.info("---------------board:{}",board);
		return board;
	}

	@Override
	public void createBoard(CompanyBoardVO cmdObj) {
		CompanyBoardVO vo = mapper.seqNext();
		log.info("-----------------------------vo : {}",vo);
		int cbSeq = vo.getCbSeq();
		cmdObj.setCbSeq(cbSeq);
		mapper.insert(cmdObj);
		processBoFiles(cmdObj);
		log.info("-----------------------------cnt : {}",cmdObj);
	}

	@Override
	public void modifyBoard(CompanyBoardVO board) {
		mapper.update(board);
		processBoFiles(board);
		
	}

	@Override
	public void removeBoard(CompanyBoardVO board) {
		CompanyBoardVO saved = mapper.select(board.getCbNo());
		int cnt = mapper.delete(board.getCbNo());
		saved.getAttatchList().forEach(a->removeAttatch(a.getAtchNo()));
		mapper.delete(board.getCbNo());
		
	}

	@Override
	public void registerNotice(int cbNo) {
	    try {
	        CompanyBoardVO board = mapper.select(cbNo);

	        if (board == null) {
	            throw new BoardException(String.format("%d 번 글 없음.", cbNo));
	        }

	        board.setCbNotice("Y"); // "y"로 변경하여 공지 등록
	        mapper.update(board);
	    } catch (Exception e) {
	        log.info("공지 등록 실패", e);
	        throw new BoardException("공지 등록 실패");
	    }
	}

	@Override
	public void unregisterNotice(int cbNo) {
	    try {
	        CompanyBoardVO board = mapper.select(cbNo);

	        if (board == null) {
	            throw new BoardException(String.format("%d 번 글 없음.", cbNo));
	        }

	        board.setCbNotice("N"); // "n"으로 변경하여 공지 해제
	        mapper.update(board);
	    } catch (Exception e) {
	        log.info("공지 해제 실패", e);
	        throw new BoardException("공지 해제 실패");
	    }
	}

	@Override
	public AtchmnflVO downloadAttatch(int atchNo) {
		AtchmnflVO atch = atchMapper.selectAttatch(atchNo);
		if(atch==null)
			throw new BoardException("파일 없음.");
		return atch;
	}

	@Override
	public void removeAttatch(int atchNo) {
		AtchmnflVO saved = atchMapper.selectAttatch(atchNo);
		atchMapper.deleteAttatch(atchNo);
		deleteBinary(saved);
		
	}
	private void deleteBinary(AtchmnflVO atch){
		Resource savedBinary;
		try {
			savedBinary = boPath.createRelative(atch.getAtchSavename());
			if(savedBinary.exists())
				FileUtils.deleteQuietly(savedBinary.getFile());
		} catch (IOException e) {
			throw new UncheckedIOException(e);
		}
	}
	
	public List<CompanyBoardVO> retrieveNoticeList(EmployeeVO realUser){
		return mapper.selectNoticeList(realUser);
	}

}
