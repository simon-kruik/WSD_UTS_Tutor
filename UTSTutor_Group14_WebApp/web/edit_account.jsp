<%-- 
    Document   : edit_account
    Created on : 01/10/2017, 2:55:01 PM
    Author     : 1234
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="SHORTCUT ICON" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" type="image/ico" /> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit account</title>
    </head>
    <body>
        <h1>Edit account details</h1>
        <form action="account.jsp" method="post">
        <table>
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
                <td></td>
                <td><input type="submit" name="submit"></td>
            </tr>
        </table>
        </form>
    </body>
</html>
