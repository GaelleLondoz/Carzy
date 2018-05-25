const initializePagination = () => {
  $(".pagination a").on("click", function(event) {
    // $(".pagination").html("Page is loading...");
    $.getScript(this.href);
    return false;
  });
}


export { initializePagination }
