/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package enjoycafe;

/**
 *
 * @author Admin
 */
import enjoycafe.services.AddSales;
import enjoycafe.services.BillingHourServices;
import enjoycafe.services.LoginService;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;

import javax.servlet.http.HttpSession;

public class LoginUser {

    //LoginUser LoginUser_type;
    LoginService LoginService_inst;
    
    
    private String username = "";
    private String user_type = "";
    private String password = "";
    private int work_id;
    private int payment_amount;
    private String uaction = "";
    private String duration ="";
    private String remotehost ="";
    private int bill_id;

   
    
    
    public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public int getBill_id() {
		return bill_id;
	}

	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}

	public void setRemotehost(String remotehost) {
        this.remotehost = remotehost;
    }

    public String getRemotehost() {
        return this.remotehost;
    }
    
    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getDuration() {
        return this.duration;
    }
    
    
    public void setPayment_amount(int amt) {
        this.payment_amount = amt;
    }

    public int getPayment_amount() {
        return this.payment_amount;
    }

    public void setUaction(String uaction) {
        this.uaction = uaction;
    }

    public String getUaction() {
        return this.uaction;
    }

    public LoginUser() {
    }
// For bringing the use of logging
    private static org.apache.log4j.Logger log = Logger
            .getLogger(LoginUser.class);

// For bringing the use of logging
    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return this.username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getWork_id() {
        return this.work_id;
    }

    public void setWork_id(int id) {
        System.out.println("CALLED : setWork_id(int id)" + id);
        this.work_id = id;
    }

    // Login L1 = new Login();
    LoginUser LoginUser_type;
    public boolean validate(HttpSession session) throws ParseException {
    	LoginUser_type = new LoginUser();
        boolean validation = false;
        
        LoginService_inst = new LoginService();

        System.out.println("LoginUser.java ** username:  " + this.username);
        System.out.println("LoginUser.java ** password:  " + this.password);
        System.out.println("LoginUser.java  work_id:  " + this.work_id);
        System.out.println("LoginUser.java  RemoteHost:  " + this.remotehost);
        System.out.println("LoginUser.java  user_type:  " + this.user_type);
        System.out.println("***LoginUser.java ***uaction :" + uaction);

        log.debug("username" + username);
        log.debug("password" + password);


        if (uaction.equals("logout")) {
            if (((session.getAttribute("user")) != null) || (this.username) != null) {
 
                System.out.println("---------------------LOGOUT-----------------CALL----------------");
            	
            	System.out.println("***LoginUser.java ***WORK-ID update request :" + this.getWork_id());
                //LoginUser_type.recordtimeLogout(this.getWork_id(), this.username);
                //System.out.println("***LoginUser.java ***this.getBill_id  :" + this.getBill_id());
                //System.out.println("***LoginUser.java ***LoginUser_type.getBill_id  :" + LoginUser_type.getBill_id());
                //System.out.println("***LoginUser.java ***session.getAttribute(bill_id) :" + session.getAttribute("bill_id"));
                System.out.println("***LoginUser.java ***session.getAttribute(work_id) :" + session.getAttribute("work_id"));
                
                if(LoginUser_type.checkUserLoggedOutByAdmin(this.getWork_id())){
                	session.setAttribute("user_status", "admin-logout");
                }
                

 
                //if(session.getAttribute("bill_id")!=null){
                if(session.getAttribute("work_id")!=null){
                    //LoginUser_type.recordtimeLogout(this.getWork_id(), this.username, this.getBill_id());
                    LoginUser_type.recordtimeLogoutUpdateItemsPurchaseOnly(this.getWork_id(), this.username);
                }else{
                	
                }
                
                System.out.println("***LoginUser.JAVA***LoginUser_type.getPayment_amount :" + LoginUser_type.getPayment_amount()); //this is coming
                System.out.println("***LoginUser.JAVA***LoginUser_type.getDuration :" + LoginUser_type.getDuration()); //this is coming
                session.setAttribute("payment_amount", LoginUser_type.getPayment_amount());
                session.setAttribute("duration", LoginUser_type.getDuration());
  
                System.out.println("***LoginUser.JAVA***getPayment_amount :" + this.getPayment_amount()); //this ans 0
                return true;
            } else {
                System.out.println("***LoginUser.java ***WORK ID ERROR-------:" + session.getAttribute("user"));
                return false;
            }
        }

        //validation = LoginUser_type.authenticate(username, password);
        validation = LoginService_inst.loginUserAuthenticate(username, password);
        if (validation) {
            //LoginUser_type.recordtime(username, password);
        	//LoginService_inst.loginUserRecordtimeGetWorkId(username, password);
        	LoginUser_type.setWork_id(LoginService_inst.loginUserRecordtimeGetWorkId(username, password, this.user_type));
        	LoginUser_type.setUsername(username);

        	//LoginUser_type.setBill_id(LoginService_inst.loginUserGenerateBillIdGetBillId(LoginUser_type.getWork_id(), username));
        	/*
        	 * Based on the update decided on 19-Sep-2014, the bill_id generation and placement with Login_Logout_Payment table is 
        	 * removed and the bill will be generated only finally during the payment.
        	 */
        	
        	//this.bill_id =LoginService_inst.loginUserGenerateBillIdGetBillId(LoginUser_type.getWork_id(), username);
        	//LoginUser_type.setBill_id(bill_id);       	
        	//LoginUser_type.work_id = this.work_id;
        	
            session.setAttribute("user", LoginUser_type);
            
            System.out.println("--------------------USER LOGIN-----------------CALL----------------");
            
            System.out.println("LoginUser.java : LoginUser_type.getUsername: " + LoginUser_type.getUsername());
            session.setAttribute("testid", "99999");
            session.setAttribute("work_id", LoginUser_type.getWork_id());
            //session.setAttribute("bill_id", LoginUser_type.getBill_id());
        }
        return validation;
    }


    public boolean checkUserLoggedOutByAdmin(int pwork_id2) {

    	String juser_status="";
    	
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            connection = DriverManager.getConnection(url, "", "");
            System.out.println("LoginUser.java checkUserLoggedOutByAdmin ----- 1");

            Statement stmt2 = connection.createStatement();
            String query2 = "select user_status from Login_Logout_Time where work_id=" + pwork_id2 + "";

            ResultSet rs2 = stmt2.executeQuery(query2);
            while (rs2.next()) {
            	juser_status = rs2.getString(1);
            }
      
            
            if((juser_status.trim().equalsIgnoreCase("logout_collect_cash"))){
            	return true;
            }
            
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    	
    	
    	return false;
		
	}

	public void recordtimeLogoutUpdateItemsPurchaseOnly(int pwork_id, String puser_name) throws ParseException {
   	
        BillingHourServices bhourservice = new BillingHourServices();
        int dwork_id = pwork_id;
        long time = System.currentTimeMillis();
        Timestamp jend_time = new Timestamp(time);
        Timestamp jstart_time = new Timestamp(time);

        SimpleDateFormat SD_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String fetch_endtime = jend_time.toString();
        java.util.Date fechaNueva = SD_format.parse(fetch_endtime);
        Timestamp access_format_end_time = Timestamp.valueOf(SD_format.format(fechaNueva));
        String access_format_endtime = SD_format.format(fechaNueva);

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            connection = DriverManager.getConnection(url, "", "");
            System.out.println("LoginUser.java  Coming inside the RECORD TIME Logout code 1");

            Statement stmt2 = connection.createStatement();
            String query2 = "select start_time from Login_Logout_Time where work_id=" + dwork_id + "";
            String u_query = "update Login_Logout_Time set user_status ='logout_collect_cash', end_time=#" + access_format_endtime + "# where work_id=" + dwork_id + "";

            ResultSet rs2 = stmt2.executeQuery(query2);
            while (rs2.next()) {
                jstart_time = rs2.getTimestamp(1);
            }

            String billtime = bhourservice.computeBillingHour(jstart_time, access_format_end_time);
            int billmin = (int) bhourservice.computeBillingMinutes(jstart_time, access_format_end_time);
            int jbill_netuse_calculated = bhourservice.BillAmount(billmin);
            this.setPayment_amount(jbill_netuse_calculated);
            
            System.out.println("###### ***LoginUser.java **** Billing setPayment_amount: " + jbill_netuse_calculated);
            System.out.println("LoginUser.java  Billing Hours for StartTime" + jstart_time + " and End Time : " + access_format_end_time);
            System.out.println("LoginUser.java  Billing Hours in Days:Hours:Minutes:Seconds:Milliseconds : " + billtime);
            
            this.setDuration(billtime);
            
            String u_bill_time_qry = "update Login_Logout_Time set bill_time='" + billtime + "' where work_id=" + dwork_id + "";
            System.out.println("LoginUser.java  QUERRY TO update WORKid " + u_query);
      
            int updatecount = stmt2.executeUpdate(u_query);
            System.out.println("LoginUser.java  Logout Update records: " + updatecount);

            System.out.println("LoginUser.java  QUERRY TO update billhour " + u_bill_time_qry);
            int billupdate = stmt2.executeUpdate(u_bill_time_qry);
            System.out.println("LoginUser.java  Bill Update records: " + billupdate);

            //Area to update payment table
            /*
            String u_query2 = "update Login_Logout_Payment set bill_pay_status ='TRACKING', "
            +"bill_netuse_calculated="+jbill_netuse_calculated+", "+ "bill_time='"+billtime+"' where bill_id="+pbill_id+"";
            System.out.println("Login_Logout_Payment update querry: " + u_query2);
            Statement stmt3 = connection.createStatement();
            int u_count=stmt3.executeUpdate(u_query2);
            System.out.println("@@@@@ Payment table ready & updated LoginUser.java update_count of records "+u_count);
            */
            
            //Area to update AddSales of internet usage to Bill_All_Items_Purchase table
            
            AddSales AddSales_type = new AddSales();
            
            AddSales_type.AddSaleNetUsageWithWorkId(pwork_id, "Internet Usage", 15, this.getDuration(), 
            		jbill_netuse_calculated, "Gene-Customer-Spot", "SOLD");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void recordtimeLogout(int pwork_id, String puser_name, int pbill_id) throws ParseException {
        System.out.println("@@@@ -----Coming inside recordtimeLogout pbill_id: "+ pbill_id);

        BillingHourServices bhourservice = new BillingHourServices();
        int dwork_id = pwork_id;
        long time = System.currentTimeMillis();
        Timestamp jend_time = new Timestamp(time);
        Timestamp jstart_time = new Timestamp(time);

        SimpleDateFormat SD_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String fetch_endtime = jend_time.toString();
        java.util.Date fechaNueva = SD_format.parse(fetch_endtime);
        Timestamp access_format_end_time = Timestamp.valueOf(SD_format.format(fechaNueva));
        String access_format_endtime = SD_format.format(fechaNueva);

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            connection = DriverManager.getConnection(url, "", "");
            System.out.println("LoginUser.java  Coming inside the RECORD TIME Logout code 1");

            Statement stmt2 = connection.createStatement();
            String query2 = "select start_time from Login_Logout_Time where work_id=" + dwork_id + "";
            String u_query = "update Login_Logout_Time set user_status ='logout_collect_cash', end_time=#" + access_format_endtime + "# where work_id=" + dwork_id + "";

            ResultSet rs2 = stmt2.executeQuery(query2);
            while (rs2.next()) {
                jstart_time = rs2.getTimestamp(1);
            }

            String billtime = bhourservice.computeBillingHour(jstart_time, access_format_end_time);
            int billmin = (int) bhourservice.computeBillingMinutes(jstart_time, access_format_end_time);
            int jbill_netuse_calculated = bhourservice.BillAmount(billmin);
            this.setPayment_amount(jbill_netuse_calculated);
            
            System.out.println("###### ***LoginUser.java **** Billing setPayment_amount: " + jbill_netuse_calculated);
            System.out.println("LoginUser.java  Billing Hours for StartTime" + jstart_time + " and End Time : " + access_format_end_time);
            System.out.println("LoginUser.java  Billing Hours in Days:Hours:Minutes:Seconds:Milliseconds : " + billtime);
            this.setDuration(billtime);
            String u_bill_time_qry = "update Login_Logout_Time set bill_time='" + billtime + "' where work_id=" + dwork_id + "";
            System.out.println("LoginUser.java  QUERRY TO update WORKid " + u_query);
            int updatecount = stmt2.executeUpdate(u_query);
            System.out.println("LoginUser.java  Logout Update records: " + updatecount);

            System.out.println("LoginUser.java  QUERRY TO update billhour " + u_bill_time_qry);
            int billupdate = stmt2.executeUpdate(u_bill_time_qry);
            System.out.println("LoginUser.java  Bill Update records: " + billupdate);

            //Area to update payment table
            
            String u_query2 = "update Login_Logout_Payment set bill_pay_status ='TRACKING', "
            +"bill_netuse_calculated="+jbill_netuse_calculated+", "+ "bill_time='"+billtime+"' where bill_id="+pbill_id+"";

            System.out.println("Login_Logout_Payment update querry: " + u_query2);

            Statement stmt3 = connection.createStatement();
      
            int u_count=stmt3.executeUpdate(u_query2);
            System.out.println("@@@@@ Payment table ready & updated LoginUser.java update_count of records "+u_count);

            //Area to update AddSales of internet usage to Bill_All_Items_Purchase table
            
            AddSales AddSales_type = new AddSales();
            
            AddSales_type.AddSaleNetUsage(pbill_id, pwork_id, "Internet Usage", 15, this.getDuration(), 
            		jbill_netuse_calculated, "Gene-Customer-Spot", "SOLD");
            //AddSales_type.AddSaleNetUsage(pbill_id, pitem_details, pitem_cost_per_unit, pitem_quantity, 
            //pitem_amount, pitem_brand, pitem_status)
            
            /*
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
           
            System.out.println("+++++++++++++++ADD SALES TO Bill_All_Items_Purchase TABLE No of sales Addes:  "+sales_add);
           
            */      
    
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
