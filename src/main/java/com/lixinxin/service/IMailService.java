package com.lixinxin.service;

import java.util.List;

import com.lixinxin.pojo.po.Mail;
import com.lixinxin.pojo.vo.PageBean;
public interface IMailService {
	public int insertMail(Mail mail);	
	public List<Mail> findAllRead(Integer aid);
	public PageBean<Mail> findAllReadByPage(Integer aid,Integer  currentPageInt,Integer currentCount);
	public List<Mail> findAllLitter(Integer aid);
	public PageBean<Mail> findAllLitterByPage(Integer aid,Integer  currentPageInt,Integer currentCount);
	public int removeMail(Mail mail);
	public int rebackMail(Mail mail);
	public void deleteMail(Mail mail);
	public Mail showDetail(Mail mail);
}
