$(document).ready(function() {

  showTopLink();
  showHotLinks();

});

function showTopLink() {
  $.ajax({
    url: "https://hawt-reads.herokuapp.com/api/v1/links/top_link",
    method: "GET"
  })
  .success(function(data) {
    $(`[data-url="${data}"]`)
      .prepend("Top Link!")
      .addClass('top_link');
  })
  .fail(function() {
    console.log('no top link');
  })
}


function showHotLinks() {
  $.ajax({
    url: "https://hawt-reads.herokuapp.com/api/v1/links/hot_links",
    method: "GET"
  })
  .success(function(data) {
    for(var i=0; i<data.length; i++) {
      $(`[data-url="${data[i]}"]`)
        .prepend("Hot Link!")
        .addClass('hot_link');
    }
  })
  .fail(function() {
    console.log('no hot links');
  })
}
