<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
    <%@ page import = "javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback</title>
</head>
<body>
<%
String dbURL = "jdbc:mysql://localhost:3306/developer-sandbox";
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
PreparedStatement st = con.prepareStatement("insert into feedback values(?, ?, ?)"); 

String name 	=	request.getParameter("name");
String email 	=	request.getParameter("email");
String message	=	request.getParameter("message");

st.setString(1, name);
st.setString(2, email);
st.setString(3, message);
st.executeUpdate();
out.println("<html><body><b>Thank you for your Feedback...."+ "</b></body></html>");
 
}
catch (Exception e)
{ 
	out.println("Error....");
	e.printStackTrace(); 
}  
%>
</body>
</html>