package com.lixinxin.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixinxin.mapper.WorkMapper;
import com.lixinxin.pojo.po.User;
import com.lixinxin.pojo.po.Work;
import com.lixinxin.service.IWorkService;

@Service
public class WorkServiceImpl implements IWorkService {
	@Autowired
	private WorkMapper wmapper;
	@Override
	public Work findWorkByDate(User user) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date currentdate=new Date();
		String date= sdf.format(currentdate);
		Work work=new Work();
		work.setDate(date);
		work.setApply(user);
		Work findWork= wmapper.selectByDate(work);		
		return findWork;
	}
	@Override
	public int saveWork(User user) {
		SimpleDateFormat sdfdate=new SimpleDateFormat("yyyy-MM-dd");
		Date currentdate=new Date();
		String date=sdfdate.format(currentdate);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String begintime = sdf.format(currentdate);
		Work work=new Work();
		work.setDate(date);
		work.setApply(user);
		work.setBegintime(begintime);
		int record = wmapper.insert(work);
		return record;
	}
	@Override
	public int updateWork(Work work) {
		Date end=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String endtime = sdf.format(end);
		String begintime = work.getBegintime();
		Double time=null;
		try {
			Date begin = sdf.parse(begintime);
			long beginwork = begin.getTime();
			long endwork = end.getTime();
			time=(double) ((endwork-beginwork)/(1000*60*60));		
		} catch (ParseException e) {
			e.printStackTrace();
		}
		work.setEndtime(endtime);
		work.setTime(time.toString());
		int record = wmapper.update(work);		
		return record;
	}
	@Override
	public List<Work> findAllApplyWork(User user) {
		Work work=new Work();
		work.setApply(user);		
		List<Work> workList = wmapper.selectByCondition(work);
		return workList;
	}
	@Override
	public List<Work> findAllWork() {		
		List<Work> workList = wmapper.selectAll();
		return workList;
	}
	

}
