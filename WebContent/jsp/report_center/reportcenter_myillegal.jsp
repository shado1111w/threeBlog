<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的举报</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
<div id="report_details" style="border:1px solid;border-style:solid;width:960px;background-color:#FFF;">
        <table id="report_table" border="1">
    <tr>
    <th width="60%">违规通知</th>
    <th width="20%">通知时间</th>
    <th width="20%">处理</th>
    </tr>
    <tr>
    <td>你在博文“···”下的评论因涉嫌违规，已被删除</td>
    <td>2018-05-15</td>
    <td><input type="button" value="确定" style="cursor:pointer;background-color:#FFF;font-size:14px;margin-right:20px;border:1px solid;"/><a href="feedback_reviews.html" style="border:1px solid; color:#000;">反馈</a></td>
    </tr>
    <tr>
    <td>你的博文“···”因涉嫌违规，已被删除</td>
    <td>2018-05-30</td>
    <td><input type="button" value="确定" style="cursor:pointer;background-color:#FFF; font-size:14px;margin-right:20px;border:1px solid;"/><a href="feedback_article.html" style="border:1px solid; color:#000;">反馈</a></td>
    </tr>
    <tr>
    <td>你多次涉嫌违规，账号已被锁定，限制时间：<span>2018-05-30到2019-05-01</span></td>
    <td>2018-06-01</td>
    <td><input type="button" value="确定" style="cursor:pointer;background-color:#FFF; font-size:14px;margin-right:20px;border:1px solid;"/><a href="feedback_user.html" style="border:1px solid; color:#000;">反馈</a></td>
    </tr>
    <tr>
    <td>你的博文“···”因涉嫌违规，已被删除</td>
    <td>2018-04-30</td>
    <td><span>已确定</span></td>
    </tr>
    <tr>
    <td>你的博文“···”因涉嫌违规，已被删除</td>
    <td>2018-03-03</td>
    <td><span>反馈等待审核</span></td>
    </tr>
    </table>
            	
        
      </div>
</body>
</html>