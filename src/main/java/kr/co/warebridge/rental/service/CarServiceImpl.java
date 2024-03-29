package kr.co.warebridge.rental.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.warebridge.rental.dao.CarDAO;
import kr.co.warebridge.vo.CarVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CarServiceImpl implements CarService {
	
	private final CarDAO dao;

	@Override
	public List<CarVO> retrieveCarList(String empCmpId) {
		return dao.selectcarList(empCmpId);
	}

	@Override
	public CarVO selectCar(String carCode) {
		return dao.selectCar(carCode);
	}

	@Override
	public int removeCar(String carCode) {
	
		return dao.deleteCar(carCode);
	}

	@Override
	public int insertCar(CarVO car) {
		return dao.createCar(car);
	}

	@Override
	public int modifyCar(CarVO car) {
		return dao.updateCar(car);
	}



}
