 $(document).ready(function(){
    $('.parallax').parallax();
    $('select').material_select();
    $('.tooltipped').tooltip({delay: 50});
    $('.modal-trigger').leanModal(); 
    $('.slider').slider({
      full_width: true
    });
   
   $('#prev-photo').on('click', function(event) {
     event.preventDefault();
     $('.slider').slider('prev');
     
   });
   
   $('#next-photo').on('click', function(event) {
     event.preventDefault();
     $('.slider').slider('next');
     
   });
});
        