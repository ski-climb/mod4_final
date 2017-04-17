$( document ).ready(function() {
  $('.links_filter input').on('keyup', function() {
    console.log('asdasdf');

    var searchInput = this.value.toLowerCase().split(" ");
    var $links = $('.link');
    if (this.value == "") {
      $links.show();
      return;
    }

    $links.hide();

    $links.filter(function () {
      for (var i=0; i<searchInput.length; i++) {
        if ($(this).text().toLowerCase().indexOf(searchInput[i]) > -1) {
          return true;
        }
      }
      return false;
    })
    .show();
  })
})
