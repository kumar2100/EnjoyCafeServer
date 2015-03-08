/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package enjoycafe;
/**
 *
 * @author Admin
 */
import java.sql.*;
import java.text.DateFormat;
import org.apache.log4j.Logger;

public class work_logout {

    private String username = "";
    private String password = "";

    public work_logout() {
    }
// For bringing the use of logging
    private static org.apache.log4j.Logger log = Logger
            .getLogger(work_logout.class);

// For bringing the use of logging
    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean validate() {

        boolean validation = false;
        work_logout L1 = new work_logout();

        System.out.println("username" + username);
        System.out.println("password" + password);

        log.debug("username" + username);
        log.debug("password" + password);


        validation = L1.authenticate(username, password);
        if(validation){
        L1.recordtime(username, password);
        }
        return validation;
    }

    public boolean authenticate(String username2, String password2) {

        String query = "select * from Login_Admin";
        String DbUserName = "";
        String DbPassword = "";
        String finalUser = "";

        try {
            System.out.println("Test 1");
            //For the oracle driver.
            //Class.forName("oracle.jdbc.driver.OracleDriver");
            //For the Mysql driver
            //Class.forName("com.mysql.jdbc.Driver").newInstance();
            System.out.println("Loading the Driver");
            log.debug("Loading the Driver");

            //**START-----This is for connection to Access**//
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            //MTrack is the DSN name used in the MTrack application.
            //String url = "jdbc:odbc:MTrack";
            String url = "jdbc:odbc:EnjoyODBC";
            Connection con = DriverManager.getConnection(url, "", "");
            //**END-----This is for connection to Access**//


            //String url = "jdbc:oracle:thin:@GEICS191:1521:koracle";
            // userName : ktrack,password: ktrack
            // Connection con =
            //   DriverManager.getConnection("jdbc:mysql://localhost/mysql_mtrack?" +
            //                              "user=root&password=kavitha");
            //Connection con = DriverManager.getConnection(url,"ktrack","ktrack");

            System.out.println("Connecting to the Server");
            log.debug("Connecting to the Server");

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
            System.out.println(""+e);
            return false;

        }

              
    }
    
    public void recordtime(String username2, String password2){
    //
                //Test Data
        
                //Date d1 = GregorianCalender(.getToday());
                Date d1 = new Date(System.currentTimeMillis());
                Time t1= new Time(System.currentTimeMillis());
                 
                //String juser_name = "ktest";
                String juser_name = username2;
                String jstart_time = "0.00";
                long l1 =d1.getTime();
                Long l2 = l1;
                //String jend_time =l2.toString();
                String jend_time = DateFormat.getTimeInstance().format(d1);
                String jbill_time = "1 hour";
        
                try {
                  
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                String url = "jdbc:odbc:EnjoyODBC";
                Connection connection = null;
                PreparedStatement pstatement = null;
                //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
                            //connection = DriverManager.getConnection(connectionURL, "root", "root");
                            connection = DriverManager.getConnection(url, "", "");
                            System.out.println("Coming inside the RECORD TIME code 1: "+juser_name);
                            String queryString = "INSERT INTO Login_Logout_Time(user_name, start_time,end_time,bill_time) VALUES (?, ?, ?,?)";
                            pstatement = connection.prepareStatement(queryString);
                            pstatement.setString(1, juser_name);
                            pstatement.setString(2, jstart_time);
                            pstatement.setString(3, jend_time);
                            pstatement.setString(4, jbill_time);
                            System.out.println("Coming inside the RECORD TIME code 2");

                            pstatement.executeUpdate();
                            System.out.println("Coming inside the RECORD TIME COMPLETED 2");
                            
                        }catch(Exception e){e.printStackTrace();}

    //
    }
        
    
}
