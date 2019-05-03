<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Connection.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
    String ID = request.getParameter("id");

	String query ="Select uscore " +
				  "From User_score "+
			      "Where UID =" + ID;
	
	ResultSet rs = st.executeQuery(query);
	
	int sum = 0;
	int score = 0;
	int count = 0;
	
	while(rs.next()){
		score = rs.getInt("uscore");
		sum+=score;
		count++;
	}
	double average=0;
	
	if(count>0)
	{
	average = sum / count;
	}
	
	response.setHeader("Refresh" ,"1,url='RenterInfo.jsp?ave="+average+"&id="+ID+"'");
	

			

%>
</body>
</html>