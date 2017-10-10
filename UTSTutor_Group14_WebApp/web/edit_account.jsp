<%-- 
    Document   : edit_account
    Created on : 01/10/2017, 2:55:01 PM
    Author     : 1234
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css">
        <link rel="SHORTCUT ICON" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" type="image/ico" /> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit account</title>
         
    </head>
    
    <h1> Edit Account </h1>
    
    <body>
        <h1>Edit account details</h1>
        <form action="account.jsp" method="post">
        <table>
            <tr>
                <td>Full Name</td>  
                <td><input type="text" name="newName"></td>
                
            </tr>
            <tr>
                <td>Password</td>  
                <td><input type="password" name="newPassword"></td>
            
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td><input type="date" name="newDob"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" name="submit"></td>
            </tr>
        </table>
        </form>
        <a href="account.jsp">Return to my account</a>
        <a href="main.jsp">Back to Main Menu</a>
    </body>
</html>
