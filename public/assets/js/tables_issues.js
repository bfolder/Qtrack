$.fn.dataTableExt.afnFiltering.push(
    function( oSettings, aData, iDataIndex ) {
        var showUnresolved = $("#unresolved-button").hasClass("active");
        var showResolved = $("#resolved-button").hasClass("active");

        if(aData[4] == "Resolved" && showResolved)
            return true;

        if(aData[4] == "Unresolved" && showUnresolved)
            return true;

        return false;
    }
);

jQuery.fn.dataTableExt.oSort['priority-desc'] = function(x,y) {
    if(x == "High")
        return 1;

    if(x == "Low")
        return -1;

    if(x == "Normal" && y == "High")
        return -1;

    return 1;
};

jQuery.fn.dataTableExt.oSort['priority-asc'] = function(x,y) {
    if(x == "High")
        return -1;

    if(x == "Low")
        return 1;

    if(x == "Normal" && y == "High")
        return 1;

    return 1;
};

$(document).ready(function() {
    var oTable = $('.datatable').dataTable( {
        "sDom": "<'row'<'span8'l><'span4'f>r>t<'row'<'span8'i><'span4'p>>",
        "sZeroRecords": "No matching issues found.",
        "sPaginationType": "bootstrap",
        "oLanguage": {
            "sZeroRecords": "No matching issues found.",
            "sInfoEmpty":  	"Showing 0 to 0 of 0 issues",
            "sLengthMenu": 	"_MENU_ issues per page",
            "sInfo":        "Showing _START_ to _END_ of _TOTAL_ issues",
            "sInfoFiltered":   "(filtered from _MAX_ total issues)",
        },
        "iDisplayLength": 25,
        "aaSorting": [[0,'asc']],
        "aoColumns": [
            { "sType": 'priority' },
            null,
            null,
            null,
            null
        ]
    });

    $("#resolved-button").click(function() {
        if($(this).hasClass("active"))
        {
            $(this).removeClass("active");
            $("#unresolved-button").addClass("active");
        }
        else
            $(this).addClass("active");

        oTable.fnDraw();
    });

    $("#unresolved-button").click(function() {
        if($(this).hasClass("active"))
        {
            $(this).removeClass("active");
            $("#resolved-button").addClass("active");
        }
        else
            $(this).addClass("active");

        oTable.fnDraw();
    });
});