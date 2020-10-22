<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revalidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);

    try {
        if (session.getAttribute("user") == null) {

            request.getRequestDispatcher("index.jsp").forward(request, response);

        }
    } catch (Exception e) {

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

%>

<%  Connection cn = null;
    Statement st = null;
    ResultSet rs = null;

    try {
       
       
        cn = Conexion.obtenConexion();
        st = cn.createStatement();
        rs = st.executeQuery("select usuario from usuarios where id_usuario='1'");
        if ((rs != null) && (rs.next())) {
             
        }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link href="css/newcss1.css" rel="stylesheet" type="text/css"/>
        <link rel='stylesheet' id='escapade-fonts-css'  href='//fonts.googleapis.com/css?family=Oswald%3A300%2C400%2C700%7CDroid+Serif%3A300%2C400%2C700&#038;subset=latin&#038;ver=4.6.1' type='text/css' media='all' /> 
        <script src="funciones/funcion1.js" type="text/javascript"></script>
        <script src="funciones/funcion4.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="librerias/alertifyjs/css/alertify.css">
        <link rel="stylesheet" type="text/css" href="librerias/alertifyjs/css/themes/default.css">
        <link rel="stylesheet" type="text/css" href="librerias/select2/css/select2.css">
        <script src="librerias/alertifyjs/alertify.js"></script>
        <script src="librerias/bootstrap/js/bootstrap.js"></script>
        <script src="librerias/select2/js/select2.js"></script>
        <title>JSP Page</title>

    </head>

    <body class="home page page-id-156 page-template-default custom-background wp-custom-logo fl-builder custom-header-imagen layout-one-column-wide" >

        <header id="masthead" class="site-header" role="banner" style="background:url('Image/ferreteria.jpg')no-repeat top center; background-size: cover;">     

            <a class="skip-link screen-reader-text" >Saltar al contenido</a>

            <div class="side-masthead " >
                <div class="menu-toggle" id="menu-toggle">
                    <div></div> 
                    <div></div>
                    <div></div>
                </div>   
                <div class="site-title-wrapper">

                    <img width="992" height="829" src="Image/logo.jpg" class="custom-logo" alt="cropped-logo-Venta&Almacén.png" itemprop="logo"><br>
                    <br>
                    <a href="menu.jsp"><h1 class="site-title">Ferretería a tu disposicion</h1></a>
                </div>

                <div class="main-navigation-container">

                    <nav id="site-navigation" class="main-navigation" >                      

                        <div class="contenedor-menu">
                            <ul class="menu">
                                <li class="current-menu-item "><a href="#" id="primero"><span class="glyphicon glyphicon-home "></span>Inicio</a></li>                            
                                <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>Administrar Articulos<span class="caret"></span></a>                             
                                    <ul>
                                        <li><a href="#" id="segundo">Categorias</a></li>
                                        <li><a href="#" id="tercero">Articulos</a></li>
                                    </ul>
                                </li>      

                                <%
                                         if (rs.getString("usuario")!="admin") {%>    
                                <li ><a href="#" id="cuarto"><span class="glyphicon glyphicon-user"></span>Administrar Usuario</a></li>
                                    <%}%>
                                    <%
                                        } catch (Exception e) {
                                            out.println(e.getMessage());
                                            e.printStackTrace();
                                        }
                                    %>

                                <li ><a href="#" id="quinto"><span class="glyphicon glyphicon-user"></span>Clientes</a></li>
                                <li ><a href="#"><span class="glyphicon glyphicon-usd"></span>Vender Articulo<span class="caret"></span></a>
                                    <ul>
                                        <li><a href="#" id="sexto">Vender Productos</a></li>
                                        <li><a href="#" id="septimo">Ventas Hechas</a></li>
                                    </ul>
                                </li>
                                <li ><a href="#" id="octavo">Portafolio</a></li>
                                <li ><a href="#" id="noveno">Galería</a></li>
                                <li> <a style="color: red" href="CerrarSesion"><span class="glyphicon glyphicon-off"></span>Salir</a></li>
                            </ul>
                        </div> 
                    </nav >
                </div> 
                <nav class="social-menu">
                </nav>
            </div>


            <div class="hero" >

                <div >

                    <aside id="text-9" class="widget widget_text"><h2 class="widget-title">Más que una compra!</h2>
                        <div class="textwidget">
                            <p>Por que tu compra no empieza cuando nos entregas tu dinero, ni termina cuando te entregamos el producto, conoce los puntos en los que estamos comprometidos contigo, durante el proceso de tu compra.</p>
                            <p>Abajo te los decimos!!</p>
                        </div>
                    </aside>
                </div>
            </div>

        </header>
        <div id="content1"> 

            <div id="page" class="hfeed site">
                <div id="content" class="site-content">
                    <div id="primary" class="content-area">
                        <main id="main" class="site-main" role="main">
                            <article id="post-156" class="post-156 page type-page status-publish hentry">
                                <div class="page-content">

                                </div>
                            </article>

                        </main>

                    </div>                  
                </div>  

                <!--<iframe width="560" height="315" src="https://www.youtube.com/embed/kR-9qDd22YU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>            -->

                <footer id="colophon" class="site-footer">
                    <div class="site-footer-inner">
                        <div class="footer-widget-area columns-2">

                            <div class="footer-widget">

                                <aside id="wpcw_contact-4" class="widget wpcw-widgets wpcw-widget-contact">
                                    <h4 class="widget-title">Comunícate con nosotros</h4>
                                    <ul>
                                        <li class="has-label">
                                            <strong>Correo electrónico</strong>
                                            <br>
                                            <div>
                                                <a href="mailto:tucorreo@tucorreo.com">tucorreo@tucorreo.com</a>
                                            </div>
                                        </li>
                                        <li class="has-label">
                                            <strong>Teléfono</strong>
                                            <br>
                                            <div>7361130039</div>
                                        </li>
                                        <li class="has-label">
                                            <strong>Dirección</strong>
                                            <br>
                                            <div>Adrián Castrejón Norte 208
                                                <br/>Apaxtla, Guerrero, México<br/>40535
                                            </div>
                                        </li>
                                        <li class="has-map">
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d975.4074634253743!2d-76.97838267081953!3d-12.068969099465782!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c6451d609353%3A0x79ca36609efad8dd!2sPuerto+Espa%C3%B1a+349%2C+Cercado+de+Lima+15022!5e0!3m2!1ses-419!2spe!4v1541660997689" width="200" height="200" frameborder="0" style="border:0" allowfullscreen></iframe>
                                        </li>
                                    </ul>
                                </aside>     
                            </div>
                        </div>           
                    </div>
                </footer>

                <div class="site-info-wrapper">

                    <div class="site-info">

                        <div class="site-info-inner">


                            <nav class="footer-menu">

                                <div class="menu-menu-principal-container">
                                    <ul id="menu-menu-principal-1" class="menu">
                                        <li class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-156 current_page_item menu-item-170"><a href="http://ferrebuentrato.mx/">Inicio</a></li>
                                        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-172"><a href="#">La empresa</a></li>
                                        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-169"><a href="#">Servicios</a></li>
                                        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-166"><a href="#">Blog</a></li>
                                        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-171"><a href="#">Comunícate con nosotros</a></li>
                                        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-237"><a href="#">Preguntas frecuentes</a></li>
                                        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-168"><a href="#">Portafolio</a></li>
                                        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-167"><a href="#">Galería</a></li>
                                    </ul>
                                </div>
                            </nav>

                        </div>
                    </div>
                </div>
            </div> 
        </div>
        <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>    
        <script src="js/main.js" type="text/javascript"></script>
        <script src="js/main2.js" type="text/javascript"></script>
    </body>

</html>
