<%-- 
    Document   : admin_collect_payment
    Created on : Sep 13, 2014, 11:47:20 PM
    Author     : kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Logout List of Users At Enjoy Cafe </title>
        <script language="javascript">
            function addSales(id) {

                alert("Employee Record Edit operation");

                var f = document.form1;
                f.method = "post";
                f.action = 'Edit_Employee.jsp?id=' + id;
                f.submit();
                //window.open("Edit_Employee.jsp","_self")
            }


            function payCash(id) {

                if (confirm('Going  to Pay Cash Page')) {

                    var f = document.form1;
                    f.method = "post";
                    f.action = 'admin_pay_cash_list_items.jsp?work_id=' + id;
                    f.submit();
                }

            }
            function userlogout(work_id) {

            	confirm("Going to LOG OUT the Customer you have selected : "+work_id);

                var f = document.form1;
                f.method = "post";
                f.action = 'admin_to_do_user_logout.jsp?id='+work_id;
                f.submit();
                //window.open("Edit_Employee.jsp","_self")
            }


            
        </script>



    </head>
    <body>


        <%@ page import = "java.sql.*" %>
        <%
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection conn = DriverManager.getConnection(url, "", "");
            Connection conn2 = DriverManager.getConnection(url, "", "");
            Statement stmt = conn.createStatement();
            String sqlStr = "SELECT * FROM Login_Logout_Time order by user_status desc";
            String sqlStr2 = "SELECT bill_netuse_calculated FROM Login_Logout_Payment where work_id=?";
            PreparedStatement pstatement = null;
            pstatement = conn2.prepareStatement(sqlStr2);        
            System.out.println("Query statement is " + sqlStr);
            ResultSet rset = stmt.executeQuery(sqlStr);
        %>
        <form name ="form1" method="get" action="admin_add_walkin_sales.jsp">
            <table border=2 cellpadding=5 width="100%">

                <tr>
                    <th colspan="5" bgcolor="#9dff9d"><font size="4" face="Arial" color="0000a0">Collect Payment Add Walk-in Sales  </th>
                <tr>

                <tr>
                    <th bgcolor="#b0d0b9">Work ID</th>
                    <th bgcolor="#b0d0b9">user_name</th>
                    <th bgcolor="#b0d0b9">user_status</th>
                    <td bgcolor="#ffddff"><input type="submit" value="Add Walkin Sales"></td>
                </tr>
                <tr>
                </tr>
                <%
                    while (rset.next()) {
                        String workid_edit = rset.getString("work_id");
                        String rend_time = rset.getString("end_time");
                        String ruser_status = rset.getString("user_status");
                        int bill_value=0;
                        
                        pstatement.setInt(1, Integer.parseInt(workid_edit));
                        //pstatement.setInt(1, 261);
						//int bill_value = pstatement.executeQuery().getInt("bill_netuse_calculated");
						
						ResultSet rs = pstatement.executeQuery();
						//rs.moveToCurrentRow();
						while(rs.next()){
						//int bill_value = rs.getInt("bill_netuse_calculated");
						bill_value = rs.getInt(1);
						 //System.out.println("pstatement.executeQuery() is bill_value " + bill_value);
                        //int bill_value = pstatement.executeQuery(sqlStr2).getInt("bill_netuse_calculated");
						}
                        
                        if (rset.wasNull());
                        rend_time = rend_time;
                        if (ruser_status == null) {
                            ruser_status = "null";
                        }
                        ruser_status = ruser_status.trim();
                        String rstart_time = rset.getString("start_time");
                        String rbill_time = rset.getString("bill_time");

                %>
                <tr>
                    <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"><%=workid_edit%></td>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%= rset.getString("user_name")%></td>
                        <%
                            if (ruser_status.equals("Working")) {
                        %>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"><img src="/EnjoyCafeServer/images/user_working2.jpg">
                    </br><%=ruser_status%> </br> <%=rstart_time%>
                    <input type="button" name="edit" value="Logout" onclick="userlogout(<%=workid_edit%>);">   </td>

                        <%}
                            if (ruser_status.equalsIgnoreCase("Walkin")) {
                        %>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"><img src="/EnjoyCafeServer/images/guest_walkin.jpg"></br><%=ruser_status%> </br> <%=rstart_time%> </td>

                        <%
                            }
                            if (ruser_status.equals("logout_collect_cash")) {
                        %>
                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"><img src= "/EnjoyCafeServer/images/user_pay_wait2.jpg">
                    </br><%=ruser_status%> </br>For Internet Charge:Rs. <%=bill_value%>  </br> <%=rstart_time%></br> <%=rend_time%></br> <%=rbill_time%> </td>
                        <%
                        }
                        if (!ruser_status.equals("logout_collect_cash") && !ruser_status.equals("Working") && !ruser_status.equalsIgnoreCase("Walkin")) {%>

                    <td bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%=ruser_status%></td>
                        <%
                            }
                        %>
                    <td bgcolor="#ffddff"><input type="button" name="edit" value="Add Sales" onclick="addSales(<%=workid_edit%>);"> 
                     <input type="button" name="delete" value="Pay Cash" onclick="payCash(<%=workid_edit%>);"></td>

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