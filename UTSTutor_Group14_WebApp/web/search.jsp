<%-- 
    Document   : search
    Created on : 07/10/2017, 11:24:28 AM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search for tutors Page</title>
    </head>
    <body>
        <h1>Search for available tutors</h1>
        <table>
            <tr>
                <td>Search by: </td>
            <form action="searchAction.jsp" method="post">
                <td>
                    <select name="searchType">
                        <option value="subject">Subject</option>
                        <option value="name">Tutor Name</option>
                        <option value="availability">Availability</option>
                    </select>
                </td>
                <td>
                    <input type="text" />
                </td>
                <td>
                    <input type="submit" value="Submit"/>
                </td>
            </form>
            </tr>
        </table>
    </body>
</html>
