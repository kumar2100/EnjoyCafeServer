<%-- 
    Document   : admin_pay_cash
    Created on : Sep 14, 2014, 3:20:40 AM
    Author     : kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Logout List of Users At Enjoy Cafe </title>
        <script language="javascript">
            function editRecord(id) {

                alert("Employee Record Edit operation");

                var f = document.form1;
                f.method = "post";
                f.action = 'Edit_Employee.jsp?id=' + id;
                f.submit();
                //window.open("Edit_Employee.jsp","_self")
            }


            function payment_update(id) {

                if (confirm('Are you sure to DELETE Work Transaction Record')) {

                    var f = document.form1;
                    f.method = "post";
                    f.action = 'admin_del_login_logout.jsp?id=' + id;
                    f.submit();
                }

            }


        </script>
    </head>
    <body>

        <%@ page import = "java.sql.*" %>
        <%
            String vwork_id = request.getParameter("id");
            int jwork_id = Integer.parseInt(vwork_id);
            System.out.println(" Work ID to Update " + jwork_id);

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection conn = DriverManager.getConnection(url, "", "");
            Statement stmt = conn.createStatement();
            String sqlStr = "SELECT * FROM Login_Logout_Payment where work_id = "+jwork_id;
            
            //String sqlStr2 = "SELECT * FROM Logout_Bill_Other_Sales where work_id = "+jwork_id;
            System.out.println("Query statement is " + sqlStr);
            ResultSet rset = stmt.executeQuery(sqlStr);
        %>


        <form name ="form1" method="get" action="AddEmployee.jsp">
            <table border=2 cellpadding=5 width="100%">

                <tr>
                    <th colspan="5" bgcolor="#9dff9d"><font size="4" face="Arial" color="0000a0">Payment Details </th>
                    <td bgcolor="#ffddff"></td>


                <tr>

                <tr>
                    <th bgcolor="#b0d0b9">Work ID</th>
                    <th bgcolor="#b0d0b9">bill_time</th>
                    <th bgcolor="#b0d0b9">internet_usage</th>
                </tr>
                <%
                    while (rset.next()) {
                        String workid_edit = rset.getString("work_id");
                        String rbill_time = rset.getString("bill_time");
                        String rbill_netuse_calculated = rset.getString("bill_netuse_calculated");
                        if (rset.wasNull());
                        rbill_time = rbill_time;
                        if (rbill_netuse_calculated == null) {
                            rbill_netuse_calculated = "null";
                        }
                        rbill_netuse_calculated = rbill_netuse_calculated.trim();
                %>
                <tr>
                    <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"><%=workid_edit%></td>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%=rbill_time%></td>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%=rbill_netuse_calculated%></td>
                    
                    <td bgcolor="#ffddff"><input type="button" name="edit" value="Edit" onclick="editRecord(<%=workid_edit%>);"> 
                     <input type="button" name="delete" value="Payment" onclick="payment_update(<%=workid_edit%>);"></td>

                </tr>
                <%
                    }
                %>
            </table>

        </form>
        <SCRIPT LANGUAGE="JavaScript">
            <!--
           function AddEmployee()
            {
                document.form1.buttonName.value = "Add";


                form1.submit();
            }
            // --> 
        </SCRIPT>


        <%
            rset.close();
            stmt.close();
            conn.close();

        %>
    </body>
</html>