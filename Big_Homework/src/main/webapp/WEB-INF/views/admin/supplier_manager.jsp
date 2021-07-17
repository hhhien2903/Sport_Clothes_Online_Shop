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
								<form method="GET" action="<c:url value = "/admin/supplier/search"/>">
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
													<th style="width: 30px; text-align: center;">#</th>
													<c:forEach items="${tableHead}" var="tableHeadItem">
													<th>${tableHeadItem}</th>
													</c:forEach>
													<th colspan="2" style="text-align: center;">Sửa/Xoá</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${list}" var="listItem" varStatus="loop">
												<tr>
													<th scope="row" style="text-align: center;">${loop.index +1}</th>
													<td>${listItem.supplierID}</td>
													<td>${listItem.supplierName}</td>
													<td>${listItem.supplierEmail}</td>
													<td style="text-align: center;"><a href="<c:url value="/admin/supplier/edit?supplierID=${listItem.supplierID}"/>" class="btn btn-primary" style="padding: 5px 10px; font-size: 15px;"><i class="fa fa-edit"></i></a></td>
													<td style="text-align: center;"><a href="<c:url value="/admin/supplier/delete?supplierID=${listItem.supplierID}"/>" class="btn btn-danger" style="padding: 5px 10px; font-size: 15px;"><i class="fas fa-trash-alt"></i></a></td>
											
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

