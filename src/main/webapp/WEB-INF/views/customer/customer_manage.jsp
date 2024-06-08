<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 정보 관리</title>
</head>
<body>
<<<<<<< Updated upstream
	<h2>고객정보 관리</h2>
	
	<!-- 고객 검색, 목록 출력 부분 -->
	<table >
=======
	<h2 >고객정보 관리</h2>
	
	<!-- 고객 검색, 목록 출력 부분 -->
	<table style="margin-top: 30px;'">
>>>>>>> Stashed changes
		<tr>
			<th>고객 성명:</th>
		</tr>
		<tr>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td><input type="button" value="조건 검색"></td>
		</tr>
		<tr>
			<td><input type="button" value="전체 검색"></td>
		</tr>
		<!-- 고객명 목록 출력 반복 -->
		<%-- <c:forEach var="dto" items="${dtos}"> --%>
			<tr>
				<td>${dto.CUST_NM}</td>
			</tr>
		<%-- </c:forEach> --%>
	</table>
	
	<!-- 고객 정보 출력, 작성 부분 -->
	<table>
		<tr>
			<td>**작성일자: </td>
			<td><input type="date"></td>
		</tr>
		<tr>
			<td>*고객명: </td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>*실명번호: </td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>*E-mail: </td>
			<td><input type="email"></td>
		</tr>
		<tr>
			<td>*전화번호: </td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>*핸드폰번호: </td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>*직업: </td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>*주소: </td>
			<td><input type="text"></td>
		</tr>
	</table>
	
	<!-- 상담내역, 하단 버튼 출력 -->
	<table>
		<tr>
			<td>관리 담당자: </td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>** 부서: </td>
			<td><input type="text" readonly></td>
		</tr>
		<tr>
			<td>** 직위: </td>
			<td><input type="text" readonly></td>
		</tr>
		<tr>
			<td>** 연락처: </td>
			<td><input type="text" readonly></td>
		</tr>
	</table>
	
	
	<!-- 상담내역, 하단 버튼 출력 -->
	<div>
		<h2>상담내역: </h2>
		<table>
			<%-- <c:forEach var="dto" items="${dtos}"> --%>
				<tr>
					<td>${dto.CUST_NM}</td>
				</tr>
			<%-- </c:forEach> --%>
		</table>
		<table>
			<tr>
				<td><input type="button" value="등록"></td>
				<td><input type="button" value="변경"></td>
				<td><input type="button" value="삭제"></td>
				<td><input type="button" value="신규"></td>
			</tr>
			<tr>
				<td><input type="button" value="고객조회"></td>
				<td><input type="button" value="종료"></td>
			</tr>
		</table>
	</div>
	
</body>
</html>
