$(document).ready(function() {
  $.ajax({
    url: "http://localhost:2000/api/v1/links/top_link",
    method: "GET"
  })
  .success(function(data) {
    $(`[data-url="${data}"]`).prepend("Top Link!");
  })
  .fail(function() {
    console.log('no top link');
  })

  $.ajax({
    url: "http://localhost:2000/api/v1/links/hot_links",
    method: "GET"
  })
  .success(function(data) {
    for(var i=0; i<data.length; i++) {
      $(`[data-url="${data[i]}"]`).prepend("Hot Link!");
    }
  })
  .fail(function() {
    console.log('no hot links');
  })
});

