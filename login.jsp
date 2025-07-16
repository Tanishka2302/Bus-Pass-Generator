<%@page import="com.helper.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../tiles/inc.jsp"%>
</head>
<body>

	<%
		UserModel um = null;
		String role = "", name = "", uid = "";
		boolean isUser = false;
		boolean isAdmin = false;
		if (session.getAttribute("USER_MODEL") != null) {
			um = (UserModel) session.getAttribute("USER_MODEL");
			if (um.getRole().equalsIgnoreCase("2")) { // user
				role = "User";
				uid = um.getUid();
				isUser = true;
			} else if (um.getRole().equalsIgnoreCase("1")) {
				role = "Administrator";
				uid = um.getUid();
				isAdmin = true;
			}

		}
	%>
	<div class="slider_area ">
		<div
			class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-xl-7 col-md-7">
						<div class="slider_info">

							<h3>Bus Pass Generate System</h3>
							<h4 class="text-info">Simple To Travel Just With Pass</h4>

							<a href="#form_login"
								class="login popup-with-form genric-btn success circle ">Let's
								Log In</a>
							<!-- 								<a href="activity_a://a">Activity A</a> -->
							<!-- 								<a href="activity_b://b">Activity B</a> -->
						</div>
					</div>

					<!-- Sign in-->
					<form id="form_login" class="white-popup-block mfp-hide"
						action="javascript:fnSubmit();">
						<div class="popup_box ">
							<div class="popup_inner">
								<div class="logo text-center">
									<a href="#"> <img
										src="<%=request.getContextPath()%>/theme/img/logo.png" alt="">
									</a>
								</div>
								<h3>Sign in</h3>

								<div class="row">
									<div class="col-xl-12 col-md-12">
										<input type="text" name="username" id="username"
											placeholder="User Name">
									</div>
									<div class="col-xl-12 col-md-12">
										<input type="password" name="password" id="password"
											placeholder="Password">
									</div>
									<div class="col-xl-12">
										<button type="submit" class="boxed_btn_orange">Sign
											in</button>
									</div>
								</div>

								<p class="dont-hav-acc">
									Not Register? <a class="dont-hav-acc" href="#reg_form">Sign
										Up</a>
								</p>
							</div>
						</div>
					</form>
					<!-- form itself end -->

					<!--Registration form -->
					<form id="reg_form" class="white-popup-block mfp-hide"
						action="javascript:fnReg()";>
						<div class="popup_box ">
							<div class="popup_inner">
								<!-- 								<div class="logo text-center"> -->
								<!-- 									<a href="#"> <img -->
								<%-- 										src="<%=request.getContextPath()%>/theme/img/logo.png" alt=""> --%>
								<!-- 									</a> -->
								<!-- 								</div> -->
								<h3>Registration</h3>

								<div class="row">
									<div class="col-xl-12 col-md-12">
										<label class="label" for="role">Select Role: <select
											id="role" name="role" onchange="toggleFields()">
												<option value="1">Student</option>
												<option value="2">Admin</option>
										</select>
										</label>
									</div>
									<!-- 							// role, name, mobile, email, enrollno, address, username, userpass -->
									<div class="col-xl-6 col-md-6">
										<input type="text" name="fname" id="fname"
											placeholder="Enter First Name">
									</div>
									<div class="col-xl-6 col-md-6">
										<input type="text" name="lname" id="lname"
											placeholder="Enter Last Name">
									</div>
									<div class="col-xl-6 col-md-6">
										<input type="email" name="email" id="email"
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
										<input type="Password" name="cpassword" id="cpassword"
											placeholder="Confirm password"> <span
											class="font-weight-bold text-center" id='message'></span>
									</div>
																	<div class="col-xl-6 col-md-6">
										<input type="text" name="mobile" id="mobile" title=""
											placeholder="Enter Phone No.">
									</div>
										<div class="col-xl-6 col-md-6">
										<input type="text" name="enrollno" id="enrollno"
											placeholder="Enter Enroll No">
									</div>
									<div class="col-xl-12 col-md-12">
										<input type="text" name="address" id="address"
											placeholder="Enter Address">
									</div>


									<div class="col-xl-12">
										<button type="submit" class="boxed_btn_orange">Sign
											Up</button>
									</div>
								</div>

							</div>
						</div>
					</form>
					<!-- form itself end -->

				</div>
			</div>
		</div>
	</div>
	<%@include file="../tiles/footer_inc.jsp"%>
</body>
<script type="text/javascript">
$('#userpass, #cpassword').on('keyup', function () {
	  if ($('#userpass').val() == $('#cpassword').val()) {
	    $('#message').html('Matching').css('color', 'cyan');
	  } else 
	    $('#message').html('Not Matching').css('color', 'red');
	});
	
	  function toggleFields() {
        var roleSelect = document.getElementById("role");
        var add = document.getElementById("address");
        var enroll = document.getElementById("enrollno");

        if (roleSelect.value == "2") { // Admin
            add.style.display = "none";
            enroll.style.display = "none";
        } else {
            add.style.display = "block";
            enroll.style.display = "block";
        }
    }
	  </script>
<script type="text/javascript">
 
function fnSubmit(){	
	var str = $("#form_login" ).serialize();
	//alert(str);
	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=checkLogin",
						str, function(data) {
		
		                    data = $.trim(data);
								if (data==1) {	
<%-- 									if(<%=um.getRoleid()%>=="1"){ --%>
                               window.location.href="<%=request.getContextPath()%>/pages/index.jsp";    
<%-- 									}if(<%=um.getRoleid()%>=="2"){ --%>
<%-- 										WINDOW.LOCATION.HREF="<%=REQUEST.GETCONTEXTPATH()%>/PAGES/ADDSTATION.JSP";     --%>
								//	}
								     
									
							}else {
								alert("Please Enter Valid Credentials");
							}
							$('#form_login')[0].reset();
						});
}


	//registration form
	function fnReg(){
	var str = $("#reg_form").serialize();
// 	alert(str);
	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=registerNewUser",
						str, function(data) {
							data = $.trim(data);
							if (data==1) {
								
								window.location.href="<%=request.getContextPath()%>/pages/login.jsp";
							} else {
								alert("Error");
							}
							$('#reg_form')[0].reset();
						});
	}
</script>
</html>