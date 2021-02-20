if (document.URL.match(/signs/)) {
  $(function() {
    var $signNumbers = $('.count-number');
    $signNumbers.each(function(){
      var $number = $(this),
          $numberData = $number.text();

      $number.text();

      $({ percent: 0 }).delay(200).animate({
        percent: $numberData
      }, {duration: 500,
        progress: function () {
          var now = this.percent;
          $number.text(Math.floor(now));
        }
      });
    });
  });
};