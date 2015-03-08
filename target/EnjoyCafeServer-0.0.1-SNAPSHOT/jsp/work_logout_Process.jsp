<%--
    Document   : process2
    Created on : Aug 25, 2013, 12:34:28 AM
    Author     : Admin
--%>

<%@ page import="java.util.*" %>

<jsp:useBean id="idHandler_out" class="enjoycafe.work_logout" scope="request">
    <jsp:setProperty name="idHandler_out" property="*"/>
</jsp:useBean>

<%
    if (idHandler_out.validate()) {
%>


<jsp:forward page="work_logout_success.jsp"/>


<%} else {
%>
<jsp:forward page="Retry.jsp"/>
<%    }
%>


