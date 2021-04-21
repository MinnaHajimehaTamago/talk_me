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

    if (signsScrollMax != 0) {
      $signsNextBtn.removeClass('hide');
      $signsBackBtn.removeClass('hide');
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
        $signsNextBtn.addClass('hide');
      } else if ($signsNextBtn.hasClass('hide')) {
        $signsNextBtn.removeClass('hide')
      };

      if (signsCurrentScrollLeft == 0 ) {
        $signsBackBtn.addClass('hide');
      } else if (signsCurrentScrollLeft > 0 && $signsBackBtn.hasClass('hide')) {
        $signsBackBtn.removeClass('hide');
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
    
    if (roomsScrollMax != 0) {
      $roomsNextBtn.removeClass('hide');
      $roomsBackBtn.removeClass('hide');
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
        $roomsNextBtn.addClass('hide');
      } else if ($roomsNextBtn.hasClass('hide')) {
        $roomsNextBtn.removeClass('hide');
      };

      if (roomsCurrentScrollLeft == 0) {
        $roomsBackBtn.addClass('hide');
      } else if ($roomsBackBtn.hasClass('hide')) {
        $roomsBackBtn.removeClass('hide');
      };
    });
  });
});