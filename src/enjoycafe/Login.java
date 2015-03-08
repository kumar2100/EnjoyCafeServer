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
import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletConfig;
import org.apache.log4j.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login {

    Login L1;
    private String username = "";
    private String password = "";
    private int work_id;
    private int payment_amount;
    private String uaction = "";
    private String duration ="";
    private String remotehost ="";

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

    public Login() {
    }
// For bringing the use of logging
    private static org.apache.log4j.Logger log = Logger
            .getLogger(Login.class);

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
    public boolean validate(HttpSession session) throws ParseException {

        boolean validation = false;
        L1 = new Login();

        System.out.println("Login.java ** username:  " + this.username);
        System.out.println("Login.java ** password:  " + this.password);
        System.out.println("Login.java  work_id:  " + this.work_id);
        System.out.println("Login.java  RemoteHost:  " + this.remotehost);
        System.out.println("***Login.java ***uaction :" + uaction);

        log.debug("username" + username);
        log.debug("password" + password);


        if (uaction.equals("logout")) {
            if (((session.getAttribute("user")) != null) || (this.username) != null) {
                //Login L2 = (Login) session.getAttribute("user");
                //System.out.println("******WORK-ID update request :" + L2.getWork_id());
                //L1.recordtimeLogout(L2.getWork_id());
                System.out.println("***Login.java ***WORK-ID update request :" + this.getWork_id());
                L1.recordtimeLogout(this.getWork_id(), this.username);
                System.out.println("***LOGIN.JAVA***L1.getPayment_amount :" + L1.getPayment_amount()); //this is coming
                System.out.println("***LOGIN.JAVA***L1.getDuration :" + L1.getDuration()); //this is coming
            
                //L1.setPayment_amount(L1.getPayment_amount());
                session.setAttribute("payment_amount", L1.getPayment_amount());
                session.setAttribute("duration", L1.getDuration());
  
                System.out.println("***LOGIN.JAVA***getPayment_amount :" + this.getPayment_amount()); //this ans 0
                return true;
            } else {

                System.out.println("***Login.java ***WORK ID ERROR-------:" + session.getAttribute("user"));

                return false;
            }

        }

        validation = L1.authenticate(username, password);
        if (validation) {
            L1.recordtime(username, password);

            
            //session =request.getSession();
            session.setAttribute("user", L1);
            System.out.println("Loging.java : L1.getUsername: " + L1.getUsername());
            session.setAttribute("testid", "99999");
            session.setAttribute("work_id", L1.getWork_id());
            //config.getServletContext().setAttribute("testid", "99999");
        }
        return validation;
    }

    public boolean authenticate(String username2, String password2) {
        String query = "select * from Login_Admin";
        String DbUserName = "";
        String DbPassword = "";
        String finalUser = "";
        try {
            System.out.println(" Login.java **Loading the Driver");
            log.debug("Loading the Driver");
            //**START-----This is for connection to Access**//
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection con = DriverManager.getConnection(url, "", "");
            System.out.println(" Login.java ** Connecting to the Server");
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

    public void recordtime(String username2, String password2) throws ParseException {
        //
        //Test Data    

        Date d1 = new Date(System.currentTimeMillis());
        Time t1 = new Time(System.currentTimeMillis());

        //String juser_name = "ktest";
        String juser_name = username2;
        //String jstart_time = DateFormat.getTimeInstance().format(d1);

        long time = System.currentTimeMillis();
        Timestamp jstart_time = new Timestamp(time);
        SimpleDateFormat SD_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //String fechaStr = "2013-10-10 10:49:29.10000";  
        String fetch_starttime = jstart_time.toString();
        java.util.Date fechaNueva = SD_format.parse(fetch_starttime);
        //System.out.println("Time Formating Test :"+SD_format.SD_format(fechaNueva));
        Timestamp access_format_start_time = Timestamp.valueOf(SD_format.format(fechaNueva));

        String access_format_string = SD_format.format(fechaNueva);
        System.out.println("Login.java Coming inside the access_format_start_time :" + access_format_start_time);
        System.out.println("Login.java  Coming inside the access_format_string :" + access_format_string);

        long l1 = d1.getTime();
        Long l2 = l1;
        //String jend_time =l2.toString();
        //String jend_time = "0.00";
        String jbill_time = "Working ";
        String juser_status = "Working ";
        String jmachine_detail = this.remotehost;
        

        try {

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String url = "jdbc:odbc:EnjoyODBC";
            Connection connection = null;
            PreparedStatement pstatement = null;
            PreparedStatement pstatement2 = null;
            connection = DriverManager.getConnection(url, "", "");
            System.out.println("Login.java  Coming inside the RECORD TIME code 1");
            //String queryString = "INSERT INTO Login_Logout_Time(user_name, start_time,end_time,bill_time) VALUES (?, ?, ?,?)";
            
            //String queryString = "INSERT INTO Login_Logout_Time(user_name, start_time,bill_time) VALUES (?, ?, ?)";
            String queryString = "INSERT INTO Login_Logout_Time(user_name, start_time, bill_time, user_status, machine_detail) VALUES (?, ?, ?,?,?)";
            pstatement = connection.prepareStatement(queryString);
            pstatement.setString(1, juser_name);
            //pstatement.setString(2, jstart_time);
            //pstatement.setString(3, jend_time);
            //pstatement.setTimestamp(2, jstart_time);
            pstatement.setTimestamp(2, access_format_start_time);

            //pstatement.setString(3, jend_time);
            pstatement.setString(3, jbill_time);
            pstatement.setString(4, juser_status);
            pstatement.setString(5, jmachine_detail);
            
            System.out.println("Login.java  Coming inside the RECORD TIME code 2");

            pstatement.executeUpdate();

            Statement stmt2 = connection.createStatement();
            //select work_id from Login_Logout_Time where user_name='ktest' AND start_time='1:09:19 PM';
            //String query2 = "select * from Login_Logout_Time where user_name='" + juser_name + "' AND start_time=#" + jstart_time + "#";
            String query2 = "select * from Login_Logout_Time where user_name='" + juser_name + "' AND start_time=#" + access_format_string + "#";

            //String u_query = "update Employee_Details set Emp_Type='"+emp_type+"',Emp_Name='"+emp_name+"',City='"+emp_city+"',Phone_Home="+emp_phone+" where Emp_Id="+num+"";            

            System.out.println("QUERRY TO GET WORKid " + query2);

            ResultSet rs2 = stmt2.executeQuery(query2);
            int genid = 0;
            while (rs2.next()) {
                genid = rs2.getInt(1);
                System.out.println("WORK ID GENERATED " + genid);
                //this.setWork_id(genid);

                this.setWork_id(genid);
                this.setUsername(juser_name);
                //this.setUsername(juser_name);
                //HttpSession session = request..getSession();
                //session.setAttribute("work_id",genid);
                //this.setMyObject(request);
            }
            System.out.println("Login.java  Coming inside the RECORD TIME COMPLETED 2");
        } catch (Exception e) {
            e.printStackTrace();
        }

        //
    }

    public void recordtimeLogout(int pwork_id, String puser_name) throws ParseException {

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
            System.out.println("Login.java  Coming inside the RECORD TIME Logout code 1");

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
            this.setPayment_amount(jbill_netuse_calculated);
            
            System.out.println("###### ***Login.java **** Billing setPayment_amount: " + jbill_netuse_calculated);

            System.out.println("Login.java  Billing Hours for StartTime" + jstart_time + " and End Time : " + access_format_end_time);

            System.out.println("Login.java  Billing Hours in Days:Hours:Minutes:Seconds:Milliseconds : " + billtime);
            
            this.setDuration(billtime);
            String u_bill_time_qry = "update Login_Logout_Time set bill_time='" + billtime + "' where work_id=" + dwork_id + "";

            System.out.println("Login.java  QUERRY TO update WORKid " + u_query);
            int updatecount = stmt2.executeUpdate(u_query);
            System.out.println("Login.java  Logout Update records: " + updatecount);

            System.out.println("Login.java  QUERRY TO update billhour " + u_bill_time_qry);
            int billupdate = stmt2.executeUpdate(u_bill_time_qry);
            System.out.println("Login.java  Bill Update records: " + billupdate);

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
