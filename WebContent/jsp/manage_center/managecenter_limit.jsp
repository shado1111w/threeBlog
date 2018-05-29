<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>限制管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
<!--限制管理begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 限制管理</span><br/>
            <form>
            <div style="margin:20px 100px;margin-right:20px;">
           <span style=" font-size:24px;"> 查询：</span> <input type="text" style=" font-size:24px;width:400px; border:1px solid;" placeholder="请输入用户名"/><br/><br/>
           <span style=" font-size:24px;">用户名&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</span>
           <span style=" font-size:24px;">开始时间&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</span>
           <span style=" font-size:24px;">结束时间</span><br/><br/>
           <div style="margin-bottom:20px;">
           <label style="width:200px; float:left;"><input type="checkbox" checked style="width:20px;height:20px;"/><span style="font-size:24px;">marin</span></label> <input type="date" style="border:1px solid;margin-left:70px;"/>
           <input type="date" style="border:1px solid;margin-left:160px;"/>
           </div>
           <div style="margin-bottom:20px;">
           <label style="width:200px; float:left;"><input type="checkbox" checked style="width:20px;height:20px;"/><span style="font-size:24px;">jackson</span></label> <input type="date" style="border:1px solid;margin-left:70px;"/>
           <input type="date" style="border:1px solid;margin-left:160px;"/>
           </div>
           <div style="margin-bottom:20px;">
           <label style="width:200px; float:left;"><input type="checkbox" checked style="width:20px;height:20px;"/><span style="font-size:24px;">jerry</span></label> <input type="date" style="border:1px solid;margin-left:70px;"/>
           <input type="date" style="border:1px solid;margin-left:160px;"/>
           </div>
           </div>
           <input type="submit" value="锁定" style="margin-left:320px; width:80px; height:50px; font-size:20px; margin-top:30px; margin-bottom:30px; border:1px solid; font-weight:bold; background-color:#FFF; border-radius:5px;"/>
        <input type="submit" value="解锁" style="margin-left:150px; width:80px; height:50px; font-size:20px; margin-top:30px; margin-bottom:30px; border:1px solid; font-weight:bold; background-color:#FFF; border-radius:5px;"/>
           </form>
         </div>  
    <!--限制管理end--> 
</body>
</html>
