<%-- 
    Document   : doTestView
    Created on : May 31, 2023, 11:37:54 AM
    Author     : quoct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h3{
                display: inline-block;
            }
        </style>

    </head>
    <body>
        <c:forEach var="i" items="${requestScope.list}">            
            <div style="border: 1px solid black; width: 50%; margin: 0 auto 10px auto; display: flex">
                <div style="width: 70%">
                    <h1> ${i.detail}</h1>
                    <input type="radio"><h3> ${i.answerA}</h3> <br>
                    <input type="radio"><h3> ${i.answerB}</h3> <br>
                    <input type="radio"><h3> ${i.answerC}</h3><br>
                    <input type="radio"><h3> ${i.answerD}</h3><br>
                </div>

            </div>

        </c:forEach>
    </body>
</html>
