<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<%@page import="java.sql.ResultSet"%>
<%@ include file="Connection.jsp"%>

    <%
	request.setCharacterEncoding("UTF-8"); 
	
	String name = request.getParameter("getName") == null ? "" : request.getParameter("getName");
	String password = request.getParameter("getPassword")== null ? "" : request.getParameter("getPassword");
	String connectinfo = request.getParameter("getConnect")== null ? "" : request.getParameter("getConnect");
	String sex = request.getParameter("getSex")== null ? "" : request.getParameter("getSex");
	
	
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>
<h1 align="center">註冊</h1><br/>
<form action="Register.jsp"  method="post" align="center" >

	Name:<input type="search" name="getName" value='<%= name %>'  /><br/>
	
	Password:<input type="search" name="getPassword" value='<%= password %>'  /><br/>
	
	Cellphone:<input type="search" name="getConnect" value='<%= connectinfo %>'  /><br/>
	
	Sex:<input type="search" name="getSex" value='<%= sex %>'  /><br/>
	
	
	
	<%
	try{
		if(request.getParameter("getName") != null && request.getParameter("getName") != ""){
		String query = " INSERT INTO User_info (UName,Password,UPhone,USex) " + 
					   "Values ('"+ name +"','"+ password +"','"+ connectinfo +"','"+ sex +"')";
		
				      
	                   		
		if(st.executeUpdate(query)==1){
			out.print("<br/>");
			out.print("註冊成功!");
		};
		response.setHeader("Refresh" , "1;url='LogIn.jsp'");	
		
		st.close(); 
		}
		}catch(Exception e){
			out.println(e.getMessage());
		}
	%>
	
	<br/>
	<br/>
	
	<input type="submit" value="送出">
	

</form>

</body>
</html>