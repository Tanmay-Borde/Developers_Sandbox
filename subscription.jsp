<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
    <%@ page import = "javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subscription</title>
</head>
<body>
<%
String dbURL = "jdbc:mysql://localhost:3306/developers-sandbox";
String dbUsername = "root"; 
String dbPassword = ""; 
try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
	
	if(con == null)
	{
		out.println("Connection Failed....\n");
	}
	else
	{
		out.println("Connection Established....");
	}
PreparedStatement st = con.prepareStatement("insert into subscription values(?)");

String sub_email = request.getParameter("sub_email");

st.setString(1, sub_email);
st.executeUpdate();
out.println("Thank you for subscribing....");
 
}
catch (Exception e)
{ 
	out.println("Error....");
	e.printStackTrace(); 
}  
%>
</body>
</html>