$(document).ready(function(){
  $( '.selectpicker' ).selectpicker();
  $( '.overlay-container' ).height($( '.overlay-container' ).width()*.75);

  $(window).on( 'resize', function(){
    $( '.overlay-container' ).height($( '.overlay-container' ).width()*.75);
  });

  $( '.resize-image' ).each(function() {
    if($( this ).css('width') < $( '.overlay-container' ).css('width')) {
      $( this ).css('width', '100%');
    }
  })


  //$('.selectpicker').selectpicker('refresh');


  // $("#transaction_type").change(function() {
  //   if($(this).val().length > 0) {
  //     if($(this).val() == 'Venta'){
  //       alert('Venta');

  //       $("#price").hide();
  //       $(".bootstrap-select").hide();

  //       var newOptions = {"Option 1": "value1",
  //         "Option 2": "value2",
  //         "Option 3": "value3"
  //       };


  //       var $price = $("#price");

  //       $price.empty();
  //       $.each(newOptions, function(key, value) {
  //         $price.append($("<option></option>")
  //            .attr("value", value).text(key));
  //       });

  //       $('.selectpicker').selectpicker();

  //     }
  //     else {
  //       alert('Cualquier alquier');
  //       $("#price").hide();
  //       $(".bootstrap-select").hide();

  //       var newOptions = {"Option 1": "value1",
  //         "Option 2": "value2",
  //         "Option 3": "value3"
  //       };


  //       var $price = $("#price");

  //       $price.empty();
  //       $.each(newOptions, function(key, value) {
  //         $price.append($("<option></option>")
  //            .attr("value", value).text(key));
  //       });


  //       $('.selectpicker').selectpicker();

  //     }
  //   }
  //   if($(this).data('options') == undefined){
  //       /*Taking an array of all options-2 and kind of embedding it on the select1*/
  //       $(this).data('options',$('#select2 option').clone());
  //       }
  //   var id = $(this).val();
  //   var options = $(this).data('options').filter('[value=' + id + ']');
  //   $('#select2').html(options);
  // });
  
});