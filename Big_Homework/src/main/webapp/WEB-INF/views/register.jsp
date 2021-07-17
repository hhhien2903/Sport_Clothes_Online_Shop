<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<section id="form" style="margin-bottom: 100px; margin-top: 50px;">
	<!--form-->
	<div class="container">
		<div class="row">
		<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="login-form">
					<!--login form-->
					<h2 align="center">Đăng Ký ${msg}</h2>
					<c:if test="${dupplicateUser}">
						<h2 style="text-align: center;"><font color="red">Xin lỗi, Tên Tài Khoản mà bạn vừa đăng ký bị trùng. Hãy chọn Tên Tài Khoản khác và đăng ký lại!</font></h2>
					</c:if>
					<form:form method="post" action="register" modelAttribute="user">
						<label for="userName" >Tên Tài Khoản: (*)</label>
						<form:input id="userName" placeholder="Tên Tài Khoản" path="userName" />
						<form:errors path="userName" cssClass="text-danger" htmlEscape="false"/>
					
						<label for="passWord" >Mật Khẩu: (*)</label>
						<form:input type="password" id="passWord" placeholder="Mật Khẩu" path="passWord"/>
						<form:errors path="passWord" cssClass="text-danger" htmlEscape="false" />
						
						<label for="fullName" >Họ Và Tên: (*)</label>
						<form:input id="fullName" placeholder="Họ Và Tên" path="fullName"  />
						<form:errors path="fullName" cssClass="text-danger" htmlEscape="false" />
						
						<label for="phoneNumber" >Số điện Thoại: (*)</label>
						<form:input id="phoneNumber" placeholder="Số điện Thoại" path="phoneNumber" />
						<form:errors path="phoneNumber" cssClass="text-danger" htmlEscape="false"/>
						
						<label for="email" >Email: (*)</label>
						<form:input id="email" placeholder="Email" path="email" />
						<form:errors path="email" cssClass="text-danger" htmlEscape="false"/>
						
						<label for="address" >Địa Chỉ:</label>
						<form:input id="address" placeholder="Địa Chỉ" path="address" />
	
						<form:hidden value="ROLE_USER"  path="role" />
						<form:hidden value="true"  path="enabled" />
						<form:errors path="enabled" cssClass="text-danger" htmlEscape="false" />
						<form:errors path="role" cssClass="text-danger" htmlEscape="false" />
						<button type="submit" class="btn btn-default">Đăng Ký</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form:form>
				</div>
				<!--/login form-->
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</section>

