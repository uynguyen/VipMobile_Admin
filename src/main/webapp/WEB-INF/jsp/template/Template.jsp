<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Turbo Vipmobile AdminZone</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- The styles -->
        <link id="bs-css" href="${pageContext.request.contextPath}/resources/css/bootstrap-cerulean.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/resources/css/charisma-app.css" rel="stylesheet">
        <link href='${pageContext.request.contextPath}/resources/bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/resources/bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
        <link href='${pageContext.request.contextPath}/resources/bower_components/chosen/chosen.min.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/resources/bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/resources/bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/resources/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/resources/css/jquery.noty.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/resources/css/noty_theme_default.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/resources/css/elfinder.min.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/resources/css/elfinder.theme.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/resources/css/jquery.iphone.toggle.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/resources/css/animate.min.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/resources/css/uploadify.css' rel='stylesheet'>

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/resources/bower_components/jquery/jquery.min.js"></script>

        <!-- The fav icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">

    </head>
    <body>
        <tiles:insertAttribute name="content" />
        <!-- topbar starts -->
        <div class="navbar navbar-default" role="navigation">

            <div class="navbar-inner">
                <button type="button" class="navbar-toggle pull-left animated flip">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"> <img alt="Charisma Logo" src="img/logo20.png" class="hidden-xs"/>
                    <span>Charisma</span></a>

                <!-- user dropdown starts -->
                <div class="btn-group pull-right">
                    <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> admin</span>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Profile</a></li>
                        <li class="divider"></li>
                        <li><a href="login.html">Logout</a></li>
                    </ul>
                </div>
                <!-- user dropdown ends -->

                <!-- theme selector starts -->
                <div class="btn-group pull-right theme-container animated tada">
                    <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <i class="glyphicon glyphicon-tint"></i><span
                            class="hidden-sm hidden-xs"> Change Theme / Skin</span>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" id="themes">
                        <li><a data-value="classic" href="#"><i class="whitespace"></i> Classic</a></li>
                        <li><a data-value="cerulean" href="#"><i class="whitespace"></i> Cerulean</a></li>
                        <li><a data-value="cyborg" href="#"><i class="whitespace"></i> Cyborg</a></li>
                        <li><a data-value="simplex" href="#"><i class="whitespace"></i> Simplex</a></li>
                        <li><a data-value="darkly" href="#"><i class="whitespace"></i> Darkly</a></li>
                        <li><a data-value="lumen" href="#"><i class="whitespace"></i> Lumen</a></li>
                        <li><a data-value="slate" href="#"><i class="whitespace"></i> Slate</a></li>
                        <li><a data-value="spacelab" href="#"><i class="whitespace"></i> Spacelab</a></li>
                        <li><a data-value="united" href="#"><i class="whitespace"></i> United</a></li>
                    </ul>
                </div>
                <!-- theme selector ends -->

                <ul class="collapse navbar-collapse nav navbar-nav top-menu">
                    <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Visit Site</a></li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i> Dropdown <span
                                class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                            <li class="divider"></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                    <li>
                        <form class="navbar-search pull-left">
                            <input placeholder="Search" class="search-query form-control col-md-10" name="query"
                                   type="text">
                        </form>
                    </li>
                </ul>

            </div>
        </div>


        <!-- external javascript -->

        <script src="${pageContext.request.contextPath}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- library for cookie management -->
        <script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
        <!-- calender plugin -->
        <script src='${pageContext.request.contextPath}/bower_components/moment/min/moment.min.js'></script>
        <script src='${pageContext.request.contextPath}/bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
        <!-- data table plugin -->
        <script src='${pageContext.request.contextPath}/js/jquery.dataTables.min.js'></script>

        <!-- select or dropdown enhancer -->
        <script src="${pageContext.request.contextPath}/resources/bower_components/chosen/chosen.jquery.min.js"></script>
        <!-- plugin for gallery image view -->
        <script src="${pageContext.request.contextPath}/resources/bower_components/colorbox/jquery.colorbox-min.js"></script>
        <!-- notification plugin -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.noty.js"></script>
        <!-- library for making tables responsive -->
        <script src="${pageContext.request.contextPath}/resources/bower_components/responsive-tables/responsive-tables.js"></script>
        <!-- tour plugin -->
        <script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
        <!-- star rating plugin -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.raty.min.js"></script>
        <!-- for iOS style toggle switch -->
        <script src="${pageContext.request.contextPath}/resources/resources/js/jquery.iphone.toggle.js"></script>
        <!-- autogrowing textarea plugin -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.autogrow-textarea.js"></script>
        <!-- multiple file upload plugin -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.uploadify-3.1.min.js"></script>
        <!-- history.js for cross-browser state change on ajax -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.history.js"></script>
        <!-- application script for Charisma demo -->
        <script src="${pageContext.request.contextPath}/resources/js/charisma.js"></script>


    </body>
</html>
