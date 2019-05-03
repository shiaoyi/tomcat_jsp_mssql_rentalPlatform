<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="Connection.jsp"%>
     <%@ page import="java.text.SimpleDateFormat,java.text.DateFormat" %>
<html>
    <%
	request.setCharacterEncoding("UTF-8"); 
	
	String category = request.getParameter("cate") == null ? "" : request.getParameter("cate");
	String object = request.getParameter("getObject") == null ? "" : request.getParameter("getObject");
	String image = request.getParameter("getImage") == null ? "" : request.getParameter("getImage");
	String price = request.getParameter("getPrice") == null ? "" : request.getParameter("getPrice");
	String city = request.getParameter("getCity") == null ? "" : request.getParameter("getCity");
	String way = request.getParameter("getWay") == null ? "" : request.getParameter("getWay");
	String detail = request.getParameter("getDetail") == null ? "" : request.getParameter("getDetail");
	String start = request.getParameter("getStart") == null ? "" : request.getParameter("getStart");
	String end = request.getParameter("getEnd") == null ? "" : request.getParameter("getEnd");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload new Item</title>
</head>
<body>
<h1>上傳表單</h1><br>
<form action="New.jsp" method="post">
	
	*類別:
	<select name="cate">
	<option name="cat" value="">-選擇類別-</option>
	<option name="cat" value="服裝">服裝</option>
	<option name="cat" value="配件">配件</option>
	<option name="cat" value="文具">文具</option>
	<option name="cat" value="家用品">家用品</option>
	<option name="cat" value="電子用品">電子用品</option>
	<option name="cat" value="運動用品">運動用品</option>
	<option name="cat" value="娛樂用品">娛樂用品</option>
	<option name="cat" value="樂透">樂器</option>
	<option name="cat" value="其他">其他</option>
	</select><br>
	*租物名:<input type="text" name="getObject" value='<%= object %>'><br>
	*預估價錢：<input type="text" name="getPrice" value='<%= price %>'><br>
	*地點：<input type="text" name="getCity" value='<%= city %>'><br>
	*方式：<input type="text" name="getWay" value='<%= way %>'><br>
	*出租日期：<input type="text" name="getStart" value='<%= start %>'><br>
	*截止日期：<input type="text" name="getEnd" value='<%= end %>'><br>
	圖片連結：<input type="text" name="getImage" value='<%= image %>'><br>
	詳細資訊：<input type="text" name="getDetail" value='<%= detail %>'><br>
	<p style="color:red;">*為必填</p><br>
	
	
	
	
	<%
	
		
	if(request.getParameter("getObject") != null & request.getParameter("getObject") != ""){
		if(category!=null & category != ""){	
	String name=(String) session.getAttribute("UName");
	
	String catQuery = "Select Classification.CID, User_info.UID "+
					  "From Classification,User_info "+
					  "Where Classification.CName='"+ category +"' and "+ "User_info.UName='"+ name +"'";
	
	ResultSet rs = st.executeQuery(catQuery);
	String cid = "";
	int uid = 0;
	DateFormat df = new SimpleDateFormat("yyyyMMdd");
	String formattedDate = df.format(new java.util.Date());
	
	while(rs.next()){
		cid = rs.getString("CID");
		uid = rs.getInt("UID");
	}
	
	
	String Query = " INSERT INTO Rent (RName,RMoney,CID,city,way,Details,Image,state,date,UID,startdate,enddate,ifrent) " + 
            " VALUES ('"+object+"','"+price+"','"+cid+"','"+city+"','"+way+"','"+detail+"','"+image+"','offer','"+formattedDate+"','"+uid+"','"+start+"','"+end+"','no') ";
	
	if(st.executeUpdate(Query)==1){
		out.print("<br/>");
		out.print("上傳成功!");
	};
	response.setHeader("Refresh" , "1;url='Classification.jsp'");	
	
	st.close(); 
	}
	}
	
	
	%>
	
	<input type="submit" value="發佈">

</form>
<form action = "Classification.jsp"> 
	<input type="submit" value = "回首頁">
	</form>

</body>
</html>