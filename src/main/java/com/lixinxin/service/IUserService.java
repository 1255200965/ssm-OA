package com.lixinxin.service;

import java.util.List;

import com.lixinxin.pojo.po.User;
import com.lixinxin.pojo.vo.PageBean;

public interface IUserService {
	public User findByLogin(User user);
	public User findByUsername(String username);
	public User updateEdit(User user);
	public List<User> findAllAcceptor(User user);
	public User findById(Integer id);
	public PageBean<User> findAllCustomerByPage(Integer  currentPageInt,Integer currentCount);
	public int saveUser(User user);
	public void deleteUser(User user);
}
