// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$("#upload-form").validate();

var like = function(event, data) {
  $(this).attr('disabled', 'disabled').attr('href', '#').find('span').text(data.like_count);
};

$('.like_button').bind('ajax:success', like);