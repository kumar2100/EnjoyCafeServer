<%--
    Document   : process2
    Created on : Aug 25, 2013, 12:34:28 AM
    Author     : Admin
--%>

<%@ page import="java.util.*" %>
<%@ page import="enjoycafe.*" %>
<%@ page import="enjoycafe.services.*" %>

<jsp:useBean id="idHandler" class="enjoycafe.LoginUser" scope="session" >
    <jsp:setProperty name="idHandler" property="*" />
</jsp:useBean>


<%
    
LoginService LoginService_inst =new LoginService();
	String uaction = request.getParameter("uaction");
	String remotehost= request.getRemoteHost();	
	idHandler.setRemotehost(remotehost);
    
	System.out.println("*********** LOGIN or logout PROCESS---------call----------------");
	System.out.println("***********FROM LOGIN PROCESS request.getRemoteHost()  "+request.getRemoteHost()+"  :address  "+request.getRemoteAddr());
	
	//Need to set becos user set in session getting the old value
     if(request.getParameter("utype")!=null){
         if (request.getParameter("utype").equals("admin")){
             
             //if(idHandler.authenticate(request.getParameter("username"), request.getParameter("password"))){
                 if(LoginService_inst.loginUserAuthenticate(request.getParameter("username"), request.getParameter("password"))){
                	                 
           %>
           <jsp:forward page="admin_frame.jsp"/>
           <%
                 
                 
             }else{
           %>
           <jsp:forward page="Retry.jsp"/>
           <%
             }
         }
     }
     
     //The following for walkin sales
     if(request.getParameter("utype")!=null && request.getParameter("username")!=null && request.getParameter("mobile")!=null){
         if (request.getParameter("utype").equals("walkin")){
  
                LoginWalkin loginw = new LoginWalkin();
                
               if(loginw.recordtimeWalkin(request.getParameter("username"), request.getParameter("mobile"))){
                 
           %>
           <jsp:forward page="admin_collect_paymentV2.jsp"/>
           <%
                 
                 
             }else{
           %>
           <jsp:forward page="admin_add_walkin_sales.jsp"/>
           <%
             }
         }
     }

     

    //The following validation we can do it with javascript validation at client side.
    boolean togo_validate=false;
    if(request.getParameter("username")!=null  && request.getParameter("password")!=null){
    if(!request.getParameter("username").isEmpty() && !request.getParameter("password").isEmpty() ){    
    togo_validate=true;
    }
    }
    
	if((request.getParameter("work_id"))!=null || request.getParameter("work_id")=="" ){
	    if(idHandler.checkUserLoggedOutByAdmin(Integer.parseInt(request.getParameter("work_id")))){
	    %>
	    <jsp:forward page="user_payment2.jsp"/>
	    <%
	  	//The above will check and tell the user as already logout by admin
	    }
	}
    
    
    idHandler.setUaction(uaction);
    if((request.getParameter("work_id")!=null)){
        idHandler.setWork_id(Integer.parseInt(request.getParameter("work_id")));
    } 
    System.out.println("***********FROM LOGIN PROCESS request.getParameter(uaction)  "+request.getParameter("uaction"));
    
    
    if(togo_validate){
    if (idHandler.validate(session)) {
    System.out.println("***********FROM LOGIN PROCESS request.getParameter(uaction)  "+request.getParameter("uaction"));
    System.out.println("***********FROM LOGIN PROCESS idHandler.getUaction()  "+idHandler.getUaction());
        if (uaction.equalsIgnoreCase("logout")) {
            //session.invalidate();
            //session.getId();
           %>
           <jsp:forward page="user_payment2.jsp"/>
           <%
        }
%>


The Work ID from JSTL get Property:     <jsp:getProperty name="idHandler" property="work_id"/>
   <% System.out.println("***********FROM LOGIN PROCESS test idHandler.getWork_id():  "+idHandler.getWork_id());  %> 
   <% System.out.println("***********FROM LOGIN PROCESS test idHandler.getUsername():  "+idHandler.getUsername());  %> 
      <% System.out.println("***********FROM LOGIN PROCESS testid : "+session.getAttribute("testid"));  %> 
      <% System.out.println("***********FROM LOGIN PROCESS  work_id: "+session.getAttribute("work_id"));  %> 
    
<jsp:forward page="work_welcome.jsp"/>


<%} else {
%>
<jsp:forward page="Retry.jsp"/>
<%    }
    
%>

<%} else {
%>
<jsp:forward page="Retry.jsp"/>
<%    }
    
%>

