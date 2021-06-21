$( document ).ready(function() {
  $('.trigger a').on('click', function() {
  	console.log("aaa");
     $('.modal-wrapper').toggleClass('open');
    $('.page-wrapper').toggleClass('blur-it');
     return false;
    });
    });
    