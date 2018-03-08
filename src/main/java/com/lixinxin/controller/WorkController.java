package com.lixinxin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lixinxin.pojo.po.User;
import com.lixinxin.pojo.po.Work;
import com.lixinxin.service.IWorkService;
@Controller
@RequestMapping("/work")
public class WorkController {
	@Autowired
	private IWorkService wservice;
	// ȥ��ҳ
	@RequestMapping("/toapply")
	public String toApply(HttpSession session,Model model) {
		User user = (User) session.getAttribute("sessionUser");
		Work findWork = wservice.findWorkByDate(user);
		model.addAttribute("findWork",findWork);
		return "applywork";
	}
	//�ϰ��
	@RequestMapping("/onwork")
	public String onWork(HttpSession session,Model model) {
		User user = (User) session.getAttribute("sessionUser");
		wservice.saveWork(user);	
		return "redirect:/work/toapply";		
	}
	//�°��
	@RequestMapping("/offwork")
	public String offWork(Work work) {
		int record = wservice.updateWork(work);
		if(record>0){
		return "redirect:/work/toworklist";
		}else{
			return "redirect:/work/toapply";
		}
	}
	//�û�������ҳ
	@RequestMapping("/toworklist")
	public String toWorklist(HttpSession session,Model model) {
		User user = (User) session.getAttribute("sessionUser");
		List<Work> workList = wservice.findAllApplyWork(user);
		model.addAttribute("workList", workList);
		return "worklist";
	}
	//����Ա�鿴����Ϣ
	@RequestMapping("/admin/toallworklist")
	public String toAllWorklist(Model model) {
		List<Work> workList = wservice.findAllWork();
		model.addAttribute("workList", workList);
		return "admin/worklist";
	}

}
