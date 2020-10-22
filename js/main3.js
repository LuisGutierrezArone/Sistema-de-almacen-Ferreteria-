/* global int */

document.write('<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>');
document.write('<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>');

$(document).ready(function () {
    $('#registro').click(function () {

        vacios = validarFormVacio('frmRegistro');

        if (vacios > 0) {
            swal("Debe llenar todos los campos!!", "capos vacios!", "error");
            return false;
        }
        datos = $('#frmRegistro').serialize();
        $.ajax({
            url: "registrar",
            data: datos,
            type: "POST",
             success: function (r) {
                    r === null;
                    $('#frmRegistro')[0].reset();
                    swal('Agregado con Exito!','aregrado', 'success');
                
                },
                error: function (r) {
                    r !== null;
                    alert("Disculpe, existio un problema");
                }      
        });   
                
    });
});

function validarFormVacio(formulario) {
    datos = $('#' + formulario).serialize();
    d = datos.split('&');
    vacios = 0;
    for (i = 0; i < d.length; i++) {
        controles = d[i].split("=");
        if (controles[1] === "A" || controles[1] === "") {
            vacios++;
        }
    }
    return vacios;
}