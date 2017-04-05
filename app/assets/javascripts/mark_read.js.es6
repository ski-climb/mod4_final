$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)


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
    .complete(function(data) {
      $('#add_link').prop("disabled", false);
    })
  })




})

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
