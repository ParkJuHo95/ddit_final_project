package kr.co.warebridge.rental.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.warebridge.vo.RoomVO;

@Service
public interface RoomService {
	
public List<RoomVO> retrieveRoomList(String empCmpId);
	
public RoomVO selectRoom(String roomCode);

public int insertRoom(RoomVO room);

public int changeRoom(RoomVO room);

public int removeRoom(String roomCode);
	

}
