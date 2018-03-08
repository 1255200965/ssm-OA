package com.lixinxin.mapper;

import java.util.List;
import com.lixinxin.pojo.po.Work;
public interface WorkMapper {
	public List<Work>  selectByCondition(Work work);
	public List<Work> selectAll();
	public Work selectByDate(Work work);
	public int insert(Work work);
	public int update(Work work);
}
