<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户统计</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
 <!--用户统计begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 用户统计</span><br/>
           <div style="margin:20px 100px;">
            <span style="font-size:24px;">注册用户统计</span><br/>
            <input type="radio"  name="total" style="font-size:20px;width:20px;height:20px;margin-left:150px;margin-bottom:20px;"/>当天新增注册用户<br/>
            <input type="radio"  name="total" style="font-size:20px;width:20px;height:20px;margin-left:150px;margin-bottom:20px;"/>近七天新增注册用户<br/>
            <input type="radio"  name="total" style="font-size:20px;width:20px;height:20px;margin-left:150px;margin-bottom:20px;"/>近一月新增注册用户<br/>
            <input type="text" style=" margin-left:150px;width:300px; font-size:24px;border:1px solid;" value="共xxx人" />
            </div>
            <div style="margin:20px 100px;margin-bottom:50px;">
            <span style="font-size:24px;">登录用户统计</span><br/>
            <input type="radio"  name="total" style="font-size:20px;width:20px;height:20px;margin-left:150px;margin-bottom:20px;"/>当天登录用户<br/>
            <input type="radio"  name="total" style="font-size:20px;width:20px;height:20px;margin-left:150px;margin-bottom:20px;"/>近七天登录用户<br/>
            <input type="radio"  name="total" style="font-size:20px;width:20px;height:20px;margin-left:150px;margin-bottom:20px;"/>近一月登录用户<br/>
            <input type="text" style=" margin-left:150px;width:300px; font-size:24px;border:1px solid;" value="共xxx人" />
            </div>
         </div>  
    <!--用户统计end--> 
</body>
</html>
