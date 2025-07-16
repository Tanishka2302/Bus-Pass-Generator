<%@ page import="com.helper.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../tiles/inc.jsp"%>
</head>
<body>
	<%@include file="../tiles/nav.jsp"%>


	<div class="slider_area ">
		<div
			class="single_slider d-flex align-items-center justify-content-center slider_bg_1">

			<div class="container">
				<div class="row align-items-center justify-content-center">

					<!--Registration form -->
					<form id="reg_form" class="mt-4" action="javascript:fnReg()";>
						<div class="popup_box ">
							<div class="popup_inner">
								
								<div class="row">
									<div class="col-xl-12 col-md-12	">
										<label class="label" for="name">Register As Student
											<input type="radio" id="roleid" name="roleid" 
											value="2" checked="checked" />
										</label>
									</div>
									<div class="col-xl-6 col-md-6">
										<input type="text" name="fname" id="fname"
											placeholder="Enter First Name">
									</div>
									<div class="col-xl-6 col-md-6">
										<input type="text" name="lname" id="lname"
											placeholder="Enter Last Name">
									</div>
									<div class="col-xl-6 col-md-6">
										<input type="email" name="emailid" id="emailid"
											placeholder="Enter Email">
									</div>
									<div class="col-xl-6 col-md-6">
										<input type="text" name="username" id="username"
											placeholder="Enter Username">
									</div>
									<div class="col-xl-6 col-md-6">
										<input type="password" name="userpass" id="userpass"
											placeholder="Password">
									</div>
									<div class="col-xl-6 col-md-6">
										<input type="text" name="phoneno" id="phoneno" pattern="[0-9]{10}"
											title="Accepted 10 Digit Only" placeholder="Mobile Number"
											required="required">
									</div>
									<div class="col-xl-6 col-md-6">
										<input type="text" name="imei" id="imei" 
										placeholder="IMI Number" required="required">
									</div>
                                    <div class="col-xl-6 col-md-6">
										<input type="text" name="cardno" id="cardno"
											placeholder="card Id">
									</div>
									
									
									<div class="col-xl-12">
										<button type="submit" class="boxed_btn_orange">Sign
											Up</button>
									</div>


								</div>
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@include file="../tiles/footer_inc.jsp"%>
</body>
<script type="text/javascript">
	
</script>
<script type="text/javascript">
function fnReg(){
	var str = $("#reg_form").serialize();
// 	alert(str);
	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=passRegister",
						str,
						function(data) {
							data = $.trim(data);
							if (data == 1) {

								window.alert("Pass Generated Successfully!");
							} else {
								alert("Error");
							}
							$('#reg_form')[0].reset();
						});
	}
</script>
</html>