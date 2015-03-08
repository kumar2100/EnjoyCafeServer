<%-- 
    Document   : user_payment2
    Created on : Sep 12, 2014, 3:15:31 AM
    Author     : kumar
--%>

<%@page import="enjoycafe.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idHandler" class="enjoycafe.LoginUser" scope="session" >
    <jsp:getProperty name="idHandler" property="username" />
</jsp:useBean>

<%
    //The below session.getAttribute() will bring problem when the user lost the session and trying to go back page and trying to logout.
    //Login Login_ins = new Login();
    if (session.getAttribute("payment_amount")== null ||session.getId()== null || session.getAttribute("work_id")== null){
          //session.getId();
           %>
           <jsp:forward page="user_session_lost.jsp"/>
           <%
      }

    
    int amount2 = (Integer) session.getAttribute("payment_amount");
    String duration= (String)session.getAttribute("duration");
    int  vwork_id= (Integer)session.getAttribute("work_id");
    
    String Puser= idHandler.getUsername();
    
    
    System.out.println("***********FROM PAYMENT JSP session invalidate called " + session.getAttribute("user"));
    System.out.println("***********FROM PAYMENT JSP idHandler.getUsername() " + idHandler.getUsername());
    System.out.println("***********FROM PAYMENT JSP session.getAttribute(payment_amount) " + session.getAttribute("payment_amount"));

    session.invalidate();
    idHandler=null;
    
    //java.lang.IllegalStateException: getAttribute: Session already invalidated
    //System.out.println("***********FROM PAYMENT JSP session invalidate called  and check :session.getAttribute(user) " + session.getAttribute("user"));

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Service Usage Duration Calculated as Days:Hours:Minutes:Seconds:Milliseconds : <%= duration %> </h3>
        </br>
        <h1>User Payment Calculated Rs : <%= amount2%> </h1>
        <h1>User Payment For Work ID : <%= vwork_id%> </h1>
        </br>
        <h1>User Payment For User : <%= Puser%> </h1>
        </br>
        <h4>Service Usage Calculated only for System and Internet, Contact Customer Service for complete Bill for other usage like printing, purchase, etc.,</h4>
        </br>
        </br>
        <h2>Thank you for visiting ITgene </h2>
    </body>
</html>
