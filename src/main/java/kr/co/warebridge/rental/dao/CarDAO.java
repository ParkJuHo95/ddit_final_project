package kr.co.warebridge.rental.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.CarVO;

@Mapper
public interface CarDAO {

	public List<CarVO> selectcarList(String empCmpId);

	public CarVO selectCar(String carCode);

	public int createCar(CarVO car);

	public int deleteCar(String carCode);

	public int updateCar(CarVO car);

}
