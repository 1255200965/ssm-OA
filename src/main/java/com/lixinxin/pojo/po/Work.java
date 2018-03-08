package com.lixinxin.pojo.po;

public class Work {
	private Integer id;
	private String begintime;
	private String endtime;
	private String  time;	
	private String date;
	private User apply;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public User getApply() {
		return apply;
	}
	public void setApply(User apply) {
		this.apply = apply;
	}
	public Work() {
		super();
	}
	@Override
	public String toString() {
		return "Work [id=" + id + ", begintime=" + begintime + ", endtime=" + endtime + ", time=" + time + ", date="
				+ date + ", apply=" + apply + "]";
	}
	
	
}
