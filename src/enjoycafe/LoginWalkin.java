/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package enjoycafe;

/**
 *
 * @author Admin
 */
import enjoycafe.services.BillingHourServices;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import javax.servlet.http.HttpSession;

public class LoginWalkin {

    LoginWalkin L1;
    private String username = "";
    private String password = "";
    private int work_id;
    private int payment_amount;
    private String uaction = "";
    private String duration ="";

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

    public LoginWalkin() {
    }
// For bringing the use of logging
    private static org.apache.log4j.Logger log = Logger
            .getLogger(LoginWalkin.class);

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

   
    public boolean recordtimeWalkin(String username2, String mobile) throws ParseException {
        String juser_name = username2;
        String juser_mobile = mobile;
        String juser_type = "walkin";

        long time = System.currentTimeMillis();
        Timestamp jstart_time = new Timestamp(time);
        SimpleDateFormat SD_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String fetch_starttime = jstart_time.toString();
        java.util.Date fechaNueva = SD_format.parse(fetch_starttime);
        Timestamp access_format_start_time = Timestamp.valueOf(SD_format.format(fechaNueva));
        String access_format_string = SD_format.format(fechaNueva);
        System.out.println("LoginWalkin.java Coming inside the access_format_start_time :" + access_format_start_time);
        System.out.println("LoginWalkin.java  Coming inside the access_format_string :" + access_format_string);

        String jbill_time = "Walk_in_user ";
        String juser_status = "Walkin";

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            PreparedStatement pstatement = null;
            PreparedStatement pstatement2 = null;
            connection = DriverManager.getConnection(url, "", "");
            System.out.println("LoginWalkin.java  Coming inside the RECORD TIME code 1");

            String queryString = "INSERT INTO Login_Logout_Time(user_name, start_time, bill_time, user_status, user_type, user_mobile) VALUES (?, ?, ?,?,?,?)";
            pstatement = connection.prepareStatement(queryString);
            pstatement.setString(1, juser_name);
            pstatement.setTimestamp(2, access_format_start_time);
            pstatement.setString(3, jbill_time);
            pstatement.setString(4, juser_status);
            pstatement.setString(5, juser_type);
            pstatement.setString(6, juser_mobile);
           
            System.out.println("LoginWalkin.java  Coming inside the RECORD TIME code 2");
            pstatement.executeUpdate();
            Statement stmt2 = connection.createStatement();
            String query2 = "select * from Login_Logout_Time where user_name='" + juser_name + "' AND start_time=#" + access_format_string + "#";
            System.out.println("QUERRY TO GET WORK ID to walkin customer " + query2);

            ResultSet rs2 = stmt2.executeQuery(query2);
            int genid = 0;
            while (rs2.next()) {
                genid = rs2.getInt(1);
                System.out.println("walkin WORK ID GENERATED " + genid);
                this.setWork_id(genid);
                this.setUsername(juser_name);
            }
            
            System.out.println("LoginWalkin.java  Coming inside the RECORD TIME COMPLETED 2");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        //
    }


    public Timestamp getCurrentEndTime(int wid) throws ParseException {
        BillingHourServices bhourservice = new BillingHourServices();
        int w_id = wid;
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
        return jend_time;
    }

   
   
    @SuppressWarnings("rawtypes")
	public ArrayList getCalculatedBillHours(int pwork_id) throws ParseException {
 
    
    	ArrayList bill_ArrayList = new ArrayList();
        BillingHourServices bhourservice = new BillingHourServices();
        int dwork_id = pwork_id;
        Date d1 = new Date(System.currentTimeMillis());
        Time t1 = new Time(System.currentTimeMillis());
        long l1 = d1.getTime();
        Long l2 = l1;
        String jbill_time = "1 hour";

        long time = System.currentTimeMillis();
        Timestamp jend_time = new Timestamp(time);
        Timestamp jstart_time = new Timestamp(time);

        //work to do to enter timestamp with access table
        SimpleDateFormat SD_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //String fechaStr = "2013-10-10 10:49:29.10000";  
        String fetch_endtime = jend_time.toString();
        java.util.Date fechaNueva = SD_format.parse(fetch_endtime);
        Timestamp access_format_end_time = Timestamp.valueOf(SD_format.format(fechaNueva));

        String access_format_endtime = SD_format.format(fechaNueva);

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            connection = DriverManager.getConnection(url, "", "");
            Statement stmt2 = connection.createStatement();
            String query2 = "select start_time from Login_Logout_Time where work_id=" + dwork_id + "";

            ResultSet rs2 = stmt2.executeQuery(query2);
            Date starttime;
            while (rs2.next()) {
                jstart_time = rs2.getTimestamp(1);

            }
            String billtime_h_m_s = bhourservice.computeBillingHour(jstart_time, access_format_end_time);
            int billmin = (int) bhourservice.computeBillingMinutes(jstart_time, access_format_end_time);
        
            int jbill_netuse_calculated = bhourservice.BillAmount(billmin);
           
            bill_ArrayList.add(access_format_endtime);
            bill_ArrayList.add(billtime_h_m_s);
            bill_ArrayList.add(jbill_netuse_calculated);
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return bill_ArrayList;
        
        //
    }

	public ArrayList getCalculatedBillHoursAdminLogout(int pwork_id) throws ParseException {
		 
	    
    	ArrayList bill_ArrayList = new ArrayList();
        BillingHourServices bhourservice = new BillingHourServices();
        int dwork_id = pwork_id;
        Date d1 = new Date(System.currentTimeMillis());
        Time t1 = new Time(System.currentTimeMillis());
        long l1 = d1.getTime();
        Long l2 = l1;
        String jbill_time = "1 hour";

        long time = System.currentTimeMillis();
        Timestamp jend_time = new Timestamp(time);
        Timestamp jstart_time = new Timestamp(time);

        //work to do to enter timestamp with access table
        SimpleDateFormat SD_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //String fechaStr = "2013-10-10 10:49:29.10000";  
        String fetch_endtime = jend_time.toString();
        java.util.Date fechaNueva = SD_format.parse(fetch_endtime);
        Timestamp access_format_end_time = Timestamp.valueOf(SD_format.format(fechaNueva));

        String access_format_endtime = SD_format.format(fechaNueva);

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            connection = DriverManager.getConnection(url, "", "");
            Statement stmt2 = connection.createStatement();
            String query2 = "select start_time, end_time from Login_Logout_Time where work_id=" + dwork_id + "";

            ResultSet rs2 = stmt2.executeQuery(query2);
            Date starttime;
            while (rs2.next()) {
                jstart_time = rs2.getTimestamp(1);
                jend_time =rs2.getTimestamp(2);
            }
            //String billtime_h_m_s = bhourservice.computeBillingHour(jstart_time, access_format_end_time);
            //int billmin = (int) bhourservice.computeBillingMinutes(jstart_time, access_format_end_time);
            String billtime_h_m_s = bhourservice.computeBillingHour(jstart_time, jend_time);
            int billmin = (int) bhourservice.computeBillingMinutes(jstart_time, jend_time);
        
            int jbill_netuse_calculated = bhourservice.BillAmount(billmin);
           
            //bill_ArrayList.add(access_format_endtime);
            bill_ArrayList.add(jend_time.toString());
            bill_ArrayList.add(billtime_h_m_s);
            bill_ArrayList.add(jbill_netuse_calculated);
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return bill_ArrayList;
        
        //
    }
    

  
    	
    }

