
$(document).ready(function (){
    $('.menu li:has(ul)').click(function (e){
        e.preventDefault();
        
        if($(this).hasClass('activado')){
           $(this).removeClass('activado');
           $(this).children('ul').slideUp();
        }else{
            $('.menu li ul').slideUp();
            $('.menu li').removeClass('activado');
            $(this).addClass('activado');
            $(this).children('ul').slideDown();
        }
    });
    
$('#segundo').click(function (){
//   window.location.href = $(this) .attr("href");
   $('#content1').load('clases/categorias.jsp');
});

$('#tercero').click(function (){
//   window.location.href = $(this) .attr("href");
   $('#content1').load('clases/articulos.jsp');
});

   $('#sexto').click(function (){
   $('#content1').load('clases/venderproductos.jsp');
});

   $('#septimo').click(function (){
   $('#content1').load('clases/ventashechas.jsp');
});
});

