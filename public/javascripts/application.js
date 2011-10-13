// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var FFHS = {};
(function() {
  FFHS.infinitescroll = function(selector) {
    $(selector).infinitescroll({
      // selector for the paged navigation (it will be hidden)
      navSelector  : "div.pagination",
      // selector for the NEXT link (to page 2)
      nextSelector : "a.next_page",
      // selector for all items you'll retrieve
      itemSelector : selector + " div.video"
    });
  }
})($, FFHS);
