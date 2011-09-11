// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  $('#content').infinitescroll({
    // selector for the paged navigation (it will be hidden)
    navSelector  : "div.pagination",
    // selector for the NEXT link (to page 2)
    nextSelector : "a.next_page",
    // selector for all items you'll retrieve
    itemSelector : "#content div.video"
  });
});
