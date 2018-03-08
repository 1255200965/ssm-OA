package com.lixinxin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lixinxin.pojo.po.Overwork;
import com.lixinxin.pojo.po.User;
import com.lixinxin.service.IOverworkService;

@Controller
@RequestMapping("/overwork")
public class OverworkController {
	@Autowired
	private IOverworkService oservice;

	// �Ӱ���Ϣ�б�
	// δ��ҳ
	@RequestMapping("/tooverworklist")
	public String toOverworkList(Model model, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		List<Overwork> overworkList = oservice.findAllApplyOverwork(user);
		model.addAttribute("overworkList", overworkList);
		return "overworklist";
	}

	// ɾ���Ӱ���Ϣ
	@RequestMapping("/delete")
	public String delete(Overwork overwork) {
		oservice.deleteOverwork(overwork);
		return "redirect:/overwork/tooverworklist";
	}

	// �Ӱ�����
	@RequestMapping("/toapply")
	public String toApply(Model model) {
		List<User> userList = oservice.findAllReviewer();
		model.addAttribute("userList", userList);
		return "applyoverwork";
	}

	// ����Ӱ�ʱ��
	@RequestMapping("/process")
	@ResponseBody
	public String processData(@RequestParam("begintime") String begintime, @RequestParam("endtime") String endtime) {
		if (begintime != null && !begintime.equals("") && endtime != null && !endtime.equals("")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String time = null;	
			try {
				Date begindate = sdf.parse(begintime.replace("T", " "));				
				Date enddate = sdf.parse(endtime.replace("T", " "));
				Long begin = begindate.getTime();
				Long end = enddate.getTime();
				Long daytime = (end - begin) / (1000 * 60 * 60);
				time = daytime.toString();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return time;
		} else {
			return null;
		}
	}

	// ����Ӱ�
	@RequestMapping("/applyoverwork")
	public String applynote(Overwork overwork, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		overwork.setBegintime(overwork.getBegintime().replace("T", " "));
		overwork.setEndtime(overwork.getEndtime().replace("T", " "));
		overwork.setApply(user);
		int record = oservice.saveOverwork(overwork);
		if (record > 0) {
			return "redirect:/overwork/toapply";
		} else {
			return "applyoverwork";
		}
	}

	// �������Ӱ���Ϣ
	// δ��ҳ
	@RequestMapping("/admin/toreviewlist")
	public String toReviewList(Model model, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		List<Overwork> overworkList = oservice.findAllReviewOverwork(user);
		model.addAttribute("overworkList", overworkList);
		return "admin/reviewoverworklist";
	}

	// ��˼Ӱ�
	@RequestMapping("/admin/toreviewoverwork")
	public String toReview(Overwork overwork, HttpSession session, Model model) {
		User user = (User) session.getAttribute("sessionUser");
		Overwork findOverwork = oservice.findOverwork(overwork);
		findOverwork.setReviewer(user);
		model.addAttribute("reviewOverwork", findOverwork);
		return "admin/reviewoverwork";
	}

	// ���ͨ��
	@RequestMapping("/admin/reviewYes")
	public String reviewYes(Overwork overwork) {
		int record = oservice.updateReviewYes(overwork);
		if (record > 0) {
			return "redirect:/overwork/admin/toreviewlist";
		} else {
			return "admin/reviewoverwork";
		}
	}

	// ��˲�ͨ��
	@RequestMapping("/admin/reviewNo")
	public String reviewNo(Overwork overwork) {
		int record = oservice.updateReviewNo(overwork);
		if (record > 0) {
			return "redirect:/overwork/admin/toreviewlist";
		} else {
			return "admin/reviewoverwork";
		}
	}
}
