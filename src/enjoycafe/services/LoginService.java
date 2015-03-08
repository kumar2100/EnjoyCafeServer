package enjoycafe.services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;

import enjoycafe.Login;

public class LoginService {
	
	// For bringing the use of logging
    private static org.apache.log4j.Logger log = Logger.getLogger(LoginService.class);
	
	public boolean loginUserAuthenticate(String username2, String password2) {
		
	     String query = "select * from Login_Admin";
	        String DbUserName = "";
	        String DbPassword = "";
	        try {

	            System.out.println("--------------------USER LOGIN-----------------CALL----------------");
	            
	        	
	        	System.out.println(" LoginService.java **Loading the Driver");
	            log.debug("Loading the Driver");
	            //**START-----This is for connection to Access**//
	            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	            String url = "jdbc:odbc:EnjoyODBC";
	            Connection con = DriverManager.getConnection(url, "", "");
	            System.out.println(" LoginService.java ** Connecting to the Server");
	            Statement stmt = con.createStatement();
	            ResultSet rst = stmt.executeQuery(query);
	            while (rst.next()) {
	                DbUserName = rst.getString("Username");
	                DbPassword = rst.getString("Password");
	                if (username2.equals(DbUserName) && password2.equals(DbPassword)) {
	                    return true;
	                    //break;
	                }
	            }
	            return false;
	            //return true
	            // enable the above line to test without validating password.

	        } catch (Exception e) {
	            System.out.println("" + e);
	            return false;
	        }
	}


	
    public int loginUserRecordtimeGetWorkId (String username2, String password2, String puser_type) throws ParseException {
 
    	int generated_workid = 0;
    	
        Date d1 = new Date(System.currentTimeMillis());
        Time t1 = new Time(System.currentTimeMillis());
        String juser_name = username2;

        long time = System.currentTimeMillis();
        Timestamp jstart_time = new Timestamp(time);
        SimpleDateFormat SD_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //String fechaStr = "2013-10-10 10:49:29.10000";  
        String fetch_starttime = jstart_time.toString();
        java.util.Date fechaNueva = SD_format.parse(fetch_starttime);
        //System.out.println("Time Formating Test :"+SD_format.SD_format(fechaNueva));
        Timestamp access_format_start_time = Timestamp.valueOf(SD_format.format(fechaNueva));

        String access_format_string = SD_format.format(fechaNueva);
        System.out.println("LoginService.java Coming inside the access_format_start_time :" + access_format_start_time);
        System.out.println("LoginService.java  Coming inside the access_format_string :" + access_format_string);

        long l1 = d1.getTime();
        Long l2 = l1;
        String jbill_time = "Working ";
        String juser_status = "Working ";
        //String jmachine_detail = this.remotehost;
        String jmachine_detail = "Machine-gene";
        

        try {

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            PreparedStatement pstatement = null;
            PreparedStatement pstatement2 = null;
            connection = DriverManager.getConnection(url, "", "");
            System.out.println("LoginService.java  Coming inside the RECORD TIME code 1");
            //String queryString = "INSERT INTO Login_Logout_Time(user_name, start_time,bill_time) VALUES (?, ?, ?)";
            String queryString = "INSERT INTO Login_Logout_Time(user_name, start_time, bill_time, user_status, machine_detail, user_type) VALUES (?, ?, ?,?,?,?)";
            pstatement = connection.prepareStatement(queryString);
            pstatement.setString(1, juser_name);
            pstatement.setTimestamp(2, access_format_start_time);
            pstatement.setString(3, jbill_time);
            pstatement.setString(4, juser_status);
            pstatement.setString(5, jmachine_detail);
            pstatement.setString(6, puser_type);
            
            System.out.println("LoginService.java  Coming inside the RECORD TIME code 2");

            pstatement.executeUpdate();

            Statement stmt2 = connection.createStatement();
            String query2 = "select * from Login_Logout_Time where user_name='" + juser_name + "' AND start_time=#" + access_format_string + "#";

            System.out.println("QUERRY TO GET WORKid " + query2);

            ResultSet rs2 = stmt2.executeQuery(query2);
            generated_workid = 0;
            while (rs2.next()) {
            	generated_workid = rs2.getInt(1);
                System.out.println("WORK ID GENERATED " + generated_workid);
                return generated_workid;
            }
            System.out.println("LoginService.java  Coming inside the RECORD TIME COMPLETED 2");
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return generated_workid;
    }
	
  
    public int loginUserGenerateBillIdGetBillId(int pwork_id, String puser_name){

    	int generated_billid = 0;
        
    	try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            connection = DriverManager.getConnection(url, "", "");
            PreparedStatement pstatement3 = null;
            //Area to update payment table
            String jbill_pay_status = "USER-BUYING";
            
            String queryString = "INSERT INTO Login_Logout_Payment(work_id, user_name, bill_pay_status) VALUES (?, ?, ?)";
            pstatement3 = connection.prepareStatement(queryString);
            pstatement3.setInt(1, pwork_id);
            pstatement3.setString(2, puser_name);
            pstatement3.setString(3, jbill_pay_status);
           
            pstatement3.executeUpdate();

            Statement stmt2 = connection.createStatement();
            String query2 = "select * from Login_Logout_Payment where work_id="+pwork_id+"";
            System.out.println("QUERRY TO GET WORKid " + query2);

            ResultSet rs2 = stmt2.executeQuery(query2);
            generated_billid = 0;
            while (rs2.next()) {
            	generated_billid = rs2.getInt(1);
                System.out.println("BILL ID GENERATED For user:  "+puser_name+":  " + generated_billid);
                return generated_billid;
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    	return generated_billid;
        //
    }

    public void logoutUserRecordtime(int pwork_id, String puser_name) throws ParseException {

        BillingHourServices bhourservice = new BillingHourServices();
        int dwork_id = pwork_id;
        Date d1 = new Date(System.currentTimeMillis());
        Time t1 = new Time(System.currentTimeMillis());
        //String juser_name = username2;
        long l1 = d1.getTime();
        Long l2 = l1;
        //String jend_time =l2.toString();
        // String jend_time = DateFormat.getTimeInstance().format(d1);
        String jbill_time = "1 hour";

        long time = System.currentTimeMillis();
        Timestamp jend_time = new Timestamp(time);
        Timestamp jstart_time = new Timestamp(time);

        //work to do to enter timestamp with access table
        SimpleDateFormat SD_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //String fechaStr = "2013-10-10 10:49:29.10000";  
        String fetch_endtime = jend_time.toString();
        java.util.Date fechaNueva = SD_format.parse(fetch_endtime);
        //System.out.println("Time Formating Test :"+SD_format.SD_format(fechaNueva));
        Timestamp access_format_end_time = Timestamp.valueOf(SD_format.format(fechaNueva));

        String access_format_endtime = SD_format.format(fechaNueva);


        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            connection = DriverManager.getConnection(url, "", "");
            System.out.println("LoginService.java  Coming inside the RECORD TIME Logout code 1");

            Statement stmt2 = connection.createStatement();
            //select work_id from Login_Logout_Time where user_name='ktest' AND start_time='1:09:19 PM';
            //String query2 = "select * from Login_Logout_Time where user_name='" + juser_name + "' AND start_time='" + jstart_time + "'";
            String query2 = "select start_time from Login_Logout_Time where work_id=" + dwork_id + "";
            //String u_query = "update Login_Logout_Time set end_time='" + jend_time + "' where work_id=" + dwork_id + "";
            //String u_query = "update Login_Logout_Time set end_time=#" + jend_time + "# where work_id=" + dwork_id + "";
            String u_query = "update Login_Logout_Time set user_status ='logout_collect_cash', end_time=#" + access_format_endtime + "# where work_id=" + dwork_id + "";

            //String u_bill_time = "update Login_Logout_Time set jbill_time=#" + access_format_endtime + "# where work_id=" + dwork_id + "";


            ResultSet rs2 = stmt2.executeQuery(query2);
            Date starttime;
            while (rs2.next()) {
                jstart_time = rs2.getTimestamp(1);

            }

            String billtime = bhourservice.computeBillingHour(jstart_time, access_format_end_time);
            int billmin = (int) bhourservice.computeBillingMinutes(jstart_time, access_format_end_time);
            
            int jbill_netuse_calculated = bhourservice.BillAmount(billmin);
            //this.setPayment_amount(jbill_netuse_calculated);
            
            System.out.println("###### ***Login.java **** Billing setPayment_amount: " + jbill_netuse_calculated);

            System.out.println("Login.java  Billing Hours for StartTime" + jstart_time + " and End Time : " + access_format_end_time);
            System.out.println("LoginService.java  Billing Hours in Days:Hours:Minutes:Seconds:Milliseconds : " + billtime);
         
            //this.setDuration(billtime);
            String u_bill_time_qry = "update Login_Logout_Time set bill_time='" + billtime + "' where work_id=" + dwork_id + "";
            System.out.println("LoginService.java  QUERRY TO update WORKid " + u_query);
            int updatecount = stmt2.executeUpdate(u_query);
            System.out.println("LoginService.java  Logout Update records: " + updatecount);
            System.out.println("LoginService.java  QUERRY TO update billhour " + u_bill_time_qry);
            int billupdate = stmt2.executeUpdate(u_bill_time_qry);
            System.out.println("LoginService.java  Bill Update records: " + billupdate);

            //Area to update payment table
            
            String jbill_pay_status = "internet_bill_ready";
            PreparedStatement pstatement3 = null;
            String queryString = "INSERT INTO Login_Logout_Payment(work_id, user_name, bill_time, bill_netuse_calculated, bill_pay_status) VALUES (?, ?, ?,?,?)";
            pstatement3 = connection.prepareStatement(queryString);
            pstatement3.setInt(1, dwork_id);
            pstatement3.setString(2, puser_name);
            pstatement3.setString(3, billtime);
            pstatement3.setInt(4, jbill_netuse_calculated);
            pstatement3.setString(5, jbill_pay_status);
       
            System.out.println("@@@@@ Payment table ready & updated Login.java  Coming inside the RECORD TIME code 2");
            pstatement3.executeUpdate();


            
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        //
    }

}
