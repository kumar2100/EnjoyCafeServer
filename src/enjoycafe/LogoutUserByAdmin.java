package enjoycafe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import enjoycafe.services.AddSales;
import enjoycafe.services.BillingHourServices;


/*
 * When we are using this class for updating the user should not change the format of time displayed
 * The program need to calculate again the new duration and new amount.
 */

public class LogoutUserByAdmin {
	
	
	private int work_id;
	private String user_type;
	private String user_name;
	private String start_time;   //start_time should not be allowed to edit.
	private String access_format_endtime;
	private String billtime_h_m_s;
	private String billmin;   //Amount calculated -- currently calculation is coming from the previous java page
	
	private String admin_logout_reason;
	
	

	public String getAdmin_logout_reason() {
		return admin_logout_reason;
	}

	public void setAdmin_logout_reason(String admin_logout_reason) {
		this.admin_logout_reason = admin_logout_reason;
	}

	public int getWork_id() {
		return work_id;
	}

	public void setWork_id(int work_id) {
		this.work_id = work_id;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getAccess_format_endtime() {
		return access_format_endtime;
	}

	public void setAccess_format_endtime(String access_format_endtime) {
		this.access_format_endtime = access_format_endtime;
	}

	public String getBilltime_h_m_s() {
		return billtime_h_m_s;
	}

	public void setBilltime_h_m_s(String billtime_h_m_s) {
		this.billtime_h_m_s = billtime_h_m_s;
	}

	public String getBillmin() {
		return billmin;
	}

	public void setBillmin(String billmin) {
		this.billmin = billmin;
	}




	public void recordtimeLogoutUpdateItemsPurchaseOnlyByAdmin(int pwork_id, String puser_name , String pstart_time, String padmin_logout_reason) throws ParseException {
	   	
        BillingHourServices bhourservice = new BillingHourServices();
        int dwork_id = pwork_id;
        long time = System.currentTimeMillis();
        Timestamp jend_time = new Timestamp(time);
        Timestamp jstart_time = new Timestamp(time);
        
        SimpleDateFormat SD_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String fetch_endtime = jend_time.toString();
        java.util.Date fechaNueva = SD_format.parse(fetch_endtime);
        Timestamp access_format_end_time = Timestamp.valueOf(SD_format.format(fechaNueva));
        //String access_format_endtime = SD_format.format(fechaNueva);
        
        
        if(this.getAccess_format_endtime()==null || this.getAccess_format_endtime()==""){
        	System.out.println("-------LogoutUserByAdmin-----end time not set from the jsp---------"+this.getAccess_format_endtime());
        }
        
        if(this.getStart_time()==null || this.getStart_time()==""){
        	System.out.println("-------LogoutUserByAdmin-----getStart_time() not set from the jsp---------"+this.getStart_time());
        }
 
    	System.out.println("-------LogoutUserByAdmin-----pstart_time--------"+pstart_time);
    	System.out.println("-------LogoutUserByAdmin-----getStart_time() not set from the jsp---------"+this.getStart_time());
        
    	System.out.println("-------LogoutUserByAdmin-----this.getAccess_format_endtime() ---------"+this.getAccess_format_endtime());
        
            
        /*As we are going to update using the edit GUI, we are not going to use the current end time
         * Logout by admin situation arises due to system failure at user side or power cut or any other situation
         * user may not logout from the system used by the user.
         * we can add the new field "admin_logout_reason" to Login_Logout_Time table 
         */
        String access_format_endtime = this.getAccess_format_endtime();
        
        //Connection connection = null;
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            connection = DriverManager.getConnection(url, "", "");
            System.out.println("LogoutUserByAdmin.java  Coming inside the RECORD TIME Logout code 1");

            Statement stmt2 = connection.createStatement();
            //String query2 = "select start_time from Login_Logout_Time where work_id=" + dwork_id + "";
            //String u_query = "update Login_Logout_Time set user_status ='logout_collect_cash', end_time=#" + access_format_endtime + "# where work_id=" + dwork_id + "";

            //ResultSet rs2 = stmt2.executeQuery(query2);
            //while (rs2.next()) {
            //    jstart_time = rs2.getTimestamp(1);
            //}
            
            //The below two values are from the jsp page so we are taking directly from the GUI converting String to Timestamp.
            //jstart_time=Timestamp.valueOf(this.getStart_time());
            jstart_time=Timestamp.valueOf(pstart_time);
            access_format_end_time = Timestamp.valueOf(this.getAccess_format_endtime());
            
            String billtime = bhourservice.computeBillingHour(jstart_time, access_format_end_time);
            int billmin = (int) bhourservice.computeBillingMinutes(jstart_time, access_format_end_time);
            int jbill_netuse_calculated = bhourservice.BillAmount(billmin);
            //this.setPayment_amount(jbill_netuse_calculated);
            this.billmin =Integer.toString(jbill_netuse_calculated);
            
            System.out.println("###### ***LogoutUserByAdmin.java **** Billing setPayment_amount: " + jbill_netuse_calculated);
            System.out.println("LogoutUserByAdmin.java  Billing Hours for StartTime" + jstart_time + " and End Time : " + access_format_end_time);
            System.out.println("LogoutUserByAdmin.java  Billing Hours in Days:Hours:Minutes:Seconds:Milliseconds : " + billtime);
            
            //this.setDuration(billtime);
            this.setBilltime_h_m_s(billtime);
            
            String u_bill_time_qry = "update Login_Logout_Time set bill_time='" + billtime + "' where work_id=" + dwork_id + "";
//            String u_query = "update Login_Logout_Time set admin_logout_reason="+this.getAdmin_logout_reason()+", user_status ='logout_collect_cash', "
//            		+ "end_time=#" + access_format_endtime + "# where work_id=" + dwork_id + "";

            //Due to user may forget to enter the reason
            if(padmin_logout_reason=="")
            {
            	padmin_logout_reason="By Admin";
            }
      
            String u_query = "update Login_Logout_Time set admin_logout_reason='"+padmin_logout_reason+"', user_status ='logout_collect_cash', "
            		+ "end_time=#" + access_format_endtime + "# where work_id=" + dwork_id + "";

            
            
            
            System.out.println("LogoutUserByAdmin.java  QUERRY TO update WORKid " + u_query);
     
            int updatecount = stmt2.executeUpdate(u_query);
            System.out.println("LogoutUserByAdmin.java  Logout Update records: " + updatecount);

            System.out.println("LogoutUserByAdmin.java  QUERRY TO update billhour " + u_bill_time_qry);
            int billupdate = stmt2.executeUpdate(u_bill_time_qry);
            System.out.println("LogoutUserByAdmin.java  Bill Update records: " + billupdate);
             
            //Area to update AddSales of internet usage to Bill_All_Items_Purchase table
            AddSales AddSales_type = new AddSales();
            
            //AddSales_type.AddSaleNetUsageWithWorkId(pwork_id, "Internet Usage", 15, this.getDuration(), 
            AddSales_type.AddSaleNetUsageWithWorkId(pwork_id, "Internet Usage", 15, this.getBilltime_h_m_s(), 
                    		            		jbill_netuse_calculated, "Gene-Customer-Spot", "SOLD");
            connection.commit();
            connection.close();
        	
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally  {
        	
        }
        
    }

	

}
