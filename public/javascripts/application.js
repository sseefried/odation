// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	$("#post_tag_tokens").tokenInput("/tags.json", {
		crossDomain: false,
		prePopulate: $("#post_tag_tokens").data("pre"),
		theme: "facebook"
	});
});
