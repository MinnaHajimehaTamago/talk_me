// $(function() {
//   $('.app-explanation-container').each(function() {
//     var $explanationWraps = $(this).find('.app-explanation-wrap'),
//         $explanationBg = $('.app-explanation-bg'),
//         $explanationContainer = $('.app-explanation-container'),
//         currentIndex = 0;

//     $('.app-explanation-btn').on('click', function() {
//       $explanationContainer.addClass('active');
//       $explanationBg.addClass('active');
//       $explanationWraps.eq(currentIndex).addClass('active');
//     });

//     $('.app-explanation-next-btn').on('click', function() {
//       $explanationWraps.eq(currentIndex).removeClass('active');
//       $explanationWraps.eq(currentIndex + 1).addClass('active');
//       currentIndex += 1;
//     });

//     $('.app-explanation-back-btn').on('click', function() {
//       $explanationWraps.eq(currentIndex).removeClass('active');
//       $explanationWraps.eq(currentIndex - 1).addClass('active');
//       currentIndex -= 1;
//     });

//     $('.modal-close-icon').on('click', function() {
//       $explanationBg.removeClass('active');
//       $explanationContainer.removeClass('active');
//       $explanationWraps.eq(currentIndex).removeClass('active');
//       currentIndex = 0;
//     });
//   });
// });

$(function () {
  $('#app_explanation_btn').each(function () {
    var $wrap = $('.app-explanation-wrap'),
        $wrapOffsetTop = $wrap.offset().top,
        el = scrollableElement('html', 'body');
    
    $(this).on('click', function () {
      $(el).animate({ scrollTop: $wrapOffsetTop}, 250);
    });

    function scrollableElement(){
      var i, len, el, $el, scrollable;
      for ( i = 0, len = arguments.length; i < len; i++){
          el = arguments[i],
          $el = $(el);
          if ($el.scrollTop() > 0){
              return el;
          } else {
              $el.scrollTop(1);
              scrollable = $el.scrollTop() > 0;
              $el.scrollTop(0);
              if (scrollable){
                  return el;
              }
          }
      }
      return [];
  }
  });
});