<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Connection.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete</title>
</head>
<body>

<% 

String ID = request.getParameter("id");

String query="DELETE FROM Rent "+
			 "WHERE RID="+ID ;

if(st.executeUpdate(query)==1){
	out.print("<br/>");
	out.print("刪除成功!");
};
response.setHeader("Refresh" , "1;url='Classification.jsp'");	

st.close(); 
%>

</body>
</html>