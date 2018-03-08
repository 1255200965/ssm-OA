package com.lixinxin.mapper;

import java.util.List;

import com.lixinxin.pojo.dto.PageValue;
import com.lixinxin.pojo.po.Mail;
import com.lixinxin.pojo.po.User;

public interface MailMapper {
	public Mail selectById(Integer id);
	public int insert(Mail mail);
	public List<Mail> selectByCondition(Mail mail);
	public List<Mail> selectByPage(PageValue<Mail> pageValue);
	public int update(Mail mail);
	public void deleteById(Integer id);
	public Long selectCount(Mail mail);
}
