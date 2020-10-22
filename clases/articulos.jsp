<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="librerias/alertifyjs/alertify.js"></script>
<script src="librerias/bootstrap/js/bootstrap.js"></script>
<script src="librerias/select2/js/select2.js"></script>
<!DOCTYPE html>
<!DOCTYPE html>
<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        cn = Conexion.obtenConexion();
        st = cn.createStatement();
%>    
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <DIV align="center"> <h1>AGREGANDO  ARTICULOS Y PRODUCTOS</h1></div>
        <br><br><br><br>
        <div id="page" class="hfeed site">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <form id="frmArticulos" >
                            <label><h3>Categoria</h3></label>
                            <select class="form-control input-sm" id="categoriaSelect" name="categoriaSelect">
                                <option value="A">Selecciona Categoria</option> 
                                <%rs = st.executeQuery("select id_categoria,nombreCategoria from categorias");%>
                                <%while ((rs != null) && (rs.next())) {%>
                                <option value="<%=rs.getString("id_categoria")%>"><%=rs.getString("nombreCategoria")%></option> 
                                <%}%>
                            </select>                          
                            <label><h3>Nombre</h3></label>
                            <input type="text" class="form-control input-sm" id="nombre" name="nombre">
                            <label><h3>Descripcion</h3></label>
                            <input type="text" class="form-control input-sm" id="descripcion" name="descripcion">
                            <label><h3>Cantidad</h3></label>
                            <input type="text" class="form-control input-sm" id="cantidad" name="cantidad">
                            <label><h3>Precio</h3></label>
                            <input type="text" class="form-control input-sm" id="precio" name="precio">
                            <p></p>
                            <span class="btn btn-primary" id="btnAgregaArticulo">Agregar</span>
                        </form>
                        <br><br><br>
                    </div>

                    <div class="col-sm-8">
                        <div id="tablaArticuloLoad">
                        </div>
                    </div>
                </div>
            </div>

            <%
                } catch (Exception e) {
                    out.println(e.getMessage());
                    e.printStackTrace();
                }
            %>

            <!-- Modal -->
            <div class="modal fade" id="actualizaArticulo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Actualiza Articulo</h4>
                        </div>
                        <div class="modal-body">
                            <form id="frmArticulosU">
                                <input type="text" id="idarticulo" hidden="" name="idarticulo">


                                <label><h3>Categoria</h3></label>
                                <input type="text" class="form-control input-sm" id="categoriaSelectU" name="categoriaSelectU" readonly>

                                <label><h3>Nombre</h3></label>
                                <input type="text" class="form-control input-sm" id="nombreU" name="nombreU">
                                <label><h3>Descripcion</h3></label>
                                <input type="text" class="form-control input-sm" id="descripcionU" name="descripcionU">
                                <label><h3>Cantidad</h3></label>
                                <input type="text" class="form-control input-sm" id="cantidadU" name="cantidadU">
                                <label><h3>Precio</h3></label>
                                <input type="text" class="form-control input-sm" id="precioU" name="precioU">                              
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnActualizaArticulo" class="btn btn-warning" data-dismiss="modal">Actualizar</button>
                        </div>
                    </div>
                </div>
            </div>  
    </body>
</html>


<script type="text/javascript">
    $(document).ready(function () {

        $('#tablaArticuloLoad').load('tablas/tablaArticulo.jsp');
        $('#btnAgregaArticulo').click(function () {

            vacios = validarFormVacio('frmArticulos');

            if (vacios > 0) {
                swal("Debe llenar todos los campos!!", "capos vacios!", "error");
                return false;
            }

            datos = $('#frmArticulos').serialize();
            $.ajax({
                url: "RegistrarArticulo",
                data: datos,
                type: "POST",
                success: function (responseText) {

                    $('#frmArticulos')[0].reset();
                    swal("AGREGADO CON EXITO", 'Agregado!', 'success');
                    $('#tablaArticuloLoad').load('tablas/tablaArticulo.jsp');
                },
                error: function (xhr, status) {
                    alertify.error("Fallo al Agregar");
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
        $('#btnActualizaArticulo').click(function () {

            datos = $('#frmArticulosU').serialize();
            $.ajax({
                url: "ActualizarArticulo",
                data: datos,
                type: "POST",
                success: function (r) {
                    r === 1;
                    alertify.success("Actualizado CON EXITO");
                    $('#tablaArticuloLoad').load('tablas/tablaArticulo.jsp');
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
    function agregaDatosArticulos(idarticulo, categoriaSelect, nombre, descripcion, cantidad, precio) {

        /*dato = jQuery.parseJSON(respJson);*/
        $('#idarticulo').val(idarticulo),
                $('#categoriaSelectU').val(categoriaSelect),
                $('#nombreU').val(nombre),
                $('#descripcionU').val(descripcion),
                $('#cantidadU').val(cantidad),
                $('#precioU').val(precio);

    }
    function eliminaArticulo(idarticulo) {

        alertify.confirm('¿Desea eliminar la articulo?', function () {
            $.ajax({
                url: "EliminarArticulo",
                data: "idarticulo=" + idarticulo,
                type: "POST",
                success: function (r) {
                    r === 1;
                    alertify.success("Eliminado con exito");
                    $('#tablaArticuloLoad').load('tablas/tablaArticulo.jsp');
                },
                error: function (r) {
                    r !== 1;
                    alertify.success("No se pudo eliminar");
                }
            });
        }, function () {
            alertify.error('Cancelo operacion');
        });
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#categoriaSelect').select2();
    });
</script>