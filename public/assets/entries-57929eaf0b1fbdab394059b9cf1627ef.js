var show_date=!0,show_guard=!0,show_parent=!0;$(document).ready(function(){width=this.window.innerWidth>0?this.window.innerWidth:this.screen.width,$("#EntryTable").dataTable(width<768?{pagingType:"full",bFilter:!1,bAutoWidth:!1,bSortable:!1}:{pagingType:"simple_numbers",bFilter:!1,bAutoWidth:!1,bSortable:!1})});