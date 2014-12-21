$(document).ready(function() {

	$('.endorsements-link').on('click', function(event) {
		event.preventDefault();

		var endorementCount = $(this).siblings('.endorsements_count');

		$.post(this.href, function() {
			endorementCount.text(response.new_endorsement_count);
		});
	});
});