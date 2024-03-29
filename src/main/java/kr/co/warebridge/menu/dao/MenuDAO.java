package kr.co.warebridge.menu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.MenuVO;

@Mapper
public interface MenuDAO {
	public List<MenuVO> selectMenuList();
}
