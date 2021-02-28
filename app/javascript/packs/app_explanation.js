$(function() {
  $('.app-explanation-container').each(function() {
    var $explanationWraps = $(this).find('.app-explanation-wrap'),
        $explanationBg = $('.app-explanation-bg'),
        $explanationContainer = $('.app-explanation-container'),
        currentIndex = 0;

    $('.app-explanation-btn').on('click', function() {
      $explanationContainer.addClass('active');
      $explanationBg.addClass('active');
      $explanationWraps.eq(currentIndex).addClass('active');
    });

    $('.app-explanation-next-btn').on('click', function() {
      $explanationWraps.eq(currentIndex).removeClass('active');
      $explanationWraps.eq(currentIndex + 1).addClass('active');
      currentIndex += 1;
    });

    $('.app-explanation-back-btn').on('click', function() {
      $explanationWraps.eq(currentIndex).removeClass('active');
      $explanationWraps.eq(currentIndex - 1).addClass('active');
      currentIndex -= 1;
    });

    $('.modal-close-icon').on('click', function() {
      $explanationBg.removeClass('active');
      $explanationContainer.removeClass('active');
      $explanationWraps.eq(currentIndex).removeClass('active');
      currentIndex = 0;
    });
  });
});