<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改个人信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/city.js"></script>
</head>

<body>
<!--修改信息begin-->
        	<div id="personalcenter_changeinfo">
            	<h1 style=" font-size:24px; width:920px; margin-left:40px;">█ 我的资料</h1>
                <div style="float:right; margin-right:100px;">
                	<input type="file"  id="changeinfo_head" accept="image/*">
                	
                </div>
                <img src="${pageContext.request.contextPath}/image/head.png" style="float:right; position:relative;right:-195px;">
                <div style="float:left; margin-top:30px;">
                <span style="font-size:20px; margin-left:100px;">用&ensp;户&ensp;名：</span><input type="text" style="border:1px solid;font-size:20px;"><br><br>
                <span style="font-size:20px; margin-left:100px;">注册时间：</span><span style="font-size:20px;">2018-05-18</span><br><br>
                <span style="font-size:20px; margin-left:100px;">注册手机：</span><span style="font-size:20px;">10000000000</span><br><br>
                <span style="font-size:20px; margin-left:100px;">性&ensp;&ensp;&ensp;&ensp;别：</span>
                <select style="width:100px; border:1x solid #000; "> 
                	<option>男</option>
                    <option>女</option>
                </select><br><br>
                 <span style="font-size:20px; margin-left:100px;">年&ensp;&ensp;&ensp;&ensp;龄：</span>
                <select style="width:50px; border:1x solid #000; "> 
                	<option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                </select>
                <select style="width:50px; border:1x solid #000; "> 
                	<option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                </select><br><br>
                 <span style="font-size:20px; margin-left:100px;">所在地区：</span>
               	<select id="province"></select>  
				<select id="city"></select>
				<script>  
    				(function(){  
        			var pHtmlStr = '';  
        			for(var name in pc){  
            		pHtmlStr = pHtmlStr + '<option>'+name+'</option>';  
        }  
        			$("#province").html(pHtmlStr);  
        			$("#province").change(function(){  
            				var pname = $("#province option:selected").text();  
            				var pHtmlStr = '';  
            				var cityList = pc[pname];  
            			for(var index in cityList){  
                			pHtmlStr = pHtmlStr + '<option>'+cityList[index]+'</option>';  
            }  
            		$("#city").html(pHtmlStr);  
        });  
        			$("#province").change();  
    })();  
				</script><br><br>
                <span style="font-size:20px; margin-left:100px;">个人简介：</span><br><textarea style=" margin-left:200px;width:250px; height:170px; resize:none;" placeholder="一句话介绍你自己！"></textarea>
                </div>
                <div style="clear:both; width:960px;">
                <input type="submit" value="保存" style="background-color:#39f; border:1px solid #39f; font-size:24px; color:#FFF; margin-left:350px; margin-top:50px;"/>
                <input type="submit" value="取消" style="background-color:#999; border:1px solid #ccc; font-size:24px; color:#FFF; margin-left:80px; margin-top:50px;"/>
                </div>
            </div>
            <!--修改信息end-->
            <!--修改密码begin-->
            <div id="personalcenter_changepassword">
            	<h1 style=" font-size:24px; width:920px; margin-left:40px;">█ 密码更改</h1>
                <div style="width:500px; margin:30px auto;">
                <span style="font-size:20px;margin-left:100px; ">原&ensp;密&ensp;码：</span><input type="text" style="border:1px solid;font-size:20px;"><br><br>
                <span style="font-size:20px; margin-left:100px;">新&ensp;密&ensp;码：</span><input type="text" style="border:1px solid;font-size:20px;"><br><br>
                <span style="font-size:20px; margin-left:100px;">确认密码：</span><input type="text" style="border:1px solid;font-size:20px;"><br><br>
                <input type="submit" value="保存" style="background-color:#39f; border:1px solid #39f; font-size:24px; color:#FFF; margin-left:200px; margin-top:20px;"/>
                <input type="submit" value="取消" style="background-color:#999; border:1px solid #ccc; font-size:24px; color:#FFF; margin-left:80px; margin-top:20px;"/>
                </div>
            </div>
            <!--修改密码end-->
</body>
</html>
