<%@page  language="java" import="java.sql.*, java.util.*"%>

<%

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use lasthw";
con.createStatement().execute(sql);

%>