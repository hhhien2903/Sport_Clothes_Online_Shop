<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<title>Quản Lý ${title}</title>
<body>
	<div class="ts-main-content">
		<%@include file="/WEB-INF/views/layouts_master/admin/admin_menu.jsp"%>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="col-md-12">
						<h2 class="page-title">Quản Lý ${title}</h2>
						<!-- Zero Configuration Table -->
						<div class="row" style="margin-bottom: 20px">
							<div class="col-md-4 col-md-offset-8">
								<form method="GET" action="<c:url value = "/admin/account/search"/>">
									<div class="search_box pull-right">
										<input type="text" name="input" placeholder="Tìm Kiếm">
											<button style="padding: 6px 12px;" type="submit" class="btn btn-inputSearch"><i class="fa fa-search"></i></button>
									</div>
								</form>	
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-heading" style="color: black;">Bảng ${title}</div>
									<div class="panel-body">
										<table class="table table-bordered table-striped">
											<thead>
												<tr>
													<th style="width: 30px%; text-align: center;">#</th>					
													<th>Mã Khách Hàng</th>
													<th>Tên Khách Hàng</th>
													<th>SĐT Khách Hàng</th>
													<th>Email</th>
													<th>Địa Chỉ</th>
													<th>Tên Tài Khoản</th>
													<th>Loại Tài Khoản</th>
													<th>Tình Trạng</th>
													<th colspan="2" style="text-align: center;">Sửa/Xoá</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${list}" var="listItem" varStatus="loop">
												<tr>
													<th scope="row" style="text-align: center;">${loop.index +1}</th>
													<td>${listItem.customer.customerID}</td>
													<td>${listItem.customer.fullName}</td>
													<td>${listItem.customer.phoneNumber}</td>
													<td>${listItem.customer.email}</td>
													<td>${listItem.customer.address}</td>
													<td>${listItem.userName}</td>
													<td>
													<c:forEach items="${listItem.listRole}" var="listRoleItem">
														${listRoleItem.role}
													</c:forEach>
													</td>
													<td>
														<c:if test="${listItem.enabled eq true}">Hoạt Động</c:if>
														<c:if test="${listItem.enabled eq false}">Ngừng Hoạt Động</c:if>
													</td>
													<td style="text-align: center;"><a href="<c:url value="/admin/account/edit?username=${listItem.userName}"/>" class="btn btn-primary" style="padding: 5px 10px; font-size: 15px;"><i class="fa fa-edit"></i></a></td>
													<c:if test="${loggedAdmin.userName ne listItem.userName}">
													<td style="text-align: center;"><a href="<c:url value="/admin/account/delete?username=${listItem.userName}"/>" class="btn btn-danger" style="padding: 5px 10px; font-size: 15px;"><i class="fas fa-trash-alt"></i></a></td>
													</c:if>
													<c:if test="${loggedAdmin.userName eq listItem.userName}">
													
													</c:if>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</body>

