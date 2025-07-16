<%@page import="com.helper.UserModel"%>
<%@page import="com.helper.StringHelper"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../tiles/inc.jsp"%>
</head>
<%
	UserModel uml = (UserModel) session.getAttribute("USER_MODEL");
	String currbal ="0";// uml.getBalance();
	System.out.println(currbal + ":" + uml.getName());
	if (currbal == null) {
		currbal = "0";
	}
%>

<body>
	<%@include file="../tiles/nav.jsp"%>
	<div class="slider_area ">
		<div
			class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
			<div class="container">
				<div class="row align-items-center justify-content-center">

					<form id="station_form" action="javascript:fnSubmit();">

						<div class="popup_box ">
							<div class="popup_inner">


								<div class="row">
									<div class="col-xl-6 col-md-6">
										<label for="name">Stop Name</label> <input type="text"
											class="form-control" placeholder="Station Name"
											id="stationname" name="stationname" required="required" />

									</div>
									<div class="col-xl-6 col-md-6">
										<label for="name">Distance</label> <input type="text"
											class="form-control" placeholder="Distance From College" id="distance"
											name="distance" required="required" />

									</div>
																	<div class="col-xl-12 col-md-12">
										<button type="submit" class="genric-btn success circle ">Add
											Stop</button>
									</div>
								</div>
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../tiles/footer_inc.jsp"%>
</body>
<script type="text/javascript">
    
      function fnSubmit(){
      	 var str = $( "#station_form" ).serialize();
      // 	 alert(str);
      	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=addStation",
						str, function(data) {
							data = $.trim(data);
							alert("Done");
							//		window.location.reload();
							$('#station_form')[0].reset();

						});
	}
</script>
</html>
