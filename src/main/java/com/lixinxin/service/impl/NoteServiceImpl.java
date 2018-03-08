package com.lixinxin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lixinxin.mapper.NoteMapper;
import com.lixinxin.mapper.UserMapper;
import com.lixinxin.pojo.dto.PageValue;
import com.lixinxin.pojo.po.Note;
import com.lixinxin.pojo.po.User;
import com.lixinxin.pojo.vo.PageBean;
import com.lixinxin.service.INoteService;

@Service
public class NoteServiceImpl implements INoteService {
	@Autowired
	private NoteMapper nmapper;
	@Autowired
	private UserMapper umapper;

	@Override
	public List<Note> findAllApplyNote(User user) {
		List<Note> noteList = nmapper.selectAllApplyNote(user.getId());
		return noteList;
	}

	@Override
	public PageBean<Note> findAllApplyNoteByPage(User user, Integer currentPageInt, Integer currentCount) {
		// 封装查询对象
		Integer pageIndex = (currentPageInt - 1) * currentCount;
		PageValue<User> pageValue = new PageValue<>();
		pageValue.setData(user);
		pageValue.setCurrentCount(currentCount);
		pageValue.setPageIndex(pageIndex);
		List<Note> noteList = nmapper.selectAllApplyNoteByPage(pageValue);
		// 封装返回对象
		PageBean<Note> pageBean = new PageBean<>();
		List<Note> notes = nmapper.selectAllApplyNote(user.getId());
		Integer totalCount = notes.size();
		double totalPageDouble = Math.ceil(totalCount * 1.0 / currentCount);
		Integer totalPage = (int) totalPageDouble;
		pageBean.setCurrentCount(currentCount);
		pageBean.setCurrentPage(currentPageInt);
		pageBean.setPageData(noteList);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	@Override
	public void deleteNote(Note note) {
		nmapper.deleteById(note.getId());
	}

	@Override
	public List<User> findAllReviewer() {
		User user = new User();
		user.setIsadmin(1);
		List<User> userList = umapper.selectByCondition(user);
		return userList;
	}

	@Override
	public int saveNote(Note note) {
		note.setIsreview(2);
		int record = nmapper.insert(note);
		return record;
	}

	@Override
	public List<Note> findAllReviewNote(User user) {
		List<Note> noteList = nmapper.selectAllReviewNote(user.getId());
		return noteList;
	}

	@Override
	public PageBean<Note> findAllReviewNotebyPage(User user, Integer currentPageInt, Integer currentCount) {
		// 封装查询对象
		Integer pageIndex = (currentPageInt - 1) * currentCount;
		PageValue<User> pageValue = new PageValue<>();
		pageValue.setData(user);
		pageValue.setCurrentCount(currentCount);
		pageValue.setPageIndex(pageIndex);
		List<Note> noteList = nmapper.selectAllReviewNoteByPage(pageValue);
		// 封装返回对象
		PageBean<Note> pageBean = new PageBean<>();
		List<Note> notes = nmapper.selectAllReviewNote(user.getId());
		Integer totalCount = notes.size();
		double totalPageDouble = Math.ceil(totalCount * 1.0 / currentCount);
		Integer totalPage = (int) totalPageDouble;
		pageBean.setCurrentCount(currentCount);
		pageBean.setCurrentPage(currentPageInt);
		pageBean.setPageData(noteList);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	@Override
	public Note findNote(Note note) {
		Note findNote = nmapper.selectById(note.getId());
		return findNote;
	}

	@Override
	public int updateReviewYes(Note note) {
		note.setIsreview(1);
		int record = nmapper.update(note);
		return record;
	}

	@Override
	public int updateReviewNo(Note note) {
		note.setIsreview(3);
		int record = nmapper.update(note);
		return record;
	}

}
