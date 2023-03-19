<%@page import = "java.sql.*,java.util.Date" %>
<%@page import = "java.text.SimpleDateFormat" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>DashBoard</title>
<style>
    .logo{
    width: 80px;
}
*{
    margin: 0px;
    padding: 0px;
}
h4{
    color: white;
}
nav{
    margin: 0px;
    display: flex;
    justify-content: space-around;
    background-color: #B6B6B6;
    height: 150px;

}

h2{

    margin-top: 25px;
    font-weight: bolder;
}
.profile{
    border-radius: 50%;
    width: 60px;
    position: absolute;
    top: 10px;
    right: 20px;
  
    
}
.nav-ul{
    
    display: flex;
    gap: 10px;
    justify-content: end;
    list-style: none;
    font-weight: bolder;
  
}

li> button{
    float: right;
    border-radius: 10px 5px 0px 5px;
    padding: 10px;
    width:100px;
    font-size: 10px;
    font-weight: bold;
    color: white;
    background-color: #336699;
    border: none;
}

.header{
    border-radius: 10px 5px 0px 5px;
     width: 90%;
     margin-left: 90px;
    background-color: #00386F;
}
.navbar{
   
   position: sticky;
   
   
}
.name{
    color: white;
    font-weight: bold;
    padding: 10px;
    margin-top: -40px;
    font-size: 20px;
    position: relative;
    top: 30px;
}
.leftBar{
  background-color: #376EA6;
  width: 190px;
  line-height: 35px;
  color: white;
  border-bottom: 1px solid #00366D;
  margin-left: 50px;
  padding: 10px;
  margin-top: 23px;
  border-radius: 5px;
}
h4{
    background-color:#00366D ;
    width: 180px;
    margin-top: -12px;
     padding: 12px;
     position: relative;
     
     right: 7px;
     height: 20px;
     border-radius: 5px;

}
li:hover{
    cursor: pointer;
}
button:hover{
    cursor: pointer;
}
a{
    color: white;
    text-decoration: none;

}
iframe{
    width: 1000px;
    position: absolute;
    top: 200px;
    left: 350px;
    height: 100vh;
}
.err{
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>
</head>

<body>





    
            <%

            String grNo= null, name="";
            String  uid = request.getParameter("Grno");
            String  pas = request.getParameter("password");


            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcampusdemo","root","");

            PreparedStatement pst = con.prepareStatement("SELECT * FROM signupdata WHERE Grno = ? AND password = ? ");
            pst.setString(1,uid);
            pst.setString(2,pas);
            
            ResultSet rs = pst.executeQuery();
            
            if (rs.next())

           {
                 grNo= rs.getString("Grno");
                 name= rs.getString("Username");
            

            }
            else
            out.print(" <h2 style='color:red'  > Record is not found </h2>");
            }
            catch(Exception e)
            {
            out.println("<h3 style='çolor:red'> Error: "+e+"<h3>");
            }
            %>
    <nav>
        <div><img src="../img/aligarh.png" alt="logo" class="logo"></div>
     <div>  <center><h2>ALIGARH INSTITUTE OF TECHNOLOGY, KARACHI <br> Student Portal
            </h2>
        </center>
    </div> 
    
   <div class="head-sec"> 
    <h2><%=  name %> </h2>
    <img src="../img/profile.jfif" alt="profile" class="profile">
   </div>
    </nav>
    <header class="header">
        <p class="name"> <%=  name %> <%=  grNo %></p>
  
      <center>
        <div class="navbar">
            <ul class="nav-ul">
                <li><button>  <a href="../htmlfiles/information.html" target="content"> Dashboard</a></button></li>
                <li><button> <a href="../htmlfiles/attendence.html" target="content"> Attendence</a></button></li>
                <li><button>  <a href="../htmlfiles/mycourse.html" target="content"> My Course</a></button></li>
                <li><button>  <a href="../htmlfiles/class.html" target="content"> Class Schedule</a></button></li>
                <li><button>  <a href="../htmlfiles/feeChallan.html" target="content"> Fee Challan</a></button></li>

                <li><button>  Exam Schedule  </button></li>
                <li><button>  Study Material</button></li>
                <li><button> Email</button></li>
                <li><button> Notification</button></li>
            </ul>
    
        </center>
        </div>
    </header>
    <div class="leftBar">
        <h4>Other Pages</h4>
        <ul>

            <li>E-Library</li> <hr>
            <li>Calender</li> <hr>
            <li>Accademic</li> <hr>
            <li>Event</li> <hr>
            <li>Holiday</li> <hr>
            <li>Notice Board</li> <hr>
            <li>Student Services</li> <hr>
            <li>Grading Criteria</li> <hr> 
            <li>Course Curriculum</li> 
        </ul>
    </div>


 <center>
    <iframe src="../htmlfiles/information.html" frameborder="1"   name="content">

    </iframe>
</center> 





</body>
</html>
