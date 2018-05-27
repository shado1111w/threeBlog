<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>点赞消息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
</head>

<body>
<!--评论消息begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 点赞消息</span>
            <select style="width:100px; float:right; margin-right:50px; font-size:18px;">
    			<option value="notread">未读</option>
    			<option value="read">已读</option>
    			<option value="all">全部</option>
    	    </select>
            <table id="information_table" border="1">
    <tr>
    <th width="5%">#</th>
    <th width="55%">点赞消息</th>
    <th width="25%">时间</th>
    <th width="15%">状态</th>
    </tr>
    <tr>
    <td>1</td>
    <td>ooo点赞了你的博文《我们都是时间的旅行者》</td>
    <td>2018-05-20</td>
    <td><img  id="read" src="${pageContext.request.contextPath}/image/unread.png"  style="width:40px; height:40px;">
        <!--查看图标更换的jq-->
<script>
$('#read').click(function(){  
          
        if($('#read').attr('src')=='image/unread.png'){  
            $('#read').attr('src','image/read.png');  
        }
          
});  
</script></td>
    </tr>
    <tr>
    <td>2</td>
    <td>ooo点赞了你的评论“（评论内容）”</td>
    <td>2018-04-01</td>
    <td><img  id="read1" src="${pageContext.request.contextPath}/image/unread.png"  style="width:40px; height:40px;">
        <!--查看图标更换的jq-->
<script>
$('#read1').click(function(){  
          
        if($('#read1').attr('src')=='image/unread.png'){  
            $('#read1').attr('src','image/read.png');  
        }
          
});  
</script></td>
    </tr>
    </table>
         </div>
    <!--评论消息end--> 
</body>
</html>
