package com.lixinxin.mapper;


import com.lixinxin.pojo.po.Countwork;
public interface CountworkMapper {
	public Countwork selectByAId(Integer applyid);
	public int insert(Countwork countwork);
	public int update(Countwork countwork);
	
}
