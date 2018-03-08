<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统之邮件详情</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script>
   function download() {
	var con = confirm("确定要带我下来么？");
	if (con) {
		var mailDetailForm=document.getElementById("mailDetail");
		mailDetailForm.action="${pageContext.request.contextPath }/mail/download";
		mailDetailForm.submit();		
		}
	} 
   function back(){
		var con = confirm("确定要离开我么？");
		if (con) {
			location.href="${pageContext.request.contextPath }/mail/toread";		
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
	<form id="mailDetail" name="mailDetail" action="${pageContext.request.contextPath}/mail/white" enctype="multipart/form-data" method="post">
		<input type="hidden" name="id" value="${findMail.id}" /> 
		<input type="hidden" name="file" value="${findMail.file}" />
		<div class="main">
		<div class="global-width">
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<title>办公自动化管理系统</title>
				<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
			</head>
			<body>
				<div class="nav" id="nav">
					<div class="t"></div>
					<dl>
						<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
						信息管理
						</dt>
					<dd>
						<a href="${pageContext.request.contextPath}/user/toinfo" target="_self">个人信息</a>
					</dd>
					</dl>
				<dl>
				<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				邮件管理
				</dt>
				<dd>
					<a href="${pageContext.request.contextPath}/mail/towhite" target="_self">写邮件</a>
				</dd>
				<dd>
				<a href="${pageContext.request.contextPath}/mail/toread" target="_self">收邮件</a>
				</dd>
				<dd>
					<a href="${pageContext.request.contextPath}/mail/tolitter" target="_self">垃圾邮件</a>
				</dd>
				</dl>
				<dl>
				<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
					考勤管理
				</dt>
				<dd>
					<a href="${pageContext.request.contextPath}/note/tonotelist" target="_self">休假</a>
				</dd>
				</dl>
				<dl>
				<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				权限管理
				</dt>
				<dd>
					<a href="${pageContext.request.contextPath}/user/toaccount" target="_self">个人账户</a>
				</dd>
				</dl>
			</div>
		</body>
	</html>
				<div class="action">
			<div class="t">邮件信息详情</div>
				<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%" height="30px">邮件标题：</td>
								<td align="left">
								<input type="text" name="subject" value="${findMail.subject}" readonly="readonly" id="si" />
								</td>				
							</tr>
							<tr>
								<td align="right" width="30%" height="30px">邮件内容：</td>
								<td align="left">									
									<textarea name="context" rows="10px" cols="40px" readonly="readonly" id="ci">
										${findMail.context}
									</textarea>
								</td>								
							<tr>
								<td align="right" width="30%" height="20px">发送时间：</td>
								<td align="left">	
									<font>${findMail.time}</font>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%" height="20px">来自：</td>
								<td align="left">
									<font>${findUser.name}</font>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%" height="20px">文件：</td>
								<td align="left">
									<input type="button" name="file" value="文件下载" readonly="readonly" id="fi" onclick="download()"/>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<button type="button" onclick="back()">返回</button>
								</td>
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