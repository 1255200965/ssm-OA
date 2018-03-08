package com.lixinxin.mapper;

import java.util.List;
import com.lixinxin.pojo.dto.PageValue;
import com.lixinxin.pojo.po.Note;
import com.lixinxin.pojo.po.User;
public interface NoteMapper {
	public List<Note>  selectAllApplyNote(Integer applyid);
	public List<Note> selectAllApplyNoteByPage(PageValue<User> pageValue);
	public void deleteById(Integer id);
	public int insert(Note note);
	public List<Note> selectAllReviewNote(Integer reviewid);
	public List<Note> selectAllReviewNoteByPage(PageValue<User> pageValue);
	public Note  selectById(Integer id);
	public int update(Note note);
	
}
