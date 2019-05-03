<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Connection.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rent and Situation</title>
</head>
<body>

<h1>確認清單</h1><br>

	
<% 
request.setCharacterEncoding("UTF-8");
	String ID = request.getParameter("id");
	
	
	String query="SELECT startdate,enddate,RMoney,RName "+
				 "From Rent "+
				 "Where RID = " + ID ;
	
   ResultSet rs = st.executeQuery(query);
	
   String object = "";
   String start = "";
   String end = "";
   String total = "";
   
   
   
   
	
	
	while (rs.next()) {
	  
		object = rs.getString("RName");
		start = rs.getString("startdate");
		end = rs.getString("enddate");
		total = rs.getString("RMoney");
		
	}
	
	out.print("租物："+object+"<br>");
	out.print("出租日期："+start+"<br>");
	out.print("截止日期："+end+"<br>");
	out.print("總金額："+total+"<br>");
	
	
	
%>  
	<br>
	<form action = "Rent.jsp?id=<%=ID %>" method="post"> 
	<input type="submit" value = "交易">
	</form>
	
	
	<form action = "Classification.jsp"> 
	<input type="submit" value = "回首頁">
	</form>
	

</body>
</html>