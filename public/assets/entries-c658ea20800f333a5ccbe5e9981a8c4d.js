$(document).ready(function(){width=this.window.innerWidth>0?this.window.innerWidth:this.screen.width,$("#EntryTable").dataTable(width<768?{pagingType:"full",bFilter:!1,bAutoWidth:!1,bSortable:!1,processing:!0,serverSide:!0,ajax:$("#EntryTable").data("source"),language:{lengthMenu:"_MENU_"}}:{pagingType:"simple_numbers",bFilter:!1,bAutoWidth:!1,bSortable:!1,processing:!0,serverSide:!0,ajax:$("#EntryTable").data("source"),language:{lengthMenu:"_MENU_"}}),$("#SearchTable").dataTable(width<768?{pagingType:"full",bFilter:!1,bAutoWidth:!1,bSortable:!1,language:{lengthMenu:"_MENU_"}}:{pagingType:"simple_numbers",bFilter:!1,bAutoWidth:!1,bSortable:!1,language:{lengthMenu:"_MENU_"}})});