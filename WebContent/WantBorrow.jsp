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
<title>Borrow Date</title>
</head>
<body>

	
<% 
String name=(String) session.getAttribute("UName");

String idQuery = "Select Rent.UID, Rent.startdate, Rent.enddate, Rent.RMoney "+
	        "From Rent "+
			"Where  Rent.RID = "+ID ;
	        

ResultSet rs = st.executeQuery(idQuery);



int uid=0;
int use_uid = 0;
String start = "";
String end = "";
String price ="";

while(rs.next()){
	
	uid = rs.getInt("UID");
	end = rs.getString("enddate");
	start  = rs.getString("startdate");
	price = rs.getString("RMoney");
	
}




	String query = " INSERT INTO Transaction_info (UID,RID,UName,RDateStart,RDateReturn,Total) " + 
                   " VALUES ('"+uid+"','"+ID+"','"+name+"','"+start+"','"+end+"','"+price+"');"+
                   "UPDATE Rent "+ 
   				   "SET ifrent = 'yes' "+
   				   "WHERE RID = "+ID;
	
	if(st.executeUpdate(query)==1){
		out.print("<br/>");
		out.print("交易成功!");
	};
	response.setHeader("Refresh" , "1;url='Home2.jsp'");	
	
	st.close(); 
%>


</body>
</html>