<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%!
	
	String Account = "sa";
	String Password = "*******";
	String DBname = "DB";
	String Driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String Url = "jdbc:sqlserver://140.119.19.35:1433;databaseName=" + DBname;
	Statement st;
	
%>
<%
try {
	Class.forName(Driver);
	
	// create the Java connection
	Connection conn = DriverManager.getConnection(Url, Account, Password);

	// create the Java statement
	st = conn.createStatement();
	


} catch (Exception e) {
	
	out.println("Cant' load");
	out.println(e.toString());
}
%>

