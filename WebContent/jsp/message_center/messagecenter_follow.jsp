<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>关注消息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
</head>

<body>
<!--评论消息begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 关注消息</span>
            <select style="width:150px; float:right; margin-right:20px; font-size:18px;">
    			<option value="unfollow">未关注</option>
    			<option value="follow">已关注</option>
    			<option value="follow_eachother">相互关注</option>
                <option value="all">全部</option>
    	    </select>
            <table id="information_table" border="1">
    <tr>
    <th width="5%">#</th>
    <th width="55%">关注消息</th>
    <th width="25%">时间</th>
    <th width="15%">操作</th>
    </tr>
    <tr>
    <td>1</td>
    <td>xxx关注了你</td>
    <td>2018-05-20</td>
    <td>关注Ta</td>
    </tr>
    <tr>
    <td>2</td>
    <td>你关注的ooo也关注了你</td>
    <td>2018-05-18</td>
    <td>取消关注</td>
    </tr>
    </table>
         </div>
    <!--评论消息end--> 
</body>
</html>
