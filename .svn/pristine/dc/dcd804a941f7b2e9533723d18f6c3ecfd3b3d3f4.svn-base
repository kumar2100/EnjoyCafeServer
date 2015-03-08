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
<TITLE>Adding Sales to Customer</TITLE>
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
                f.action = 'admin_pay_cash_list_items.jsp?id='+id;
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
	<FORM name="add_form1" action="admin_item_add_sales.jsp"
		onsubmit="return validateForm();" method="post">
		<!-- <FORM name ="form1" onsubmit="validate();" method="get">//-->

		<table border="1" width="100%">
			<tr>
				<th colspan="5" bgcolor="#9dff9d"><font size="3" face="Arial"
					color="0000a0">Adding Products Used or Purchased by Customer</th>
			</tr>
		</table>
		<div align="center">
			<TABLE border="1">

				<tr>
					<th bgcolor="#b0d0b9">item_details</th>
					<td bgcolor="#ffffb9"><input type="text" name="item_details"></td>
				</tr>
				<tr>
					<th bgcolor="#b0d0b9">item_cost_per_unit</th>
					<td bgcolor="#ffffb9"><input type="text"
						name="item_cost_per_unit"></td>
				</tr>
				<tr>
					<th bgcolor="#b0d0b9">item_quantity</th>
					<td bgcolor="#ffffb9"><input type="text" name="item_quantity"></td>
				</tr>
				<tr>
					<th bgcolor="#b0d0b9">item_amount</th>
					<td bgcolor="#ffffb9"><input type="text" name="item_amount"></td>
				</tr>
				<tr>
					<th bgcolor="#b0d0b9">item_brand</th>
					<td bgcolor="#ffffb9"><input type="text" name="item_brand"></td>

					<input type="hidden" name="bill_id"
						value="<%=request.getParameter("bill_id")%>">
					<input type="hidden" name="work_id"
						value="<%=request.getParameter("work_id")%>">

					<td><input type="Submit" name="Update" value="Update"
						style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>
					<td><input type="button" name="Cancel" value="Cancel"
						onclick="cancelEdit(<%=request.getParameter("work_id")%>);"
						style="background-color: #49333D; font-weight: bold; color: #ffffff;"></td>
				</tr>
			</TABLE>
		</DIV>

		<%
			String bill_id = request.getParameter("bill_id");
			String work_id = request.getParameter("work_id");
			String item_details = request.getParameter("item_details");
			String item_cost_per_unit = request
					.getParameter("item_cost_per_unit");
			String item_quantity = request.getParameter("item_quantity");
			String item_amount = request.getParameter("item_amount");
			String item_brand = request.getParameter("item_brand");
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String url = "jdbc:odbc:EnjoyODBC";
			//Connection conn = DriverManager.getConnection(url, "", "");

			Connection connection = null;
			PreparedStatement pstatement = null;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();

			int updateQuery = 0;

			if (bill_id != null && work_id != null && item_details != null) {
				if (bill_id != "" && work_id != "" && item_details != "") {
					try {
						//connection = DriverManager.getConnection(connectionURL, "root", "root");
						connection = DriverManager.getConnection(url, "", "");
						System.out.println("----Adding SALES ITEM -----------1");
						String queryString = "INSERT INTO Bill_All_Items_Purchase(bill_id, work_id, item_details, item_cost_per_unit, item_quantity, item_amount, item_brand, item_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

						pstatement = connection.prepareStatement(queryString);
						pstatement.setInt(1, Integer.parseInt(bill_id));
						pstatement.setInt(2, Integer.parseInt(work_id));
						pstatement.setString(3, item_details);
						pstatement.setInt(4,
								Integer.parseInt(item_cost_per_unit));
						pstatement.setString(5, item_quantity);
						pstatement.setInt(6, Integer.parseInt(item_amount));
						pstatement.setString(7, item_brand);
						pstatement.setString(8, "SOLD");
						System.out.println("----Adding SALES ITEM ------------2");

						updateQuery = pstatement.executeUpdate();
						System.out.println("----Adding SALES ITEM ------------");
						System.out.println("updateQuery " + updateQuery);

						if (updateQuery != 0) {
							connection.commit();
		%>
		<jsp:forward page="admin_add_edit_delete_confirmation.jsp">
			<jsp:param name="work_id" value="<%=work_id%>" />
		</jsp:forward>


		<%
			}

					} catch (Exception ex) {
						out.println("RECORD NOT UPDATED, Unable to connect to Database. "
								+ ex);
					} finally {
						if (pstatement != null) {
							pstatement.close();
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