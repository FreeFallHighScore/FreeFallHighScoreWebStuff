// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  $('#content').infinitescroll({
    navSelector  : "div.pagination",
    nextSelector : "a.next_page",
    itemSelector : "#content div.video",
    loadingText  : "Loading new videos...",
    donetext     : "We've loaded all the videos..."
  });
});
