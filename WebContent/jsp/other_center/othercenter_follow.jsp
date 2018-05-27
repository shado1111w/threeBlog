<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ta的关注</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
	<!--中间栏begin-->
        <div id="othercenter_body">
        	<div id="othercenter_info">
        		<h1 style=" font-size:24px; width:960px; margin-left:40px;">█ Ta的关注</h1>
            	<table class="zebra">
    <thead>
    <tr>
        <th >#</th>        
        <th>用户名</th>
        <th>关注时间</th>
        <th>操作</th>

    </tr>
    </thead>
    <tfoot>
    <tr>
        <td>&nbsp;</td>        
        <td></td>
        <td></td>
        <td></td>
    </tr>
    </tfoot>    
    <tbody><tr>

        <td>1</td>        
        <td><a href="#" target="_blank">Marin</a></td>
        <td>2015.5.15</td>
        <td><a href="http://www.baidu.com" target="_blank"><img  id="eye" src="${pageContext.request.contextPath}/image/eye.png"  style="width:40px; height:40px;"></a>
        <!--查看图标更换的jq-->
<script>
$('#eye').click(function(){  
          
        if($('#eye').attr('src')=='image/eye.png'){  
            $('#eye').attr('src','image/eyes.png');  
        }
          
});  
</script>
        </td>
    </tr>  
          
   
</tbody></table>
            	
            </div>
        </div>
        <!--中间栏end-->
</body>
</html>
