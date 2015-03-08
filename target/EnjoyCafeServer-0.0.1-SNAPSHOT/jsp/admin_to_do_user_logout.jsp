<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="enjoycafe.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>MTRack List Employees</title>
    <script language="javascript">

    function updateRecord(id) {
        //alert(validateForm());
    //if(validateForm()){
    var f = document.edit_form1;
    f.method = "post";
    f.action = 'admin_to_do_user_logout_update.jsp?work_id=' + id;
    f.submit();
   // }
}


function cancelEdit(id) {
    var f = document.edit_form1;
    f.method = "post";
    f.action = 'admin_collect_paymentV2.jsp?id=' + id;
    f.submit();
}

function validateForm()
    {

       if (document.edit_form1.user_type.value=="")
        {
            alert("Please provide your Type of User!");
            document.add_form1.user_type.focus();
            return false;
        }
     if (document.edit_form1.user_name.value=="")
        {
            alert("Please provide your Name of User!");
            document.add_form1.user_name.focus();
            return false;
        }
     if (document.edit_form1.start_time.value=="")
        {
            alert("Please provide Start_time!");
            document.add_form1.start_time.focus();
            return false;
        }
     if (document.edit_form1.access_format_endtime.value=="")
        {
            alert("Please provide your End Time!");
            document.add_form1.access_format_endtime.focus();
            return false;
        }
    return true;
    }

</script>

</head>
<table border="1" width="100%">
    <tr>
        <th colspan="5" bgcolor="#9dff9d"><font size="3" face="Arial" color="0000a0">EnjoyCafe Tracking System To LOGOUT USER from admin screen</th>
    </tr>
</table>
<br>
<br>

<form name ="edit_form1" method="post" action="-------NEED----CHANGE------ Update_Employee.jsp">
     <div align="center"><table border="1" >
               <%
                    String swork_id_edit = request.getParameter("work_id");
                    int jwork_id = Integer.parseInt(swork_id_edit);

                    ArrayList bill_ArrayList = new ArrayList();
					LoginWalkin LoginWalkin_ins = new LoginWalkin();
					bill_ArrayList = LoginWalkin_ins.getCalculatedBillHours(jwork_id);
					
					//Array Object[] = bill_ArrayList.toArray()
					
					String access_format_endtime =(String) bill_ArrayList.get(0);
					String billtime_h_m_s = (String) bill_ArrayList.get(1);
					int billmin = (Integer)bill_ArrayList.get(2);
					
                    
                    int sumcount = 0;
                    try {

                        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                        String url = "jdbc:odbc:EnjoyODBC";
                        Connection conn = DriverManager.getConnection(url, "", "");
                        Statement stmt = conn.createStatement();
                        String sqlStr = "SELECT * FROM Login_Logout_Time where work_id=" + jwork_id;
                        System.out.println("Query statement is " + sqlStr);
                        ResultSet rs = stmt.executeQuery(sqlStr);
                        while (rs.next()) {
                        	
                        String jstart_time = rs.getString("start_time");	
                        	
                        	
                %>
        <tr>

        <tr><th bgcolor="#b0d0b9">Work ID</th><td bgcolor="#ffffb9"><%=jwork_id%></td></tr>
        <tr><th bgcolor="#b0d0b9">User Type</th><td bgcolor="#ffffb9"><input type="text" name="user_type" value="<%=rs.getString("user_type")%>"></td></tr>
        <tr><th bgcolor="#b0d0b9">User Name</th><td bgcolor="#ffffb9"><input type="text" name="user_name" value="<%=rs.getString("user_name")%>"></td></tr>
        <tr><th bgcolor="#b0d0b9">Start Time </th><td bgcolor="#ffffb9"><%=jstart_time%></td></tr>
        <tr><th bgcolor="#b0d0b9">End Time </th><td bgcolor="#ffffb9"><input type="text" name="access_format_endtime" value="<%=access_format_endtime%>"></td></tr>
        <tr><th bgcolor="#b0d0b9">Bill Duration </th><td bgcolor="#ffffb9"><input type="text" name="billtime_h_m_s" value="<%=billtime_h_m_s%>"></td></tr>
        <tr><th bgcolor="#b0d0b9">Bill Amount </th><td bgcolor="#ffffb9"><input type="text" name="billmin" value="<%=billmin%>"></td></tr>
        <tr><th bgcolor="#b0d0b9">admin_logout_reason </th><td bgcolor="#ffffb9"><input type="text" name="admin_logout_reason"></td></tr>
        <tr><td><input type="hidden" name="work_id" value="<%=rs.getString("work_id")%>"></td></tr>
        <tr><td><input type="hidden" name="start_time" value="<%=jstart_time%>"></td></tr>
        
<%--         <tr><td><input type="hidden" name="work_id" value="<%=rs.getString("work_id")%>"></td></tr> --%>
<%--         <tr><td><input type="hidden" name="start_time" value="<%=rs.getString("start_time")%>"></td></tr> --%>

        <tr>
        <td><input type="button" name="Update" value="Update Logout" onclick="updateRecord(<%=swork_id_edit%>);" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
		<td><input type="button" name="Cancel" value="Cancel" onclick="cancelEdit(<%=swork_id_edit%>);" style="background-color:#49333D;font-weight:bold;color:#ffffff;"></td>
        </tr>
        <%
                }
            } catch (Exception e) {

                e.printStackTrace();
            }
        %>
    </table>
     </div>
        

</form>
</html>
