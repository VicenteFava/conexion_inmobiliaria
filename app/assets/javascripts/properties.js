$(document).ready(function(){
  $( '#slider-property .carousel-inner .item' ).height($( '#slider-property .carousel-inner' ).width()*.75);

  $(window).on( 'resize', function() {
    $( '#slider-property .carousel-inner .item' ).height($( '#slider-property .carousel-inner' ).width()*.75);
  });
});

$(window).on('load', function() {
  $( '#slider-property .carousel-inner .item' ).height($( '#slider-property .carousel-inner' ).width()*.75);
});
