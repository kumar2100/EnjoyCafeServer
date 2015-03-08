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
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>



<HTML>
<HEAD>
<TITLE>Bill Sales to Customer</TITLE>
<script type="text/javascript">

function printBill(work_id) {

	window.open("admin_collect_paymentV2.jsp", "_self");
	window.open("admin_pay_cash_total_items_bill.jsp?work_id="+work_id);
	
    //var f = document.form1;
    //f.method = "post";
    //f.action = 'admin_pay_cash_total_items_bill.jsp?work_id='+work_id;
    //f.submit();
    //window.open("admin_pay_cash_total_items_bill.jsp");
}

</script>

</HEAD>
<BODY>


		<%

		int jbill_id=0;
		//date bill_date
		int jwork_id=0;
		String juser_name="";
		int jbill_total_products=0;
		int jbill_discount=0;
		int jbill_service_tax=0;
		int jbill_total_to_pay=0;
		int jbill_total_paid=0;
		String jbill_pay_status="";
		int jbill_balance=0;
		String jbill_cancel_detail="";
		
		java.util.Date  utilDate = new java.util.Date();
		java.sql.Date jbill_date = new java.sql.Date(utilDate.getTime());

		
		
		System.out.println("----Adding Bill  PAYMENT ----request.getParameter(work_id);-----------" +request.getParameter("work_id"));
		
		
		//String swork_id= request.getParameter("work_id");
		jwork_id =Integer.parseInt(request.getParameter("work_id"));
		juser_name=request.getParameter("user_name");
		
		//Area For validation and assignent of values: //other wise need to do in the value submitting page for correct values.
		if((request.getParameter("bill_total_products")=="") || request.getParameter("bill_total_products")==null){
			jbill_total_products=0;
		}else {
			jbill_total_products =Integer.parseInt(request.getParameter("bill_total_products"));	
		}
		
		jbill_discount =Integer.parseInt(request.getParameter("bill_discount"));
		jbill_service_tax =Integer.parseInt(request.getParameter("bill_service_tax"));
		jbill_total_to_pay =Integer.parseInt(request.getParameter("bill_total_to_pay"));
		jbill_total_paid=Integer.parseInt(request.getParameter("bill_total_paid"));
		jbill_pay_status="PAID TESTING";
		jbill_balance =Integer.parseInt(request.getParameter("bill_balance"));
		jbill_cancel_detail="PAID TESTING";
		
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String url = "jdbc:odbc:EnjoyODBC";
			//Connection conn = DriverManager.getConnection(url, "", "");

			Connection connection = null;
			PreparedStatement pstatement = null;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();

			int updateQuery = 0;

			if (juser_name != null) {
					try {
						//connection = DriverManager.getConnection(connectionURL, "root", "root");
						connection = DriverManager.getConnection(url, "", "");
						System.out.println("----Adding Bill  PAYMENT -------1");
						//String queryString = "INSERT INTO Bill_All_Items_Purchase(bill_id, work_id, item_details, item_cost_per_unit, item_quantity, item_amount, item_brand, item_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
						//String queryString = "INSERT INTO Bill_All_Items_Purchase(work_id, item_details, item_cost_per_unit, item_quantity, item_amount, item_brand, item_status) VALUES (?, ?, ?, ?, ?, ?, ?)";
						String queryString = "INSERT INTO Login_Logout_Payment"
						+"(work_id, user_name, bill_total_products, bill_discount, bill_service_tax,"
						+" bill_total_to_pay, bill_total_paid, bill_pay_status, bill_balance, bill_cancel_detail, bill_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

						pstatement = connection.prepareStatement(queryString);
						//pstatement.setInt(1, Integer.parseInt(bill_id));
						pstatement.setInt(1, jwork_id);
						pstatement.setString(2, juser_name);
						pstatement.setInt(3, jbill_total_products);
						pstatement.setInt(4, jbill_discount);
						pstatement.setInt(5, jbill_service_tax);

						pstatement.setInt(6, jbill_total_to_pay);
						pstatement.setInt(7, jbill_total_paid);
						pstatement.setString(8, jbill_pay_status);
						pstatement.setInt(9, jbill_balance);
						pstatement.setString(10, jbill_cancel_detail);
						pstatement.setDate(11, jbill_date);
						
						
						System.out.println("--PROCESSING--Adding Bill  PAYMENT ------2");

						updateQuery = pstatement.executeUpdate();
						System.out.println("----COMPLETING Bill  PAYMENT ------3");
						System.out.println("----BILL PAYMENT RECORD COUNT---> pstatement.executeUpdate()  RESULT : " + updateQuery);

						if (updateQuery != 0) {
							connection.commit();
		%>
<%-- 		<jsp:forward page="admin_add_edit_delete_confirmation.jsp"> --%>
<%-- 		<jsp:forward page="admin_pay_cash_total_items_bill.jsp"> --%>
<%-- 			<jsp:param name="work_id" value="<%=jwork_id%>" /> --%>
<%-- 		</jsp:forward> --%>

<form name='update_form' method="post"
	action="admin_pay_cash_total_list_items.jsp">
	<table>
		<tr>

			<th bgcolor="#9dff9d"><font size="4" face="Arial" color="0000a0">BILL Details
					Captured and PAYMENT UPDATED Successfully FOR Customer: <%=juser_name%>  -Work ID: <%=jwork_id%>  <input type="hidden"
					name="work_id" value="<%=jwork_id%>"></th>
		</tr>
	</table>
	</br> </br> </br> </br>

	<table border="1">
		<tr>
			<TD bgcolor="#ffddff" width="50%"><font size="3" face="Arial"><INPUT
					TYPE="Button" VALUE="VIEW PAYMENT MADE" onclick="printBill(<%=jwork_id%>);"
					style="background-color: #49333D; font-weight: bold; color: #ffffff;">
					............. </TD>

		</tr>
		<tr>		<td><input type="button" value="Print this page" onClick="window.print()"></td>
		</tr>

	</table>
</form>

</body>

</html>

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

			
		%>
			