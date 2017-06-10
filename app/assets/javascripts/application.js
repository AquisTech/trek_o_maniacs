// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require jquery_ujs
//= require jquery_nested_form
//= require foundation
//= require_tree .

$(document).on('turbolinks:load', function() {
  $(document).foundation();
  $('body').on('click', '[data-open="ajax-reveal"]', function(e) {
    e.preventDefault();
    $.ajax({
      url: $(this).data('url'),
      success: function(result) {
        $('.reveal-content').html(result);
      },
      error: function(result) {
        $('.reveal-content').html('Error loading content. Please close popup and retry.');
      }
    });
  });
  $('body').on('click', '.delete-array-field', function(e) {
    if($(this).parents('.fieldset').find('.input-group').length == 1) {
      alert('Cannot remove all the fields');
    } else {
      $(this).parents('.input-group').remove();
    }
  });
  $('body').on('click', '.clone-array-field', function(e) {
    var clonedField = $(this).prev('.input-group').clone();
    clonedField.find('input').val(null);
    $(this).before(clonedField);
  });
});
