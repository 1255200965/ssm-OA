package com.lixinxin.service;

import java.util.List;

import com.lixinxin.pojo.po.Overwork;
import com.lixinxin.pojo.po.User;
public interface IOverworkService {
	public List<Overwork> findAllApplyOverwork(User user);
	public void deleteOverwork(Overwork overwork);
	public List<User> findAllReviewer();
	public int saveOverwork(Overwork overwork);
	public List<Overwork> findAllReviewOverwork(User user);
	public Overwork findOverwork(Overwork overwork);
	public int updateReviewYes(Overwork overwork);
	public int updateReviewNo(Overwork overwork);
}
