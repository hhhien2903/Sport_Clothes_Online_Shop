<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="left-sidebar">
	<h2>Danh Mục</h2>
	<div class="panel-group category-products" id="accordian">
		<!--category-productsr-->
		<c:forEach items="${listCategories}" var="categoryItem">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordian"
							href="#category_<c:out value="${categoryItem.categoryID}"/>">
							<span class="badge pull-right"><i class="fa fa-plus"></i></span>
							${categoryItem.categoryName}
						</a>
					</h4>
				</div>
				<div id="category_<c:out value="${categoryItem.categoryID}"/>"
					class="panel-collapse collapse">
					<div class="panel-body">
						<ul>
							<li><a
								href="<c:url value="/product/1/category?categoryID=${categoryItem.categoryID}"/>">
									Tất cả sản phẩm</a></li>
							<c:forEach items="${listSuppliers}" var="supplierItem">
							<!--<c:url value = "/product/category-supplier" var = "productURL">
								<c:param name="categoryID" value="${categoryItem.categoryID}"/>
								<c:param name="supplierID" value="${supplierItem.supplierID}"/>
							</c:url>-->
								<li><a
									href="<c:url value="/product/1/category-supplier?categoryID=${categoryItem.categoryID}&supplierID=${supplierItem.supplierID}"/>">${supplierItem.supplierName}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</c:forEach>
		<!--  <div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Shoes</a></h4>
								</div>
							</div>-->
	</div>
	<!--/category-products-->

	<div class="brands_products">
		<!--brands_products-->
		<h2>Thương Hiệu</h2>
		<div class="brands-name">
			<ul class="nav nav-pills nav-stacked">
				<c:forEach items="${listSuppliers}" var="supplierItem">
					<li><a href="<c:url value="/product/1/supplier?supplierID=${supplierItem.supplierID}"/>">${supplierItem.supplierName}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!--/brands_products-->
</div>