<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        String validar = null;
        cn = Conexion.obtenConexion();
        st = cn.createStatement();
        rs = st.executeQuery("select * from usuarios where usuario='admin'");
        if ((rs != null) && (rs.next())) {
            validar = "admin";
        }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>JSP Page</title>
    </head>
    <Br> <br> <br> <Br> <br> 
    <body style="background:url('Image/ferreteria.jpg'); background-size: 100% 100%; background-attachment: fixed;">
        <Br> <br> <br>
        <div class="container">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <div class="panel panel-primary">
                        <div align="center" class="panel panel-heading"><h2>FERRETERIA A TU DISPOSICION</h2></div>
                        <div class="panel panel-body">
                            <p>
                                <img src="Image/logo.jpg" height="165"> 
                            <form  id="frmlogin" action="inicio" method="POST">                            

                                <label>USUARIO:</label>
                                <input type="text" class="form-control input-sm" name="usuario" id="usuario"/>
                                <p>
                                </p>   
                                <label>PASSWORD:</label>
                                <input type="password" class="form-control input-sm" name="password" id="password"/>                           
                                <p>
                                </p><br>                         
                                <div align="center">
                                    <input class="btn btn-primary" style="font-size:20px " type="submit" value="Entrar" id="entrar"/>
                                    <%
                                        if (validar == null) {%>    

                                    <a href = "registro.jsp " type="buttom" class="btn btn-primary btn-danger" style="font-size:20px ">Registro</a>
                                    <%}%>
                                    <%
                                        } catch (Exception e) {
                                            out.println(e.getMessage());
                                            e.printStackTrace();
                                        }
                                    %>
                                </div>
                            </form>
                            <br> 
                        </div>
                    </div>
                    <div class="col-sn-4"></div>
                </div>
            </div>
        </div>
    </body>
</html>

<script type="text/javascript">

    $(document).ready(function () {
        $('#entrar').click(function () {

            vacios = validarFormVacio('frmlogin');

            if (vacios > 0) {
                swal("Debe llenar todos los campos!!", "capos vacios!", "error");
                return false;
            }

            datos = $('#frmlogin').serialize();          

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