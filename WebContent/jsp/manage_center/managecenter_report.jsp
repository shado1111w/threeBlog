<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>举报管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
<!--举报管理begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 举报管理</span>
           <select style="width:150px; float:right; margin-right:50px; font-size:18px;">
    			<option value="notread">未处理</option>
    			<option value="read">已处理</option>
    			<option value="all">全部</option>
    	    </select>
            <table id="information_table" border="1">
    <tr>
    <th width="30%">举报内容</th>
    <th width="20%">违规用户</th>
    <th width="30%">举报用户及理由</th>
    <th width="20%">处理</th>
    </tr>
    <tr>
    <td><a href="#">我们是时间的旅行者</a></td>
    <td>jerry</td>
    <td><span>&emsp;Tom</span>----<span>虚假信息</span>----<span>这篇文章很假，欺骗我感情，恶心！</span></td>
    <td><input type="button" value="删除" style="cursor:pointer;border:1px solid; background-color:#FFF;"/>
    <input type="button" id="limit" value="限制" style="cursor:pointer;border:1px solid #000; margin-left:20px;background-color:#FFF;"/></td>
    </tr>
    <tr>
    <td><a href="#">丢，*他*的</a></td>
    <td>jerry</td>
    <td><span>&emsp;Tom</span>----<span>违反社会主义核心价值观</span>----<span>人身攻击！</span></td>
    <td>已处理</td>
    </tr>
    </table>
         </div>
    <!--举报管理end--> 
        
</body>
</html>
