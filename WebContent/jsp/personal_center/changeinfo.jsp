<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.User" %>
<%@ page import="threeblog.service.Service" %>
<%
	User user = new User();
	Service service = new Service();
	int user_id = 10240;
	if (session.getAttribute("user_id") == null) {
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("<script>alert(`会话过期，将重新登录！`)</script>");
		String content = 0 + ";URL= " +request.getContextPath()+ "/jsp/login/sign_in.jsp";
		response.setHeader("REFRESH ", content);
	} else {
		user_id = Integer.valueOf((String) session.getAttribute("user_id"));
		user = service.getUserFromId(user_id);
	}
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改个人信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/city.js"></script>
<script>
	function resetEx(form){
		form.reset();
		(function(){  
			var pHtmlStr = '';  
			for(var name in pc){  
				if(name=="<%=user.getProvince()%>")
					pHtmlStr = pHtmlStr + '<option value="'+name+'" selected="selected">'+name+'</option>';  
				else
					pHtmlStr = pHtmlStr + '<option value="'+name+'">'+name+'</option>';  
				}  
			$("#province").html(pHtmlStr); 
			
			$("#province").change(function(){  
					var pname = $("#province option:selected").text();  
					var pHtmlStr = '';  
					var cityList = pc[pname];  
				for(var index in cityList){ 
					if(cityList[index]=="<%=user.getCity()%>")	
	   				pHtmlStr = pHtmlStr + '<option value="'+cityList[index]+'" selected="selected">'+cityList[index]+'</option>';  
	 			else
	 				pHtmlStr = pHtmlStr + '<option value="'+cityList[index]+'">'+cityList[index]+'</option>';  
			}  
			$("#city").html(pHtmlStr);  
				});  
			$("#province").change();  
			
			$("#city").val(["<%=user.getCity()%>"]);
			$("#sex").val(["<%=user.getSex()%>"]);
				})();  
	}
</script>

<script type="text/javascript">
	$(document)
	.ready(
			function() {
				
				$("#age")
						.blur(
								function() {
									var age = $("#age").val();
									if(age!=""){
										if(age<=0||age>150){
											
										
												alert("这不可能是人类的年龄！");
												$("#age").val("");
												$("#age").focus();
									
											
										}
									}
								});
			});

	
</script>
</head>

<body >
<!--修改信息begin-->
        	<div id="personalcenter_changeinfo">
            	<h1 style=" font-size:24px; width:920px; margin-left:40px;">█ 我的资料</h1>
                <form id="formname" name="formname" action="${pageContext.request.contextPath}/servlet/ChangeInformation" enctype="multipart/form-data" method="post">
                <div style="float:right; margin-right:100px;">
                	<input onchange="change()" type="file"  id="changeinfo_head" name="touxiang" accept="image/*">
                	
                </div>
                <img id="touxiang" src="<%=user.getTouxiang() %>" style="width:200px;height:200px;border-radius:100px;float:right; position:relative;right:-195px;">
                <script type="text/javascript">
					function change() {
						var pic = document.getElementById("touxiang"), file = document
								.getElementById("changeinfo_head");
				
						var ext = file.value.substring(file.value.lastIndexOf(".") + 1)
								.toLowerCase();
				
						// gif在IE浏览器暂时无法显示
						if (ext != 'png' && ext != 'jpg' && ext != 'jpeg') {
							alert("图片的格式必须为png或者jpg或者jpeg格式！");
							return;
						}
						var isIE = navigator.userAgent.match(/MSIE/) != null, isIE6 = navigator.userAgent
								.match(/MSIE 6.0/) != null;
				
						if (isIE) {
							file.select();
							var reallocalpath = document.selection.createRange().text;
				
							// IE6浏览器设置img的src为本地路径可以直接显示图片
							if (isIE6) {
								pic.src = reallocalpath;
							} else {
								// 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
								pic.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\""
										+ reallocalpath + "\")";
								// 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
								pic.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
							}
						} else {
							html5Reader(file);
						}
					}
				
					function html5Reader(file) {
						var file = file.files[0];
						var reader = new FileReader();
						reader.readAsDataURL(file);
						reader.onload = function(e) {
							var pic = document.getElementById("touxiang");
							pic.src = this.result;
						}
					}
				</script>
                <div style="float:left; margin-top:30px;">
                <span style="font-size:20px; margin-left:100px;">用&ensp;户&ensp;名：</span><span style="font-size:20px;"><%=user.getUsername() %></span><br><br>
                <span style="font-size:20px; margin-left:100px;">注册时间：</span><span style="font-size:20px;"><%=user.getRegister_time() %></span><br><br>
                <span style="font-size:20px; margin-left:100px;">注册手机：</span><span style="font-size:20px;"><%=user.getPhonenum() %></span><br><br>
                <span style="font-size:20px; margin-left:100px;">性&ensp;&ensp;&ensp;&ensp;别：</span>
                <select id="sex" name="sex" style="width:100px; border:1x solid #000; "> 
                	<option value="男">男</option>
                    <option value="女">女</option>
                </select>   <br><br>
                <span style="font-size:20px; margin-left:100px;">年&ensp;&ensp;&ensp;&ensp;龄：</span>
                
                <input type="text" value="<%=user.getAge()%>" id="age" name="age" style=" border:1x solid #000;" required><br><br>
                <span style="font-size:20px; margin-left:100px;">所在地区：</span>
               	<select id="province" name="province" ></select>  
				<select id="city" name="city"></select>
				<script>  
    				(function(){  
        			var pHtmlStr = '';  
        			for(var name in pc){  
        				if(name=="<%=user.getProvince()%>")
        					pHtmlStr = pHtmlStr + '<option value="'+name+'" selected="selected">'+name+'</option>';  
        				else
            				pHtmlStr = pHtmlStr + '<option value="'+name+'">'+name+'</option>';  
      				}  
        			$("#province").html(pHtmlStr); 
        			
        			$("#province").change(function(){  
            				var pname = $("#province option:selected").text();  
            				var pHtmlStr = '';  
            				var cityList = pc[pname];  
           			for(var index in cityList){ 
           				if(cityList[index]=="<%=user.getCity()%>")	
               				pHtmlStr = pHtmlStr + '<option value="'+cityList[index]+'" selected="selected">'+cityList[index]+'</option>';  
             			else
             				pHtmlStr = pHtmlStr + '<option value="'+cityList[index]+'">'+cityList[index]+'</option>';  
            		}  
            		$("#city").html(pHtmlStr);  
       				});  
        			$("#province").change();  
        			
        			$("#city").val(["<%=user.getCity()%>"]);
        			$("#sex").val(["<%=user.getSex()%>"]);
   					})();  
				</script>
				<br><br>
                <span style="font-size:20px; margin-left:100px;">个人简介：</span><br><textarea id="introduction" name="introduction" style=" margin-left:200px;width:250px; height:170px; resize:none;" placeholder="一句话介绍你自己！" required><%=user.getIntroduction() %></textarea>
                </div>
                <div style="clear:both; width:960px;">
                <input type="submit" value="保存" style="background-color:#39f; border:1px solid #39f; font-size:24px; color:#FFF; margin-left:350px; margin-top:50px;"/>
                <input type="button" onclick="resetEx(formname)" value="取消" style="cursor:pointer;background-color:#999; border:1px solid #ccc; font-size:24px; color:#FFF; margin-left:80px; margin-top:50px;"/>
                </div>
                </form>
            </div>
            <!--修改信息end-->
            <!--修改密码begin-->
            <div id="personalcenter_changepassword">
            	<h1 style=" font-size:24px; width:920px; margin-left:40px;">█ 密码更改</h1>
                <div style="width:500px; margin:30px auto;">
                <form action="${pageContext.request.contextPath}/servlet/ChangePassword" method="post">
                <span style="font-size:20px;margin-left:100px; ">原&ensp;密&ensp;码：</span><input  id="password" type="password" style="border:1px solid;font-size:20px;" required><br><br>
                <span style="font-size:20px; margin-left:100px;">新&ensp;密&ensp;码：</span><input id="xmm" name="password" type="password" style="border:1px solid;font-size:20px;" required><br><br>
                <span style="font-size:20px; margin-left:100px;">确认密码：</span><input type="password" id="zcsrmm" style="border:1px solid;font-size:20px;" required><br><br>
                <input type="submit" value="保存" style="background-color:#39f; border:1px solid #39f; font-size:24px; color:#FFF; margin-left:200px; margin-top:20px;"/>
                <input type="reset" value="取消" style="background-color:#999; border:1px solid #ccc; font-size:24px; color:#FFF; margin-left:80px; margin-top:20px;"/>
                </form>
                </div>
            </div>
            <script>
			$(document)
			.ready(
					function() {
						$("#password")
								.blur(
										function() {
										
											var val = $("#password").val();
											val = $.trim(val);
											 if (val != "") {
												var url = "${pageContext.request.contextPath}/servlet/ValiatePassword";
												var args = {
													"password" : val,
													"time" : new Date()
												};
												$.get(url, args,
														function(data) {
															var result=eval("("+data+")");
															if(result.bol){
																alert("密码正确");
															}
															else{
																alert("密码错误，请重新输入");
																$("#password").val("");
																$("#password").focus();
															}
												});
											} 
											
										});
					});
				
			</script>
            <script type="text/javascript">
			$(document)
			.ready(
					function() {
						
						$("#zcsrmm")
								.blur(
										function() {
											var pass1 = $("#xmm").val();
											var pass2 = $("#zcsrmm").val();
											if(pass1!=""){
												
												if(pass1!=pass2){
													alert("输入密码不一致，请重新输入");
													$("#xmm").val("");
													$("#zcsrmm").val("");
													$("#xmm").focus();
													
												}
												
											}
										});
					});
			$(document)
			.ready(
					function() {
						$("#xmm")
								.blur(
										function() {
											var pass1 = $("#xmm").val();
											var pass2 = $("#zcsrmm").val();
											if(pass2!=""){
												
												if(pass1!=pass2){
													alert("输入密码不一致，请重新输入");
													$("#xmm").val("");
													$("#zcsrmm").val("");
													$("#zcsrmm").focus();
												}
												
											}
										});
					});
			
		</script>
            <!--修改密码end-->
</body>
</html>
