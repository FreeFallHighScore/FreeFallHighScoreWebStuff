$(function () {
  if (!admin)
  {
    $(".navigation > .buttonsContainer .naviBtn").click(function () {
      _class = $(this).attr('class');
      _class = _class.replace(/naviBtn|last/g, '').trim();
      _obj = $('.navigation .activeNavigation .buttonsContainer .' + _class);
      _width = $(this).width();
      $(this).addClass('active');

      $(this).css({position: 'absolute'});
      $(this).animate({left: '-535px'}, 1000, function () {
        if (_obj)
        {
          $(this).appendTo(_obj.parent());
          $(this).css({display: 'inline', left: '0', width: _width + 'px' });
        }
        document.location = $(this).attr('href')
      });
      $(".activeNavigation .naviBtn").fadeOut(1000);
      return false;
    });
  }
});
