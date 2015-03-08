<%-- 
    Document   : admin_del_login_logout
    Created on : Sep 13, 2014, 12:16:17 PM
    Author     : kumar
--%>


<%@page language="java"%>
<%@page import="java.sql.*"%>

<h1>Enjoy Cafe Server Delete work id details</h1>
<%
String id=request.getParameter("id");
int num=Integer.parseInt(id);
System.out.println(" Work ID to Update "+num);

try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection conn = DriverManager.getConnection(url, "", "");
            Statement stmt = conn.createStatement();
            //String u_query = "update Employee_Details set Emp_Type='"+emp_type+"',Emp_Name='"+emp_name+"',City='"+emp_city+"',Phone_Home="+emp_phone+" where Emp_Id="+num+"";            
            String u_query = "Delete from Login_Logout_Time where work_id="+num+"";            
            //stmt.executeUpdate("update Employee_Details set Emp_Type='"+emp_type+"',Emp_Name='"+emp_name+"',City='"+emp_city+"',Phone_Home='"+emp_phone+"' where Emp_Id="+num+");
            System.out.println(u_query);
            stmt.executeUpdate(u_query);
%>
<jsp:forward page="admin_work_update_confirm.jsp" />
<%
}
catch(Exception e){
System.out.println(e);
}
%>