<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="../css/newcss1.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <DIV align="center"> <h1>ADMINISTRAR USUARIO</h1></div>
        <br><br><br><br>
        <div id="page" class="hfeed site">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <form id="frmUsuarios">
                            <label><h3>Nombre</h3></label>
                            <input type="text" class="form-control input-sm" name="nombre" id="nombre">
                            <label><h3>Apellido</h3></label>
                            <input type="text" class="form-control input-sm" name="apellido" id="apellido">
                            <label><h3>Usuario</h3></label>
                            <input type="text" class="form-control input-sm" name="usuario" id="usuario">
                            <label><h3>Password</h3></label>
                            <input type="text" class="form-control input-sm" name="password" id="password">                        
                            <p></p>
                            <span class="btn btn-primary" id="btnAgregaUsuario">Agregar</span>
                        </form>
                        <br><br><br>
                    </div>
                    <div class="col-sm-6">
                        <div id="tablaUsuarioLoad"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="actualizaUsuario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Actualiza Usuarios</h4>
                    </div>
                    <div class="modal-body">
                        <form id="frmUsuariosU">
                              <input type="text" hidden="" id="idusuario" name="idusuario">
                            <label><h3>Nombre</h3></label>
                            <input type="text" class="form-control input-sm" name="nombreU" id="nombreU">
                            <label><h3>Apellido</h3></label>
                            <input type="text" class="form-control input-sm" name="apellidoU" id="apellidoU">
                            <label><h3>Usuario</h3></label>
                            <input type="text" class="form-control input-sm" name="usuarioU" id="usuarioU">                        
                        </form>


                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnActualizaUsuario" class="btn btn-warning" data-dismiss="modal">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>                     
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function () {

        $('#tablaUsuarioLoad').load('tablas/tablaUsuarios.jsp');
        $('#btnAgregaUsuario').click(function () {

            vacios = validarFormVacio('frmUsuarios');

            if (vacios > 0) {
                swal("Debe llenar todos los campos!!", "capos vacios!", "error");
                return false;
            }

            datos = $('#frmUsuarios').serialize();
            $.ajax({
                url: "registrar",
                data: datos,
                type: 'post',
                success: function (r) {
                    r === 1;
                    $('#frmUsuarios')[0].reset();
                    swal("AGREGADO CON EXITO", 'Agregado!', 'success');
                    $('#tablaUsuarioLoad').load('tablas/tablaUsuarios.jsp');
                },
                error: function (r) {
                    r !== 1;
                    alertify.success("No se pudo guardar");
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
        $('#btnActualizaUsuario').click(function () {

            datos = $('#frmUsuariosU').serialize();
            $.ajax({
                url: "ActualizarUsuario",
                data: datos,
                type: "POST",
                success: function (r) {
                    r === 1;
                    alertify.success("Actualizado CON EXITO");
                    $('#tablaUsuarioLoad').load('tablas/tablaUsuarios.jsp');
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
    function agregaDato(idusuario,nombre,apellido, usuario) {
        $('#idusuario').val(idusuario);
        $('#nombreU').val(nombre);
        $('#apellidoU').val(apellido);
        $('#usuarioU').val(usuario);
    }

    function eliminaUsuario(idusuario) {

        alertify.confirm('¿Desea eliminar al usuario?', function () {
            $.ajax({
                url: "EliminarUsuario",
                data: "idusuario=" + idusuario,
                type: "POST",
                success: function (r) {
                    r === 1;
                    alertify.success("Eliminado con exito");
                    $('#tablaUsuarioLoad').load('tablas/tablaUsuarios.jsp');
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