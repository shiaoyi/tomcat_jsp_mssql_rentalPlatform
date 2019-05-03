<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Connection.jsp"%>

    <%
    request.setCharacterEncoding("UTF-8"); 

    String ID = request.getParameter("id");
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rent Date</title>
</head>
<body>
<form action="Rent.jsp"  method="post">
	
<% 
	String name=(String) session.getAttribute("UName");
	
	String idQuery = "Select  Rent.UID, startdate, enddate, RMoney "+
		        "From Rent "+
				"Where  Rent.RID = "+ID ;
	
			        

	ResultSet rs = st.executeQuery(idQuery);
	
	
	int uid=0;
	int use_uid = 0;
	String start = "";
	String end = "";
	int price = 0;
	
	while(rs.next()){
		
		uid = rs.getInt("UID");
		start  = rs.getString("startdate");
		end = rs.getString("enddate");
		price = rs.getInt("RMoney");
		
	}




		String query = " INSERT INTO Transaction_info (UID,UName,RID,RDateStart,RDateReturn,Total) " + 
	                   " VALUES ('"+uid+"','"+name+"','"+ID+"','"+start+"','"+end+"','"+price+"');"+
	                   "UPDATE Rent "+ 
	   				   "SET ifrent = 'yes' "+
	   				   "WHERE RID = "+ID;
		
		if(st.executeUpdate(query)==1){
			out.print("<br/>");
			out.print("交易成功!");
		};
		response.setHeader("Refresh" , "1;url='Classification.jsp'");	
		
		st.close(); 
		
%>
</form>
</body>
</html>