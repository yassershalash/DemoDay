//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
  $("#doit").click(function(){
    var x = $("#want").val();
    $("#event_what").val(x);
  })
});
