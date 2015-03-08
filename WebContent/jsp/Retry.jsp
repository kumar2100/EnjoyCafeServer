
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% session.invalidate(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="/EnjoyCafeServer/images/INDEX.JPG">
    <br>
 <center><h3>Please enter your user name and password</h3></center>
 <br>
 <br>
 
 <form  action="/EnjoyCafeServer/jsp/Login_Process.jsp"   method = "post" >
 
 <center>username</center> <center><input type = "text" name= "username"></center>
 <center>password</center> <center><input type = "password" name = "password"></center>
 <input type = "hidden" name = "uaction" value="login">

 </br>
 <h2><a href="/EnjoyCafeServer/jsp/admin_login.jsp">Admin User Login Here</a>  </h2>   
</br>

<center><h3><%  out.write("WRONG User OR Password RE-TRY"); %></h3></center>

 <center><input type="submit" name="Submit" value="Login"></center>

 </form>
 

    </body>
</html>





