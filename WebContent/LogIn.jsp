<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="Connection.jsp"%>
    <%
	request.setCharacterEncoding("UTF-8"); 
	
	String name = request.getParameter("allname") == null ? "" : request.getParameter("allname");
	String password = request.getParameter("searchPassword") == null ? "" : request.getParameter("searchPassword");
	String remain = request.getParameter("keep") == null ? "" : request.getParameter("keep");
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log in</title>
</head>
<body>
	<form action="LogIn.jsp" method="post" align="center"><br/>
	<h1>
	歡迎來到出租平台
	</h1><br/>
	Name:
	<input type="search" name="allname" value='<%= name %>'  /><br/>
	Password:
	<input type="password" name="searchPassword" value='<%= password %>'  /><br/>
	記住我<input type="checkbox" name="keep" value='<%= remain %>'/><br/>
	<input type="submit" value="登入">
	
	<% 
	if(request.getParameter("allname") != null & request.getParameter("allname") != "") {
	String userQuery = "Select * "+
	           "From User_info"+
			" Where Password ='"+password+"'";

	ResultSet rs = st.executeQuery(userQuery);
	
	 if(rs.next()){
	String pwd = rs.getString("Password");
	out.print("<br>");
	out.print("登入成功！");
	
	session.setAttribute("UName",name);
	
	//設定cookie
	if(remain!=null){
		Cookie ck = new Cookie("ACCOUNT",name);
		ck.setMaxAge(99999);//設一個大數,儲存久久
		response.addCookie(ck);
	} 
	//導向首頁
	response.sendRedirect("Classification.jsp");
}
	else{
		out.print("<br>");
		out.print("帳號或密碼錯誤！");
	}
	
}

	Cookie[] cks = request.getCookies();
    if(cks!=null){
    	boolean flagCookie=false;
    	for(int i=0;i<cks.length;i++){
    		if(cks[i].getName().equals("ACCOUNT")){
    			flagCookie=true;
    			session.setAttribute("UName",cks[i].getValue());
    			break;
    		}
    	}
    	if( flagCookie )
    		response.sendRedirect("Classification.jsp");
    }
	
	%>
	
	<br/>
	<a href="Register.jsp">還沒有帳號嗎？</a>
	</form>

</body>
</html>