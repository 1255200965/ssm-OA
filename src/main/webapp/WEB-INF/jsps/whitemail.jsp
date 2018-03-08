<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统之写邮件</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script>
	$(function() {
		$("#whiteMail").validate({
			rules : {
				subject : {
					required : true
				},
				accepterid : {
					required : true
				}				
			},
			messages : {
				subject : {
					required : "主题不能为空"
				},
				accepterid : {
					required : "收件人不能为空"
				}								
			}
		});
	});
	
	function check() {
		var file = document.getElementById("mfi");
		var maxSize = 9 * 1024 * 1024;
		var fileSize = file.files[0].size;
		var sp1 = document.getElementById("sp1");
		sp1.innerHTML = "";
		if (fileSize>maxSize) {
			sp1.innerHTML = "<font color='red'>*(上传附件不能大于9M)</font>";
			return false;
		} else {
			return true;
		} 
	}
</script>
</head>

<body>
	<div class="top">
		<div class="global-width">
			<img src="${pageContext.request.contextPath}/Images/logo.gif"
				class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			${sessionUser.name}你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="${pageContext.request.contextPath}/user/exit">注销</a>
			&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/toindex" >返回首页</a>
		</div> 
	</div>
    <form id="whiteMail" name="whiteMail" onsubmit="return check()" action="${pageContext.request.contextPath}/mail/white" enctype="multipart/form-data" method="post">
		<input type="hidden" name="senderid" value="${sessionUser.id}" /> <input
			type="hidden" name="islitter" value="2" id="m_il" /> <input
			type="hidden" name="isread" value="2" id="m_ir" />
		<div class="main">
			<div class="global-width">
				<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="nav" id="nav">
		<div class="t"></div>
		<dl>
			<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				信息管理</dt>
			<dd>
				<a href="${pageContext.request.contextPath}/user/toinfo"
					target="_self">个人信息</a>
			</dd>
		</dl>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				邮件管理</dt>
			<dd>
				<a href="${pageContext.request.contextPath}/mail/towhite"
					target="_self">写邮件</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath}/mail/toread"
					target="_self">收邮件</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath}/mail/tolitter"
					target="_self">垃圾邮件</a>
			</dd>
		</dl>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				考勤管理</dt>
			<dd>
				<a href="${pageContext.request.contextPath}/note/tonotelist"
					target="_self">休假</a>
			</dd>
		</dl>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				权限管理</dt>
			<dd>
				<a href="${pageContext.request.contextPath}/user/toaccount"
					target="_self">个人账户</a>
			</dd>
		</dl>
	</div>
</body>
				</html>
				<div class="action">
					<div class="t">写邮件</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">收件人：</td>
								<td align="left"><select name="accepterid" id="m_ai">
										<option value="">--请选择--</option>
										<c:forEach items="${userList}" var="user">
											<option value="${user.id }">${user.name }</option>
										</c:forEach>
								</select>&nbsp;<font color="red">*</font>&nbsp; &nbsp; &nbsp;</td>
							</tr>
							<tr>
								<td align="right" width="30%" height="40px">邮件标题：</td>
								<td align="left">
								<input type="text" name="subject" 	id="m_si" />&nbsp;<font color="red">*</font></td>
							</tr>
							<tr>
								<td align="right" width="30px" height="40px">邮件内容：</td>
								<td align="left">
								<textarea name="context" rows="10px" cols="40px"></textarea></td>
							</tr>
							<tr>
								<td align="right" width="20%" height="40px">上传附件：</td>
								<td align="left">
									<input type="file" name="uploadfile"  id="mfi" />
									<span id="sp1"></span>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2"><br /> 
								<input type="submit" id="send" value="发送邮件" /></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
</html>