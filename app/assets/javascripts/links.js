$(document).ready(function() {
  $('#new_link').on('submit', function(event) {
    event.preventDefault();
    var new_link = {
      link: {
        url: $('#link_url').val(),
        title: $('#link_title').val()
      }
    }
    $.ajax({
      url: "/api/v1/links",
      method: "POST",
      data: new_link
    })
    .success(function(linkPartial) {
      $('#links').prepend(linkPartial);
      $('#error-messages').html('');
      $('#link_url').val('');
      $('#link_title').val('');
    })
    .fail(function(errorPartial) {
      $('#error-messages').html(errorPartial.responseText);
    })
  })
})
