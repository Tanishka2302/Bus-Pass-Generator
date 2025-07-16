<%@ page import="com.helper.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <%@include file="../tiles/inc.jsp"%>
   </head>
   <%
      UserModel uml = (UserModel) session.getAttribute("USER_MODEL");
      %>
   <body>
      <%@include file="../tiles/nav.jsp"%>
      <div class="slider_area ">
         <div
            class="single_slider d-flex align-items-center justify-content-center slider_bg_1">            
               <div class="row align-items-center justify-content-center">
               <div class="container">
                  <form id="update_form" class="mt-4" action="javascript:fnSubmit()";>
                     <div class="popup_box">
                        <div class="popup_inner">
                           <div class="row">
                              <div class="col-xl-6 col-md-6">
                                 <label for="name">First Name</label> <input type="text"
                                    class="form-control" style="text-transform: capitalize;"
                                    id="fname" name="fname" tabindex="1"
                                    placeholder="Enter Full Name" required="required"
                                    maxlength="20" value="<%=um.getName()%>" disabled="disabled" />
                              </div>
                             
                              <div class="col-xl-6 col-md-6">
                                 <label for="email"> Email Address</label> <span
                                    class="input-group-addon"><span
                                    class="glyphicon glyphicon-envelope"></span> </span> <input
                                    type="email" class="form-control" tabindex="3" name="emailid"
                                    id="emailid" placeholder="Enter email" required="required"
                                    onchange="checkEmail();" value="<%=um.getEmail()%>" disabled="disabled"/>
                              </div>
                              <div class="col-xl-6 col-md-6">
                                 <label for="name">Phone No</label> <input type="text"
                                    class="form-control" name="phoneno" tabindex="5" id="phoneno"
                                    placeholder="Enter Phone No" required="required"
                                    maxlength="10" value="<%=um.getMobile()%>"
                                    disabled="disabled" />
                              </div>
                              <div class="col-xl-12 col-md-12">
                                 <label for="name">Address</label>
                                 <!-- <input type="text" class="form-control" tabindex="5"  name="address" id="address" value="" placeholder="Enter Address" required="required" /> -->
                                 <textarea
                                       tabindex="7" placeholder="Enter Address" draggable="false"
                                    class="form-control" name="address" id="address"><%=um.getAddress()%></textarea>
                               </div>
                           <div class="col-xl-6 col-md-6">
                              <label for="name">Enroll </label> <input type="text"
                                 class="form-control" name="enrollno" id="enrollno" tabindex="4"
                                 placeholder="Enroll" required="required"
                                 value="<%=um.getEnrollno()%>" disabled="disabled" />
                           </div>
                           <div class="col-xl-6 col-md-6">
                              <label for="name">User Name </label> <input type="text"
                                 class="form-control" id="username" name="username"
                                 tabindex="6" placeholder="User Name" required="required"
                                 onchange="checkUsername();" value="<%=um.getUsername()%>"
                                 disabled="disabled" />
                           </div>
                           <div class="col-xl-6 col-md-6">
                              <label for="name">Password</label> <input type="password"
                                 class="form-control" id="userpass" tabindex="8"
                                 value="<%=um.getUserpass()%>" placeholder="Enter Password"
                                 name="userpass" required="required" />
                           </div>
                           <div class="col-xl-6 col-md-6">
                              <label for="name">Confirm Password</label> <input
                                 type="password" class="form-control" name="cuserpass"
                                 tabindex="9" id="cuserpass"
                                 placeholder="Enter Confirm Password" required="required" />
                              <span id="message"></span>
                           </div>
                           <div class="col-xl-12 col-md-12">
                              <button type="submit" class="genric-btn success circle "
                                 tabindex="11">Update</button>
                           </div>
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
   <script>
      $('#userpass, #cuserpass').on('keyup', function () {
      	  if ($('#userpass').val() == $('#cuserpass').val()) {
      	    $('#message').html('Matching').css('color', 'cyan');
      	  } else 
      	    $('#message').html('Not Matching').css('color', 'red');
      	});
      function fnSubmit(){
      	
      	
      	 var str = $( "#update_form" ).serialize();
      // 	 alert(str);
      	$.post("<%=request.getContextPath()%>/tiles/ajax.jsp?methodId=updateProfile",
      						str, function(data) {
      							data = $.trim(data);
      							// 			alert(data);
      							window.location.reload();
      							$('#update_form')[0].reset();
      						});
      	}
   </script>
</html> 
