<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
Connection conn = null;
Statement st = null;
ResultSet rs= null;
%>
<% try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root", "admin");
	String sql="select film_id,title,description from film";
	String sql1="select language_id from language where language.last_update=film.last_update";
	st = conn.createStatement();
	rs = st.executeQuery(sql);
	rs1 = st.executeQuery(sql1);
%>

<table border="1" width="80%">
   <tr>
       <td>电影序列号</td>
       <td>电影名称</td>
       <td>电影描述</td>
       <td>語言</td>
   </tr>
    
<%
while(rs.next()){
	String flname=rs.getString("title");
	int flnumber=rs.getInt("film_id");
    String decri=rs.getString("description");
    String lan=rs1.getString("language_id");
}
%>

<tr>
   <td><%=flname %></td>
   <td><%=flnumber %></td>
</tr>




</table>
  catch (Exception e) {
	e.printStackTrace(e); 
}finally{
try{
	rs.close();
	st.close();
	conn.close();
	}catch(catch (Exception e)){
	}
}

%>
</body>
</html>