$(document).ready(function(){
  $('.selectpicker').selectpicker('refresh');
    
  $("#search_transaction_type").change(function() {
    complete_options($(this));
    $('.dropdown-menu.inner.selectpicker').last().css('min-height', '26px')
  });
  
});

function complete_options(search) {
  
  var $price = $("#search_price"); 
  $price.empty();  
  $price.append(new Option("Todos", "0"));

  if(search.val().length > 0) {
    if(search.val() == 3) {

      var newOptions = {  "Menos de US$200.000": "1",
                          "Entre US$200.000 y US$500.000": "2",
                          "Más de US$500.000": "3",
                        };
      complete_input(newOptions, $price);
    }
    else {

      var newOptions = {  "Menos de $20.000": "1",
                          "Mas de $20.000": "2"
                        };
      complete_input(newOptions, $price);
    }
  }
  
  $('.selectpicker').selectpicker('refresh');
}

function complete_input(newOptions, input) {
  var optgroup = $('<optgroup>');
  optgroup.attr('label','Operaciones');

  $.each(newOptions, function(key, value) {
    optgroup.append($("<option></option>")
       .attr("value", value).text(key));
  });
  input.append(optgroup);

  $('.selectpicker').selectpicker('refresh');
}