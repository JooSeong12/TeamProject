<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객정보 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${path}/resources/css/customer.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="${path}/resources/js/search.js"></script>
</head>
<body>
    <div class="header">
        <h2>고객정보 관리</h2>
    </div>

    <div class="container">
        <div class="searchbar">  
	      	<h2 style="margin-bottom: 20px;">고객 검색</h2>
                <input type="text" name="keyword" id="keyword">
               	<button type="button" name="searchType" value="condition" class="btn btn-outline-secondary btn-sm" id="condition">조건검색</button>
                <button type="button" name="searchType" value="all" class="btn btn-outline-secondary btn-sm" id="all">전체검색</button>
			<table style="height: 625px;">
				<tr>
					<td style="vertical-align: top;">
						<!-- 검색 결과 보이는곳 -->
						<div id="result"></div>
					</td>
				</tr>

			</table>
        </div>
		
        <div class="content">
         	<h2>회원정보</h2>
         	<table class="defalut">
				<tr>
					<td>**작성일자: </td>
					<td><input type="date" class="form-control form-control-sm"></td>
				</tr>
				<tr>
					<td>*고객명: </td>
					<td><input type="text" class="form-control form-control-sm"></td>
				</tr>
				<tr>
					<td>*실명번호: </td>
					<td><input type="text" class="form-control form-control-sm"></td>
				</tr>
				<tr>
					<td>*E-mail: </td>
					<td><input type="email" class="form-control form-control-sm"></td>
				</tr>
				<tr>
					<td>*전화번호: </td>
					<td><input type="text" class="form-control form-control-sm"></td>
				</tr>
				<tr>
					<td>*핸드폰번호: </td>
					<td><input type="text" class="form-control form-control-sm"></td>
				</tr>
				<tr>
					<td>*직업: </td>
					<td><input type="text" class="form-control form-control-sm"></td>
				</tr>
				<tr>
					<td>*주소: </td>
					<td><textarea class="form-control" rows='2' ></textarea></td>
				</tr>
			</table>
			<table class="defalut">
				<tr>
					<td>관리담당자: </td>
					<td>
					<div class="input-group input-group-sm">
					    <input type="text" class="form-control" aria-label="Text input with icon">
					    <span id="searchIcon" class="input-group-text"><i class="bi bi-search"></i></span>
					 </div>
					</td>
				</tr>
				<tr>
					<td>**부서: </td>
					<td><input type="text" class="form-control form-control-sm"></td>
				</tr>
				<tr>
					<td>**직위: </td>
					<td><input type="text" class="form-control form-control-sm"></td>
				</tr>
				<tr>
					<td>**연락처: </td>
					<td><input type="text" class="form-control form-control-sm"></td>
				</tr>
			</table>
        	<table id="customer"></table>
        	<table id="manager"></table>
        </div>
		
        <div class="consulting">
            <h2>상담내역</h2>
            <table style="height: 610px;">
				<tr>
					<td style="vertical-align: top;">상담내용 table</td>
				</tr>
			</table>
			<br>
			<div class="FirstLineButtons">
			    <input type="button" class="btn btn-outline-secondary btn-sm" value="등록">
			    <input type="button" class="btn btn-outline-secondary btn-sm" value="변경">
			    <input type="button" class="btn btn-outline-secondary btn-sm" value="삭제">
			    <input type="button" class="btn btn-outline-secondary btn-sm" value="신규">
			    <br>
			</div>
			<div class="secondLineButtons">
			        <input type="button" class="btn btn-outline-secondary btn-sm" value="고객조회">
			        <input type="button" class="btn btn-outline-secondary btn-sm" value="종료"">
    		</div>
        </div>
    </div>
</body>
</html>
	