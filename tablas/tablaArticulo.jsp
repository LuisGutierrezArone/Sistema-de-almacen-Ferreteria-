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
        rs = st.executeQuery("select "
                + "art.id_producto,"
                + "art.nombre,"
                + "art.descripcion,"
                + "art.cantidad,"
                + "art.precio,"
                + "cat.nombreCategoria"    
                + " from articulos as art inner join categorias as cat "
                + "on art.id_categoria=cat.id_categoria");
%>    
<table class="table table-hover table-condensed table-bordered">
    <caption><label><h3>Articulos</h3></label></caption>
    <tr>
        <td>Nombre</td>
        <td>Descripcion</td>
        <td>Cantidad</td>
        <td>Precio</td>
        <td>Categoria</td>
        <td>Editar</td>
        <td>Eliminar</td>
    </tr>
    <%while ((rs != null) && (rs.next())) {%>
    <tr>
        <td><%=rs.getString("nombre")%></td>
        <td><%=rs.getString("descripcion")%></td>
        <td><%=rs.getInt("cantidad")%></td>
        <td><%=rs.getDouble("precio")%></td>
        <td><%=rs.getString("nombreCategoria")%></td>

        <td>
            <span  class="btn btn-warning btn-sm" data-toggle="modal" 
                   data-target="#actualizaArticulo" onclick="agregaDatosArticulos('<%=rs.getInt("id_producto")%>','<%=rs.getString("nombreCategoria")%>','<%=rs.getString("nombre")%>',
                   '<%=rs.getString("descripcion")%>','<%=rs.getInt("cantidad")%>','<%=rs.getDouble("precio")%>')">
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaArticulo('<%=rs.getInt("id_producto")%>')">
                <span class="glyphicon glyphicon-remove"></span>
            </span>
        </td>
    </tr>
    <%}%>
    <%
        } catch (Exception e) {
            out.println(e.getMessage());
            e.printStackTrace();
        }
    %>
</table>