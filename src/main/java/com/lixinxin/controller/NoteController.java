package com.lixinxin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lixinxin.pojo.po.Countwork;
import com.lixinxin.pojo.po.Note;
import com.lixinxin.pojo.po.User;
import com.lixinxin.pojo.vo.PageBean;
import com.lixinxin.service.ICountworkService;
import com.lixinxin.service.INoteService;

@Controller
@RequestMapping("/note")
public class NoteController {
	@Autowired
	private INoteService nservice;
	@Autowired
	private ICountworkService cservice;

	// 休假信息列表
	/*未分页
	 * @RequestMapping("/tonotelist")
	public String toNoteList(Model model, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		List<Note> noteList = nservice.findAllApplyNote(user);
		model.addAttribute("noteList", noteList);
		return "notelist";
	}*/
	@RequestMapping("/tonotelist")
	public String toNoteList(Model model, HttpSession session,HttpServletRequest request) {
		String currentPage = request.getParameter("currentPage");
		Integer currentPageInt = 1;
		if (currentPage != null && !"".equals(currentPage)) {
			currentPageInt = Integer.parseInt(currentPage);
		}
		Integer currentCount = 3;
		User user = (User) session.getAttribute("sessionUser");
		PageBean<Note> notePageBean = nservice.findAllApplyNoteByPage(user, currentPageInt, currentCount);
		model.addAttribute("notePageBean",notePageBean);
		return "notelist";
	}

	// 删除请假信息
	@RequestMapping("/delete")
	public String delete(Note note) {
		nservice.deleteNote(note);
		return "redirect:/note/tonotelist";
	}

	// 请假
	@RequestMapping("/toapply")
	public String toApply(Model model,HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		List<User> userList = nservice.findAllReviewer();
		Countwork countwork = cservice.findByAId(user.getId());
		model.addAttribute("userList", userList);
		model.addAttribute("countwork", countwork);
		return "applynote";
	}

	// 处理请假天数
	@RequestMapping("/process")
	@ResponseBody
	public String processData(@RequestParam("begintime") String begintime, @RequestParam("endtime") String endtime) {
		if (begintime != null && !begintime.equals("") && endtime != null && !endtime.equals("")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String day = null;
			try {
				Date begindate = sdf.parse(begintime);
				Date enddate = sdf.parse(endtime);
				Calendar begin = Calendar.getInstance();
				begin.setTime(begindate);
				Calendar end = Calendar.getInstance();
				end.setTime(enddate);
				int beginInt = begin.get(Calendar.DAY_OF_YEAR);
				int endInt = end.get(Calendar.DAY_OF_YEAR);
				Integer daytime = endInt - beginInt;
				day = daytime.toString();				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return day;
		}else{
			return null;
		}
	}

	// 请假
	@RequestMapping("/applynote")
	public String applynote(Note note, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		note.setApply(user);
		int record = nservice.saveNote(note);
		if (record > 0) {
			return "redirect:/note/toapply";
		} else {
			return "applynote";
		}
	}

	// 经理管理请假信息
	/*未分页
	 * @RequestMapping("/admin/toreviewlist")
	public String toReviewList(Model model, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		List<Note> noteList = nservice.findAllReviewNote(user);
		model.addAttribute("noteList", noteList);
		return "admin/reviewlist";
	}*/
	//分页
	@RequestMapping("/admin/toreviewlist")
	public String toReviewList(Model model, HttpSession session,HttpServletRequest request) {
		String currentPage = request.getParameter("currentPage");
		Integer currentPageInt = 1;
		if (currentPage != null && !"".equals(currentPage)) {
			currentPageInt = Integer.parseInt(currentPage);
		}
		Integer currentCount = 3;
		User user = (User) session.getAttribute("sessionUser");
		PageBean<Note> notePageBean = nservice.findAllReviewNotebyPage(user, currentPageInt, currentCount);
		model.addAttribute("notePageBean",notePageBean);
		return "admin/reviewlist";
	}

	// 审核
	@RequestMapping("/admin/toreview")
	public String toReview(Note note, HttpSession session, Model model) {
		User user = (User) session.getAttribute("sessionUser");
		Note findNote = nservice.findNote(note);
		findNote.setReviewer(user);
		model.addAttribute("reviewnote", findNote);
		return "admin/reviewnote";
	}

	// 审核通过
	@RequestMapping("/admin/reviewYes")
	public String reviewYes(Note note) {
		int record = nservice.updateReviewYes(note);
		if (record > 0) {
			return "redirect:/note/admin/toreviewlist";
		} else {
			return "admin/reviewnote";
		}
	}

	// 审核不通过
	@RequestMapping("/admin/reviewNo")
	public String reviewNo(Note note) {
		int record = nservice.updateReviewNo(note);
		if (record > 0) {
			return "redirect:/note/admin/toreviewlist";
		} else {
			return "admin/reviewnote";
		}
	}
}
