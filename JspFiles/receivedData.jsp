<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@page import = "java.sql.*,util.*" %>
<%@page import="java.io.*,  java.util.Enumeration" %> 

<html>
<body>

<%

 String Username, Email,  Gender, Usertype,password, confirmPass,Grno;
 
  Grno=request.getParameter("Grno"); 
  Username=request.getParameter("userName"); 
  Email=request.getParameter("email"); 
  password=request.getParameter("password"); 
  confirmPass=request.getParameter("con-pass"); 

  Gender=request.getParameter("gender"); 
  Usertype=request.getParameter("userType");
  SimpleDateFormat formater = new SimpleDateFormat("yyyy-mm-dd");
  java.util.Date util_Dateofbirth = formater.parse( request.getParameter("date") );
  java.sql.Date Dateofbirth = new java.sql.Date( util_Dateofbirth.getTime() );
  
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcampusdemo","root","");
 PreparedStatement ps = con.prepareStatement("insert into signupdata(Grno,Username, Email, Dateofbirth, Gender, Usertype, password, confirmPass) values ( ?,?,?,?,?,?,?,? ); ");
 ps.setString(1,Grno);
 ps.setString(2,Username);
 ps.setString(3,Email);
 ps.setDate(4,Dateofbirth);
 ps.setString(5,Gender);
 ps.setString(6,Usertype);
 ps.setString(7,password);
 ps.setString(8,confirmPass);

 int x = ps.executeUpdate();
 out.println("Signup Successfully "+x);

 }
 catch(Exception e)
 {
 out.println("Error: "+e);
 }

%>
</body>
</html>