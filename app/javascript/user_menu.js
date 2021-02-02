$(function(){
  $('.user-icon-btns').on('mouseover', function(){
    $('.user-menu').removeClass('hide');
  })
  .on('mouseout', function(){
    $('.user-menu').addClass('hide');
  });
});