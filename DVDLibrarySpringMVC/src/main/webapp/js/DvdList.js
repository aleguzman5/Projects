$(document).ready(function () {

    $('#search-button').click(function (event) {

        var newContentRows = $('#newContentRows');
        $.ajax({
            type: 'GET',
            url: 'search/dvds/',
            success: function (data, status) {
                $.each(data, function (index, dvd) {
                    var title = dvd.title;
                    var releaseYear = dvd.releaseYear;
                    var director = dvd.director;
                    var rating = dvd.rating;
                    var id = dvd.dvdId;

                    var row = '<tr>';
                    //row += '<td><a onclick="displayDvdInfo(' + id + ')"'> + title + '</a></td>';
                    row += '<td>' + title + '</td>';
                    row += '<td>' + releaseYear + '</td>';
                    row += '<td>' + director + '</td>';
                    row += '<td>' + rating + '</td>';
                    row += '<td><a onclick="displayDvdInfo(' + id + ')">View</a></td>';
                    row += '</tr>';
                    newContentRows.append(row);
                });
            },
            error: function () {
                $('#errorMessages')
                        .append($('<li>')
                                .attr({class: 'list-group-item list-group-item-danger'})
                                .text('Error calling web service.  Please try again later.'));
            }
        });
        $('#dvdTableDiv').hide();
        $('#foundDvdDiv').show();
        $('#show-back-button').show();
    });
});