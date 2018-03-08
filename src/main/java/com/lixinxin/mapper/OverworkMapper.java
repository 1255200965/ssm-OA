package com.lixinxin.mapper;

import java.util.List;
import com.lixinxin.pojo.po.Overwork;
public interface OverworkMapper {
	public List<Overwork>  selectAllApplyOverwork(Integer applyid);
	public void deleteById(Integer id);
	public int insert(Overwork overwork);
	public List<Overwork> selectAllReviewOverwork(Integer reviewid);
	public Overwork  selectById(Integer id);
	public int update(Overwork overwork);
	
}
