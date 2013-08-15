$(document).ready(function() {
    $('.datatable').dataTable( {
        "sDom": "<'row'<'span8'l><'span4'f>r>t<'row'<'span8'i><'span4'p>>",
        "sZeroRecords": "No matching users found.",
        "sPaginationType": "bootstrap",
        "oLanguage": {
            "sZeroRecords": "No matching users found.",
            "sInfoEmpty":  	"Showing 0 to 0 of 0 issues",
            "sLengthMenu": 	"_MENU_ issues per page",
            "sInfo":        "Showing _START_ to _END_ of _TOTAL_ issues",
            "sInfoFiltered":   "(filtered from _MAX_ total issues)",
        },
        "iDisplayLength": 25,
        "aaSorting": [[0,'asc']],
        "aoColumns": [
            null,
            null,
            null,
            null,
            null,
            null
        ]
    });

    $('#options').removeClass('sorting');
});