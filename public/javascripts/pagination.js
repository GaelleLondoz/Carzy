$(function() {
  $(".pagination a").live("click", function(event) {
    debugger
    $(".pagination").html("Page is loading...");
    $.getScript(this.href);
    return false;
  });
});
