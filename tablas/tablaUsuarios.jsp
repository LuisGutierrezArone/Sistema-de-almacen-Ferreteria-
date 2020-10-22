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
        rs = st.executeQuery("select * from usuarios");
%>     

<table class="table table-hover table-condensed table-bordered">
<caption><h3>Usuarios</h3></caption>
    <tr>
        <td>Nombre</td>
        <td>Apellido</td>
        <td>Usuario</td>
        <td>Editar</td>
        <td>Eliminar</td>
    </tr>
    <%while ((rs != null) && (rs.next())) {%>
    <tr>
        <td><%=rs.getString("nombre")%></td>
        <td><%=rs.getString("apellido")%></td>
        <td><%=rs.getString("usuario")%></td>
        <td>
            <span class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizaUsuario"
                  onclick="agregaDato('<%=rs.getString("id_usuario")%>','<%=rs.getString("nombre")%>','<%=rs.getString("apellido")%>','<%=rs.getString("usuario")%>')">
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaUsuario('<%=rs.getString("id_usuario")%>')">
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