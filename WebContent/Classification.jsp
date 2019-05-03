<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<%@ include file="Connection.jsp"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	
	String item = request.getParameter("searchText") == null ? "" : request.getParameter("searchText");
	
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Item Classification</title>
</head>
<style>
	*{
	background-color:#f1f1f1;
	}
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
	.button{
	display:inline-block;
	}

	.square{

	width:500px;
	height:40px;
	margin-left:360px;
	
	}
</style>
<body>
<h1 align="center">歡迎來到出租平台</h1>
	<div class="square">
		<form action="Need.jsp" method="post" class="button">
			<input type = "submit" value = "誠徵物品"/>
		</form>
		
		<form action="New.jsp" method="post" class="button">
			<input type = "submit" value = "上傳物品"/>
		</form>
		
		
		<form action="Personal.jsp" method="post" class="button">
			<input type = "submit" value = "租借物紀錄"/>
		</form>
		
		<form action="Home2.jsp" method="post" class="button">
			<input type = "submit" value = "徵物清單"/>
		</form>
		
		
		<form action="Classification.jsp" method="post" class="button">
			<input type = "submit" value = "租物清單"/>
		</form>
		</div>
		
		<form id="index" method="post" action="Classification.jsp" align="center">
		搜尋類別: <input type="search" name="searchText" value='<%= item  %>' />
		<input type="submit" name="Search" value="Search" /> <br /> <br />
		
		<table border='1px' align="center">
			<tr>
				<th>類別</th>
				<th>租物資訊</th>
				<th>承租人資訊</th>
				<th >狀態與租賃</th>
				<th>刪除</th>

			</tr>
			

			<%

					
				try {
					

					
					String Where = "";
					
					
					
					
					if(request.getParameter("searchText") != null & request.getParameter("searchText") != "") {
						Where = " and Classification.CName Like '%" + request.getParameter("searchText") + "%'";
					}
					
					
					
					
					
					String query="Select Rent.RName, Classification.CName, User_info.UName, User_info.UID, Rent.RID "+
								 "From Rent "+
								 "INNER Join Classification ON Rent.CID = Classification.CID "+
								 "INNER Join User_info ON Rent.UID = User_info.UID "+
								 "Where Rent.state='offer' and Rent.ifrent='no' "+Where;
								
									
					// execute the query, and get a Java ResultSet
			
					ResultSet rs = st.executeQuery(query);
					// iterate through the Java ResultSet
					while (rs.next()) {

						String Cate = rs.getString("CName");
						String Object = rs.getString("RName");
						String Name = rs.getString("UName");
						int rid = rs.getInt("RID");
						int uid = rs.getInt("UID");
						
						out.print("<tr>");
						out.print("<td>" + Cate + "</td>");
						out.print("<td><a href='ObjectInfo.jsp?id="+rid+"'>" + Object + "</a></td>");
						out.print("<td><a href='Calculate.jsp?id="+uid+"'>" + Name + "</a></td>");
						
						out.print("<td><a href='WantRent.jsp?id="+rid+"'>我要租賃</a></td>");
						out.print("<td><a href='Delete.jsp?id="+rid+"'>刪除</a></td>");
						out.print("</tr>");
					}
					rs.close();
					st.close();
				} catch (Exception e) {

					out.println("Cant' load");
					out.println(e.toString());
				}
			%>

		</table>
			
	</form>
	       <form action="LogOut.jsp" method="post" align="center">
	       <br/>
			<input type = "submit" value = "登出"/>
			</form>


</body>
</html>



