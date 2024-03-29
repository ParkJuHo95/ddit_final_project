package kr.co.warebridge.rental.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.EquipVO;

@Mapper
public interface EquipDAO {

	public List<EquipVO> selectEquipList();

	public EquipVO selectEquip(String equipCode);

	public int createEquip(EquipVO equip);

	public int deleteEquip(String equipCode);

	public int updateEquip(EquipVO equip);

}
