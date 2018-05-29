<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>恢复管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
<!--恢复管理begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 恢复管理</span>
            <select style="width:150px; float:right; margin-right:50px; font-size:18px;">
    			<option value="notread">未处理</option>
    			<option value="read">已处理</option>
    			<option value="all">全部</option>
    	    </select>
            <table id="information_table" border="1">
    <tr>
    <th width="60%">申请内容</th>
    <th width="20%">申请时间</th>
    <th width="20%">是否同意</th>
    </tr>
    <tr>
    <td><span>jackson</span>申请恢复其<a href="#"><span>xxx博文</span></a>----<span>我那篇文章不是假的，是真的xxxxxxx</span></td>
    <td>2018-06-01</td>
    <td><input type="button" value="是" style="border:1px solid; background-color:#FFF; cursor:pointer;" />
<input type="button" id="limit" value="否" style="border:1px solid; margin-left:20px;background-color:#FFF; cursor:pointer;"/></td>
    </tr>
    <tr>
    <td><span>jackson</span>申请恢复其<a href="#"><span>xxx评论</span></a>----<span>我的评论没侵权</span></td>
    <td>2018-02-29</td>
    <td>已处理</td>
    </tr>
    </table>
         </div>
    <!--恢复管理end--> 
</body>
</html>
