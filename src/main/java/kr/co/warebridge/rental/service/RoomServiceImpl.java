package kr.co.warebridge.rental.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.warebridge.rental.dao.RoomDAO;
import kr.co.warebridge.vo.RoomVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RoomServiceImpl implements RoomService {

	private final RoomDAO dao;

	@Override
	public List<RoomVO> retrieveRoomList(String empCmpId) {
		return dao.selectRoomList(empCmpId);
	}

	@Override
	public RoomVO selectRoom(String roomCode) {
		return dao.selectRoom(roomCode);
	}

	@Override
	public int insertRoom(RoomVO room) {
		return dao.createRoom(room);
	}

	@Override
	public int changeRoom(RoomVO room) {
		return dao.updateRoom(room);
	}

	@Override
	public int removeRoom(String roomCode) {
		
		return dao.deleteRoom(roomCode);
	}
}
