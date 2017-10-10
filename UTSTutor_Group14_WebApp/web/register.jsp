<%-- 
    Document   : register
    Created on : 11/09/2017, 3:17:50 PM
    Author     : Simon
--%>

<%@page import="uts.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register an account</title>
        <link rel="SHORTCUT ICON" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" type="image/ico" />
        <script language="javascript">
                            function yesnoCheck(that) {
                                if (that.value == "Tutor") {
                                    document.getElementById("ifTutor").style.display = "";
                                 } else {
                                 document.getElementById("ifTutor").style.display="none";
                                 }
                }
        </script>
    </head>
    
    <h1> Register </h1>
    
    <body>        
        <h1>Registration</h1>
        <table>
            <tr>
            <form action="main.jsp" method="post">
        <td>Email</td>  
                <td><input type="text" name="email"></td>
            
            </tr>
            
      <tr>
            <td>Full Name</td>  
                <td><input type="text" name="name"></td>
            
            </tr>
        
      <tr>
            <td>Password</td>  
                <td><input type="password" name="password"></td>
            
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td><input type="date" name="dob"></td>
            </tr>
            <tr>
                <td>User type</td>
                <td>
                    <select name="type" onchange="yesnoCheck(this);">
                        <option value="Student">Student</option>
                        <option value="Tutor">Tutor</option>

                    </select>
                </td>
            </tr>

            

            <tr id="ifTutor" style="display:none;">
                        
                <td >Tutor subject</td>
                <td>
                    <select name="subject">
                        <option value="WSD">WSD</option>
                        <option value ="USP">USP</option>
                        <option value="SEP">SEP</option>
                        <option value="AppProg">AppProg</option>
                        <option value="MobileApp">MobileApp</option>
                    </select>
                </td>
            </tr>
                <td></td>

                <td><input type="submit" value="Submit"/></td>
            </tr>
            
            </form>
        </table>
    </body>
</html>
