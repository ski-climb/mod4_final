$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
  $("body").on("click", ".mark-as-unread", markAsUnread)
})

function markAsUnread(e) {
  e.preventDefault();

  $(this).text("Mark as Read")
  $(this).toggleClass("mark-as-unread")
  $(this).parents('.link').toggleClass("mark_as_red")
  $(this).toggleClass("mark-as-read")

  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function markAsRead(e) {
  e.preventDefault();

  $(this).text("Mark as Unread")
  $(this).toggleClass("mark-as-read")
  $(this).parents('.link').toggleClass("mark_as_red")
  $(this).toggleClass("mark-as-unread")

  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');
  var linkUrl = $link.data('url');
  var urlData = {
    link: {
      url: linkUrl
    }
  }

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);

  $.ajax({
    type: "POST",
    url: "https://hawt-reads.herokuapp.com/api/v1/links",
    data: urlData
    }).then(() => {
      console.log('link marked as read');
    }).fail(() => {
      console.log('link not marked as read');
    })
}

function updateLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}

