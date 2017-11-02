<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create DVD</title>
        <link href="css/bootstrap.css" rel="stylesheet">
    </head>
    <body>
        <div class="col-md-offset-2 col-md-6">
            <h1>Create DVD</h1>
            <hr/>
        </div>
        <div class="col-md-offset-2 col-md-6">
            <div id="createFormDiv">
                <form class="form-horizontal" role="form" id="create-form">
                    <div class="form-group">
                        <label for="create-dvd-title" class="col-md-4 control-label">
                            Dvd Title:
                        </label>

                        <div class="col-md-8">
                            <input type="text" class="form-control" id="create-dvd-title" placeholder="Dvd Title" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create-release-year" class="col-md-4 control-label">
                            Release Year:
                        </label>

                        <div class="col-md-8">
                            <input type="text" class="form-control" id="create-release-year" placeholder="Release Year" pattern="[0-9]{4}" maxlength="4"
                                   />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create-director" class="col-md-4 control-label">
                            Director:</label>

                        <div class="col-md-8">
                            <input type="text" class="form-control" id="create-director" placeholder="Director" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-rating" class="col-md-4 control-label">
                            Rating:</label>

                        <div class="col-md-4">

                            <select id="create-rating" class="form-control">
                                <option value="G">G</option>
                                <option value="PG">PG</option>
                                <option value="PG-13">PG-13</option>
                                <option value="R">R</option>
                                <option value="NC-17">NC-17</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-notes" class="col-md-4 control-label">Notes:</label>

                        <div class="col-md-8">
                            <textarea class="form-control" id="create-notes"></textarea>
                        </div>
                    </div>
                </form>
                    <div class="form-group">
                        <form class="form-horizontal" role="form" method="POST" action="returnToIndex">
                            <div class="col-md-offset-4 col-md-4">
                                <button type="submit" id="create-cancel-button" class="btn btn-default">
                                    Cancel
                                </button>
                            </div>
                        </form>

                        <div class="col-md-4">
                            <button type="submit" id="create-new-button" class="btn btn-default">
                                Create Dvd
                            </button>
                        </div>
                    </div>
            </div>
        </div>
        <script src="js/jquery-2.2.4.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/home.js"></script>
    </body>
</html>
<%--<sf:form class="form-horizontal" role="form" modelAttribute="contact" action="editContact" method="POST">
                <div class="form-group">
                    <label for="add-dvd-title" class="col-md-4 control-label">Dvd Title</label>
                    <div class="col-md-8">
                        <sf:input type="text" class="form-control" id="add-dvd-title"
                                  path="firstName" placeholder="First Name"/>
                        <sf:errors path="firstName" cssClass="error"></sf:errors>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-last-name" class="col-md-4 control-label">Last Name:</label>
                        <div class="col-md-8">
                        <sf:input type="text" class="form-control" id="add-last-name"
                                  path="lastName" placeholder="Last Name"/>
                        <sf:errors path="lastName" cssclass="error"></sf:errors>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-company" class="col-md-4 control-label">Company:</label>                          
                        <div class="col-md-8">
                        <sf:input type="text" class="form-control" id="add-company"
                                  path="company" placeholder="Company"/>
                        <sf:errors path="company" cssclass="error"></sf:errors>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-email" class="col-md-4 control-label">Email:</label>
                        <div class="col-md-8">
                        <sf:input type="email" class="form-control" id="add-email"
                                  path="email" placeholder="Email"/>
                        <sf:errors path="email" cssclass="error"></sf:errors>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-phone" class="col-md-4 control-label">Phone:</label>
                        <div class="col-md-8">
                        <sf:input type="tel" class="form-control" id="add-phone"
                                  path="phone" placeholder="Phone"/>
                        <sf:errors path="phone" cssclass="error"></sf:errors>
                        <sf:hidden path="contactId"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-8">
                        <input type="submit" class="btn btn-default" value="Update Contact"/>
                    </div>
                </div>
            </div>
        </sf:form>--%>