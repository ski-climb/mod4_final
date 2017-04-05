$(document).ready(function() {
  $('#add_link').on('click', function(event) {
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
    .done(function(linkPartial) {
      $('#links').prepend(linkPartial);
    })
    .fail(function(data) {
      console.log('fail');
    })
  })
})
