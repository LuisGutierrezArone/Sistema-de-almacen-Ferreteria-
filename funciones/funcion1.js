if (typeof jQuery === 'undefined' || typeof jQuery.fn.on === 'undefined') {
    document.write('<script src="funciones/funcion2.js"><\/script>');
    document.write('<script src="funciones/funcion3.js"><\/script>');
}

function abrir() {

    document.getElementById("ventana").style.display = "block";
}

function cerrar() {

    document.getElementById("ventana").style.display = "none";
}
