<%-- 
    Document   : admin_add_sales
    Created on : Sep 14, 2014, 3:21:05 AM
    Author     : kumar
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<HTML>
<HEAD>
<TITLE>Deleting Item from Sales to Customer</TITLE>
<script type="text/javascript">

            <!--
            function validate(x) {

                alert("Hello there:  " + x);
                window.open("List_Employees.jsp", "_self")
            }

            function updateRecord() {

                var f = document.add_form1;
                f.method = "post";
                f.submit();
                //window.open("Edit_Employee.jsp","_self")
            }

            function cancelEdit(id) {
                var f = document.add_form1;
                f.method = "post";
                f.action = 'admin_pay_cash_list_items.jsp?work_id='+id;
                f.submit();
            }

            function validateForm()
            {
                //var x = document.forms["myForm"]["email"].value;
                //var atpos = x.indexOf("@");
                //var dotpos = x.lastIndexOf(".");
                //if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length)
                //{
                //  alert("Not a valid e-mail address");
                //return false;
                //}

               if (document.add_form1.item_details.value=="")
                {
                    alert("Please provide Item_details!");
                    document.add_form1.item_details.focus();
                    return false;
                }
             if (document.add_form1.item_cost_per_unit.value=="")
                {
                    alert("Please provide your item_cost_per_unit!");
                    document.add_form1.item_cost_per_unit.focus();
                    return false;
                }
             if (document.add_form1.item_quantity.value=="")
                {
                    alert("Please provide Quantity!");
                    document.add_form1.item_quantity.focus();
                    return false;
                }
             if (document.add_form1.item_amount.value=="")
                {
                    alert("Please provide your Amount!");
                    document.add_form1.item_amount.focus();
                    return false;
                }
            
            }

            //-->
        </script>

</HEAD>
<BODY>
	<FORM name="add_form1" action="admin_add_sales.jsp"
		onsubmit="return validateForm();" method="post">
		<!-- <FORM name ="form1" onsubmit="validate();" method="get">//-->

		<table border="1" width="100%">
			<tr>
				<th colspan="5" bgcolor="#9dff9d"><font size="3" face="Arial"
					color="0000a0">To Delete Products Used or Purchased by Customer</th>
			</tr>
		</table>

		<%
		String item_id = request.getParameter("item_id");
		String work_id = request.getParameter("work_id");
		String jitem_admin_detail = request.getParameter("item_admin_detail");
		if(jitem_admin_detail==null || jitem_admin_detail==""){
			jitem_admin_detail="deleted admin screen";
		}
		
		System.out.println("-----UPDATING--Item --request.getParameter(item_admin_detail);--"+jitem_admin_detail);
				
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String url = "jdbc:odbc:EnjoyODBC";
			Connection connection = null;
			Statement statement_del = null;
			//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();

			int updateQuery = 0;

			if (item_id != null) {
				if (item_id != "") {
					try {
						//connection = DriverManager.getConnection(connectionURL, "root", "root");
						connection = DriverManager.getConnection(url, "", "");
						//statement_del.getConnection();
						statement_del = connection.createStatement();
						
						System.out.println("----Deleting SALES ITEM ----UPDATING--Item Status as DELETED-------1");
						
						//String queryString_del = "Delete from Bill_All_Items_Purchase where item_id ="+Integer.parseInt(item_id);
						String queryString_del = "update Bill_All_Items_Purchase set item_admin_detail='"+jitem_admin_detail+"', item_status='DELETED' where item_id ="+Integer.parseInt(item_id);

						System.out.println("----admin_item_delete_sales.jsl--Delete QUERY: " + queryString_del);

						updateQuery = statement_del.executeUpdate(queryString_del);

						System.out.println("----admin_item_delete_sales.jsl--Delete Record deleted: " + updateQuery);
						

						if (updateQuery != 0) {
							connection.commit();
							
		%>
		<br>
		<jsp:forward page="admin_add_edit_delete_confirmation.jsp">
			<jsp:param name="work_id" value="<%=work_id%>" />
		</jsp:forward>

		<%
			}

					} catch (Exception ex) {
						out.println("RECORD NOT UPDATED, Unable to connect to Database. "+ ex);
						System.out.println("----Exception OCCURED:  " + ex);
			
						
					} finally {
						if (statement_del != null) {
							statement_del.close();
							connection.commit();
							connection.close();

						}
	
					}

				}

			}
		%>

	</FORM>

</body>

</html>