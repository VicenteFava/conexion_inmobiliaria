$(document).ready(function(){

  $( '.overlay-container' ).height($( '.overlay-container' ).width()*.75);

  $(window).on( 'resize', function(){
    $( '.overlay-container' ).height($( '.overlay-container' ).width()*.75);
  });

  $( '.resize-image' ).each(function() {
    if($( this ).css('width') < $( '.overlay-container' ).css('width')) {
      $( this ).css('width', '100%');
    }
  })

});
