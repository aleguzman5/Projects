<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>DVD Library</title>
        <link href="css/bootstrap.css" rel="stylesheet">
    </head>
    <body>
        <h1>Search Results</h1>
        <div id="foundDvdDiv">
            <table id="dvdTable" class="table table-hover">
                <tr>
                    <th width="30%">Title</th>
                    <th width="20%">Release Date</th>
                    <th width="15%">Director</th>
                    <th width="10%">Rating</th>
                    <th width="15%"></th>
                </tr>
                <tbody id="newContentRows"></tbody>
            </table>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/DvdList.js"></script>
    </body>
</html>


