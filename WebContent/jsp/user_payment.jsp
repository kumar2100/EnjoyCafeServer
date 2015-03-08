<%--
    Document   : user_payment
    Created on : Sep 12, 2014, 1:11:29 AM
    Author     : kumar
--%>


<%@page import="enjoycafe.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Login L1 = (Login) session.getAttribute("user");
    String uid = L1.getUsername();
    int wid = L1.getWork_id();
    int amount = L1.getPayment_amount();
    int amount2 = (Integer) session.getAttribute("payment_amount");
    String duration= (String)session.getAttribute("duration");

    System.out.println("***********FROM PAYMENT JSP L1.getWork_id() " + L1.getWork_id());
    System.out.println("***********FROM PAYMENT JSP L1.getPayment_amount() " + L1.getPayment_amount());
    System.out.println("***********FROM PAYMENT JSP session.getAttribute(user) " + session.getAttribute("user"));
    System.out.println("***********FROM PAYMENT JSP session.getAttribute(payment_amount) " + session.getAttribute("payment_amount"));
%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Service Usage Duration Calculated as Days:Hours:Minutes:Seconds:Milliseconds : <%= duration %> </h3>
        </br>
        <h1>User Payment Calculated Rs : <%= amount2%> </h1>
        </br>
        <h4>Service Usage Calculated only for System and Internet, Contact Customer Service for complete Bill for other usage like printing, purchase, etc.,</h4>
        </br>
        <h2>Thank you for visiting ITgene </h2>
    </body>
</html>
