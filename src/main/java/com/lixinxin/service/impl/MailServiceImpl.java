package com.lixinxin.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixinxin.mapper.MailMapper;
import com.lixinxin.pojo.dto.PageValue;
import com.lixinxin.pojo.po.Mail;
import com.lixinxin.pojo.vo.PageBean;
import com.lixinxin.service.IMailService;

@Service
public class MailServiceImpl implements IMailService {
	@Autowired
	private MailMapper mapper;

	@Override
	public int insertMail(Mail mail) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time = sdf.format(date);
		mail.setTime(time);
		int record = mapper.insert(mail);
		return record;
	}

	@Override
	public List<Mail> findAllRead(Integer aid) {
		Mail mail = new Mail();
		mail.setAccepterid(aid);
		mail.setIslitter(2);
		List<Mail> mailList = mapper.selectByCondition(mail);
		return mailList;
	}

	@Override
	public PageBean<Mail> findAllReadByPage(Integer aid, Integer currentPageInt, Integer currentCount) {
		// 封装查询对象
		Mail mail = new Mail();
		mail.setAccepterid(aid);
		mail.setIslitter(2);
		Integer pageIndex = (currentPageInt - 1) * currentCount;
		PageValue<Mail> pageValue = new PageValue<>();
		pageValue.setData(mail);
		pageValue.setCurrentCount(currentCount);
		pageValue.setPageIndex(pageIndex);		
		List<Mail> mailList = mapper.selectByPage(pageValue);
		// 封装返回对象
		PageBean<Mail> pageBean = new PageBean<>();
		Long count = mapper.selectCount(mail);
		Integer totalCount = count.intValue();
		double totalPageDouble = Math.ceil(totalCount * 1.0 / currentCount);
		Integer totalPage = (int) totalPageDouble;
		pageBean.setCurrentCount(currentCount);
		pageBean.setCurrentPage(currentPageInt);
		pageBean.setPageData(mailList);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		return pageBean;		
	}

	@Override
	public int removeMail(Mail mail) {
		mail.setIslitter(1);
		int record = mapper.update(mail);
		return record;
	}

	@Override
	public Mail showDetail(Mail mail) {
		mail.setIsread(1);
		int record = mapper.update(mail);
		Mail findMail = null;
		if (record > 0) {
			findMail = mapper.selectById(mail.getId());

		}
		return findMail;
	}

	@Override
	public List<Mail> findAllLitter(Integer aid) {
		Mail mail = new Mail();
		mail.setAccepterid(aid);
		mail.setIslitter(1);
		List<Mail> mailList = mapper.selectByCondition(mail);
		return mailList;
	}	
	@Override
	public PageBean<Mail> findAllLitterByPage(Integer aid, Integer currentPageInt, Integer currentCount) {
		// 封装查询对象
		Mail mail = new Mail();
		mail.setAccepterid(aid);
		mail.setIslitter(1);
		Integer pageIndex = (currentPageInt - 1) * currentCount;
		PageValue<Mail> pageValue = new PageValue<>();
		pageValue.setData(mail);
		pageValue.setCurrentCount(currentCount);
		pageValue.setPageIndex(pageIndex);		
		List<Mail> mailList = mapper.selectByPage(pageValue);
		// 封装返回对象
		PageBean<Mail> pageBean = new PageBean<>();
		Long count = mapper.selectCount(mail);
		Integer totalCount = count.intValue();
		double totalPageDouble = Math.ceil(totalCount * 1.0 / currentCount);
		Integer totalPage = (int) totalPageDouble;
		pageBean.setCurrentCount(currentCount);
		pageBean.setCurrentPage(currentPageInt);
		pageBean.setPageData(mailList);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		return pageBean;		
	}

	@Override
	public int rebackMail(Mail mail) {
		mail.setIslitter(2);
		int record = mapper.update(mail);
		return record;
	}

	@Override
	public void deleteMail(Mail mail) {
		mapper.deleteById(mail.getId());
	}

}
