package com.lixinxin.pojo.dto;

public class PageValue<T> {
	private Integer  pageIndex;
	private Integer currentCount;
	private T data;
	
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public Integer getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(Integer currentCount) {
		this.currentCount = currentCount;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "PageValue [pageIndex=" + pageIndex + ", currentCount=" + currentCount + ", data=" + data + "]";
	}
	public PageValue() {
		super();
	}
	
	
}
