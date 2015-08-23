<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
<html><head>
<title></title>
</head>
<body>
<%!
Connection conn = null;
Statement st = null;
ResultSet rs= null;
boolean flag=false;
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root", "admin");
	String sql="select first_name from customer where first_name=?";
	st = conn.createStatement();
	rs = st.executeQuery(sql);	
	if(rs.next()){
		flag=ture;
	}
}
catch (Exception e) {
		e.printStackTrace();
		}
finally{
	try{
	rs.close();
	st.close();
	conn.close();
	}catch (Exception e)
}
%>

<%
   if(flag){
%>
   <jsp:forward page="login_success.jsp">
    </jsp:forward>>
<%
   }else{
%>
   <jsp:forward page="login_failure.jsp">
   </jsp:forward>
 <%
 }
 %>

   
   </body>
</html>