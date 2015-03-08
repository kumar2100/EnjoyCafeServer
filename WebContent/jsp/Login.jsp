<%-- 
    Document   : Login
    Created on : Aug 25, 2013, 12:26:44 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="/EnjoyCafeServer/images/INDEX.JPG">
    <br>
 <p> <h3><center>Please enter your user name and password</center></h3></p>
 <br>
 <br>
 
 <form  action="/EnjoyCafeServer/jsp/Login_Process.jsp"   method = "post" >
 
 <center>username</center> <center><input type = "text" name= "username"></center>
 <center>password</center> <center><input type = "password" name = "password"></center>
 <input type = "hidden" name = "uaction" value="login">
 <input type = "hidden" name = "user_type" value="net-user">
 
 <center><input type="submit" name="Submit" value="Login"></center>

 </form>
 

    </body>
</html>
