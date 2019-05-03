<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Connection.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Renter Information</title>
</head>
<body>

<%

	request.setCharacterEncoding("UTF-8");
	String ID = request.getParameter("id");
	String average = (String)request.getParameter("ave");
	String query="SELECT User_info.UName, User_info.USex, User_info.UPhone, Rent.city  "+
		  "FROM User_info "+
		  "Inner Join Rent on User_info.UID = Rent.UID "+	  
		  "WHERE User_info.UID = " + ID ;
   ResultSet rs = st.executeQuery(query);
	
   String name = "";
   String gender = "";
   String address = "";
   String contact = "";
   
   
	
	
	while (rs.next()) {
	  
		name = rs.getString("UName");
		gender = rs.getString("USex");
		address = rs.getString("city");
		contact = rs.getString("UPhone");
		
		
	}
	
	
    out.print("<h1>承租人資訊</h1><br>");

	out.print("姓名："+name+"<br>");
	out.print("性別："+gender+"<br>");
	out.print("交易地點："+address+"<br>");
	out.print("聯絡方式："+contact+"<br>");
	out.print("評分："+average+"/5.0<br>");
%>
	<form action = "Classification.jsp"> 
	<input type="submit" value = "回首頁">
	</form>
	
	

</body>
</html>