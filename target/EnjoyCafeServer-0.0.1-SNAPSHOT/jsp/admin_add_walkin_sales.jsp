<%-- 
    Document   : admin_add_walkin_sales
    Created on : Sep 14, 2014, 1:27:46 AM
    Author     : kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
                    function userCancel() {
            	
                var f = document.form1;
                f.method = "post";
                f.action = 'admin_collect_paymentV2.jsp';
                f.submit();
                //window.open("Edit_Employee.jsp","_self")
            }

        </script>
        
    </head>
<!--    <body background="/EnjoyCafeServer/images/INDEX.JPG">
    <br>-->

<p> <h2><center>Walkin User Entry screen</center></h3></p>
 <p> <h3><center>Please enter Walk In User and Mobile</center></h3></p>
 <br>
 <br>
 
 <form name ="form1" action="/EnjoyCafeServer/jsp/Login_Process.jsp"   method = "post" >
 
 <center>Walkin User Name</center> <center><input type = "text" name= "username"></center>
 <center>Mobile or Email</center> <center><input type = "text" name = "mobile"></center>
 <input type = "hidden" name = "uaction" value="login_walkin">
 <input type = "hidden" name = "utype" value="walkin">
 
 <center><input type="submit" name="Submit" value="Login"><input type="button" name="Cancel"  value="Cancel" onclick="userCancel();"></center>

 </form>
 

    </body>
</html>
