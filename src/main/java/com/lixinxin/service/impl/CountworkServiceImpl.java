package com.lixinxin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixinxin.mapper.CountworkMapper;
import com.lixinxin.pojo.po.Countwork;
import com.lixinxin.service.ICountworkService;
@Service
public class CountworkServiceImpl implements ICountworkService {
	@Autowired
	private CountworkMapper cmapper;
	@Override
	public Countwork findByAId(Integer applyid) {
		Countwork countwork = cmapper.selectByAId(applyid);
		return countwork;
	}

}
