<%-- 
    Document   : admin_user_monitor
    Created on : Sep 13, 2014, 11:23:28 AM
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


            function deleteRecord(id) {

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
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection conn = DriverManager.getConnection(url, "", "");
            Statement stmt = conn.createStatement();
            String sqlStr = "SELECT * FROM Login_Logout_Time order by user_status desc";
            System.out.println("Query statement is " + sqlStr);
            ResultSet rset = stmt.executeQuery(sqlStr);
        %>


        <form name ="form1" method="get" action="AddEmployee.jsp">
            <table border=2 cellpadding=5 width="100%">

                <tr>
                    <th colspan="5" bgcolor="#9dff9d"><font size="4" face="Arial" color="0000a0">Admin User Monitor  </th>
                    <td bgcolor="#ffddff"><input type="submit" value="Add New"></td>


                <tr>

                <tr>
                    <th bgcolor="#b0d0b9">Work ID</th>
                    <th bgcolor="#b0d0b9">user_name</th>
                    <th bgcolor="#b0d0b9">start_time</th>
                    <th bgcolor="#b0d0b9">end_time</th>
                    <th bgcolor="#b0d0b9">bill_time</th>
                    <th bgcolor="#b0d0b9">user_status</th>
                    <th bgcolor="#c184ff">Modification</th>
                </tr>
                <%
                    while (rset.next()) {
                        String workid_edit = rset.getString("work_id");
                        String rend_time = rset.getString("end_time");
                        String ruser_status = rset.getString("user_status");
                        if (rset.wasNull());
                        rend_time = rend_time;
                        if (ruser_status == null) {
                            ruser_status = "null";
                        }
                        ruser_status = ruser_status.trim();
                %>
                <tr>
                    <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"><%=workid_edit%></td>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%= rset.getString("user_name")%></td>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%= rset.getString("start_time")%></td>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%=rend_time%></td>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%= rset.getString("bill_time")%></td>

                    <%
                        if (ruser_status.equals("Working")) {
                    %>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"><img src="/EnjoyCafeServer/images/user_working2.jpg"></br><%=ruser_status%></td>
                        <%
                            }
                            if (ruser_status.equals("logout_collect_cash")) {
                        %>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"><img src= "/EnjoyCafeServer/images/user_pay_wait2.jpg"></br><%=ruser_status%></td>
                        <%
                            }
                            if (ruser_status.equalsIgnoreCase("Walkin")) {
                        %>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"><img src= "/EnjoyCafeServer/images/guest_walkin.jpg"></br><%=ruser_status%></td>
                        <%
                        }
                        if (!ruser_status.equals("logout_collect_cash") && !ruser_status.equals("Working") && !ruser_status.equalsIgnoreCase("Walkin")) {%>

                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> </br><%=ruser_status%></td>
                        <%
                            }
                        %>
                    <td bgcolor="#ffddff"><input type="button" name="edit" value="Edit" onclick="editRecord(<%=workid_edit%>);">  <input type="button" name="delete" value="Delete" onclick="deleteRecord(<%=workid_edit%>);"></td>

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