// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
  $("#command_command").focus();

  jQuery("#command").submit(function(e) {
    e.preventDefault();

    var command = jQuery(':text#command_command').val();

    jQuery.ajax({
      dataType: 'json',
      type: 'POST',
      url: '/commands',
      data: { command: command },
      success: function(data) {
        if (typeof data.output !== 'undefined') {
          jQuery(".result").append(jQuery("<pre>").html(data.output));
        }

        jQuery("#command_command").scrollTo().val('');
      }
    });
  });
});

function checkJson(key, value) {
    var type;
    if (value && typeof value === 'object') {
        type = value.type;
        if (typeof type === 'string' && typeof window[type] === 'function') {
            return new (window[type])(value);
        }
    }
    return value;
}
