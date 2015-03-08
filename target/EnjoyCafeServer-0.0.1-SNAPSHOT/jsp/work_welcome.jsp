<%-- 
    Document   : Login
    Created on : Aug 25, 2013, 12:26:44 AM
    Author     : Admin
--%>

<%@page import="enjoycafe.LoginUser" session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<jsp:useBean id="idHandler" type="enjoycafe.Login" scope="session">
    <jsp:getProperty name="idHandler" property="*"/>
</jsp:useBean>--%>

 <%
 //Login L1 = (Login)session.getAttribute("user");
 LoginUser L1 = (LoginUser)session.getAttribute("user");
   String uid = L1.getUsername();
    int wid = L1.getWork_id();
  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="/MTrackAccess/docs/images/INDEX.JPG">
    <br>
    Welcome Dear <% out.print(uid); System.out.println("FROM work_welcome jsp User Name:   "+L1.getUsername());  %> and Your work_id Today:
    <%
    out.print(session.getAttribute("work_id"));
    %>
    <br/>
    YOUR ID :
   
   <% 
    //System.out.println("FROM work_welcome jsp >session.getAttribute(L1.getUsername()  "+idHandler.getWork_id());
    //out.print(uid);
    out.print(wid);
    
    %>
    
<!--    <% System.out.println("FROM work_welcome jsp WorkID:  "+L1.getWork_id());  %> 
    <% System.out.println("FROM work_welcome jsp WorkID session.getAttribute():  "+session.getAttribute("work_id"));  %> -->
    
    
    <%
   //Login user = (Login)session.getAttribute("user");
    //System.out.println("***KKKK***FROM session.getAttribute work_welcome test"+user.getWork_id());
    %>
    
    
 <p> <h3><center>Greeting ! And Have a Great Day</center></h3></p>
 <p> <h3><center>Your WORK Timing Started to USE, After Completing the work Please remember to logout !</center></h3></p>
 <br>
 <br>

 
 <form  action="./Login_Process.jsp"   method = "post" >
<!-- <form  action="./work_logout_Process.jsp"   method = "post" >-->
 <input type = "hidden" name= "username" value='<%= L1.getUsername() %>' >
 <input type = "hidden" name = "password" value='<%= L1.getUsername() %>'>
 <input type = "hidden" name = "work_id" value='<%= L1.getWork_id()%>'>
  <input type = "hidden" name = "uaction" value="logout">
 <center><input type="submit" name="Submit" value="logout"></center>
 </form>
    </body>
</html>
