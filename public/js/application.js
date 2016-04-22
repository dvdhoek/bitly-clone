$(document).ready(function() {
	// $('button').click(function(){
	// 	$.post("contact", { name: "Friend" },
	// 	  function(result) { $("#greeting").html(result); }
	// 	);
	// });
	$('#urls_form').submit(function(event){
	
		event.preventDefault();

		var $form = $(this)
		var url = $form.attr('action')

		$.post(url, { long_url: $('#long_url').val() }, 
							 function(result) { $("#urls").html(result) }
							)
		});
});

$(document).ready(function() {
	$('#submit_button').click(function() {
		var $button = $(this)
		$button.val('Next')
		$.ajax({type: "get",
                url: "/"
            });
	});
});

$('#table_stats').dataTable({
   "bFilter": false,
   "bInfo": false,
   "bAutoWidth": false,
   "bSortClasses": false,
   "displayLength":10,
   "oLanguage": {
       "sInfo": "Showing START to END of TOTAL entries",
       "sZeroRecords": "No data to show" 
   },                                  
});
