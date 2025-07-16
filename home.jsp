<%@ page import="com.helper.UserModel" %>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../tiles/inc.jsp"%>
</head>
<body>
<%@include file="../tiles/nav.jsp"%>


<%
UserModel u=null;

%>
 <div class="slider_area ">
        <div class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <h1>Welcome <span class="white-text"> </span></h1>
                 
                </div>
            </div>
        </div>
    </div>
<%@include file="../tiles/footer.jsp"%>
</body>
</html>