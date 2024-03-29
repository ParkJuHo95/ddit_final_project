package kr.co.warebridge.news.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.warebridge.vo.NewsVO;

@Mapper
public interface NewsDAO {
	
	public NewsVO selectNews(@Param("addr") String addr,@Param("age") String age, @Param("gender") String gender);
}
