<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.DBUtils"%>
<%@page import="com.helper.UserModel"%>
<%@page import="com.database.ConnectionManager"%>
<%@page import="com.helper.PassModel"%>
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
		String userId = um.getUid();
		String Uname = um.getName();
	%>
	<div class="slider_area ">
		<div
			class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
			<div class="container">

				<div class="row align-items-center justify-content-center">
					<form id="form_journey" action="javascript:fnSubmit();">
						<div class="fade-left">
							<div id="note" class="alert alert-warning" role="alert">
								Welcome <span class="text-capitalize text-dark"><%=Uname%></span>,
								Enquiry your pass charges
							</div>
						</div>
						<div class="popup_box ">
							<div class="popup_inner">
								<h3>Calculate Pass Charges</h3>
								<div class="row">
									<div class="col-xl-6 col-md-6">
										<input type="hidden" name="userId" value="<%=userId%>" /> <label
											for="name">FROM</label> <select id="from" name="from"
											class="form-select">
											<option selected>From Station</option>
											<%
												HashMap hm1 = null;
												List list = ConnectionManager.getStation();
												if (list.size() > 0) {
													for (int i = 0; i < list.size(); i++) {
														hm1 = (HashMap) list.get(i);
											%>
											<option value="<%=hm1.get("sid")%>"><%=hm1.get("stationname")%></option>
											<%
												}
												}
											%>

										</select>
									</div>
									<div class="col-xl-6 col-md-6">

										<label for="name">TO</label> <select id="to" name="to"
											class="form-select">
											<option>To Station</option>
											<%
												HashMap hm2 = null;
												List l = ConnectionManager.getStation();
												if (l.size() > 0) {
													for (int i = 0; i < l.size(); i++) {
														hm2 = (HashMap) l.get(i);
											%>
											<option value="<%=hm2.get("sid")%>"><%=hm2.get("stationname")%></option>
											<%
												}
												}
											%>

										</select>
									</div>
									
									<div class="col-xl-6 col-md-6">
										<label for="date">Start Select Date:</label> <input
											type="date" id="source" name="source">
									</div>
									<div class="col-xl-6 col-md-6">
										<label for="date">End Select Date:</label> <input type="date"
											id="destination" name="destination">
									</div>
																		<div class="col-xl-4 col-md-4 mt-4">
										<h2 class="text-white">Fare :</h2>
									</div>
									<div class="col-xl-4 col-md-4 mt-4">
										<h2 class="text-warning" id="fare" name="fare">0</h2>
									</div>

									<div class="col-xl-4 mt-4  text-center">
										<button type="submit" class=" genric-btn success circle">Charges
										</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%@include file="../tiles/footer.jsp"%>
	</div>
	<%@include file="../tiles/footer_inc.jsp"%>
</body>
<script>

function fnSubmit(){
	if ($("#from").val()==$("#to").val()){
		alert("Do Not Select Same Station.");
	}
	else{
		var str = $("#form_journey").serialize();
	
 	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=showJourneyFare",
							str,
							function(data) {
								data = $.trim(data);
								document.getElementById('fare').innerHTML = data;
							});
		}
	}
	$("#note").show().delay(5000).hide(0);
</script>
</html>