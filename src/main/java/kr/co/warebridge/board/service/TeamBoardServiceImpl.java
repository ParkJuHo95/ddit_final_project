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
import kr.co.warebridge.mybatis.mappers.TeamBoardMapper;
import kr.co.warebridge.vo.AtchmnflVO;
import kr.co.warebridge.vo.TeamBoardVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class TeamBoardServiceImpl implements TeamBoardService {
	
	@Inject
	private TeamBoardMapper mapper;
	
	@Inject
	private AtchmnflMapper atchMapper;
	@Value("#{appInfo.boPath}")
	private Resource boPath;

	private void processBoFiles(TeamBoardVO board) {
		MultipartFile[] boFiles = board.getBoFiles();
		if(boFiles==null) return;
		for(MultipartFile single : boFiles) {
			if(single.isEmpty()) continue;
			// 파일 메타데이터 저장
			AtchmnflVO atch = new AtchmnflVO(single);
			atch.setAtchCbNo(board.getTbSeq());
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
	public List<TeamBoardVO> retrieveBoardList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectList(paging);
	}

	@Override
	public TeamBoardVO retrieveBoard(int tbNo) {
		mapper.boardView(tbNo);
		TeamBoardVO board = mapper.select(tbNo);
		if(board==null)
			throw new BoardException(String.format("%d 번 글 없음.", tbNo));
		log.info("---------------board:{}",board);
		return board;
	}

	@Override
	public void createBoard(TeamBoardVO cmdObj) {
		TeamBoardVO vo = mapper.seqNext();
		log.info("-----------------------------vo : {}",vo);
		int tbSeq = vo.getTbSeq();
		cmdObj.setTbSeq(tbSeq);
		mapper.insert(cmdObj);
		processBoFiles(cmdObj);
		log.info("-----------------------------cnt : {}",cmdObj);
	}

	@Override
	public void modifyBoard(TeamBoardVO board) {
		mapper.update(board);
		processBoFiles(board);
		
	}

	@Override
	public void removeBoard(TeamBoardVO board) {
		TeamBoardVO saved = mapper.select(board.getTbNo());
		int cnt = mapper.delete(board.getTbNo());
		saved.getAttatchList().forEach(a->removeAttatch(a.getAtchNo()));
		mapper.delete(board.getTbNo());
		
	}

	@Override
	public void registerNotice(int tbNo) {
	    try {
	        TeamBoardVO board = mapper.select(tbNo);

	        if (board == null) {
	            throw new BoardException(String.format("%d 번 글 없음.", tbNo));
	        }

	        board.setTbNotice("Y"); // "y"로 변경하여 공지 등록
	        mapper.update(board);
	    } catch (Exception e) {
	        log.info("공지 등록 실패", e);
	        throw new BoardException("공지 등록 실패");
	    }
	}

	@Override
	public void unregisterNotice(int tbNo) {
	    try {
	        TeamBoardVO board = mapper.select(tbNo);

	        if (board == null) {
	        }

	        board.setTbNotice("N"); // "n"으로 변경하여 공지 해제
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
	

}
