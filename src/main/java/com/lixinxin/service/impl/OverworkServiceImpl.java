package com.lixinxin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixinxin.mapper.CountworkMapper;
import com.lixinxin.mapper.OverworkMapper;
import com.lixinxin.mapper.UserMapper;
import com.lixinxin.pojo.po.Countwork;
import com.lixinxin.pojo.po.Overwork;
import com.lixinxin.pojo.po.User;
import com.lixinxin.service.IOverworkService;

@Service
public class OverworkServiceImpl implements IOverworkService {
	@Autowired
	private OverworkMapper omapper;
	@Autowired
	private UserMapper umapper;
	@Autowired
	private CountworkMapper cmapper;
	@Override
	public List<Overwork> findAllApplyOverwork(User user) {
		 List<Overwork> overworkList = omapper.selectAllApplyOverwork(user.getId());
		return overworkList;
	}
	@Override
	public void deleteOverwork(Overwork overwork) {
		omapper.deleteById(overwork.getId());
	}
	@Override
	public List<User> findAllReviewer() {
		User user = new User();
		user.setIsadmin(1);
		List<User> userList = umapper.selectByCondition(user);
		return userList;
	}

	@Override
	public int saveOverwork(Overwork overwork) {
		overwork.setIsreview(2);
		int record = omapper.insert(overwork);
		return record;
	}

	@Override
	public List<Overwork> findAllReviewOverwork(User user) {
		List<Overwork> overworkList = omapper.selectAllReviewOverwork(user.getId());
		return overworkList;
	}

	@Override
	public Overwork findOverwork(Overwork overwork) {
		Overwork findOverwork = omapper.selectById(overwork.getId());
		return findOverwork;
	}

	@Override
	public int updateReviewYes(Overwork overwork) {
		overwork.setIsreview(1);		
		int record = omapper.update(overwork);
		overwork= omapper.selectById(overwork.getId());
		Countwork findCountwork = cmapper.selectByAId(overwork.getApply().getId());
		if(findCountwork!=null){
			Integer oldtime= findCountwork.getCounttime();
			Integer newtime=Integer.parseInt(overwork.getTime());
			findCountwork.setCounttime(oldtime+newtime);
			cmapper.update(findCountwork);
		}
		else{
			Countwork countwork =new Countwork();
			countwork.setApplyid(overwork.getApply().getId());
			countwork.setCounttime(Integer.parseInt(overwork.getTime()));
			cmapper.insert(countwork);
		}
		return record;
	}

	@Override
	public int updateReviewNo(Overwork overwork) {
		overwork.setIsreview(3);
		int record = omapper.update(overwork);
		return record;
	}

}
