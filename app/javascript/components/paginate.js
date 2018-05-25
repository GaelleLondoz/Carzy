const initializePagination = () => {
  $('.previous_page').text('Previous');
  $('.next_page').text('Next');

  $(".pagination a").on("click", function(event) {
    // $(".pagination").html("Page is loading...");
    $.getScript(this.href);

    return false;
  });
}

export { initializePagination }
