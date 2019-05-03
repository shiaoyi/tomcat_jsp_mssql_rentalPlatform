<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Connection.jsp"%>
<%
	Cookie ck = new Cookie("ACCOUNT",null);
	ck.setMaxAge(0);
	response.addCookie(ck);
	session.removeAttribute("UName");
	response.setHeader("Refresh" , "1,url='LogIn.jsp'");
	%>