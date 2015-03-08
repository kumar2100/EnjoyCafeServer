<%-- 
    Document   : admin_work_update_confirm
    Created on : Sep 13, 2014, 12:35:02 PM
    Author     : kumar
--%>

<%@page language="java"%>
<%@page import="java.sql.*"%>
     <script type="text/javascript">
            <!--
    
   function add_employee() {
                var f = document.update_form;
                f.method = "post";
                f.action = 'AddEmployee.jsp';
                f.submit();
            }
            
                 //-->
        </script>
        
<form name='update_form' method="post" action="admin_user_monitor.jsp">
    <table >
        <tr>

            <th bgcolor="#9dff9d"><font size="4" face="Arial" color="0000a0">Enjoy Cafe Tracking Captured and UPDATED Successfully </th>
        </tr>
    </table>
    </br>
    </br>
    </br>
   </br>
    
         <table border="1">
        <tr>
            <TD bgcolor="#ffddff" width="50%"><font size="3" face="Arial"><INPUT TYPE="submit" VALUE="List User Status" style="background-color:#49333D;font-weight:bold;color:#ffffff;" >
          ............. </TD>

        </tr>

    </table>
</form>