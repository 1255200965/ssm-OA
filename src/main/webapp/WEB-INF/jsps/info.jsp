<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统之信息页</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script>
	function edit(){
		document.forms[0].submit();
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
			<a href="${pageContext.request.contextPath}/user/exit" >注销</a>
			&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/toindex" >返回首页</a>
		</div>
	</div>
	<form id="infoForm" name="infoForm" action="${pageContext.request.contextPath}/user/toeditinfo" method="post">
		<div class="main">
		<div class="global-width">
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<title>办公自动化管理系统之个人信息</title>
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
			<div class="t">个人信息</div>
				<div class="pages">
					<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">昵称：</td>
								<td align="left">
								<input type="text" name="name" value="${sessionUser.name}" readonly="readonly" id="u.name" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">年龄：</td>
								<td align="left">
									<input type="text" name="age" value="${sessionUser.age}" readonly="readonly" id="u.age" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">性别：</td>
								<td align="left">	
									<input type="text" name="gender"  value="${sessionUser.gender==1?'女':'男'}" readonly="readonly" id="u.gender" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">手机：</td>
								<td align="left">
								<input type="text" name="phone" value="${sessionUser.phone}" readonly="readonly" id="u.phone" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">地址：</td>
								<td align="left">
									<input type="text" name="address" value="${sessionUser.address}" readonly="readonly" id="u.address" />
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2"><br />
								<input type="button" id="save" value="编辑数据" onclick="edit()" />
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