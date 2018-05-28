<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>忘记密码</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
	var sends = {
		checked : 1,
		send : function() {
			var numbers = /^1\d{10}$/;
			var val = $('#zh').val().replace(/\s+/g, ""); //获取输入手机号码
			if ($('#signin_xgmm a').attr('class') == 'send1') {
				if (!numbers.test(val) || val.length == 0) {
					alert("手机号码格式错误,请重新输入");	
				}	
				
			}
			if (numbers.test(val)) {
				
				var url = "${pageContext.request.contextPath}/servlet/Zhucheguoma";
				var args = {
					"phone" : val,
					"time" : new Date()
				};
				$.get(url, args,function(data) {
					var result=eval("("+data+")");
					if(result.bol){
						alert("该手机号暂未注册，请返回注册");
						$("#zh").val("");
						$("#zh").focus();
					}
					else{
						var url = "${pageContext.request.contextPath}/servlet/Ranks";
						var args = {
							"phone" : val,
							"time" : new Date()
						};
						$.get(url, args);
						alert("已将验证码发送到你的手机，请注意查收");
					}
				});
				
				var time = 30;
				function timeCountDown() {
					if (time == 0) {
						clearInterval(timer);
						$('#signin_xgmm a').addClass('send1')
								.removeClass('send0').html("发送验证码");
						$('#signin_xgmm a').attr('onclick','return sends.send();'); 
						sends.checked = 1;
						return true;
					}
					$('#signin_xgmm a').html(time + "S后再次发送");
					time--;
					return false;
					sends.checked = 0;
				}
				$('#signin_xgmm a').addClass('send0').removeClass('send1');
				$('#signin_xgmm a').attr('onclick',''); 
				timeCountDown();
				var timer = setInterval(timeCountDown, 1000);
			}
		}
	}
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

<script type="text/javascript">
$(document)
.ready(
		function() {
			$("#yzm")
					.blur(
							function() {
							
								var val = $("#yzm").val();
								val = $.trim(val);
								 if (val != "") {
									var url = "${pageContext.request.contextPath}/servlet/ValiateRanks";
									var args = {
										"mobile_code" : val,
										"time" : new Date()
									};
									$.get(url, args,
											function(data) {
												var result=eval("("+data+")");
												if(result.bol==1){
													alert("请先获取验证码！");
													$("#yzm").val("");
													$("#yzm").focus();
												}else if(result.bol==3){
													alert("验证码错误，请重新输入！");
													$("#yzm").val("");
													$("#yzm").focus();
												}else{
													alert("验证成功！");
												}
										
									});
								} 
								
							});
		});
</script> 	
</head>

<body>
	<div id="signin">
    	<div id="signin_logo">
    	<img src="${pageContext.request.contextPath}/image/footer_logo.png" />
    	</div>
        <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color=#987cb9 SIZE=3>
        <div id="signin_input">
        		<form action="${pageContext.request.contextPath}/servlet/Forget_pwd" method="post">
	        	<div id="signin_xgmm">
	            	<span>手机号 ：</span>
	            	<input type="text" id="zh"  name="zh" style="height:23px;width:350px" required><br><br>
	                <span>验证码 ：</span> 
	                <input type="text" id="yzm" name="yzm" style="height:23px;width:250px" required > 
	                  <a href="javascript:;" method="post"
						class="send1" onclick="return sends.send();">发送验证码</a><br><br>
	                <span>新密码 ：</span> 
	                <input type="password" id="xmm" name="pass1" style="height:23px;width:350px" required><br><br>
	                <span>再次输入新密码 ：</span><input type="password" name="pass2" id="zcsrmm" style="height:23px;width:235px" required>
	            </div>
	            <input type="submit" name="submit" id="signin_xg" value="修改" style="font-weight:bold;font-size: 36px;color:#fff;"/>
	        
	        </form>
        </div>
    </div>
</body>
</html>
