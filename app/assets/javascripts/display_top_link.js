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
});
