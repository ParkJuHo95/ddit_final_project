package kr.co.warebridge.rental.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.RoomVO;

@Mapper
public interface RoomDAO {
	
	public List<RoomVO> selectRoomList(String empCmpId);
	
	public RoomVO selectRoom(String roomCode);
	
	public int createRoom(RoomVO room);
	
	public int deleteRoom(String roomCode);
	
	public int updateRoom(RoomVO room);
	
}
