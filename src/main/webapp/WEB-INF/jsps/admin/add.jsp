<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统之添加账号</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
		<script>	
			function back(){
				var con = confirm("确定要离开我么？");
				if (con) {
					location.href="${pageContext.request.contextPath }/user/admin/tomanager";		
					}
				} 
			$(function() {
				$("#addUserForm").validate({
									rules : {
										username : {required:true			
											},
										password : {required:true			
											},
										name : {required:true			
											},
										age : {required:true,
												number:true										
											},										
										phone : {
											required:true,							
											number:true,					
											rangelength:[11,11]
										}										
									},
									messages : {
										username : {required:"用户名不能为空"			
										},
									password : {required:"密码不能为空"			
										},
									name : {required:"昵称不能为空"				
										},
									age : {required:"年龄不能为空",
										number:"必须为数字"						
										},									
								 	phone : {
										required:"电话不能为空",							
										number:"必须为数字",
										rangelength:"必须为11位"
									}
									}
				});
			});
			$(function(){
				$("#u_username").blur(
					function(){
						$.get(
							"${pageContext.request.contextPath}/user/admin/confirm",
							{"username":this.value},
							function(data){
								if(data!=null){
									var val = data.username;
									$("#span1").html("用户名已被注册");
								}else{
									$("#span1").html("用户名可以使用");
								}	
							},
							"json"
						);						
					}		
				);				
			});
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
				<a href="${pageContext.request.contextPath}/user/exit">注销</a>
				&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/toindex" >返回首页</a>
			</div>
		</div>
		<form id="addUserForm" name="addUserForm" action="${pageContext.request.contextPath}/user/admin/add" method="post">
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
							<a href="${pageContext.request.contextPath}/note/tonotelist" target="_self">休假</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/note/admin/toreviewlist" target="_self">休假管理</a>
						</dd>	
					</dl>
					
					<dl>					
						<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							权限管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/user/toaccount" target="_self">个人账户</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/user/admin/tomanager" target="_self">管理账户</a>
						</dd>						
					</dl>
				</div>
  </body>
</html>
 
					<div class="action">
						<div class="t">
							添加账户
						</div>
						<div class="pages">
							<table width="90%" border="1" cellspacing="1" cellpadding="2">
								<tr >
									<td align="right" width="30%">用户名：</td>
									<td  align="left">
										<input type="text" name="username"   id="u_username"/>&nbsp;<font color="red">*</font>
										<span id="span1"></span>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">密码：</td>
									<td  align="left">
										<input type="text" name="password"   id="u_password"/>&nbsp;<font color="red">*</font>										
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">昵称：</td>
									<td  align="left">
										<input type="text" name="name"   id="u_name"/>&nbsp;<font color="red">*</font>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">年龄：</td>
									<td  align="left">
										<input type="text" name="age"   id="u_age"/>&nbsp;<font color="red">*</font>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">性别：</td><td  align="left">									
									<select name="gender" id="u_gender">
										<option >--请选择--</option>
										<option value="1">女</option>
										<option value="2">男</option>
									</select>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">手机：</td>
									<td  align="left">
										<input type="text" name="phone"  id="u_phone"/>&nbsp;<font color="red">*</font>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">地址：</td>
									<td  align="left">
										<input type="text" name="address"  id="u_address"/>
									</td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br />									
										<input  type="submit"  value="保存数据" />
										<button type="button" onclick="back()">返回</button>
									</td>						
								</tr>								
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