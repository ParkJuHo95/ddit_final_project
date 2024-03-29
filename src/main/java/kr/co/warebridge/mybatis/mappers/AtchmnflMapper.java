package kr.co.warebridge.mybatis.mappers;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.AtchmnflVO;

@Mapper
public interface AtchmnflMapper{
	public int insertAttatch(AtchmnflVO attatch);
	public AtchmnflVO selectAttatch(int attNo);
	public int deleteAttatch(int attNo);
}
