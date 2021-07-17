<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<body>
<h1>HTTP Status 403 - Access is denied</h1>
<h2>${msg}</h2>
<c:url value="/user/logout" var="logoutUrl" />
<a href="${logoutUrl}">Thoát</a>
</body>