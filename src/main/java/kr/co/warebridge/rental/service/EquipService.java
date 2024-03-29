package kr.co.warebridge.rental.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.warebridge.vo.CarVO;
import kr.co.warebridge.vo.EquipVO;
import kr.co.warebridge.vo.RoomVO;

@Service
public interface EquipService {
	
	public List<EquipVO> retrieveEquipList();
	
	public EquipVO selectEquip(String equipCode);
	
	public int removeEquip(String equipCode);
	
	public int insertEquip(EquipVO equip);
	
	public int modifyEquip(EquipVO equip);

}
