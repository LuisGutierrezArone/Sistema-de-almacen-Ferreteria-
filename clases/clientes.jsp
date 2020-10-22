<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <DIV align="center"> <h1>ADMINISTRAR CLIENTES</h1></div>
        <br><br><br><br>
        <div id="page" class="hfeed site">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <form id="frmClientes">
                            <label><h3>Nombre</h3></label>
                            <input  type="text" class="form-control input-sm" name="nombre" id="nombre">
                            <label><h3>Apellido</h3></label>
                            <input type="text" class="form-control input-sm" name="apellido" id="apellido">
                            <label><h3>Direccion</h3></label>
                            <input type="text" class="form-control input-sm" name="direccion" id="direccion">
                            <label><h3>Email</h3></label>
                            <input type="text" class="form-control input-sm" name="email" id="email">
                            <label><h3>Telefono</h3></label>
                            <input type="text" class="form-control input-sm" name="telefono" id="telefono">
                            <label><h3>RFC</h3></label>
                            <input type="text" class="form-control input-sm" name="rfc" id="rfc">
                            <p></p>
                            <span class="btn btn-primary" id="btnAgregaCliente">Agregar</span>
                        </form>
                        <br><br><br>
                    </div>
                    <div class="col-sm-8">
                        <div id="tablaClienteLoad"></div>
                    </div>
                </div>
            </div>
        </div>
        
            <div class="modal fade" id="actualizaCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Actualiza Clientes</h4>
                    </div>  
                    <div class="modal-body">
       
                         <form id="frmClientesU">
                             <input type="text" hidden="" id="idcliente" name="idcliente">
                            <label><h3>Nombre</h3></label>
                            <input  type="text" class="form-control input-sm" name="nombreU" id="nombreU">
                            <label><h3>Apellido</h3></label>
                            <input type="text" class="form-control input-sm" name="apellidoU" id="apellidoU">
                            <label><h3>Direccion</h3></label>
                            <input type="text" class="form-control input-sm" name="direccionU" id="direccionU">
                            <label><h3>Email</h3></label>
                            <input type="text" class="form-control input-sm" name="emailU" id="emailU">
                            <label><h3>Telefono</h3></label>
                            <input type="text" class="form-control input-sm" name="telefonoU" id="telefonoU">
                            <label><h3>RFC</h3></label>
                            <input type="text" class="form-control input-sm" name="rfcU" id="rfcU">

                        </form>
      
                    </div>             
                    <div class="modal-footer">
                        <button type="button" id="btnActualizaCliente" class="btn btn-warning" data-dismiss="modal">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>  
        
        
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $('#tablaClienteLoad').load('tablas/tablaCliente.jsp');
        $('#btnAgregaCliente').click(function () {

            vacios = validarFormVacio('frmClientes');

            if (vacios > 0) {
                swal("Debe llenar todos los campos!!", "capos vacios!", "error");
                return false;
            }

            datos = $('#frmClientes').serialize();
            $.ajax({
                url: "RegistraCliente",
                data: datos,
                type: "POST",
                success: function (r) {
                    $('#frmClientes')[0].reset();
                    alert("agregado");
                    $('#tablaClienteLoad').load('tablas/tablaCliente.jsp');
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
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#btnActualizaCliente').click(function () {

            datos = $('#frmClientesU').serialize();
            $.ajax({
                url: "ActualizarCliente",
                data: datos,
                type: "POST",
                success: function (r) {
                    r === 1;
                    alertify.success("Actualizado CON EXITO");
                    $('#tablaClienteLoad').load('tablas/tablaCliente.jsp');
                },
                error: function (r) {
                    r !== 1;
                    alert("Disculpe, existio un problema");
                }
            });
        });
    });
</script>
<script type="text/javascript">
    function agregaDato(idcliente, nombre,apellido,direccion,email,telefono,rfc) {
        $('#idcliente').val(idcliente);
        $('#nombreU').val(nombre);
        $('#apellidoU').val(apellido);
        $('#direccionU').val(direccion);
        $('#emailU').val(email);
        $('#telefonoU').val(telefono);
        $('#rfcU').val(rfc);
    }

    function eliminaCliente(idcliente) {

        alertify.confirm('¿Desea eliminar la categotria?', function () {
            $.ajax({
                url: "EliminaCliente",
                data: "idcliente=" + idcliente,
                type: "POST",
                success: function (r) {
                    r === 1;
                    alertify.success("Eliminado con exito");
                    $('#tablaClienteLoad').load('tablas/tablaCliente.jsp');
                },
                error: function (r){  
                    r !== 1;
                        alertify.success("No se pudo eliminar");     
                }
            });
        }, function () {
            alertify.error('Cancelo operacion');
        });
    }
</script>