<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section id="form" style="margin-bottom: 100px; margin-top: 50px;">
	<!--form-->
	<div class="container">
		<div class="row">
			<div class="col-sm-12" align="center">
				<div class="login-form">
					<!--login form-->
					<h2>Đăng Nhập</h2>
					<c:if test="${error}">
						<h2><font color="red">Tên Đăng Nhập hoặc Mật Khẩu không hợp lệ, hoặc Tài Khoản của bạn đã bị Ngừng Hoạt Động!</font></h2>
					</c:if>
					<c:if test="${registerSuccessfully}">
						<h2><font color="red">Chúc mừng bạn đã đăng ký thành công, mời bạn đăng nhập!</font></h2>
					</c:if>
					<form method="post"
						action="<c:url value='/user/j_spring_security_login'/>">
						<input type="text" placeholder="Tên đăng nhập" name="username" style="width: 55%" />
						<input type="password" placeholder="Mật Khẩu" name="password" style="width: 55%" />
						<button type="submit" class="btn btn-default">ĐĂNG NHẬP</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
				</div>
				<!--/login form-->
			</div>
		</div>
	</div>
</section>

