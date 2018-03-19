$(document).ready(function(){
  $('a[href^="#"]').on('click',function (e){
    e.preventDefault();

    var target = this.hash;

    $('html, body').stop().animate(
      { 'scrollTop':  $(target).offset().top },
      900,
      'swing',
      function (){
        window.location.hash = target;
      }
    );
  });
});
