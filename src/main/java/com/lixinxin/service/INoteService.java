package com.lixinxin.service;

import java.util.List;
import com.lixinxin.pojo.po.Note;
import com.lixinxin.pojo.po.User;
import com.lixinxin.pojo.vo.PageBean;
public interface INoteService {
	public List<Note> findAllApplyNote(User user);
	public PageBean<Note> findAllApplyNoteByPage(User user,Integer currentPageInt,Integer currentCount);
	public void deleteNote(Note note);
	public List<User> findAllReviewer();
	public int saveNote(Note note);
	public List<Note> findAllReviewNote(User user);
	public PageBean<Note> findAllReviewNotebyPage(User user,Integer currentPageInt,Integer currentCount);
	public Note findNote(Note note);
	public int updateReviewYes(Note note);
	public int updateReviewNo(Note note);	
}
