<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body  align="center">      
        <DIV align="center"> <h1>AGREGANDO  CATEGORIAS</h1></div>
        <br><br><br><br>
        <div class="container" >
            <div class="row">
                <div class="col-sm-4">
                    <form id="frmCategorias">
                        <label><h3>Categoria</h3></label>
                        <input type="text" class="form-control input-sm" name="categoria" id="categoria">
                        <p></p>
                        <span class="btn btn-primary" id="btnAgregarCategoria">Agregar</span>
                    </form>
                </div>

                <div class="col-sm-6">
                    <div id="tablaCategoriaLoad">

                    </div>
                </div>
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="actualizaCategoria" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Actualiza Categorias</h4>
                    </div>
                    <div class="modal-body">
                        <form id="frmCategoriaU">
                            <input type="text" hidden="" id="idcategoria" name="idcategoria">
                            <label>Categoria</label>
                            <input type="text"  id="categoriaU" name="categoriaU" class="form-control input-sm">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnActualizaCategoria" class="btn btn-warning" data-dismiss="modal">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>                     

    </body>
</html>
<script type="text/javascript">
    $(document).ready(function () {

        $('#tablaCategoriaLoad').load('tablas/tablaCategoria.jsp');
        $('#btnAgregarCategoria').click(function () {

            vacios = validarFormVacio('frmCategorias');

            if (vacios > 0) {
                swal("Debe llenar todos los campos!!", "capos vacios!", "error");
                return false;
            }

            datos = $('#frmCategorias').serialize();
            $.ajax({
                url: "RegistrarCategoria",
                data: datos,
                type: "POST",
                success: function (r) {
////                alert(r);
                    r === null;
                    $('#frmCategorias')[0].reset();
                    swal("AGREGADO CON EXITO", 'Agregado!', 'success');
                    $('#tablaCategoriaLoad').load('tablas/tablaCategoria.jsp');
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
        $('#btnActualizaCategoria').click(function () {

            datos = $('#frmCategoriaU').serialize();
            $.ajax({
                url: "ActualizarCategoria",
                data: datos,
                type: "POST",
                success: function (r) {
                    r === 1;
                    alertify.success("Actualizado CON EXITO");
                    $('#tablaCategoriaLoad').load('tablas/tablaCategoria.jsp');
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
    function agregaDato(idcategoria, categoria) {
        $('#idcategoria').val(idcategoria);
        $('#categoriaU').val(categoria);
    }

    function eliminaCategoria(idcategoria) {

        alertify.confirm('¿Desea eliminar la categotria?', function () {
            $.ajax({
                url: "EliminarCategoria",
                data: "idcategoria=" + idcategoria,
                type: "POST",
                success: function (r) {
                    r === 1;
                    alertify.success("Eliminado con exito");
                    $('#tablaCategoriaLoad').load('tablas/tablaCategoria.jsp');
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