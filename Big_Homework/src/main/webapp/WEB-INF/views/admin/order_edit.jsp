<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Sửa ${title}</title>
<body>
	<div class="ts-main-content">
		<%@include file="/WEB-INF/views/layouts_master/admin/admin_menu.jsp"%>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h2 class="page-title">Sửa ${title}</h2>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<div class="panel panel-default">
									<div class="panel-heading">Sửa ${title}</div>
									<div class="panel-body">
										<form:form method="POST" action="edit" modelAttribute="order" class="form-horizontal" enctype="multipart/form-data"> 
											<div class="form-group">
												<label class="col-sm-2 control-label">Mã Đơn Hàng:</label>
												<div class="col-sm-10">
													<form:input readonly="true" value="${orderInDB.orderID}" path="orderID" class="form-control"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Mã Khách Hàng:</label>
												<div class="col-sm-10">
													<input readonly type="text" value="${editCustomerID}" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Tên Người Đặt:</label>
												<div class="col-sm-10">
													<form:input value="${orderInDB.ordererName}" path="ordererName" class="form-control"/>
													<form:errors path="ordererName" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">SĐT Người Đặt:</label>
												<div class="col-sm-10">
													<form:input value="${orderInDB.ordererPhoneNumber}" path="ordererPhoneNumber" class="form-control"/>
													<form:errors path="ordererPhoneNumber" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Ngày Đặt:</label>
												<div class="col-sm-10">
													<input readonly type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${editOrderDate}"/>" class="form-control">
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label">Tên Người Nhận:</label>
												<div class="col-sm-10">
													<form:input path="receiverName" value="${orderInDB.receiverName}" placeholder="Tên Người Nhận" class="form-control"/>
													<form:errors path="receiverName" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">SĐT Người Nhận:</label>
												<div class="col-sm-10">
													<form:input path="receiverPhoneNumber" value="${orderInDB.receiverPhoneNumber}" placeholder="SĐT Người Nhận" class="form-control"/>
													<form:errors path="receiverPhoneNumber" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Địa Chỉ Người Nhận:</label>
												<div class="col-sm-10">
													<form:input path="receiverAddress" value="${orderInDB.receiverAddress}" placeholder="Địa Chỉ Người Nhận" class="form-control"/>
													<form:errors path="receiverAddress" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Tổng Tiền:</label>
												<div class="col-sm-10">
													<input readonly type="text" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${editOrderTotal}" /> đ" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Trạng Thái:</label>
												<div class="col-sm-10">
													<form:select title="Chọn trạng thái" path="orderStatus" class="selectpicker">
														<c:if test="${editOrderStatus eq 'Đang Xử Lý'}">
															<form:option selected="true" value="Đang Xử Lý" label="Đang Xử Lý"/>
															<form:option value="Hoàn Thành" label="Hoàn Thành"/>
														</c:if>
														<c:if test="${editOrderStatus eq 'Hoàn Thành'}">
															<form:option value="Đang Xử Lý" label="Đang Xử Lý"/>
															<form:option selected="true" value="Hoàn Thành" label="Hoàn Thành"/>
														</c:if>
													</form:select>
													
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-8 col-sm-offset-2">
													<button class="btn btn-primary" type="submit" style="font-size: 14px">CẬP NHẬT</button>
												</div>
											</div>
										</form:form>

									</div>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>

