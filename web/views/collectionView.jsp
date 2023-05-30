<%-- 
    Document   : CollectionView
    Created on : May 30, 2023, 10:25:51 PM
    Author     : quoct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>All quiz are below</h1>
        <c:forEach var="i" items="${requestScope.collection}">

            <div style="border: 1px solid black; width: 50%; margin: 0 auto 10px auto;">
                <h1> ${i.detail}</h1>
                <h3>A. ${i.answerA}</h3>
                <h3>B. ${i.answerB}</h3>
                <h3>C. ${i.answerC}</h3>
                <h3>D. ${i.answerD}</h3>
               
            </div>

        </c:forEach>

    </body>
</html>
