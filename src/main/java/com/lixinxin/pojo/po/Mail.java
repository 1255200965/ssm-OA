package com.lixinxin.pojo.po;

public class Mail {
private Integer id;
private Integer senderid;
private Integer accepterid;
private String subject;
private String context;
private String file;
private Integer isread;
private String time;
private Integer islitter;
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public Integer getSenderid() {
	return senderid;
}
public void setSenderid(Integer senderid) {
	this.senderid = senderid;
}
public Integer getAccepterid() {
	return accepterid;
}
public void setAccepterid(Integer accepterid) {
	this.accepterid = accepterid;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getContext() {
	return context;
}
public void setContext(String context) {
	this.context = context;
}
public String getFile() {
	return file;
}
public void setFile(String file) {
	this.file = file;
}
public Integer getIsread() {
	return isread;
}
public void setIsread(Integer isread) {
	this.isread = isread;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public Integer getIslitter() {
	return islitter;
}
public void setIslitter(Integer islitter) {
	this.islitter = islitter;
}
@Override
public String toString() {
	return "Mail [id=" + id + ", senderid=" + senderid + ", accepterid=" + accepterid + ", subject=" + subject
			+ ", context=" + context + ", file=" + file + ", isread=" + isread + ", time=" + time + ", islitter="
			+ islitter + "]";
}
public Mail() {
	super();
}

}
