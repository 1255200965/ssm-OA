<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统之收邮件</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script>
 function removeMail(count) {
	var con = confirm("确定要删除我吗？");
	if (con) {
		var index=count-1;
		document.forms[index].action="${pageContext.request.contextPath }/mail/remove";
		document.forms[index].submit();	
		}
	} 
  function readMail(count) {
	var con = confirm("确定要看看我吗？");
	if (con) {		
		var index=count-1;
		document.forms[index].action="${pageContext.request.contextPath }/mail/detail";
		document.forms[index].submit();	
		}
	} 
function change(id,info){
		var tr=document.getElementById(id);
		if(info=="over"){
			tr.style.backgroundColor="blueviolet";
			}
		if(info=="out"){
			tr.style.backgroundColor="white";
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
			<a href="${pageContext.request.contextPath}/user/exit" >注销</a>
			&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/toindex" >返回首页</a>
		</div>
	</div>
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
			<div class="t">邮件信息列表</div>
				<div class="pages">
					<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center" width="5%"><font size="3">序号</font></td>
								<td align="center" width="15%"><font size="3">邮件标题</font></td>
								<td align="center" width="35%"><font size="3">内容</font></td>
								<td align="center" width="10%"><font size="3">是否已读</font></td>
								<td align="center" width="30%"><font size="3">时间</font></td>
								<td align="center" width="5%"><font size="3">删除</font></td>
							</tr>		
							<c:forEach items="${mailList}" var="mail" varStatus="vs">								
							 <tr>
								<form id="mailForm" name="mailForm" action="###" method="post">
								 <table width="90%" border="0" cellspacing="0" cellpadding="0">
									<tr id="tr${vs.count}"   onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')">
									<td align="center" width="5%"><font size="3">${vs.count}</font></td>									
									<td align="center" width="15%">											
										<a href="javascript:void(0)" onclick="readMail(${vs.count})"><font size="3">${mail.subject}</font></a>		
									</td>
									<td align="center" width="35%"><font size="3">${mail.context}</font></td>
									<td align="center" width="10%"><font size="3">${mail.isread==1?"已读":"未读"}</font></td>
									<td align="center" width="30%"><font size="3">${mail.time}</font></td>
									<td align="center">
										<input type="hidden" name="id" value="${mail.id}" />
									</td>
									<td align="center" width="5%">																														
										<a href="javascript:void(0)" onclick="removeMail(${vs.count})"><font size="3">删除</font></a>										
									</td>
									</tr>
									</table>
								</form>	
							 </tr>											
							</c:forEach>						
						</table>
					</div>
				</div>
			</div>
		</div>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
</html>