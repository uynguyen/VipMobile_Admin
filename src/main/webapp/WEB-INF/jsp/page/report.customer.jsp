<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--SPRING WEB FORM-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!--FUNC-->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="hidden" id="domain">${pageContext.request.contextPath}</div>
<div class="hidden" id="link-html">${linkHtml}</div>
<br />
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <h2 class="text-center">Danh sách khách hàng mua nhiều sản phẩm nhất</h2>
<!--            <h4 class="text-center">
                <a href="${pageContext.request.contextPath}/dashboard/report/customer.do/10">10</a> - 
                <a href="${pageContext.request.contextPath}/dashboard/report/customer.do/20">20</a> - 
                <a href="${pageContext.request.contextPath}/dashboard/report/customer.do/30">30</a> - 
                <a href="${pageContext.request.contextPath}/dashboard/report/customer.do/40">40</a> - 
                <a href="${pageContext.request.contextPath}/dashboard/report/customer.do/50">50</a> - 
                <a href="${pageContext.request.contextPath}/dashboard/report/customer.do/60">60</a> - 
                <a href="${pageContext.request.contextPath}/dashboard/report/customer.do/70">70</a> - 
                <a href="${pageContext.request.contextPath}/dashboard/report/customer.do/80">80</a> - 
                <a href="${pageContext.request.contextPath}/dashboard/report/customer.do/90">90</a> - 
                <a href="${pageContext.request.contextPath}/dashboard/report/customer.do/100">100</a>
            </h4>-->
        </div>
    </div>
    <script>
        var chooseType = function(){
            $('.menu').removeClass('active');
            $('.report-view').addClass('hide');
        }
    </script>
    <div class="row">
        <div class="col-md-12">
            <ul class="nav nav-tabs">
                <li role="presentation" id="htmlview" class="menu active">
                    <a href="#" onclick="chooseType(); 
                        if (!$('#htmlview').hasClass('active')){ 
                            $('#htmlview').addClass('active');
                            $('#html-view').removeClass('hide');
                        }">Html</a></li>
                <li role="presentation" id="pdfview"  class="menu">
                    <a href="#" onclick="chooseType(); 
                        if (!$('#pdfview').hasClass('active')){
                            $('#pdfview').addClass('active');
                            $('#pdf-view').removeClass('hide');
                        }">Pdf</a></li>
                <li role="presentation" id="excelview"  class="menu ">
                    <a href="#" onclick="chooseType(); 
                        if (!$('#excelview').hasClass('active')){
                            $('#excelview').addClass('active');
                            $('#xls-view').removeClass('hide');
                        }">Excel</a></li>
            </ul>
            <div class="report-view" id="html-view">
                <div id="html-view-body" ></div>
                <script>
                    $.ajax({
                        url: $('#link-html').text(),
                        type: "GET",
                        success: function (msg) {
                            $('#html-view-body').html(msg);
                             
                        }
                    });
                    
                                
                        
                </script>
            </div>
            <div class="report-view hide" id="pdf-view">
                <embed src="${linkPdf}" width="1024" height="700" alt="pdf" 
                       pluginspage="http://www.adobe.com/products/acrobat/readstep2.html">
            </div>
            <div class="report-view hide" id="xls-view">
                <h2 class="text-center"><a href="${linkXls}">Tải trực tiếp tại đây</a></h2>
                
            </div>
        </div>
    </div>
</div>
