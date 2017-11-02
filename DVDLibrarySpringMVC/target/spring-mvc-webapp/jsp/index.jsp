<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>DVD Library</title>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

    </head>

    <body>
        <div class="container">
            <br>
            <br>
            <div class="row">
                <form class="form-horizontal" role="form" method="POST" action="displayCreateDvdPage">
                    <div class="form-group col-md-3">
                        <button type="submit" id="create-button" class="btn btn-primary">Create Dvd</button>
                    </div>
                </form>
                <form class="form-horizontal" role="form" id="search-form" method="POST" action="displaySearchPage">
                    <div class="form-group col-md-2">
                        <button type="submit" id="search-button" class="btn btn-primary">Search</button>
                    </div>
                    <div class="form-group col-md-3">
                        <select id="category" class="form-control" required>
                            <option class="placeholder" selected disabled value="">Search Category</option>
                            <option value="title">Title</option>
                            <option value="year">Release Year</option>
                            <option value="director">Director Name</option>
                            <option value="rating">Rating</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <input type="text" id="search" class="form-control" placeholder="Search Term" required/>
                    </div>
                </form>
            </div>
            <div id="errors">
                <ul class="list-group" id="errorMessages"></ul>
            </div>

            <div id="dvdTableDiv">
                <table id="dvdTable" class="table table-hover">
                    <tr>
                        <th width="30%">Title</th>
                        <th width="20%">Release Date</th>
                        <th width="15%">Director</th>
                        <th width="10%">Rating</th>
                        <th width="10%"></th>
                        <th width="10%"></th>
                    </tr>
                    <tbody id="contentRows"></tbody>
                </table>
            </div>

<!--            <div class="col-md-6">

                <div id="editFormDiv" style="display: none">
                      
                    <h2 id="edit-title-banner">Edit Dvd: </h2>

                    <form class="form-horizontal" role="form" id="edit-form">
                        <div class="form-group">
                            <label for="edit-dvd-title" class="col-md-4 control-label">
                                Dvd Title:
                            </label>

                            <div class="col-md-8">
                                <input type="text" class="form-control" id="edit-dvd-title" placeholder="Dvd Title" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-release-year" class="col-md-4 control-label">
                                Release Year:
                            </label>

                            <div class="col-md-8">
                                <input type="text" class="form-control" id="edit-release-year" placeholder="Release Year" pattern="[0-9]{4}" maxlength="4"
                                       />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-director" class="col-md-4 control-label">
                                Director:</label>

                            <div class="col-md-8">
                                <input type="text" class="form-control" id="edit-director" placeholder="Director" />
                            </div>
                        </div>

                        <div class="form-group">

                            <label for="edit-rating" class="col-md-4 control-label">
                                Rating:</label>

                            <div class="col-md-4">

                                <select id="edit-rating" class="form-control">
                                    <option value="G">G</option>
                                    <option value="PG">PG</option>
                                    <option value="PG-13">PG-13</option>
                                    <option value="R">R</option>
                                    <option value="NC-17">NC-17</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="edit-notes" class="col-md-4 control-label">Notes:</label>

                            <div class="col-md-8">
                                <textarea class="form-control" id="edit-notes"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-4">
                                <input type="hidden" id="edit-dvd-id">
                                <button type="button" id="edit-cancel-button" class="btn btn-default" onclick="hideEditForm()">
                                    Cancel
                                </button>
                            </div>
                            <div class="col-md-4">
                                <button type="button" id="edit-button" class="btn btn-default">
                                    Save Changes
                                </button>
                            </div>
                        </div>

                    </form>
                </div>

                createFormDiv 

                <div id="displayDvdDiv" style="display: none">
                    <h2 id="display-dvd-title"></h2>
                    <hr>
                    <label for="display-release-year" class="col-md-4 control-label">
                        Release Year:
                    </label>
                    <div class="col-md-8">
                        <p id="display-release-year"></p><br />
                    </div>

                    <label for="display-director" class="col-md-4 control-label">
                        Director:
                    </label>
                    <div class="col-md-8">
                        <p id="display-director"></p><br />
                    </div>

                    <label for="display-rating" class="col-md-4 control-label">
                        Rating:
                    </label>
                    <div class="col-md-8">
                        <p id="display-rating"></p><br />
                    </div>

                    <label for="display-notes" class="col-md-4 control-label">
                        Notes:
                    </label>
                    <div class="col-md-8">
                        <p id="display-notes"></p><br /><br />
                    </div>

                    <input type="hidden" id="display-dvd-id">
                </div>
                displayDvdDiv 
                <div class="col-md-4" id="show-back-button" style="display: none">
                    <button type="button" id="back-button" class="btn btn-default">
                        Back
                    </button>
                </div>
            </div>-->
            <!--col-md-6 -->

        </div>
        <script src="js/jquery-2.2.4.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/home.js"></script>
    </body>

</html>