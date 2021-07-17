<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<title>Thống Kê</title>
<body>
	<div class="ts-main-content">
		<%@include file="/WEB-INF/views/layouts_master/admin/admin_menu.jsp"%>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h2 class="page-title">Thống Kê</h2>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-info text-light">
												<div class="stat-panel text-center">
													<div class="stat-panel-number h1 ">${fn:length(listProducts)}</div>
													<div class="stat-panel-title text-uppercase">SẢN PHẨM</div>
												</div>
											</div>
											<a href="<c:url value="/admin/product"/>" class="block-anchor panel-footer">XEM TẤT CẢ<i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-primary text-light">
												<div class="stat-panel text-center">
													<div class="stat-panel-number h1 ">${fn:length(listOrders)}</div>
													<div class="stat-panel-title text-uppercase">ĐƠN HÀNG</div>
												</div>
											</div>
											<a href="<c:url value="/admin/order"/>" class="block-anchor panel-footer">XEM TẤT CẢ<i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-success text-light">
												<div class="stat-panel text-center">
													<div class="stat-panel-number h1 ">${fn:length(listUsers)}</div>
													<div class="stat-panel-title text-uppercase">NGƯỜI DÙNG</div>
												</div>
											</div>
											<a href="<c:url value="/admin/account"/>" class="block-anchor panel-footer">XEM TẤT CẢ<i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

