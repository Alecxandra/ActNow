 $(document).ready(function(){
    $('.parallax').parallax();
    $('select').material_select();
    $('.tooltipped').tooltip({delay: 50});
    $('.modal-trigger').leanModal(); 
    $('.jcarousel').jcarousel();
   
    $('.jcarousel-prev').jcarouselControl({
        target: '-=1'
    });

    $('.jcarousel-next').jcarouselControl({
        target: '+=1'
    });
});
        