<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Cookie[] cookies=request.getCookies();
	if(cookies!=null&&cookies.length>0){
		for(Cookie c:cookies){
			if(c.getName().equals("password1")||c.getName().equals("phonenum1")){
				c.setDomain("localhost");
				c.setPath("/");
				c.setMaxAge(0); //设置cookie失效
				response.addCookie(c); //保存
			}
		}
	}
	session.invalidate();
	response.setContentType("text/html;charset=utf-8");
	response.getWriter().print("<script>alert(`成功退出账号！`)</script>");
	String   content=0+ ";URL= "+request.getContextPath()+"/index.jsp"; 
	response.setHeader( "REFRESH ",content);
%>