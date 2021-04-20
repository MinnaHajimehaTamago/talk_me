$(function () {
  $('.match-signs').each(function () {
    var $signs = $(this),
        $signsNextBtn = $('.match-signs-next'),
        $signsBackBtn = $('.match-signs-back'),
        signsCurrentScrollLeft = 0,
        signsScrollLeft = 0;
    $signs.scrollLeft(20000);
    var signsScrollMax = $signs.scrollLeft();
    $signs.scrollLeft(0);
    
    if (signsScrollMax != signsCurrentScrollLeft) {
      $signsNextBtn.addClass('signs-bar-btn-active')
    };

    $signsNextBtn.on('click', function() {
      signsScrollLeft = signsCurrentScrollLeft + 480;
      $signs.animate({ scrollLeft: signsScrollLeft}, 250);
    });

    $signsBackBtn.on('click', function() {
      signsScrollLeft = signsCurrentScrollLeft - 480;
      $signs.animate({ scrollLeft: signsScrollLeft}, 250);
    })

    $signs.on('scroll', function() {
      signsCurrentScrollLeft = $signs.scrollLeft();

      if (signsCurrentScrollLeft >= signsScrollMax) {
        $signsNextBtn.removeClass('signs-bar-btn-active');
      } else if (!$signsNextBtn.hasClass('signs-bar-btn-active')) {
        $signsNextBtn.addClass('signs-bar-btn-active')
      };

      if (signsCurrentScrollLeft == 0 && $signsBackBtn.hasClass('signs-bar-btn-active')) {
        $signsBackBtn.removeClass('signs-bar-btn-active');
      } else if (signsCurrentScrollLeft > 0 && !$signsBackBtn.hasClass('signs-bar-btn-active')) {
        $signsBackBtn.addClass('signs-bar-btn-active');
      };
    });
  });

  $('.talk-rooms').each(function () {
    var $rooms = $(this),
        $roomsNextBtn = $('.talk-rooms-next'),
        $roomsBackBtn = $('.talk-rooms-back'),
        roomsCurrentScrollLeft = 0,
        roomsScrollLeft = 0;
    $rooms.scrollLeft(20000);
    var roomsScrollMax = $rooms.scrollLeft();
    $rooms.scrollLeft(0);
    
    if (roomsScrollMax != roomsCurrentScrollLeft) {
      $roomsNextBtn.addClass('signs-bar-btn-active')
    };

    $roomsNextBtn.on('click', function() {
      roomsScrollLeft = roomsCurrentScrollLeft + 480;
      $rooms.animate({ scrollLeft: roomsScrollLeft}, 250);
    });

    $roomsBackBtn.on('click', function() {
      roomsScrollLeft = roomsCurrentScrollLeft - 480;
      $rooms.animate({ scrollLeft: roomsScrollLeft}, 250);
    })

    $rooms.on('scroll', function() {
      roomsCurrentScrollLeft = $rooms.scrollLeft();

      if (roomsCurrentScrollLeft >= roomsScrollMax) {
        $roomsNextBtn.removeClass('signs-bar-btn-active');
      } else if (!$roomsNextBtn.hasClass('signs-bar-btn-active')) {
        $roomsNextBtn.addClass('signs-bar-btn-active')
      };

      if (roomsCurrentScrollLeft == 0 && $roomsBackBtn.hasClass('signs-bar-btn-active')) {
        $roomsBackBtn.removeClass('signs-bar-btn-active');
      } else if (roomsCurrentScrollLeft > 0 && !$roomsBackBtn.hasClass('signs-bar-btn-active')) {
        $roomsBackBtn.addClass('signs-bar-btn-active');
      };
    });
  });
});