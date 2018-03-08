package com.lixinxin.pojo.po;

public class Countwork {
	private Integer id;
	private Integer applyid;
	private Integer counttime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getApplyid() {
		return applyid;
	}
	public void setApplyid(Integer applyid) {
		this.applyid = applyid;
	}
	public Integer getCounttime() {
		return counttime;
	}
	public void setCounttime(Integer counttime) {
		this.counttime = counttime;
	}
	@Override
	public String toString() {
		return "Countwork [id=" + id + ", applyid=" + applyid + ", counttime=" + counttime + "]";
	}
	public Countwork() {
		super();
	}
	
	
}
