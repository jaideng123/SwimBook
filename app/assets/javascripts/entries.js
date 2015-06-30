$(document).ready(function(){
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('#EntryTable').dataTable( {
                "pagingType": "full",bFilter: false,bAutoWidth: false,bSortable: false,processing: true,
          			serverSide: true, ajax: $('#EntryTable').data('source'),language:{
                        lengthMenu:"_MENU_"}
            } );
        } else {
            $('#EntryTable').dataTable( {
                "pagingType": "simple_numbers",bFilter: false,bAutoWidth: false,bSortable: false,processing: true,
          			serverSide: true, ajax: $('#EntryTable').data('source'),language:{
                        lengthMenu:"_MENU_"}
            } );
        }
        if (width < 768) {
            $('#SearchTable').dataTable( {
                "pagingType": "full",bFilter: false,bAutoWidth: false,bSortable: false,language:{
                    lengthMenu:"_MENU_"}
            } );
        } else {
            $('#SearchTable').dataTable( {
                "pagingType": "simple_numbers",bFilter: false,bAutoWidth: false,bSortable: false,language:{
                    lengthMenu:"_MENU_"}
            } );
        }


});
