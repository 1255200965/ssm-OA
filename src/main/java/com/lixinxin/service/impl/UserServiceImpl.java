package com.lixinxin.service.impl;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixinxin.mapper.UserMapper;
import com.lixinxin.pojo.dto.PageValue;
import com.lixinxin.pojo.po.User;
import com.lixinxin.pojo.vo.PageBean;
import com.lixinxin.service.IUserService;
@Service
public class UserServiceImpl implements IUserService{
	@Autowired
	private UserMapper mapper;
	@Override
	public User findByLogin(User user) {
		 User findUser= mapper.selectByLogin(user);		
		return findUser;
	}
	@Override
	public User updateEdit(User user) {
		int record = mapper.update(user);
		if(record>0){
			User findUser = mapper.selectById(user.getId());
			return findUser;
		}else{
			return null;
		}
	}
	@Override
	public List<User> findAllAcceptor(User user) {
		List<User> users = mapper.selectAll();
		List<User> userList=new LinkedList<>();
		for (User finduser : users) {
			if(finduser.getId()==user.getId()){
				continue;
			}
			userList.add(finduser);
		}
		return userList;
	}
	@Override
	public User findById(Integer id) {
		User findUser = mapper.selectById(id);
		return findUser;
	}
	@Override
	public PageBean<User> findAllCustomerByPage(Integer currentPageInt,Integer currentCount) {
		//封装查询对象
		User user=new User();
		user.setIsadmin(2);			
		Integer pageIndex = (currentPageInt - 1) * currentCount;
		PageValue<User> pageValue=new PageValue<>();
		pageValue.setData(user);
		pageValue.setCurrentCount(currentCount);
		pageValue.setPageIndex(pageIndex);
		List<User> userList= mapper.selectByPage(pageValue);		
		//封装返回对象
		PageBean<User> pageBean=new PageBean<>();
		Long count = mapper.selectCount(user);
		Integer  totalCount = count.intValue();
		double totalPageDouble = Math.ceil(totalCount * 1.0 / currentCount);
		Integer  totalPage = (int) totalPageDouble;
		pageBean.setCurrentCount(currentCount);
		pageBean.setCurrentPage(currentPageInt);
		pageBean.setPageData(userList);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}
	/*@Override
	public List<User> findAllCustomer() {
		User user=new User();
		user.setIsadmin(2);
		List<User> userList = mapper.selectByCondition(user);
		return userList;
	}*/
	@Override
	public int saveUser(User user) {
		user.setIsadmin(2);
		int record = mapper.insert(user);
		return record;
	}
	@Override
	public void deleteUser(User user) {
		mapper.deleteById(user.getId());
	}
	@Override
	public User findByUsername(String username) {
		User user=new User();
		user.setUsername(username);
		User findUser=mapper.selectByUserName(user);		
		return findUser;
	}
	

}
