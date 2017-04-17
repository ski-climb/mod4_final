$( document ).ready(function() {
  $('#new_link').on('submit', createLink)
});

function createLink(event) {
  event.preventDefault();
  var newLink = {
    link: {
      url: $('#link_url').val(),
      title: $('#link_title').val()
    }
  }
  $.ajax({
    url: "/api/v1/links",
    method: "POST",
    data: newLink
  })
  .success(function(linkPartial) {
    prependLinkToList(linkPartial);
    clearErrorMessages();
    clearUserInput();
  })
  .fail(function(errorPartial) {
    displayErrorMessages(errorPartial);
  })
  .complete(function(data) {
    reEnableAddLinkButton();
  })
}

function prependLinkToList(linkPartial) {
  $('#links').prepend(linkPartial);
}

function clearErrorMessages() {
  $('#error-messages').html('');
}

function clearUserInput() {
  $('#link_url').val('');
  $('#link_title').val('');
}

function displayErrorMessages(errorPartial) {
  $('#error-messages').html(errorPartial.responseText);
}

function reEnableAddLinkButton() {
  $('#add_link').prop("disabled", false);
}
