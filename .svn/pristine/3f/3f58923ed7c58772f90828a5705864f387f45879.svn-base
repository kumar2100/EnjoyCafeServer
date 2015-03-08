
<%@page language="java"%>
<%@page import="java.sql.*"%>

<h1>Enjoy cafe Tracking System update ITem Details</h1>

<%
	String jitem_id = request.getParameter("item_id");
	int Iitem_id = Integer.parseInt(jitem_id);
	System.out.println(" ITem ID to Update " + Iitem_id);
	String jitem_details = request.getParameter("item_details");
	String jitem_cost_per_unit = request.getParameter("item_cost_per_unit");
	String jitem_quantity = request.getParameter("item_quantity");
	String jitem_amount = request.getParameter("item_amount");
	String jitem_admin_detail = request.getParameter("item_admin_detail");
	

	try {

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String url = "jdbc:odbc:EnjoyODBC";
		Connection conn = DriverManager.getConnection(url, "", "");
		Statement stmt = conn.createStatement();

		String u_query = "update Bill_All_Items_Purchase set item_details='"
				+ jitem_details + "',item_cost_per_unit=" + jitem_cost_per_unit + ", item_quantity='"
				+ jitem_quantity + "',item_amount=" + jitem_amount+ ", item_admin_detail='"
				+ jitem_admin_detail+"' where item_id=" + Iitem_id + "";

						
		//stmt.executeUpdate("update Employee_Details set Emp_Type='"+emp_type+"',Emp_Name='"+emp_name+"',City='"+emp_city+"',Phone_Home='"+emp_phone+"' where Emp_Id="+Iitem_id+");

		System.out.println(u_query);

		int update_count= stmt.executeUpdate(u_query);
		if(update_count !=0){
			System.out.println("Record Count of Update:  "+update_count);
		}

		//response.sendRedirect("http://localhost:8080/MTrackAccess/jsp/List_Employees2.jsp");
%>

<jsp:forward page="admin_add_edit_delete_confirmation.jsp" />

<%
	} catch (Exception e) {
		out.println("RECORD NOT UPDATED PLEASE CONTACT SYSTEM ADMIN   "+e);
		System.out.println(e);
		
	}
%>