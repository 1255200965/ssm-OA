package com.lixinxin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lixinxin.pojo.po.Mail;
import com.lixinxin.pojo.po.User;
import com.lixinxin.pojo.vo.PageBean;
import com.lixinxin.service.IMailService;
import com.lixinxin.service.IUserService;

import sun.misc.BASE64Encoder;

@Controller
@RequestMapping("/mail")
public class MailController {
	@Autowired
	private IUserService uservice;
	@Autowired
	private IMailService mservice;

	// 写邮件
	@RequestMapping("/towhite")
	public String toWhite(Model model, HttpSession session) {
		User user = (User) session.getAttribute("sessionUser");
		List<User> userList = uservice.findAllAcceptor(user);
		model.addAttribute("userList", userList);
		return "whitemail";
	}

	@RequestMapping("/white")
	public String whiteMail(HttpServletRequest request, Mail mail, @RequestParam("uploadfile") MultipartFile file) {
		if (!file.isEmpty()) {
			String savePath = request.getServletContext().getRealPath("/uploads/" + file.getOriginalFilename());
			try {
				file.transferTo(new File(savePath));
				String filename = "/uploads/" + file.getOriginalFilename();
				mail.setFile(filename);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		int record = mservice.insertMail(mail);
		if (record > 0) {
			return "redirect:/mail/towhite";
		} else {
			return "whitemail";
		}
	}

	// 读邮件
	/*
	 * 没有分页
	 * 
	 * @RequestMapping("/toread") public String toRead(HttpSession session,
	 * Model model) { User sessionUser = (User)
	 * session.getAttribute("sessionUser"); List<Mail> mailList =
	 * mservice.findAllRead(sessionUser.getId()); model.addAttribute("mailList",
	 * mailList); return "readmail"; }
	 */
	// 读邮件分页
	@RequestMapping("/toread")
	public String toRead(HttpSession session, Model model, HttpServletRequest request) {
		String currentPage = request.getParameter("currentPage");
		Integer currentPageInt = 1;
		if (currentPage != null && !"".equals(currentPage)) {
			currentPageInt = Integer.parseInt(currentPage);
		}
		Integer currentCount = 3;
		User sessionUser = (User) session.getAttribute("sessionUser");
		PageBean<Mail> mailPageBean = mservice.findAllReadByPage(sessionUser.getId(), currentPageInt, currentCount);
		model.addAttribute("mailPageBean", mailPageBean);
		return "readmail";
	}

	// 移除邮件
	@RequestMapping("/remove")
	public String remove(Mail mail) {
		int record = mservice.removeMail(mail);
		if (record > 0) {
			return "redirect:/mail/toread";
		} else {
			return "readmail";
		}
	}

	// 邮件详情
	@RequestMapping("/detail")
	public String detail(Mail mail, Model model) {
		Mail findMail = mservice.showDetail(mail);
		if (findMail != null) {
			User findUser = uservice.findById(findMail.getSenderid());
			model.addAttribute("findMail", findMail);
			model.addAttribute("findUser", findUser);
			return "maildetail";
		} else {
			return "redirect:/mail/toread";
		}
	}

	// 附件下载
	@RequestMapping("/download")
	public void download(HttpServletRequest request, HttpServletResponse response, Mail mail) {
		String path = mail.getFile();
		if (path != null && !"".equals(path)) {
			String filename = path.substring(9);
			response.setContentType(request.getServletContext().getMimeType(filename));
			String realPath = request.getServletContext().getRealPath(path);
			InputStream is = null;
			try {
				is = new FileInputStream(new File(realPath));
				String agent = request.getHeader("User-Agent");
				String encodeFile = "";
				if (agent.contains("MSIE")) {
					// IE浏览器
					encodeFile = URLEncoder.encode(filename, "utf-8");
					encodeFile = encodeFile.replace("+", " ");
				} else if (agent.contains("Firefox")) {
					// 火狐浏览器
					BASE64Encoder base64Encoder = new BASE64Encoder();
					encodeFile = "=?utf-8?B?" + base64Encoder.encode(filename.getBytes("utf-8")) + "?=";
				} else {
					// 其它浏览器
					encodeFile = URLEncoder.encode(filename, "utf-8");
				}
				response.setHeader("Content-Disposition", "attachment;filename=" + encodeFile);
				ServletOutputStream os = response.getOutputStream();
				int len = 0;
				while ((len = is.read()) != -1) {
					os.write(len);
					os.flush();
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	// 显示垃圾邮件
	/*
	 * @RequestMapping("/tolitter") public String toLitter(HttpSession session,
	 * Model model) { User sessionUser = (User)
	 * session.getAttribute("sessionUser"); List<Mail> mailList =
	 * mservice.findAllLitter(sessionUser.getId());
	 * model.addAttribute("mailList", mailList); return "littermail"; }
	 */

	// 显示垃圾邮件分页
	@RequestMapping("/tolitter")
	public String toLitter(HttpSession session, Model model, HttpServletRequest request) {
		String currentPage = request.getParameter("currentPage");
		Integer currentPageInt = 1;
		if (currentPage != null && !"".equals(currentPage)) {
			currentPageInt = Integer.parseInt(currentPage);
		}
		Integer currentCount = 3;
		User sessionUser = (User) session.getAttribute("sessionUser");
		PageBean<Mail> mailPageBean = mservice.findAllLitterByPage(sessionUser.getId(), currentPageInt, currentCount);
		model.addAttribute("mailPageBean", mailPageBean);
		return "littermail";
	}

	// 还原邮件
	@RequestMapping("/reback")
	public String reback(Mail mail) {
		int record = mservice.rebackMail(mail);
		if (record > 0) {
			return "redirect:/mail/tolitter";
		} else {
			return "littermail";
		}
	}

	// 删除邮件
	@RequestMapping("/delete")
	public String delete(Mail mail) {
		mservice.deleteMail(mail);
		return "redirect:/mail/tolitter";
	}

}
