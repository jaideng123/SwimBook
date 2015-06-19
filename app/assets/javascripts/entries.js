$(document).ready(function(){
var show_date = true;
var show_guard = true;
var show_parent = true;
if($( window ).width() < 630 && show_date){
	   console.log("Cut Date");
	   $('td:nth-child(8)').hide();
	   $('th:nth-child(8)').hide();
	   show_date = false;
   }
if($( window ).width() < 530 && show_guard){
	   console.log("Cut Guard");
	   $('td:nth-child(7)').hide();
	   $('th:nth-child(7)').hide();
	   show_guard = false;
}
if($( window ).width() < 430 && show_parent){
	   console.log("Cut Parent");
	   $('td:nth-child(4)').hide();
	   $('th:nth-child(4)').hide();
	   show_parent = false;
}$( window ).resize(function() {
   if($( window ).width() < 630 && show_date){
	   console.log("Cut Date");
	   $('td:nth-child(8)').hide();
	   $('th:nth-child(8)').hide();
	   show_date = false;
   }
   if($( window ).width() < 530 && show_guard){
	   console.log("Cut Guard");
	   $('td:nth-child(7)').hide();
	   $('th:nth-child(7)').hide();
	   show_guard = false;
   }
   if($( window ).width() > 630 && !show_date){
	   console.log("Show Date");
	   $('td:nth-child(8)').show();
	   $('th:nth-child(8)').show();
	   show_date = true;
   }
   if($( window ).width() > 530 && !show_guard){
	   console.log("Show Guard");
	   $('td:nth-child(7)').show();
	   $('th:nth-child(7)').show();
	   show_guard = true;
   }
});
});
