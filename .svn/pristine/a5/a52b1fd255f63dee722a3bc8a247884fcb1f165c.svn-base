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

            function addSales(pbill_id, pworkid) {

                alert("admin_add_sales. operation");

                var f = document.form1;
                f.method = "post";
                f.action = 'admin_item_add_sales.jsp?bill_id=' +pbill_id+'&work_id='+pworkid;
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
            
            function item_delete(id, pwork_id) {

                if (confirm('Are you sure to DELETE item')) {

                    var f = document.form1;
                    f.method = "post";
                    f.action = 'admin_item_delete_sales.jsp?item_id=' + id+'&work_id='+pwork_id;
                    f.submit();
                }

            }
            
            function addSalesWithBill(id, pbill_id) {
                    var f = document.form1;
                    var wid = document.form1.work_id.value;
                    alert("Adding Sales to Work ID:  "+wid);
                    f.method = "post";
                    f.action = 'admin_item_add_sales.jsp?bill_id=' +pbill_id+'&work_id='+wid;
                    f.submit();

            }

            function addSalesWithWorkId(id, pwork_id) {
                   var f = document.form1;
                      alert("Adding Sales to Work ID:  "+pwork_id);
                    f.method = "post";
                    f.action = 'admin_item_add_salesV2.jsp?work_id='+pwork_id;
                    f.submit();

            }
            


        </script>
    </head>
    <body>

        <%@ page import = "java.sql.*" %>
        <%
  			int jbill_id=0;
        
            String vwork_id = request.getParameter("work_id");
        	System.out.println(" Work ID to Update vwork_id String " + vwork_id);

            int jwork_id = Integer.parseInt(vwork_id);
            System.out.println(" Work ID to Update " + jwork_id);

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection conn = DriverManager.getConnection(url, "", "");
            Statement stmt = conn.createStatement();
            String sqlStr = "SELECT * FROM Login_Logout_Payment where work_id = "+jwork_id;
            String sqlStr_list_items = "SELECT * FROM Bill_All_Items_Purchase where work_id = "+jwork_id;
             
            //String sqlStr2 = "SELECT * FROM Logout_Bill_Other_Sales where work_id = "+jwork_id;
            //System.out.println("Query statement is " + sqlStr);
            System.out.println("Query statement is " + sqlStr_list_items);
            //ResultSet rset = stmt.executeQuery(sqlStr);
            ResultSet rset = stmt.executeQuery(sqlStr_list_items);
                %>


        <form name ="form1" method="get" action="admin_add_sales.jsp">
            <table border=2 cellpadding=5 width="100%">

                <tr>
                    <th colspan="5" bgcolor="#9dff9d"><font size="4" face="Arial" color="0000a0">Payment Details </th>
                    <td bgcolor="#ffddff"></td>


                <tr>

                <tr>
                    <th bgcolor="#b0d0b9">item_id</th>
                    <th bgcolor="#b0d0b9">item_details</th>
                    <th bgcolor="#b0d0b9">item_cost_per_unit</th>
                    <th bgcolor="#b0d0b9">item_quantity </th>
                    <th bgcolor="#b0d0b9">item_amount</th>
                </tr>
                <%
                		
                		
                    while (rset.next()) {
                    	//jbill_id = rset.getInt("bill_id");
                    	
                        //System.out.println("------admin_pay_cash_list_items.jsp--------bill_id---from DBMS:  " + jbill_id);
                                           	
                    	
                        String jitem_id = Integer.toString(rset.getInt("item_id"));
                        String jitem_details = rset.getString("item_details");
                        String jitem_cost_per_unit = Integer.toString(rset.getInt("item_cost_per_unit"));
                        String jitem_quantity = rset.getString("item_quantity");
                        String jitem_amount = Integer.toString(rset.getInt("item_amount"));
                         
 		             %>
                <tr>
                    <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"><%=jitem_id%></td>
                    <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%=jitem_details%></td>
                    <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%=jitem_cost_per_unit%></td>
                    <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%=jitem_quantity%></td>
                    <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040"> <%=jitem_amount%></td>
                    
                    <td bgcolor="#ffddff"><input type="button" name="edit" value="Edit" onclick="editRecord(<%=jitem_id%>);">
                    
                      <input type="button" name="delete" value="Delete" onclick="item_delete(<%=jitem_id%>,(<%=jwork_id%>);"></td>

                </tr>
                
                <%
                    }
                %>
                <tr>
                    <input type="hidden" name="work_id" value="<%=jwork_id%>">
                   
 
                <td bgcolor="#ffddff"><input type="button" name="addSales" value="Add Sales" onclick="addSalesWithWorkId(<%=jwork_id%>);"></td>
               <td> <a href="/EnjoyCafeServer/jsp/admin_item_add_salesV2.jsp?work_id=<%=jwork_id%>">Add Sales</a></td>
                
                </tr>
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