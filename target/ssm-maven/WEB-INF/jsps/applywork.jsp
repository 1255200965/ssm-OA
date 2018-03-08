<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统之打卡</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script>
function onwork(){
   alert("您真的很勤奋！！！");   
   location.href="${pageContext.request.contextPath }/work/onwork";		
	}
function offwork(){
	alert("上了一天班了，回去好好休息！！！");   
	document.forms[0].submit();
}		
function worklist(){
	var con = confirm("确定要看看我吗？");
	if (con) {
		 location.href="${pageContext.request.contextPath }/work/toworklist";		
		}
}
</script>
</head>	
	<body>
		<div class="top">
			<div class="global-width">
				<img src="${pageContext.request.contextPath}/Images/logo.gif" class="logo" />
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
		<form id="workForm" name="workForm" action="${pageContext.request.contextPath }/work/offwork" method="post">
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
							<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理 
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
						<div class="t">
							日常打卡
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">				
							<tr>
								<td align="right" width="30%" height="30px">姓名：</td>
								<td align="left">
								<input type="text" name="name" value="${sessionUser.name}" readonly="readonly"  />
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="hidden" name="id" value="${findWork.id}" />
								</td>
								<td align="center">
									<input type="hidden" name="apply.id" value="${findWork.apply.id}" />
								</td>
								<td align="center">
									<input type="hidden" name="date" value="${findWork.date}" />
								</td>
							</tr>
							<c:if test="${empty findWork}">	
							<tr>
								<td align="center" colspan="2">																
									<button type="button" onclick="onwork()">上班打卡</button>
								</td>
							</tr>
							</c:if>
							<c:if test="${!empty findWork}">
							<tr>
								<td align="right" width="30%" height="30px">上班时间：</td>
								<td align="left">
									<input type="text"  name="begintime" value="${findWork.begintime}" id="w_begintime" />
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<button type="button" onclick="offwork()">下班打卡</button>									
								</td>								
							</tr>
							<tr>
								<td align="center" colspan="2">
									<button type="button" onclick="worklist()">查看打卡记录</button>									
								</td>								
							</tr>
							</c:if>								
						</table>								
						</div>
					</div>
			</div>
		</div>
		</form>
		<div class="copyright">
			Copyright &nbsp; &copy; &nbsp; 
		</div>
 
	</body>
</html>