
<%@ page import="com.helper.PassModel"%>
<%@ page import="com.helper.DBUtils"%>
<%@page import="java.util.List"%>
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

		List list = DBUtils.getBeanList(PassModel.class,
		"SELECT * FROM passdetails WHERE uid  LIKE '" + userId
				+ "' ");
		System.out.print(userId+","+um.getName());
		PassModel jm = null;
	%>

	<div class="slider_area ">
		<div
			class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
			<div class="container">

				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Sr. No</th>
								<th scope="col">From</th>
								<th scope="col">To</th>
								<th scope="col">Pass Charges</th>
								<th scope="col">Issue Date</th>
							   <th scope="col">Expiry Date</th>
							</tr>
						</thead>
					<tbody>
    <%
        for (int i = 0; i < list.size(); i++) {
            jm = (PassModel) list.get(i);
    %>
    <tr >
        <th scope="row"><%=i + 1%></th>
        <td><%=jm.getSource() != null ? jm.getSource() : "N/A"%></td>
        <td><%=jm.getDestination() != null ? jm.getDestination() : "N/A"%></td>
        <td><%=jm.getPassamt() != null ? jm.getPassamt() : "N/A"%></td>
        <td><%=jm.getIssuedate() != null ? jm.getIssuedate() : "N/A"%></td>
        <td><%=jm.getExpdate() != null ? jm.getExpdate() : "N/A"%></td>
    </tr>
    <% } %>
</tbody>
						
					</table>

				</div>
			</div>
		</div>
		<%@include file="../tiles/footer.jsp"%>
	</div>
	<%@include file="../tiles/footer_inc.jsp"%>
</body>
</html>