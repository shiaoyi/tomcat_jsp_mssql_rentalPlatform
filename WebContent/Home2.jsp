<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Connection.jsp"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	
	String item = request.getParameter("searchText") == null ? "" : request.getParameter("searchText");
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Borrow and situation</title>
<style>
.button{
	display:inline-block;
}

.square{

width:500px;
height:40px;
	margin-left:370px;
	
}
</style>
</head>
<body>
<div class = "square">
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
		
		<form method="post" align="center">
		搜尋類別: <input type="search" name="searchText" value='<%= item  %>' />
		<input type="submit" name="Search" value="Search" /> <br /> <br />
		
			
				

			
			

			<%

					
				try {
					String Where = "";
					
					if(request.getParameter("searchText") != null & request.getParameter("searchText") != "") {
						Where = " and Classification.CName Like '%" + request.getParameter("searchText") + "%'";
					}
					
					
					String query="Select Rent.RName, User_info.UName, User_info.UPhone, User_info.UName, Rent.RMoney, Rent.city, Rent.way, Rent.RID, Rent.startdate, Rent.enddate, Classification.CName "+
								 "From Rent "+
								 "INNER Join Classification ON Rent.CID = Classification.CID "+
								 "INNER Join User_info ON Rent.UID = User_info.UID "+
								 "Where Rent.state='want' and Rent.ifrent='no' "+Where;
								
									
					// execute the query, and get a Java ResultSet
			
					ResultSet rs = st.executeQuery(query);
					// iterate through the Java ResultSet
					while (rs.next()) {

						String Cate = rs.getString("CName");
						String Object = rs.getString("RName");
						String Name = rs.getString("UName");
						String contact = rs.getString("UPhone");
						int money = rs.getInt("RMoney");
						String way = rs.getString("way");
						String city = rs.getString("city");
						String start = rs.getString("startdate");
						String end = rs.getString("enddate");
						int rid = rs.getInt("RID");
						
						
						out.print("<div style='border:solid gray 2px;width:300px;margin-right:auto;margin-left:auto;padding:15px 20px;text-align:left'>");
						out.print("需求者:" + Name +"<br/>");
						out.print("分類:" + Cate +"<br/>");
						out.print("租物名:" + Object +"<br/>");
						out.print("聯絡資訊:" + contact +"<br/>");
						out.print("預估價錢:$" + money +"<br/>");
						out.print("出租日期:" + start +"<br>");
						out.print("截止日期:" + end +"<br>");
						out.print("交易方式:" + way +"<br/>");
						out.print("交易地點:" + city +"<br/>");
						out.print("<a href='WantBorrow.jsp?id="+rid+"'>我要提供</a><br>");
						out.print("<a href='Delete.jsp?id="+rid+"'>刪除</a>");
						out.print("</div>");
						out.print("<br/><br/>");
						
					}
					rs.close();
					st.close();
				} catch (Exception e) {

					out.println("Cant' load");
					out.println(e.toString());
				}
			%>

		</form>
	       <form action="LogOut.jsp" method="post" align="center">
	       <br/>
			<input type = "submit" value = "登出"/>
			</form>

</body>
</html>