<%-- 
    Document   : search
    Created on : Jun 10, 2023, 10:59:27 AM
    Author     : Acer
--%>

<%@page import="java.util.List"%>
<%@page import="KhaiPT.Registration.RegistrationDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <%
            Cookie[] cookies = request.getCookies();
            String username = cookies[cookies.length - 1].getName();
        %>
        <font color="red">Welcome, <%=  username%></font>

        <h1>SEARCH PAGE</h1>
        <form action="MainController" method="POST">
            Search value:
            <input type="text" name="txtSearch" required=""/><br/>
            <input type="submit" name="btAction" value="Search"/><br/>
        </form>

        <%--
            String searchValue = request.getParameter("txtSearch");
            if (searchValue != null) {
                List<RegistrationDTO> result = (List<RegistrationDTO>) request.getAttribute("SEARCHRESULT");
                if (result != null) {
        --%>
        <c:set var="searchValue" value="${param.txtSearch}"/>
        <c:if test="${not empty searchValue}">
            <c:set var="result" value="${requestScope.SEARCHRESULT}"/>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>UserName</th>
                            <th>Password</th>
                            <th>Last Name</th>
                            <th>Role</th>     
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead> 
                    <tbody>  
                        <%--
                            int count = 0;
                            for (RegistrationDTO dto : result) {
                                String url = "MainController?btAction=Delete&txtSearch=" + searchValue + "&username=" + dto.getUsername();
                        --%>

                        <c:forEach var="dto" items="${result}" varStatus="counter">
                        <form action="MainController"> 
                            <tr>
                                <td>
                                    ${counter.count}
                                </td>
                                <td>
                                    ${dto.username}
                                    <input type="hidden" value="${dto.username}" name="txtUsername">
                                </td>
                                <td>
                                    <input type="password" value="${dto.password}" name="txtPassword">
                                    ${dto.password}
                                </td>
                                <td>
                                    <input type="text" value="${dto.lastname}" name="txtLastname">
                                    ${dto.lastname}
                                </td>
                                <td>
                                    <c:if test="${dto.role}">
                                        <input type="checkbox" name="isAdmin" value="ON" checked="checked"/>
                                    </c:if>

                                    <c:if test="${!dto.role}">
                                        <input type="checkbox" name='isAdmin' value=""/> 
                                    </c:if>

                                </td>
                                <td>

                                    <c:url var="delLink" value="MainController">
                                        <c:param name="btAction" value="delete"></c:param>
                                        <c:param name="pk" value="${dto.username}"></c:param>
                                        <c:param name="searchValue" value="${searchValue}"></c:param>
                                    </c:url>
                                    <a href="${delLink}">Delete</a>
                                </td>
                                <td>
                                    <input type="hidden" name="txtSearch" value="${searchValue}"/>
                                    <input type="submit" name="btAction" value="Update"/>
                                </td>
                            </tr>
                        </form> 
                    </c:forEach>
                </tbody>                  
            </table>
        </c:if>
        <c:if test="${empty result}">
            <p>No record is matched !</p>
        </c:if>
    </c:if>

            <c:if test="${empty searchValue}">
                <h2>Search value is empty.</h2>
            </c:if>

</body>
</html>
