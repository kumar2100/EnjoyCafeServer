<%@page language="java"%>
<%@page import="java.sql.*"%>

<head>
<title>Enjoy Cafe Edit Item Sales</title>
<script language="javascript">
 
    
	    function updateRecord(id) {
	     alert("Going to Update Record ! ");
			   // if(validateForm()){
			    var f = document.edit_form1;
			    f.method = "post";
			    f.action = 'admin_item_update_sale.jsp?item_id=' + id;
			    f.submit();
			    //}
		}


function cancelEdit(id) {
    var f = document.edit_form1;
    f.method = "post";
    f.action = 'admin_pay_cash_total_list_items.jsp?work_id=' + id;
    f.submit();
}

function validateForm()
{

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
	return true;
}



function sum() {
	//alert(" Java Script Calculation ");
	var txtFirstNumberValue = document.edit_form1.item_quantity.value;
    var txtSecondNumberValue = document.edit_form1.item_cost_per_unit.value;

    var result = parseInt(txtFirstNumberValue) * parseInt(txtSecondNumberValue);
 
        if (!isNaN(result)) {
            //document.getElementById('txt3').value = result;
            document.edit_form1.item_amount.value = result;
         }
}


</script>

</head>
<table border="1" width="100%">
	<tr>
		<th colspan="5" bgcolor="#9dff9d"><font size="3" face="Arial"
			color="0000a0">ADMIN SCREEN TO EDIT ITEM Details</th>
	</tr>
</table>
<br>
<br>

<form name="edit_form1" method="post" action="Update_Employee.jsp">
	<div align="center">
		<table border="1">
			<%
				String jitem_id = request.getParameter("item_id");
				String jwork_id = request.getParameter("work_id");

				int no = Integer.parseInt(jitem_id);
				int sumcount = 0;
				try {

					Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					String url = "jdbc:odbc:EnjoyODBC";
					Connection conn = DriverManager.getConnection(url, "", "");
					Statement stmt = conn.createStatement();
					String sqlStr = "SELECT * FROM Bill_All_Items_Purchase where item_id="
							+ no;
					System.out.println("Query statement is " + sqlStr);
					ResultSet rs = stmt.executeQuery(sqlStr);
					while (rs.next()) {
			%>
			<tr>
			<tr>
				<th bgcolor="#b0d0b9">ITem Details</th>
				<td bgcolor="#ffffb9"><input type="text" name="item_details"
					value="<%=rs.getString("item_details")%>"></td>
			</tr>
			<tr>
				<th bgcolor="#b0d0b9">ITem_cost_per_unite</th>
				<td bgcolor="#ffffb9"><input type="text" onkeyup="sum();"
					name="item_cost_per_unit"
					value="<%=rs.getString("item_cost_per_unit")%>"></td>
			</tr>
			<tr>
				<th bgcolor="#b0d0b9">ITem_quantity</th>
				<td bgcolor="#ffffb9"><input type="text" name="item_quantity" onkeyup="sum();"
					value="<%=rs.getString("item_quantity")%>"></td>
			</tr>
			<tr>
				<th bgcolor="#b0d0b9">ITem_amount</th>
				<td bgcolor="#ffffb9"><input type="text" name="item_amount"
					value="<%=rs.getString("item_amount")%>"></td>
			</tr>
			<tr>
				<th bgcolor="#b0d0b9">TTem_admin_detail</th>
				<td bgcolor="#ffffb9"><input type="text" name="item_admin_detail"
					value="<%=rs.getString("item_admin_detail")%>"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="item_id"
					value="<%=rs.getInt("item_id")%>"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="work_id" value="<%=jwork_id%>"></td>
			</tr>

			<td><input type="button" name="Update" value="Update"
				onclick="updateRecord(<%=jitem_id%>);"
				style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>

			<td><input type="button" name="Cancel" value="Cancel"
				onclick="cancelEdit(<%=jwork_id%>);"
				style="background-color: #49333D; font-weight: bold; color: #ffffff;"></td>
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