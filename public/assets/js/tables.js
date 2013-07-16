/* Default class modification */
$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
} );

/* API method to get paging information */
$.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
{
    return {
        "iStart":         oSettings._iDisplayStart,
        "iEnd":           oSettings.fnDisplayEnd(),
        "iLength":        oSettings._iDisplayLength,
        "iTotal":         oSettings.fnRecordsTotal(),
        "iFilteredTotal": oSettings.fnRecordsDisplay(),
        "iPage":          Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
        "iTotalPages":    Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
    };
}

/* Bootstrap style pagination control */
$.extend( $.fn.dataTableExt.oPagination, {
    "bootstrap": {
        "fnInit": function( oSettings, nPaging, fnDraw ) {
            var oLang = oSettings.oLanguage.oPaginate;
            var fnClickHandler = function ( e ) {
                e.preventDefault();
                if ( oSettings.oApi._fnPageChange(oSettings, e.data.action) ) {
                    fnDraw( oSettings );
                }
            };

            $(nPaging).addClass('pagination').append(
                '<ul>'+
                    '<li class="prev disabled"><a href="#"><span class="awe-caret-left"></span> '+oLang.sPrevious+'</a></li>'+
                    '<li class="next disabled"><a href="#">'+oLang.sNext+' <span class="awe-caret-right"></span></a></li>'+
                    '</ul>'
            );
            var els = $('a', nPaging);
            $(els[0]).bind( 'click.DT', { action: "previous" }, fnClickHandler );
            $(els[1]).bind( 'click.DT', { action: "next" }, fnClickHandler );
        },

        "fnUpdate": function ( oSettings, fnDraw ) {
            var iListLength = 0;
            var oPaging = oSettings.oInstance.fnPagingInfo();
            var an = oSettings.aanFeatures.p;
            var i, j, sClass, iStart, iEnd, iHalf=Math.floor(iListLength/2);

            if ( oPaging.iTotalPages < iListLength) {
                iStart = 1;
                iEnd = oPaging.iTotalPages;
            }
            else if ( oPaging.iPage <= iHalf ) {
                iStart = 1;
                iEnd = iListLength;
            } else if ( oPaging.iPage >= (oPaging.iTotalPages-iHalf) ) {
                iStart = oPaging.iTotalPages - iListLength + 1;
                iEnd = oPaging.iTotalPages;
            } else {
                iStart = oPaging.iPage - iHalf + 1;
                iEnd = iStart + iListLength - 1;
            }

            for ( i=0, iLen=an.length ; i<iLen ; i++ ) {

                // Add / remove disabled classes from the static elements
                if ( oPaging.iPage === 0 ) {
                    $('li:first', an[i]).addClass('disabled');
                } else {
                    $('li:first', an[i]).removeClass('disabled');
                }

                if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
                    $('li:last', an[i]).addClass('disabled');
                } else {
                    $('li:last', an[i]).removeClass('disabled');
                }
            }
        }
    }
});

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

    return -1;
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