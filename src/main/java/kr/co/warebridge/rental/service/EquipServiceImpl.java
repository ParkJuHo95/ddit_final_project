package kr.co.warebridge.rental.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.warebridge.rental.dao.CarDAO;
import kr.co.warebridge.rental.dao.EquipDAO;
import kr.co.warebridge.vo.CarVO;
import kr.co.warebridge.vo.EquipVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EquipServiceImpl implements EquipService {

	private final EquipDAO dao;

	@Override
	public List<EquipVO> retrieveEquipList() {
		return dao.selectEquipList();
	}

	@Override
	public EquipVO selectEquip(String equipCode) {

		return dao.selectEquip(equipCode);
	}

	@Override
	public int removeEquip(String equipCode) {
		return dao.deleteEquip(equipCode);
	}

	@Override
	public int insertEquip(EquipVO equip) {
		return dao.createEquip(equip);
	}

	@Override
	public int modifyEquip(EquipVO equip) {
		return dao.updateEquip(equip);
	}

}
