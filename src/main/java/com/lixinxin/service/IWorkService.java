package com.lixinxin.service;
import java.util.List;

import com.lixinxin.pojo.po.User;
import com.lixinxin.pojo.po.Work;
public interface IWorkService {
	public Work findWorkByDate(User user);	
	public int saveWork(User user);
	public int updateWork(Work work);
	public List<Work> findAllApplyWork(User user);
	public List<Work> findAllWork();
}
