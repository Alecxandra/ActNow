var initFunction = function() {
  $('.parallax').parallax();
  $('select').material_select();
  $('.tooltipped').tooltip({delay: 50});
  $('.modal-trigger').leanModal(); 
}  

$(document).on('page:load', initFunction);
$(document).ready(initFunction);
        