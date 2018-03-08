package com.lixinxin.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lixinxin.pojo.po.User;
import com.lixinxin.pojo.vo.PageBean;
import com.lixinxin.service.IUserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private IUserService uservice;

	// ��¼
	@RequestMapping(value = "/tologin")
	public String toLogin() {
		return "login";
	}

	@RequestMapping(value = "/login")
	@ResponseBody
	public String login(User user, HttpSession session) {
		User findUser = uservice.findByLogin(user);
		if (findUser != null) {
			session.setAttribute("sessionUser", findUser);
			return "1";
		} else {
			return "0";
		}
	}

	// ��ҳ
	@RequestMapping("/toindex")
	public String toIndex(HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		if (user.getIsadmin() == 1) {
			return "admin/adminindex";
		} else {
			return "index";
		}
	}

	// ������Ϣҳ
	@RequestMapping("/toinfo")
	public String info() {
		return "info";
	}

	// �༭
	@RequestMapping("/toeditinfo")
	public String toEditInfo() {
		return "editinfo";
	}

	@RequestMapping("/editinfo")
	public String editAccount(User user, HttpSession session) {
		User findUser = uservice.updateEdit(user);
		if (findUser != null) {
			session.removeAttribute("sessionUser");
			session.setAttribute("sessionUser", findUser);
			return "redirect:/user/toinfo";
		} else {
			return "editinfo";
		}
	}

	// �����˻�ҳ
	@RequestMapping("/toaccount")
	public String toAccount() {
		return "account";
	}

	// �༭�����˻�
	@RequestMapping("/toeditaccount")
	public String toEdit() {
		return "editaccount";
	}
	@RequestMapping("/editaccount")
	public String edit(User user, HttpSession session) {
		User findUser = uservice.updateEdit(user);
		if (findUser != null) {
			session.removeAttribute("sessionUser");
			session.setAttribute("sessionUser", findUser);
			return "redirect:/user/toaccount";
		} else {
			return "editaccount";
		}
	}

	// �˳�
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.removeAttribute("sessionUser");
		return "redirect:/user/tologin";
	}

	// �����˻������б�
	// �����˻�ҳ
	/*û�з�ҳ
	 * @RequestMapping("/admin/tomanager")
	public String toManager(Model model) {
		List<User> userList = uservice.findAllCustomer();
		model.addAttribute("userList", userList);
		return "admin/manager";
	}*/
	//��ҳ
	@RequestMapping("/admin/tomanager")
	public String toManager(Model model,HttpServletRequest request) {
		String currentPage= request.getParameter("currentPage");
		Integer  currentPageInt=1;
		if(currentPage!=null&&!"".equals(currentPage)){
			currentPageInt= Integer.parseInt(currentPage);
		}
		Integer  currentCount=3;
		PageBean<User> UserpageBean= uservice.findAllCustomerByPage(currentPageInt,currentCount);		
		model.addAttribute("UserpageBean",UserpageBean);
		return "admin/manager";
	}
    //ajax��֤�û���
	@RequestMapping("/admin/confirm")
	@ResponseBody
	public User confirm(@RequestParam("username") String username){
		System.out.println(username);
		User findUser = uservice.findByUsername(username);
		return findUser;
	}
	// ����˻�
	@RequestMapping("/admin/toadd")
	public String toAdd() {
		return "admin/add";
	}

	@RequestMapping("/admin/add")
	public String add(User user) {
		int record = uservice.saveUser(user);
		if(record>0){
			return "redirect:/user/admin/tomanager";
		}else{
			return "admin/add";
		}
	}

	//ɾ���˻�
	@RequestMapping("/admin/delete")
	public String delete(User user) {
		uservice.deleteUser(user);
		return "redirect:/user/admin/tomanager";
	}

}
