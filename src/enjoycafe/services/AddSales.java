package enjoycafe.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class AddSales {
	
	public int AddSaleNetUsage(int pbill_id,int pwork_id, String pitem_details, int pitem_cost_per_unit, 
			String pitem_quantity, int pitem_amount, String pitem_brand, String pitem_status){
		int sales_add=0;
        try {

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            connection = DriverManager.getConnection(url, "", "");
  
            //Area to update AddSales of internet usage to Bill_All_Items_Purchase table
            PreparedStatement pstatement4 = null;
            String query_add_sales = "INSERT INTO Bill_All_Items_Purchase(bill_id, work_id, item_details, item_cost_per_unit, "
            		+ "item_quantity, item_amount, item_brand, item_status) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
            pstatement4 = connection.prepareStatement(query_add_sales);
            pstatement4.setInt(1, pbill_id);
            pstatement4.setInt(2, pwork_id);
            pstatement4.setString(3, pitem_details);
            pstatement4.setInt(4, pitem_cost_per_unit);	
            pstatement4.setString(5, pitem_quantity);
            pstatement4.setInt(6, pitem_amount);
            pstatement4.setString(7, pitem_brand);
            pstatement4.setString(8, pitem_status);
            sales_add = pstatement4.executeUpdate();
            System.out.println("+++++++++++++++ADD SALES TO Bill_All_Items_Purchase TABLE No of sales Addes:  "+sales_add);
            return sales_add;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sales_add;
        
	}

	public int AddSaleNetUsageWithWorkId(int pwork_id, String pitem_details, int pitem_cost_per_unit, 
			String pitem_quantity, int pitem_amount, String pitem_brand, String pitem_status){
		int sales_add=0;
        try {

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            connection = DriverManager.getConnection(url, "", "");
  
            //Area to update AddSales of internet usage to Bill_All_Items_Purchase table
            PreparedStatement pstatement4 = null;
            String query_add_sales = "INSERT INTO Bill_All_Items_Purchase(work_id, item_details, item_cost_per_unit, "
            		+ "item_quantity, item_amount, item_brand, item_status) VALUES (?, ?, ?, ?, ?, ?,?)";
            pstatement4 = connection.prepareStatement(query_add_sales);
            //pstatement4.setInt(1, pbill_id);
            pstatement4.setInt(1, pwork_id);
            pstatement4.setString(2, pitem_details);
            pstatement4.setInt(3, pitem_cost_per_unit);	
            pstatement4.setString(4, pitem_quantity);
            pstatement4.setInt(5, pitem_amount);
            pstatement4.setString(6, pitem_brand);
            pstatement4.setString(7, pitem_status);
            sales_add = pstatement4.executeUpdate();
            System.out.println("+++++++++++++++ADD SALES TO Bill_All_Items_Purchase TABLE No of sales Addes Record update:  "+sales_add);
            return sales_add;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sales_add;
        
	}

}
