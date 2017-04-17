$( document ).ready(function() {
  $('.read_only').on('click', hideUnread);
  $('.unread_only').on('click', hideRead);
})

function hideUnread() {
  $('.mark-as-unread').parents('.link').show();
  $('.mark-as-read').parents('.link').hide();
}

function hideRead() {
  $('.mark-as-read').parents('.link').show();
  $('.mark-as-unread').parents('.link').hide();
}
