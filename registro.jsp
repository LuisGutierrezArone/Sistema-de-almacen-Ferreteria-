<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="js/main3.js" type="text/javascript"></script>
      
        <title>JSP Page</title>
    </head>
    <Br> <br> <br> <Br> <br> 
    <body style="background:url('Image/ferreteria.jpg'); background-size: 100% 100%; background-attachment: fixed;">
        <br><br><br>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <div class="panel panel-danger">
                        <div align="center" class="panel panel-heading"><h3>REGISTRAR ADMINISTRADOR</h3></div>
                        <div class="panel panel-body">
                            <form id="frmRegistro">                 
                                <label>Nombre</label>
                                <input type="text" class="form-control input-sm" name="nombre" id="nombre"><br> 
                                <label>Apellido</label>
                                <input type="text" class="form-control input-sm" name="apellido" id="apellido"><br> 
                                <label>Usuario</label>
                                <input type="text" class="form-control input-sm" name="usuario" id="usuario"><br> 
                                <label>Password</label>
                                <input type="text" class="form-control input-sm" name="password" id="password"><br>
                              
                                <p></p>                            
                                <span class="btn btn-primary"  id="registro" >Registrar</span>
                                <div style="text-align: right">
                                    <a href="index.jsp" class="btn btn-default">Regresar login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
    </body>
</html>
