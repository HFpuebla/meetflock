$(document).ready(function(){
	
	$(".city_autocomplete").autocomplete({
		source: function(request, response) {
					$.ajax({
						url: "/metropoli/cities.json",
						dataType: "json",
						data: {	q: request.term	},
						success: function(data) {
							response($.map(data, function(item) {
								return {
									label: item.to_s,
									value: item.to_s
								}
							}));
						}
					});
				},
		open: function() {
			$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
		},
		close: function() {
			$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
		}
	});
	
	$(".state_autocomplete").autocomplete({
		source: function(request, response) {
					$.ajax({
						url: "/metropoli/states.json",
						dataType: "json",
						data: {	q: request.term	},
						success: function(data) {
							response($.map(data, function(item) {
								return {
									label: item.to_s,
									value: item.to_s
								}
							}));
						}
					});
				},
		open: function() {
			$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
		},
		close: function() {
			$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
		}
	});
	
	$(".country_autocomplete").autocomplete({
		source: function(request, response) {
					$.ajax({
						url: "/metropoli/countries.json",
						dataType: "json",
						data: {	q: request.term	},
						success: function(data) {
							response($.map(data, function(item) {
								return {
									label: item.to_s,
									value: item.to_s
								}
							}));
						}
					});
				},
		open: function() {
			$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
		},
		close: function() {
			$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
		}
	});
	
});