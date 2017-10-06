<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vending Machine</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">        
    </head>
    <body>
        <div class="container">
            <h1 style="text-align:center">Vending Machine</h1>
            <hr/>
            <div class="row">
                <div class="col-md-8">

                    <div class="content">
                        <div class="row" id="contentRow">
                            <c:forEach var="currentItem" items="${itemList}">
                                <div class="card col-md-4">
                                    <img class="card-img-top" src="..." alt="${currentItem.itemNumber}">
                                    <div class="card-body">
                                        <h4 class="card-title">${currentItem.name}</h4>
                                        <p class="card-text">${currentItem.price}</p>
                                        <p class="card-text">Quantity Left: ${currentItem.quantity}</p>
                                        <form class="form-horizontal" role="form" method="POST" action="selectItem">
                                            <input type="hidden" value="${currentItem.itemNumber}" name="itemId"/>
                                            <input type="submit" class="btn btn-primary" value="Select Item" />
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
                <div class="col-md-4">
                    <h2 style="text-align:center">Total $ In</h2>
                    <form class="form-horizontal" role="form" id="money-form" method="POST" action="calculateMoney">
                        <div class="col-md-12 form-group">
                            <input type="text" class="form-control text-center" id="userMoney" value="${totalIn}"/>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-8">
                                <button type="submit" id="add-dollar-button" class="btn btn-primary" value="1.00" name="money">Add Dollar</button>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" id="add-quarter-button" class="btn btn-primary" value="0.25" name="money">Add Quarter</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-8">
                                <button type="submit" id="add-dime-button" class="btn btn-primary" value="0.10" name="money">Add Dime</button>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" id="add-nickel-button" class="btn btn-primary" value="0.05" name="money">Add Nickel</button>
                            </div>
                        </div>
                    </form>
                    <hr/>
                    <form class="form-horizontal" role="form" id="messages-form">
                        <h2 style="text-align:center">Messages</h2>
                        <div class="col-md-12">
                            <input type="text" class="form-control" id="messages" value="${message}"/>
                        </div>
                        <div class="form-group">
                            <label for="item" class="col-md-4 control-label">Item:</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="item" value="${itemSelected}"/>
                            </div>
                        </div>
                        <div class="col-md-offset-4 col-md-8">
                            <button type="sumbit" id="make-purchase-button" class="btn btn-primary">Make Purchase</button>
                        </div>
                    </form>
                    <hr/>
                    <form class="form-horizontal" role="form" id="change-form">
                        <h2 style="text-align:center">Change</h2>
                        <div class="col-md-12 form-group">
                            <input type="text" class="form-control" id="change" />
                        </div>
                        <div class="col-md-8">
                            <button type="submit" id="change-return-button" class="btn btn-primary">Change Return</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>

