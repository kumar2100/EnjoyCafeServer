<%-- 
    Document   : admin_pay_cash
    Created on : Sep 14, 2014, 3:20:40 AM
    Author     : kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
<link rel="stylesheet" href="gstyle.css" media="screen, print" type="text/css">
        <title>EnjoyCafe Usage Bill</title>
        <script language="javascript">

        function addSales(pbill_id, pworkid) {

                alert("admin_add_sales. operation");

                var f = document.form1;
                f.method = "post";
                f.action = 'admin_item_add_sales.jsp?bill_id=' +pbill_id+'&work_id='+pworkid;
                f.submit();
                //window.open("Edit_Employee.jsp","_self")
            }
        
        
        function closeBill(pworkid) {

            var ok = confirm("CLOSING BILL");
			if(ok){
				window.close();
			}
			else {
				
			}
        }
        
        
        function printpage() {
            //Get the print button and put it into a variable
            var printButton = document.getElementById("print-button");
            var closeButton = document.getElementById("close-bill");
            
            
            //Set the print button visibility to 'hidden' 
            printButton.style.visibility = 'hidden';
            closeButton.style.visibility = 'hidden';
                       //Print the page content
            window.print();
            //Set the print button to 'visible' again 
            //[Delete this line if you want it to stay hidden after printing]
            printButton.style.visibility = 'visible';
            closeButton.style.visibility = 'visible';
          }
        

        </script>
    </head>
    <body>

        <%@ page import = "java.sql.*" %>
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
      
        
        
            String vwork_id = request.getParameter("work_id");
        	System.out.println("----admin_pay_cash_total_items_bill.jsp-------- Work ID to BILL vwork_id String " + vwork_id);

        	//String juser_name ="";
        	
            jwork_id = Integer.parseInt(vwork_id);
            System.out.println("--------admin_pay_cash_total_items_bill.jsp--------- Work ID to Update " + jwork_id);
			int total_amount=0;
			
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection conn = DriverManager.getConnection(url, "", "");
            Statement stmt = conn.createStatement();
            Statement pay_stmt = conn.createStatement();
            Statement update_stmt = conn.createStatement();
            //String sqlStr = "SELECT * FROM Login_Logout_Payment where work_id = "+jwork_id;
            String sqlStr_list_items = "SELECT * FROM Bill_All_Items_Purchase where item_status='SOLD' and work_id = "+jwork_id;

            String sqlStr_user_name = "SELECT user_name FROM Login_Logout_Time where work_id = "+jwork_id;

            String sqlStr_uptade_paid_status = "update Login_Logout_Time  set user_status='CASH_PAID' where work_id = "+jwork_id;

            //To update the status of Login_Logout_Time table:
            update_stmt.execute(sqlStr_uptade_paid_status);	
            
            String sqlStr_total_amount="SELECT Bill_All_Items_Purchase.work_id, Sum(Bill_All_Items_Purchase.item_amount) AS SumOfitem_amount"
            		+" FROM Bill_All_Items_Purchase where item_status='SOLD'"
            		+" GROUP BY Bill_All_Items_Purchase.work_id"
            		+" HAVING (((Bill_All_Items_Purchase.work_id)="+jwork_id+"))";
            
            System.out.println("---------------admin_pay_cash_total_items_bill.jsp-------- sqlStr_total_amount QUERRY : " + sqlStr_total_amount);
            ResultSet rset_total = stmt.executeQuery(sqlStr_total_amount);
            while (rset_total.next()) {
            	total_amount=rset_total.getInt(2);
            }

            ResultSet rset_uname = stmt.executeQuery(sqlStr_user_name);
            while (rset_uname.next()) {
            	juser_name=rset_uname.getString(1);
            }

            
            //String sqlStr2 = "SELECT * FROM Logout_Bill_Other_Sales where work_id = "+jwork_id;
            //System.out.println("Query statement is " + sqlStr);
            System.out.println("----------------admin_pay_cash_total_items_bill.jsp-----------------Query statement is " + sqlStr_list_items);
            //ResultSet rset = stmt.executeQuery(sqlStr);
            ResultSet rset = stmt.executeQuery(sqlStr_list_items);

            /*
            *currently bill_id is generated for everytime paying and same work_id is having many bill_id generated 
            *Production site will be having ONLY onle bill_id for every work_id
            */
            String sqlStr_payment = "SELECT * FROM Login_Logout_Payment where work_id = "+jwork_id;
            ResultSet rset_payment = pay_stmt.executeQuery(sqlStr_payment);
                    

            
            %>


        <form name ="form1" method="get" action="admin_add_sales.jsp">
            <table border=2 cellpadding=5 width="100%">

                <tr>
                    <th colspan="5" bgcolor="#9dff9d"><font size="4" face="Arial" color="0000a0">Bill To : <%=juser_name%> With Work ID: <%=jwork_id%> </th>
                <tr>

                <tr>
                    <th bgcolor="#b0d0b9">Item Id</th>
                    <th bgcolor="#b0d0b9">Item Details</th>
                    <th bgcolor="#b0d0b9">Item Cost_per_unit</th>
                    <th bgcolor="#b0d0b9">Item Quantity </th>
                    <th bgcolor="#b0d0b9">Item Amount</th>
                </tr>
                <%
                		
                    while (rset.next()) {
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
                </tr>
                
                <%
                    }
                %>
                <tr>
                    <input type="hidden" name="work_id" value="<%=jwork_id%>">
                    <input type="hidden" name="user_name" value="<%=juser_name%>">
                <%
                
                while(rset_payment.next()){

            		jbill_id = rset_payment.getInt("bill_id");
            		jbill_date =rset_payment.getDate("bill_date");
            		jbill_total_products = rset_payment.getInt("bill_total_products");
            		jbill_service_tax = rset_payment.getInt("bill_service_tax");
              		jbill_discount = rset_payment.getInt("bill_discount");
              		jbill_total_to_pay = rset_payment.getInt("bill_total_to_pay");
              		jbill_total_paid = rset_payment.getInt("bill_total_paid");
	           		jbill_balance = rset_payment.getInt("bill_balance");
              		jbill_pay_status = rset_payment.getString("bill_pay_status");
              		//jbill_date=rset_payment.getDate("bill_date");
             
                %>    
                    
	                <th colspan =4 align="right" bgcolor=""><%=jbill_date%>  BILL ID: <%=jbill_id%> Total Items Amount</th>
	                <td align="center" bgcolor="#ffddff"><font size="2" face="verdana" color="800040"><%=total_amount%>
	                </td>
 				</tr>
 	
 	             <tr>
                    <th colspan =4 align="right" bgcolor="">Total FROM DBMS </th>
	                <td align="center" bgcolor="#ffddff"><font size="2" face="verdana" color="800040"><%=jbill_total_products%></td>
 				</tr>
	             <tr>
                    <th colspan =4 align="right" bgcolor=""> Service Tax</th>
	                <td align="center" bgcolor="#ffddff"><font size="2" face="verdana" color="800040">
	                <%=jbill_service_tax%></td>
 				</tr>
	
 	             <tr>
                    <th colspan =4 align="right" bgcolor=""> Discount</th>
	                <td align="center" bgcolor="#ffddff"><font size="2" face="verdana" color="800040">
	                <%=jbill_discount%></td>
 				</tr>
	             <tr>
                    <th colspan =4 align="right" bgcolor="">Total To Pay</th>
	                <td align="center" bgcolor="#ffddff"><font size="2" face="verdana" color="800040">
	                <%=jbill_total_to_pay%></td>
 				</tr>
 	
	             <tr>
                    <th colspan =4 align="right" bgcolor="">Total Paid</th>
	                <td align="center" bgcolor="#ffddff"><font size="2" face="verdana" color="800040">
	                <%=jbill_total_paid%></td>
 				</tr>
	             <tr>
                    <th colspan =4 align="right" bgcolor="">Bill Balance</th>
	                <td align="center" bgcolor="#ffddff"><font size="2" face="verdana" color="800040"><%=jbill_balance%>
	                </td>
 				</tr>

	             <tr>
                    <th colspan =4 align="right" bgcolor="">Bill Pay Status</th>
	                <td align="center" bgcolor="#ffddff"><font size="2" face="verdana" color="800040"><%=jbill_pay_status%>
	                </td>
 				</tr>

             <tr>
                    <th bgcolor="#9dff9d" align="center" colspan =5 align="right" bgcolor="">Thank You Visit Again</th>
 				</tr>

 			<%

                }
 			%>
 	
 	          <tr>
<!--                 <td  align="center" colspan=5><input type="button" value="Print Bill" onClick="window.print()"> -->
                <td id="print-button" align="center" colspan=5><input type="button" value="Print Bill" onClick="printpage()">
                <input id="close-bill" class=no-print' type="button" name="edit" value="CLOSE Bill" onclick="closeBill(<%=jwork_id%>);"></td>
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