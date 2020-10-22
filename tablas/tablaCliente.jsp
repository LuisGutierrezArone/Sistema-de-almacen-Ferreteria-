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
        rs = st.executeQuery("select * from clientes");
%>     
<table class="table table-hover table-condensed table-bordered">
    <caption><h3>Clientes</h3></caption>

    <tr>
        <td>Nombre</td>
        <td>Apellido</td>
        <td>Direccion</td>
        <td>Email</td>
        <td>Telefono</td>
        <td>RFC</td>
        <td>Editar</td>
        <td>Eliminar</td>
    </tr>
    <%while ((rs != null) && (rs.next())) {%>
    <tr>
        <td><%=rs.getString("nombre")%></td>
        <td><%=rs.getString("apellido")%></td>
        <td><%=rs.getString("direccion")%></td>
        <td><%=rs.getString("email")%></td>
        <td><%=rs.getString("telefono")%></td>
        <td><%=rs.getString("rfc")%></td>
        <td>
            <span class="btn btn-warning btn-sm" data-toggle="modal"
                 data-target="#actualizaCliente"  onclick="agregaDato('<%=rs.getString("id_cliente")%>', '<%=rs.getString("nombre")%>','<%=rs.getString("apellido")%>','<%=rs.getString("direccion")%>','<%=rs.getString("email")%>','<%=rs.getString("telefono")%>','<%=rs.getString("rfc")%>')">
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaCliente('<%=rs.getString("id_cliente")%>')">
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