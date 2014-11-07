$(document).ready(function(){

  $( '.selectpicker' ).selectpicker();
  
  $("#search_transaction_type").change(function() {
    if($(this).val().length > 0) {
      if($(this).val() == 3){

        var newOptions = {  "Todos": "0",
                            "Menos de US$200.000": "1",
                            "Mas de US$200.000": "2",
                            "Menos de US$0.000": "3",
                        };


        var $price = $("#search_price");

        $price.empty();
        $.each(newOptions, function(key, value) {
          $price.append($("<option></option>")
             .attr("value", value).text(key));
        });

        $('.selectpicker').selectpicker('refresh');
      }
      else {

        var newOptions = {  "Todos": "0",
                            "Menos de $20.000": "1",
                            "Mas de $20.000": "2"
                          };

        var $price = $("#search_price");

        $price.empty();
        $.each(newOptions, function(key, value) {
          $price.append($("<option></option>")
             .attr("value", value).text(key));
        });

        $('.selectpicker').selectpicker('refresh');

      }
    }
    else {
      var $select = $("#search_price"); 
      $select.empty();  
      $select.append('<option value>Todos</option>');

      $('.selectpicker').selectpicker('refresh');
    }
  });
  
});