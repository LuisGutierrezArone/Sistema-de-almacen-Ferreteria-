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
        rs = st.executeQuery("select id_categoria,nombreCategoria from categorias");
%>     

<table class="table table-hover table-condensed table-bordered">         
    <caption><label>Categorias</label></caption>                       
    <tr>
        <td>Categoria</td>
        <td>Editar</td>
        <td>Eliminar</td>
    </tr>
    <%while ((rs != null) && (rs.next())) {%>
    <tr>                               
        <td><%=rs.getString("nombreCategoria")%></td>
        <td>
            <span class="btn btn-warning btn-sm" data-toggle="modal"
                  data-target="#actualizaCategoria" onclick="agregaDato('<%=rs.getString("id_categoria")%>','<%=rs.getString("nombreCategoria")%>')">
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaCategoria('<%=rs.getString("id_categoria")%>')">
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