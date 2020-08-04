$(document).ready(function(){
	$('#userName').blur(function(event){
		$.ajax({
			url: 'GetUserServlet',
			data : {
				userName: $('#userName').val()
			},
			success : function(responseText){
				$('#ajaxGetUserServletResponse').text(responseText);
			}
		});
	});
});