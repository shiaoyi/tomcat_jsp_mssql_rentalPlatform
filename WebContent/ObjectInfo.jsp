<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Connection.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Object Information</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String ID = request.getParameter("id");
	String query="SELECT RName, RMoney, way, city, Details, Image, startdate, enddate "+
		  "FROM Rent "+
		  "WHERE RID = '" + ID +"'";
   ResultSet rs = st.executeQuery(query);
   
	
  
   String object = "";
   int price = 0;
   String Tway = "";
   String Tcity = "";
   String image = "";
   String details= "";
   String start ="";
   String end ="";
   
	
	
	while (rs.next()) {
		
		object = rs.getString("RName");
		price = rs.getInt("RMoney");
		Tway = rs.getString("way");
		Tcity= rs.getString("city");
		image = rs.getString("Image");
		details = rs.getString("Details");
		start = rs.getString("startdate");
		end = rs.getString("enddate");
		
	}
	
	
    out.print("<h1>租物資訊</h1><br>");

	
	out.print("租物："+object+"<br>");
	out.print("預估價錢：$"+price+"<br>");
	out.print("交易方式："+Tway+"<br>");
	out.print("鄰近地點："+Tcity+"<br>");
	out.print("出租日："+start+"<br>");
	out.print("截止日："+end+"<br>");
	out.print("圖片：<a href = '"+image+"'>看圖片</a><br>");
	out.print("詳細說明："+details+"<br");
%>
	<form action = "Classification.jsp" method="post"> 
	<input type="submit" value = "回首頁">
	</form>

</body>
</html>