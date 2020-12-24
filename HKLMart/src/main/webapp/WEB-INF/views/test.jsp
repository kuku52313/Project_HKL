<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Document</title>
		<link rel="shortcut icon" href="/resources/img/back_exception.jpg">
	</head>
	<body>
		<form action="/fuck2?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
			<input type="file" name="file" />
			<input type="submit" value="제출" />
		</form>
	</body>
</html>
