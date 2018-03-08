<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统之垃圾邮箱</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
	#pageUl li{
		display: inline;
		font-size:15px;
	}
</style>
<script>
 function deleteMail(count) {
	var con = confirm("确定要删除我吗？");
	if (con) {
		var index=count-1;
		document.forms[index].action="${pageContext.request.contextPath }/mail/delete";
		document.forms[index].submit();	
		}
	} 
  function rebackMail(count) {
	var con = confirm("确定执行此操作？");
	if (con) {
		var index=count-1;
		document.forms[index].action="${pageContext.request.contextPath }/mail/reback";
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
			<a href="${pageContext.request.contextPath}/user/exit">注销</a>
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
			<div class="t">垃圾邮件列表</div>
				<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center" width="8%"><font size="4">序号</font></td>
								<td align="center" width="13%"><font size="4">邮件标题</font></td>
								<td align="center" width="25%"><font size="4">内容</font></td>
								<td align="center" width="12%"><font size="4">是否已读</font></td>
								<td align="center" width="28%"><font size="4">时间</font></td>
								<td align="center" width="14%"><font size="4">操作</font></td>
							</tr>
							</table>		
							<table width="90%" border="0" cellspacing="0" cellpadding="0">	
							<c:forEach items="${mailPageBean.pageData}" var="mail" varStatus="vs">								
							 <tr>
								<form id="litterMailForm" name="litterMailForm" action="###" method="post">
								  <table width="90%" border="0" cellspacing="0" cellpadding="0">
									<tr id="tr${vs.count}"   onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')">
									<td align="center" width="8%"><font size="4">${vs.count}</font></td>									
									<td align="center" width="13%">		
										<font size="4">${mail.subject}</font>
									</td>
									<td align="center" width="25%"><font size="4">${mail.context}</font></td>
									<td align="center" width="12%"><font size="4">${mail.isread==1?"已读":"未读"}</font></td>
									<td align="center" width="28%"><font size="4">${mail.time}</font></td>
									<td align="center">
										<input type="hidden" name="id" value="${mail.id}" />
									</td>
									<td align="center" width="7%">																														
										<a href="javascript:void(0)" onclick="rebackMail(${vs.count})"><font size="4">还原</font></a>																			
									</td>
									<td align="center" width="7%">																
										<a href="javascript:void(0)" onclick="deleteMail(${vs.count})"><font size="4">删除</font></a>										
									</td>
									</tr>
									</table>
								</form>	
							 </tr>											
							</c:forEach>
							<c:if test="${mailPageBean.totalCount!=0}">
							<tr>							
							<td >
							<br/>
								<div style="text-algin: center">			
									<ul id="pageUl" >
										<c:if test="${mailPageBean.currentPage==1}">
											<li><a>上一页</a></li>
										</c:if>
										<c:if test="${mailPageBean.currentPage!=1}">
											<li><a href="${pageContext.request.contextPath}/mail/tolitter?currentPage=${mailPageBean.currentPage-1}">上一页</a></li>
										</c:if>
										<c:forEach begin="1" end="${mailPageBean.totalPage}" var="page">
											<c:if test="${page==mailPageBean.currentPage}">
												<li><font size="5px" color="red">${page}</font></li>
											</c:if>
											<c:if test="${page!=mailPageBean.currentPage}">
												<li><a href="${pageContext.request.contextPath}/mail/tolitter?currentPage=${page}">${page}</a></li>
											</c:if>
											</c:forEach>
											<c:if test="${mailPageBean.currentPage==mailPageBean.totalPage}">
												<li><a>下一页</a></li>
											</c:if>
											<c:if test="${mailPageBean.currentPage!=mailPageBean.totalPage}">
												<li><a href="${pageContext.request.contextPath}/mail/tolitter?currentPage=${mailPageBean.currentPage+1}">下一页</a></li>
											</c:if>
										</ul>
									</div>			
								</td>
							</tr>
							</c:if>		
						</table>											
					</div>
				</div>
			</div>
		</div>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
</html>