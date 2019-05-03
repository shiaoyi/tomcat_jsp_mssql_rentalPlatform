<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Connection.jsp"%>
    <%@ page import="java.text.SimpleDateFormat,java.text.DateFormat" %>
    
    <%
    int number = Integer.parseInt(request.getParameter("num")== null ? "0" : request.getParameter("num")) ;
    String ID = request.getParameter("id");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Score</title>
</head>
<body>

	<form action="Comment.jsp?id=<%=ID %>" method="post">
	
	<select name="num" >
		<option name="score" value=0>-請評分-</option>
		<option name="score" value=1>1</option>
		<option name="score" value=2>2</option>
		<option name="score" value=3>3</option>
		<option name="score" value=4>4</option>
		<option name="score" value=5>5</option>
	</select>
<% 	
try{

	
	if(number!=0 ){
	DateFormat df = new SimpleDateFormat("yyyyMMdd");
	String formattedDate = df.format(new java.util.Date());

   
	String name=(String) session.getAttribute("UName");
	
		
	String query = "Insert into User_score(UID,UName,uscore,score_date) "+
				   "Values ('"+ ID +"','"+ name +"','"+ number +"','"+ formattedDate +"')";
				   

	
	if(st.executeUpdate(query)==1){
		out.print("<br/>");
		out.print("評分成功!");
	}
	
	response.setHeader("Refresh" , "1;url='Personal.jsp'");	
	
	st.close(); 
	}
}catch(Exception e){
	out.println("<br>已評分過！");
	
	
}
	
	
			
			
%>
<br>
<input type="submit" value="送出">
	</form>
	<form action = "Classification.jsp"> 
	<input type="submit" value = "回首頁">
	</form>
</body>
</html>