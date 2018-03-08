<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统之加班列表</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script>
 function deleteOverwork(count) {
	var con = confirm("确定要删除我吗？");
	if (con) {
		var index=count-1;
		document.forms[index].action="${pageContext.request.contextPath }/overwork/delete";
		document.forms[index].submit();	
		}
	} 
 function applyOverwork() {
	  location.href="${pageContext.request.contextPath }/overwork/toapply";		
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
					<a href="${pageContext.request.contextPath}/work/toapply" target="_self">每日打卡</a>
				</dd>
				<dd>
					<a href="${pageContext.request.contextPath}/overwork/tooverworklist" target="_self">加班</a>
				</dd>	
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
			<div class="t">加班信息列表</div>
				<div class="pages">
					<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center" width="5%"><font size="3">序号</font></td>
								<td align="center" width="10%"><font size="3">申请人</font></td>
								<td align="center" width="24%"><font size="3">开始时间</font></td>
								<td align="center" width="24%"><font size="3">结束时间</font></td>
								<td align="center" width="5%"><font size="3">小时</font></td>
								<td align="center" width="15%"><font size="3">审批状态</font></td>
								<td align="center" width="12%"><font size="3">原因</font></td>
								<td align="center" width="5%"><font size="3">删除</font></td>
							</tr>		
							<c:forEach items="${overworkList}" var="overwork" varStatus="vs">								
							 <tr>
								<form id="myForm" name="myForm" action="###" method="post">
								 <table width="90%" border="0" cellspacing="0" cellpadding="0">
									<tr id="tr${vs.count}"   onmouseover="change(this.id,'over')" onmouseout="change(this.id,'out')">
									<td align="center" width="5%"><font size="3">${vs.count}</font></td>									
									<td align="center" width="10%">		
										<font size="3">${overwork.apply.name}</font>		
									</td>
									<td align="center" width="24%"><font size="3">${overwork.begintime}</font></td>
									<td align="center" width="24%"><font size="3">${overwork.endtime}</font></td>
									<td align="center" width="5%"><font size="3">${overwork.time}</font></td>
									<td align="center" width="15%">
										<c:if test="${overwork.isreview==1}"><font size="3">已审核</font></c:if>
										<c:if test="${overwork.isreview==2}"><font size="3">未审核</font></c:if>
										<c:if test="${overwork.isreview==3}"><font size="3">审核不通过</font></c:if>								
									</td>
									<td align="center" width="12%"><font size="3">${overwork.cause}</font></td>
									<td align="center" >
										<input type="hidden" name="id" value="${overwork.id}" />
									</td>
									<td align="center" width="5%">																														
										<a href="javascript:void(0)" onclick="deleteOverwork(${vs.count})"><font size="3">删除</font></a>
									</td>
									</tr>
									</table>
								</form>	
							 </tr>											
							</c:forEach>					
							<tr>
								<td colspan="8" align="right" > 											
									<input type="button" value="加班申请" onclick="applyOverwork()"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
</html>