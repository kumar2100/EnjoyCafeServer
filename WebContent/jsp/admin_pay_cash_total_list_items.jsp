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

        function validateForm()
        {

	           if (document.pay_form1.bill_total_products.value=="")
	            {
	                alert("Please provide bill_total_products!");
	                document.pay_form1.bill_total_products.focus();
	                return false;
	            }
	         if (document.pay_form1.bill_service_tax.value=="")
	            {
	                alert("Please provide your bill_service_tax!");
	                document.pay_form1.bill_service_tax.focus();
	                return false;
	            }
	         if (document.pay_form1.bill_discount.value=="")
	            {
	                alert("Please provide bill_discount!");
	                document.pay_form1.bill_discount.focus();
	                return false;
	            }
	         if (document.pay_form1.bill_total_to_pay.value=="")
	         {
	             alert("Please provide your bill_total_to_pay!");
	             document.pay_form1.bill_total_to_pay.focus();
	             return false;
	         }
	         if (document.pay_form1.bill_total_paid.value=="")
	         {
	             alert("Please provide your bill_total_paid!");
	             document.pay_form1.bill_total_paid.focus();
	             return false;
	         }
	         if (document.pay_form1.bill_balance.value=="")
	         {
	             alert("Please provide your bill_balance!");
	             document.pay_form1.bill_balance.focus();
	             return false;
	         }
        
	         return true;
        }

        	function editRecord(pitem_id) {

                alert("Admin Edit ITem Sales operation");
                var f = document.pay_form1;
                f.method = "post";
                f.action = 'admin_item_edit_sales.jsp?item_id=' + pitem_id;
                f.submit();
                //window.open("Edit_Employee.jsp","_self")
            }
        	
        	function editRecordDetail(pitem_id, pitem_details) {

                alert("Admin Edit ITem Sales operation"+pitem_details.trim());

                var f = document.pay_form1;
                if(pitem_details.trim()=="Internet Usage"){
                	alert("Going to edit Internet Usage : "+pitem_details);
                    f.method = "post";
                    //f.action = 'admin_to_do_user_logout.jsp?item_id=' + pitem_id;
                    // The above working fine, but calculation taking the current system time as END TIME and its creating huge difference for the 
                    //old logout, internet usage edit is 100% manual, no system calculation, any how the edit will update to item_admin_detail.
                    
                    f.action = 'admin_item_edit_sales.jsp?item_id=' + pitem_id;
                    f.submit();
                }

                if(pitem_details.trim()!=="Internet Usage"){
                f.method = "post";
                f.action = 'admin_item_edit_sales.jsp?item_id=' + pitem_id;
                f.submit();
                //window.open("Edit_Employee.jsp","_self")
                }

        	}
        	

            function addSales(pbill_id, pworkid) {

                alert("admin_add_sales. operation");

                var f = document.pay_form1;
                f.method = "post";
                f.action = 'admin_item_add_sales.jsp?bill_id=' +pbill_id+'&work_id='+pworkid;
                f.submit();
                //window.open("Edit_Employee.jsp","_self")
            }

            function payment_update(id) {

                if (confirm('Are you sure to DELETE Work Transaction Record')) {

                    var f = document.pay_form1;
                    f.method = "post";
                    f.action = 'admin_del_login_logout.jsp?id=' + id;
                    f.submit();
                }

            }
            
           
            
            function item_delete(pitem_id) {
            	
            	var ok = confirm('Are you sure to DELETE item'); 

            	if(ok){    
					var reason = prompt('Reason to DELETE Record " ');	
                    var f = document.pay_form1;
                    f.method = "post";
                    f.action = 'admin_item_delete_sales.jsp?item_id=' + pitem_id+'&item_admin_detail='+reason;
                    f.submit();
					}
					else{
						alert("ok Great!");
					}
            }

           
            function addSalesWithBill(id, pbill_id) {
                    var f = document.pay_form1;
                    var wid = document.pay_form1.work_id.value;
                    alert("Adding Sales to Work ID:  "+wid);
                    f.method = "post";
                    f.action = 'admin_item_add_sales.jsp?bill_id=' +pbill_id+'&work_id='+wid;
                    f.submit();

            }

            function addSalesWithWorkId(pwork_id) {
                   var f = document.pay_form1;
                      alert("Adding Sales to Work ID:  "+pwork_id);
                    f.method = "post";
                    f.action = 'admin_item_add_salesV2.jsp?work_id='+pwork_id;
                    f.submit();
             }
  
            
            function payTotalBill(pwork_id) {
				//Complete the validation for the complete filling of the form first
				
				//onsubmit="return validateForm();"
				var validated= validateForm();
				if(validated)
				{					
	            	var txtFirstNumberValue = document.pay_form1.bill_total_products.value;
	                var txtSecondNumberValue = document.pay_form1.bill_service_tax.value;
	                var txtThirdNumberValue = document.pay_form1.bill_discount.value;
	            	var f = document.pay_form1;
	
	            	if(isNaN(txtFirstNumberValue))
	            		alert("Please Complete the value Bill_Total_Prouducts");
	            		
	            	
	            	
	            	
	            	var ok = confirm('Going To PayBill'+pwork_id); 
	            	if(ok){    
	                 f.method = "post";
	                 f.action = 'admin_pay_cash_total_paid.jsp?work_id='+pwork_id;
	                 f.submit();
	            	}
	            	else {
	            		alert("Ok Great!");
	            	}
				}
         }
            
            function func1() {
            	  //alert("Window ON LOAD CALCULATION");
            	  //function sum();
            	}window.onload=func1;

            function billBalance() {
                	
                   	var txtFirstNumberValue = document.pay_form1.bill_total_to_pay.value;
                    var txtSecondNumberValue = document.pay_form1.bill_total_paid.value;
      
                    var result = parseInt(txtFirstNumberValue) - parseInt(txtSecondNumberValue);
                    
                    if (!isNaN(result)) {
                        document.pay_form1.bill_balance.value = result;
                    }
                }

            
            function sum() {
            	//alert(" Java Script Calculation Please Check Payment  ");
            	var txtFirstNumberValue = document.pay_form1.bill_total_products.value;
                var txtSecondNumberValue = document.pay_form1.bill_service_tax.value;
                var txtThirdNumberValue = document.pay_form1.bill_discount.value;
                //var txtFirstNumberValue = document.getElementById('txt1').value;
                //var txtSecondNumberValue = document.getElementById('txt2').value;
	    
                var result = parseInt(txtFirstNumberValue) + parseInt(txtSecondNumberValue);
                var result2 = result - parseInt(txtThirdNumberValue);
  
	                if (!isNaN(result2)) {
	                    //document.getElementById('txt3').value = result;
	                    document.pay_form1.bill_total_to_pay.value = result2;
	                    document.pay_form1.bill_total_paid.value = result2;
	                    document.pay_form1.bill_pay_status.value = "pay-screen";
	                }
            }

            function userlogout(work_id) {

            	if(confirm("Going to LOG OUT the Customer you have selected : "+work_id)){

                var f = document.pay_form1;
                f.method = "post";
                f.action = 'admin_to_do_user_logout.jsp?work_id='+work_id;
                f.submit();
            	}
  
            }


        </script>
    </head>
    <body>

        <%@ page import = "java.sql.*" %>
        <%
  			int jbill_id=0;
        
            String vwork_id = request.getParameter("work_id");
        	System.out.println("-----------admin_pay_cash_total_list_items.jsp-------- Work ID to Update vwork_id String " + vwork_id);

        	String juser_name ="";
        	String juser_status="";
        	
        	
            int jwork_id = Integer.parseInt(vwork_id);
            System.out.println("-----------admin_pay_cash_total_list_items.jsp------- Work ID to Update " + jwork_id);
			int total_amount=0;
			
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection conn = DriverManager.getConnection(url, "", "");
            Statement stmt = conn.createStatement();
            //String sqlStr = "SELECT * FROM Login_Logout_Payment where work_id = "+jwork_id;
            String sqlStr_list_items = "SELECT * FROM Bill_All_Items_Purchase where item_status='SOLD' and work_id = "+jwork_id;
            //String sqlStr_list_items = "SELECT * FROM Bill_All_Items_Purchase where work_id="+jwork_id+" AND item_status='SOLD'";
            String sqlStr_user_name = "SELECT user_name, user_status FROM Login_Logout_Time where work_id = "+jwork_id;

            String sqlStr_total_amount="SELECT Bill_All_Items_Purchase.work_id, Sum(Bill_All_Items_Purchase.item_amount) AS SumOfitem_amount"
            		+" FROM Bill_All_Items_Purchase where item_status='SOLD'"
            		+" GROUP BY Bill_All_Items_Purchase.work_id"
            		+" HAVING (((Bill_All_Items_Purchase.work_id)="+jwork_id+"))";
            
            System.out.println("-----------admin_pay_cash_total_list_items.jsp------- sqlStr_total_amount QUERRY : " + sqlStr_total_amount);
            ResultSet rset_total = stmt.executeQuery(sqlStr_total_amount);
            while (rset_total.next()) {
            	total_amount=rset_total.getInt(2);
            }

            ResultSet rset_uname = stmt.executeQuery(sqlStr_user_name);
            while (rset_uname.next()) {
            	juser_name=rset_uname.getString(1);
            	juser_status=rset_uname.getString(2);
            }

            System.out.println("-----------admin_pay_cash_total_list_items.jsp------- juser_status : " + juser_status);
            
            //String sqlStr2 = "SELECT * FROM Logout_Bill_Other_Sales where work_id = "+jwork_id;
            //System.out.println("Query statement is " + sqlStr);
            System.out.println("Query statement is " + sqlStr_list_items);
            //ResultSet rset = stmt.executeQuery(sqlStr);
            ResultSet rset = stmt.executeQuery(sqlStr_list_items);
                %>


        <form name ="pay_form1" method="get" action="admin_add_sales.jsp"  >
            <table border=2 cellpadding=5 width="100%">

                <tr>
                    <th colspan="6" bgcolor="#9dff9d"><font size="3" face="Arial" color="0000a0">Work No: <%=jwork_id%> Bill Details For : <%=juser_name%>   </th>
<!--                     <td bgcolor="#ffddff"></td> -->


                <tr>
<!--          		 <tr> -->
<%--                   <td colspan =6 align="center" bgcolor="yellow"><input type="button" name="addSales" value="Add Sales" onclick="addSalesWithWorkId(<%=jwork_id%>);"></td> --%>
<!--                 </tr> -->
      
                <tr>
                    <th bgcolor="#b0d0b9">Item Id</th>
                    <th bgcolor="#b0d0b9">Item Details</th>
                    <th bgcolor="#b0d0b9">Item Unit Cost</th>
                    <th bgcolor="#b0d0b9">Item Quantity </th>
                    <th bgcolor="#b0d0b9">Item Amount</th>
                    <th bgcolor="#b0d0b9">Item Option</th>
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
                    
<%--                     <td bgcolor="#ffddff"><input type="button" name="edit" value="Edit" onclick="editRecord(<%=jitem_id%>);"> --%>
                    <td bgcolor="#ffddff"><input type="button" name="edit" value="Edit" onclick="editRecordDetail('<%=jitem_id%>', '<%=jitem_details%>');">
                    
                      <input type="button" name="delete" value="Delete" onclick="item_delete(<%=jitem_id%>);"></td>

                </tr>
                
                <%
                    }
                %>
                <tr>
                    <input type="hidden" name="work_id" value="<%=jwork_id%>">
                    <input type="hidden" name="user_name" value="<%=juser_name%>">
	                <th colspan =4 align="right" bgcolor="">Total Items Amount</th>
	                <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040">
	                <input type = "text" id="bill_total_products" name= "bill_total_products" value="<%=total_amount%>"> </td>
	     <td rowspan =7 align="center" bgcolor="orange"><input type="button" name="addSales" value="Add Sales" onclick="addSalesWithWorkId(<%=jwork_id%>);"></td>           
 				</tr>
 	             <tr>
                    <th colspan =4 align="right" bgcolor=""> Service Tax</th>
	                <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040">
	                <input type = "text"  onkeyup="sum();" id="bill_service_tax" name= "bill_service_tax"></td>
 				</tr>
	             <tr>
                    <th colspan =4 align="right" bgcolor=""> Discount</th>
	                <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040">
	                <input type = "text"  onkeyup="sum();" id= "bill_discount" name= "bill_discount"></td>
 				</tr>
	             <tr>
                    <th colspan =4 align="right" bgcolor="">Total To Pay</th>
	                <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040">
	                <input type = "text" onclick="sum();" id= "bill_total_to_pay" name= "bill_total_to_pay"></td>
 				</tr>
 	
	             <tr>
                    <th colspan =4 align="right" bgcolor="">Total Paid</th>
	                <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040">
	                <input type = "text" onkeyup="billBalance();"  id= "bill_total_paid" name= "bill_total_paid"></td>
 				</tr>
	             <tr>
                    <th colspan =4 align="right" bgcolor="">Bill Balance</th>
	                <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040">
	                <input type = "text" name= "bill_balance"></td>
 				</tr>

	             <tr>
                    <th colspan =4 align="right" bgcolor="">Bill Pay Status</th>
	                <td align="center" bgcolor="#ffffb9"><font size="2" face="verdana" color="800040">
	                <input type = "text" name= "bill_pay_status"></td>
 				</tr>

 				<tr>
<%--                 <td colspan =4 align="center" bgcolor="#ffddff"><input type="button" name="addSales" value="Add Sales" onclick="addSalesWithWorkId(<%=jwork_id%>);"></td> --%>
<%--                <td> <a href="/EnjoyCafeServer/jsp/admin_item_add_salesV2.jsp?work_id=<%=jwork_id%>">Add Sales</a></td> --%>

				<%
				
				
	            System.out.println("-----------admin_pay_cash_total_list_items.jsp------- juser_status 2 : " + juser_status);
				juser_status.trim();
				
				
				//if((juser_status.equals("Working")) || (juser_status=="Working") || (juser_status.equalsIgnoreCase("WORKING")) ){
				if(!(juser_status.equals("logout_collect_cash")) ){
				            System.out.println("-----------admin_pay_cash_total_list_items.jsp------- juser_status 3 : " + juser_status);
					
					
				%>
                <td colspan =6 align="center" bgcolor="yellow"><input type="button" name="logout" value=" LOG-OUT USER" onclick="userlogout(<%=jwork_id%>);"></td>
                <%
                 }else {
 		            System.out.println("-----------admin_pay_cash_total_list_items.jsp------- juser_status 4 : " + juser_status);
				%>
                <td colspan =6 align="center" bgcolor="yellow"><input type="button" name="PayBill" value=" PAY BILL" onclick="payTotalBill(<%=jwork_id%>);"></td>
                <%
                 }
                %>
                
                
            </table>

        </form>
        <SCRIPT LANGUAGE="JavaScript">
            <!--
           function AddEmployee()
            {
                document.pay_form1.buttonName.value = "Add";


                pay_form1.submit();
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