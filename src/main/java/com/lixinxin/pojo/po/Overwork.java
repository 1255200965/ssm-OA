package com.lixinxin.pojo.po;

public class Overwork {
	private Integer id;
	private String begintime;
	private String endtime;
	private String time;
	private Integer isreview;
	private String cause;
	private User apply;
	private User reviewer;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getIsreview() {
		return isreview;
	}
	public void setIsreview(Integer isreview) {
		this.isreview = isreview;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public User getApply() {
		return apply;
	}
	public void setApply(User apply) {
		this.apply = apply;
	}
	public User getReviewer() {
		return reviewer;
	}
	public void setReviewer(User reviewer) {
		this.reviewer = reviewer;
	}
	@Override
	public String toString() {
		return "OverWork [id=" + id + ", begintime=" + begintime + ", endtime=" + endtime + ", time=" + time
				+ ", isreview=" + isreview + ", cause=" + cause + ", apply=" + apply + ", reviewer=" + reviewer + "]";
	}
	public Overwork() {
		super();
	}	
}
