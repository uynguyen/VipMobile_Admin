<%-- 
    Document   : master
    Created on : Oct 9, 2015, 7:22:08 PM
    Author     : LeeSan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Shopper an E-Commerce online Shopping Category Flat Bootstarp responsive Website Template| Man :: w3layouts</title>   
        <link href='/java_he_thong_phan_tan_admin/css/bootstrap.css' rel='stylesheet' type='text/css' />   
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->   
        <script src='/java_he_thong_phan_tan_admin/js/jquery.min.js'></script>   
        <!-- Custom Theme files -->   
        <link href='/java_he_thong_phan_tan_admin/css/hover.css' rel='stylesheet' media='all'>   
        <link href='/java_he_thong_phan_tan_admin/css/style.css' rel='stylesheet' type='text/css' media='all' />   
        <!-- Custom Theme files -->   
        <meta name='viewport' content='width=device-width, initial-scale=1'>   
        <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />   

        <script type='application/x-javascript'> addEventListener('load', function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>   
        <!--webfont-->   
        <link href='http: fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>   
        <script src='http: ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js'></script>   

        <title>Shopper an E-Commerce online Shopping Category Flat Bootstarp responsive Website Template| Home :: w3layouts</title>
        <link href="/java_he_thong_phan_tan_admin/css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/java_he_thong_phan_tan_admin/js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <link href="/java_he_thong_phan_tan_admin/css/hover.css" rel="stylesheet" media="all">
        <link href="/java_he_thong_phan_tan_admin/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Shopper Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--webfont-->
        <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
        <!---- tabs---->
        <link type="text/css" rel="stylesheet" href="/java_he_thong_phan_tan_admin/css/easy-responsive-tabs.css" />
        <script src="/java_he_thong_phan_tan_admin/js/easyResponsiveTabs.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#horizontalTab').easyResponsiveTabs({
                    type: 'default', //Types: default, vertical, accordion           
                    width: 'auto', //auto or any width like 600px
                    fit: true, // 100% fit in a container
                    closed: 'accordion', // Start closed if in accordion view
                    activate: function (event) { // Callback function if tab is switched
                        var $tab = $(this);
                        var $info = $('#tabInfo');
                        var $name = $('span', $info);
                        $name.text($tab.text());
                        $info.show();
                    }
                });

                $('#verticalTab').easyResponsiveTabs({
                    type: 'vertical',
                    width: 'auto',
                    fit: true
                });
            });
        </script>

        <script src="/java_he_thong_phan_tan_admin/js/responsiveslides.min.js"></script>
        <script>
            $(function () {
                $("#slider").responsiveSlides({
                    auto: true,
                    speed: 500,
                    manualControls: '#slider3-pager',
                });
            });
        </script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src='/java_he_thong_phan_tan_admin/script/jquery-1.10.2.js'></script> 
        <script src='/java_he_thong_phan_tan_admin/script/jquery-ui.js'></script> 
        <script>
            $(function () {
                $('#datepicker').datepicker();
            });
        </script> 

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <style type="text/css">
            .bs-example{
                margin: 20px;
            }
            hr{
                margin: 60px 0;
            }
        </style>
    </head>
    <body>     
        <tiles:insertAttribute name="header" />

        <tiles:insertAttribute name="content" />

        <tiles:insertAttribute name="footer" />
    </body>
</html>