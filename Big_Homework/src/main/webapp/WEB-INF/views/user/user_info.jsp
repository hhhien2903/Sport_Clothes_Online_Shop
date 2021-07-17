<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<title>THÔNG TIN CÁ NHÂN</title>
<body>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<%@include file="/WEB-INF/views/layouts_master/user/user_menu.jsp"%>
				</div>
				<div class="col-sm-9 padding-right" style="margin-bottom: 100px">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">THÔNG TIN</h2>

						<div class="card sm-12" style="color: #696763; margin-left: 15px;margin-right: 15px">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-5" style="padding-left: 80px;">
										<h4 class="mb-0">Họ Và Tên:</h4>
									</div>
									<div class="col-sm-7 text-secondary">
										<h4>${loggedUser.customer.fullName}</h4>
									</div>
								</div>
								<hr
									style="margin-top: 5px; margin-bottom: 5px; border-top: 1px solid rgba(0, 0, 0, .1);">
								<div class="row">
									<div class="col-sm-5" style="padding-left: 80px;">
										<h4 class="mb-0">Số Điện Thoại:</h4>
									</div>
									<div class="col-sm-7 text-secondary">
										<h4>${loggedUser.customer.phoneNumber}</h4>
									</div>
								</div>
								<hr
									style="margin-top: 5px; margin-bottom: 5px; border-top: 1px solid rgba(0, 0, 0, .1);">
								<div class="row">
									<div class="col-sm-5" style="padding-left: 80px;">
										<h4 class="mb-0">Địa Chỉ:</h4>
									</div>
									<div class="col-sm-7 text-secondary">
										<h4>${loggedUser.customer.address}</h4>
									</div>
								</div>
								<hr
									style="margin-top: 5px; margin-bottom: 5px; border-top: 1px solid rgba(0, 0, 0, .1);">
								<div class="row">
									<div class="col-sm-5" style="padding-left: 80px;">
										<h4 class="mb-0">Email:</h4>
									</div>
									<div class="col-sm-7 text-secondary">
										<h4>${loggedUser.customer.email}</h4>
									</div>
								</div>
								<hr
									style="margin-top: 5px; margin-bottom: 5px; border-top: 1px solid rgba(0, 0, 0, .1);">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>