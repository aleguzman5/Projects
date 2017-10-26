<%-- 
    Document   : home
    Created on : Oct 24, 2017, 11:13:35 AM
    Author     : Alejandro
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"> 
        <style type = "text/css">
            /*            body {
                            background-image: url("jsp/heroes.jpg");
                        }*/
        </style>
    </head>
    <body>
        <div class="container">
            <h1 align="center">Heroes</h1>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/super">Super Humans</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/organization">Organizations</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/sighting">Sightings</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/location">Locations</a></li>
                </ul> 
            </div>
            <!-- Main Page Content Start -->
            <div class="row">
                <div class="col-md-12">
                    <br><h3>Latest Super Hero/Villain Sightings</h3>
                    <table id="sightingsTable" class="table table-hover">
                        <tr>
                            <th width="25%">Date</th>
                            <th width="25%">Location</th>
                            <th width="25%">Supers</th>
                            <th width="25%">Organization</th>
                        </tr>
                        <tbody id="content-rows">
                            <c:forEach var="sighting" items="${sightingList}">
                                <tr>
                                    <td>
                                        <c:out value="${sighting.date}"/>
                                    </td>
                                    <td>
                                        <c:out value="${sighting.location.name}"/>
                                    </td>
                                    <td>
                                        <c:forEach var="hero" items="${sighting.supers}">
                                            <c:out value="${hero.name}"/><br><br>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach var="hero" items="${sighting.supers}">
                                            <c:forEach var="org" items="${hero.organizations}">
                                                <c:out value="${org.name}"/><br>
                                            </c:forEach><br>
                                        </c:forEach>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                     
                </div> <!-- End col div --> 
            </div>  <!-- End row div --> 
            <!-- Main Page Content Stop -->  
        </div>
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>