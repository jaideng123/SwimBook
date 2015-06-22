var show_date = true;
var show_guard = true;
var show_parent = true;
$(document).ready(function(){
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('#EntryTable').dataTable( {
                "pagingType": "full",bFilter: false,bAutoWidth: false,bSortable: false
            } );
        } else {
            $('#EntryTable').dataTable( {
                "pagingType": "simple_numbers",bFilter: false,bAutoWidth: false,bSortable: false
            } );
        }
	// function getUrlParameter(sParam)
	// {
	//     var sPageURL = window.location.search.substring(1);
	//     var sURLVariables = sPageURL.split('&');
	//     for (var i = 0; i < sURLVariables.length; i++) 
	//     {
	//         var sParameterName = sURLVariables[i].split('=');
	//         if (sParameterName[0] == sParam) 
	//         {
	//             return sParameterName[1];
	//         }
	//     }
	// } 
	// console.log(show_date);
	// var current_page = $('.current').text();
	// console.log(current_page);
	// if($( window ).width() < 630 && show_date){
	// 	   console.log("Cut Date");
	// 	   $('td:nth-child(8)').hide();
	// 	   $('th:nth-child(8)').hide();
	// 	   show_date = false;
	//   }
	// if($( window ).width() < 530 && show_guard){
	// 	   console.log("Cut Guard");
	// 	   $('td:nth-child(7)').hide();
	// 	   $('th:nth-child(7)').hide();
	// 	   show_guard = false;
	// }
	// if($( window ).width() < 430 && show_parent){
	// 	   console.log("Cut Parent");
	// 	   $('td:nth-child(4)').hide();
	// 	   $('th:nth-child(4)').hide();
	// 	   show_parent = false;
	// }
	// $( window ).resize(function() {
	//    if($( window ).width() < 630 && show_date){
	// 	   console.log("Cut Date");
	// 	   $('td:nth-child(8)').hide();
	// 	   $('th:nth-child(8)').hide();
	// 	   show_date = false;
	//    }
	//    if($( window ).width() < 530 && show_guard){
	// 	   console.log("Cut Guard");
	// 	   $('td:nth-child(7)').hide();
	// 	   $('th:nth-child(7)').hide();
	// 	   show_guard = false;
	//    }
	//    if($( window ).width() < 430 && show_parent){
	// 	   console.log("Cut Parent");
	// 	   $('td:nth-child(4)').hide();
	// 	   $('th:nth-child(4)').hide();
	// 	   show_parent = false;
	// 	}
	//    if($( window ).width() > 630 && !show_date){
	// 	   console.log("Show Date");
	// 	   $('td:nth-child(8)').show();
	// 	   $('th:nth-child(8)').show();
	// 	   show_date = true;
	//    }
	//    if($( window ).width() > 530 && !show_guard){
	// 	   console.log("Show Guard");
	// 	   $('td:nth-child(7)').show();
	// 	   $('th:nth-child(7)').show();
	// 	   show_guard = true;
	//    }
	//    if($( window ).width() > 430 && !show_parent){
	// 	   console.log("Show Parent");
	// 	   $('td:nth-child(4)').show();
	// 	   $('th:nth-child(4)').show();
	// 	   show_parent = true;
	// 	}
	// });
	// $( document ).ajaxComplete(function() {
 //  		console.log("Triggered ajaxComplete handler." );
	// });

});
