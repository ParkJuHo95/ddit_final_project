package kr.co.warebridge.mybatis.mappers;

import java.util.List;

import kr.co.warebridge.common.paging.PaginationInfo;



public interface AbstractCommonMapper<T,P> {
	public T seqNext();
	public int insert(T newData);
	public T select(P pk);
	public int selectTotalRecord(PaginationInfo paging);
	public List<T> selectList(PaginationInfo paging);
	public int update(T target);
	public int delete(P pk);
}
