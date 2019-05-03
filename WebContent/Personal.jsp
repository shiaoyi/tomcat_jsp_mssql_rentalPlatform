<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Connection.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Rent Information</title>
<style>
table,tr,th,td{
	border:solid 1px black;
	border-collapse:collapse;
	margin-left:auto;
	margin-right:auto;
	color:#333;
	font-family:微軟正黑體;
	font-size:20px;
	}
	
	th,td{
	padding:15px 20px;
	border-style:dotted;
	}
	th{
	padding:15px 30px;
	font-size:26px;
	}
	td{
	font-weight:lighter;
	}
</style>
</head>
<body>
<%
	
	String name=(String) session.getAttribute("UName");
	
	
	
	String query = "Select Transaction_info.UID,Transaction_info.RDateStart,Transaction_info.RDateReturn,Transaction_info.Total,Rent.RName,Rent.state,User_info.UName "+
			       "From Transaction_info "+
				   "Inner Join Rent On Rent.UID = Transaction_info.UID "+
			       "Inner Join User_info On User_info.UID = Transaction_info.UID "+
				   "Where Transaction_info.UName ='"+name+"' and Rent.ifrent='yes'" ;
				  
				   
	
	out.print("<h1>您的租借物紀錄</h1><br>");
	
	

	
	ResultSet rs = st.executeQuery(query);
	
	int uid =0;
	String other = "";
	String start = "";
	String end = "";
	int price = 0;
	String object = "";
	String type = "";
	
	
	 out.print("<table>");
	 out.print("<tr>");
	 out.print("<th>物品</th>");
	 out.print("<th>承租人/出租人</th>");
	 out.print("<th>出租日期</th>");
	 out.print("<th>截止日期</th>");
	 out.print("<th>總金額</th>");
	 out.print("<th>行為</th>");
	 out.print("<th>評分</th>");
	 out.print("</tr>");
	
	while (rs.next()) {
		 uid = rs.getInt("UID");
		 other = rs.getString("UName");
		 start = rs.getString("RDateStart");
		 end = rs.getString("RDateReturn");
		 price = rs.getInt("Total");
		 object = rs.getString("RName");
		 type = rs.getString("state");
		 
		 
		 out.print("<tr>");
		 out.print("<td>"+object+"</td>");
		 out.print("<td>"+other+"</td>");
		 out.print("<td>"+start+"</td>");
		 out.print("<td>"+end+"</td>");
		 out.print("<td>"+price+"</td>");
		 out.print("<td>"+type+"</td>");
		 out.print("<td><a href='Comment.jsp?id="+uid+"'>評分</a></td>");
		 out.print("</tr>");
		 
	}
	out.print("</table>");
	
%>

	
		
				
				
				
				
				
				

		</tr>
	</table>
	<br>
	<form action = "Classification.jsp" method="post" align="center"> 
	<input type="submit" value = "回首頁" >
	</form>










</body>
</html>