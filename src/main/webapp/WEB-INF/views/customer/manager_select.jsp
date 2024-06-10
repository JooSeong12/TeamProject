<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>담당자 선택</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${path}/resources/css/customer.css" rel="stylesheet">
</head>
<body>
	<table style="margin-top: 30px;'">
		<tr>
			<th>담당자명</th>
		</tr>
		<c:forEach var="dto" items="${dtos}">
			<tr>
				<td>${dto.pic_nm}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>