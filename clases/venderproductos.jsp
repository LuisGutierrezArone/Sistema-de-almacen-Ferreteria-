<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="librerias/alertifyjs/alertify.js"></script>
<script src="librerias/bootstrap/js/bootstrap.js"></script>
<script src="librerias/select2/js/select2.js"></script>
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
        <DIV align="center"> <h1>VENDER PRODUCTO</h1></div>
        <br><br><br><br>
        <div id="page" class="hfeed site">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <form id="frmVentasProductos">
                            <label><h3>Selecciona Cliente</h3></label>
                            <select class="form-control input-sm" name="clienteVenta" id="clienteVenta">
                                <option value="A">Selecciona</option>
                                <option value="0">Sin cliente</option>
                                <%     rs = st.executeQuery("select * from clientes");%>
                                <%while ((rs != null) && (rs.next())) {%>
                                <option value="<%=rs.getString("id_cliente")%>"><%=rs.getString("nombre") + " " + rs.getString("apellido")%></option> 
                                <%}%>
                            </select>
                            <label><h3>Producto</h3></label>
                            <select class="form-control input-sm" name="productoVenta" id="productoVenta">
                                <option value="A">Selecciona</option>
                                <%     rs = st.executeQuery("select * from articulos");%>
                                <%while ((rs != null) && (rs.next())) {%>
                                <option value="<%=rs.getString("id_producto")%>"><%=rs.getString("nombre")%></option> 
                                <%}%>
                            </select>
                            <label><h3>Descripcion</h3></label>
                            <textarea class="form-control input-sm" name="descripcion" id="descripcion" readonly=""></textarea>
                            <label><h3>Cantidad</h3></label>
                            <input type="text" class="form-control input-sm" name="cantidad" id="cantidad" readonly="">
                            <label><h3>Precio</h3></label>
                            <input type="text" class="form-control input-sm" name="precio" id="precio" readonly="">  
                            <p></p>
                            <span class="btn btn-primary" id="btnAgregaVenta">Agregar</span>
                        </form>
                        <br><br><br>
                    </div>

                    <div class="col-sm-8">
                        <div id="tablaProductoLoad"></div>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="actualizaCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Actualiza Prodcuto</h4>
                    </div>  
                    <div class="modal-body">

                        <form id="frmVentasProductosU">
                            <label><h3>Selecciona Cliente</h3></label>
                            <select class="form-control input-sm" name="clienteU" id="clienteU">
                                <option value="A">Selecciona</option>
                                <option value="0">Sin cliente</option>
                                <%     rs = st.executeQuery("select * from clientes");%>
                                <%while ((rs != null) && (rs.next())) {%>
                                <option value="<%=rs.getString("id_cliente")%>"><%=rs.getString("nombre") + " " + rs.getString("apellido")%></option> 
                                <%}%>
                            </select>
                            <label><h3>Producto</h3></label>
                            <select class="form-control input-sm" name="productoU" id="productoU">
                                <option value="A">Selecciona</option>
                                <%     rs = st.executeQuery("select * from articulos");%>
                                <%while ((rs != null) && (rs.next())) {%>
                                <option value="<%=rs.getString("id_producto")%>"><%=rs.getString("nombre")%></option> 
                                <%}%>
                            </select>
                            <label><h3>Descripcion</h3></label>
                            <textarea class="form-control input-sm" name="descripcionU" id="descripcionU"></textarea>
                            <label><h3>Cantidad</h3></label>
                            <input type="text" class="form-control input-sm" name="cantidadU" id="cantidadU">
                            <label><h3>Precio</h3></label>
                            <input type="text" class="form-control input-sm" name="precioU" id="precioU">  
                        </form>
                        <%
                            } catch (Exception e) {
                                out.println(e.getMessage());
                                e.printStackTrace();
                            }
                        %>
                    </div>             
                    <div class="modal-footer">
                        <button type="button" id="btnActualizaProducto" class="btn btn-warning" data-dismiss="modal">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>  



    </body>
</html>




<script type="text/javascript">
    $(document).ready(function () {
        $('#productoVenta').change(function () {
            $.ajax({
                type: "POST",
                data: "idproducto" + $('#productoVenta').val(),
                url: "obtenerDatos",
                success: function (r) {
                    $('#descripcion').val();
                    $('#cantidad').val();
                    $('#precio').val();
                }
            });
        });
    });
</script>





<script type="text/javascript">
    $(document).ready(function () {
        $('#tablaProductoLoad').load('tablas/tablaVprod.jsp');
        $('#btnAgregaVenta').click(function () {

            vacios = validarFormVacio('frmVentasProductos');

            if (vacios > 0) {
                swal("Debe llenar todos los campos!!", "capos vacios!", "error");
                return false;
            }

            datos = $('#frmVentasProductos').serialize();
            $.ajax({
                url: "",
                data: datos,
                type: 'post',
                success: function (r) {
                    $('#tablaProductoLoad').load('tablas/tablaVprod.jsp');
                    alert("agregado");


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
        $('#clienteVenta').select2();
        $('#productoVenta').select2();
    });
</script>