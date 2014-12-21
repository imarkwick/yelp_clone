$(document).ready(function() {

	$('.endorsements-link').on('click', function(event) {
		event.preventDefault();

		var endorsementCount = $(this).siblings('.endorsements_count');
		console.log('working..?')
		$.post(this.href, function(response) {
			endorsementCount.text(response.new_endorsement_count);
		});
	});
});