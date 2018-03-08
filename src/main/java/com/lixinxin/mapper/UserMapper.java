package com.lixinxin.mapper;

import java.util.List;

import com.lixinxin.pojo.dto.PageValue;
import com.lixinxin.pojo.po.User;

public interface UserMapper {
	public int update(User user);
	public User selectById(Integer id);
	public User selectByUserName(User user);
	public User selectByLogin(User user);
	public List<User> selectAll();
	public List<User> selectByCondition(User user);
	public int insert(User user);
	public void deleteById(Integer id);
	public Long selectCount(User user);
	public List<User> selectByPage(PageValue<User> pageValue);
}
