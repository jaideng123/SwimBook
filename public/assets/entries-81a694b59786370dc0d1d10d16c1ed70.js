$(document).ready(function(){width=this.window.innerWidth>0?this.window.innerWidth:this.screen.width,$("#EntryTable").dataTable(width<768?{pagingType:"full",bFilter:!1,bAutoWidth:!1,bSortable:!1,bProcessing:!0,bServerSide:!0,sAjaxSource:$("#EntryTable").data("source")}:{pagingType:"simple_numbers",bFilter:!1,bAutoWidth:!1,bSortable:!1,processing:!0,serverSide:!0,ajax:$("#EntryTable").data("source")}),$("#SearchTable").dataTable(width<768?{pagingType:"full",bFilter:!1,bAutoWidth:!1,bSortable:!1}:{pagingType:"simple_numbers",bFilter:!1,bAutoWidth:!1,bSortable:!1})});