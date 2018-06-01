<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
response.setContentType("text/html;charset=utf-8");
response.getWriter().print("<script>alert(`成功退出账号！`)</script>");
String   content=0+ ";URL= "+request.getContextPath()+"/index.jsp"; 
response.setHeader( "REFRESH ",content);
%>