<%-- 
    Document   : Login
    Created on : Aug 25, 2013, 12:26:44 AM
    Author     : Admin
--%>
<jsp:useBean id="idHandler" class="enjoycafe.Login" scope="request">
    <jsp:setProperty name="idHandler" property="*"/>
</jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="http://localhost:8080/MTrackAccess/docs/images/INDEX.JPG">
    <br>
 <p> <h3><center>WORK SUCCESSFULLY RECORDED !</center></h3></p>
 <p> <h3><center>Thank you for working with Us, Good Time to You!</center></h3></p>
 <br>
 <br>
 
    
 
 <form  action="./Login.jsp"   method = "post" >
 <input type = "hidden" name= "username" value="test_user">
 <input type = "hidden" name = "password" value="test_user">

 <center><input type="submit" name="Submit" value="Re-work"></center>

 </form>
 

    </body>
</html>
