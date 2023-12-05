<%-- 
    Document   : ViewCart
    Created on : Jun 21, 2023, 8:09:44 AM
    Author     : Acer
--%>

<%@page import="java.util.Map"%>
<%@page import="KhaiPT.Registration.CartObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
    </head>
    <body>
        <h1>View Cart</h1>

        <%--
            if (session != null) {
                CartObj cart = (CartObj) session.getAttribute("CART");
                if (cart != null) {
                    if (cart.getItems() != null) {
                        int count = 0;
        --%>

        <c:set var="cart" value="${sessionScope.CART}"/>
        <c:if test="${not empty cart}">
            <c:if test="${not empty cart.items}">

                <table border ="1" style="text-align: center">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Title</th>
                            <th>Quantity</th> 
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="MainController">

                        <c:forEach var="items" items="${cart}">
                            <c:set var="currentCount" value="${count + 1}"/>
                            <tr>
                                <td>
                                    ${currentCount}
                                </td>
                                <td>
                                    ${items.key}
                                </td>
                                <td>
                                    ${items.value}
                                </td>
                                <td>
                                    <input type="Checkbox" name="checkItem" value="${items.key}"/>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <a href="bookStore.html">Add more items</a> 
                                </td>
                                <td colspan="2">
                                    <input type ="submit" name="btAction" value="Remove Item">
                                </td>
                            </tr>
                        </c:forEach>
                        <%--
                            Map<String, Integer> items = cart.getItems();
                            for (Map.Entry item : items.entrySet()) {
                        --%>
                    </form>
                </tbody>
            </table>
        </c:if>
    </c:if>

    <div style="color: red">This is no cart</div><br/>
    <a href="bookStore.html">Back to book Store</a>

</body>
</html>
