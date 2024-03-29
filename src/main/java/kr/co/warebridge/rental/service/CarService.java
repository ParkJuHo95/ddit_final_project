package kr.co.warebridge.rental.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.warebridge.vo.CarVO;

@Service
public interface CarService {
	
	public List<CarVO> retrieveCarList(String mailGetter);
	
	public CarVO selectCar(String carCode);
	
	public int removeCar(String carCode);
	
	public int insertCar(CarVO car);
	
	public int modifyCar(CarVO car);

}
