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
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <link href="${contextPath}/resources/css/customer.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/search.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,100,0,0" />
<script type="text/javascript">
var childWindow;

$(document).ready(function() {
    // 클릭 이벤트 핸들러 설정
    $(document).on('click', '.search-icon', function() {
        openChild();
    });

    function openChild() {
        var jspPath = '/managerList';
        childWindow = window.open(jspPath, '_blank', 'width=1000, height=500, top=500, left=500, scrollbars=yes');
    }
});

// 부모 창에서 값을 받는 함수는 전역에 정의
function receiveManagerValues(managerName, deptName, role, telno) {
    document.getElementById("pic_nm_1").value = managerName;
    document.getElementById("tkcg_dept_nm_1").value = deptName;
    document.getElementById("pic_role_1").value = role;
    document.getElementById("pic_telno_1").value = telno;
    console.log("부모 창에서 전달된 관리자 이름: " + managerName);
}
// 함수가 제대로 정의되었는지 확인
console.log(typeof receiveManagerValues); // Should log 'function'	
</script>
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
			<div class="table-container">
			    <table class="result">
			        <tr>
			            <td style="vertical-align: top;">
			                <!-- 검색 결과 보이는곳 -->
			                <div id="result"></div>
			            </td>
			        </tr>
			    </table>
			</div>
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
               <td style="vertical-align: top;">
                  2024-06-10 오후 1시 퇴직 연금 가입 안내 미팅.<br>
                  2024-06-11 오전 10시 주식 투자 전략 논의.<br>
                  2024-06-16 오후 2시 세금 최적화 전략 논의.<br>
                  2024-06-19 오전 11시 재산 관리 방안 논의.<br>
               </td>
            </tr>
         </table>
			<br>
			<div class="FirstLineButtons">
<!-- 			    <input type="button" class="btn btn-outline-secondary btn-sm" value="등록"> -->
				<input type="button" class="btn btn-outline-secondary btn-sm" value="신규" id="clearInput">	
				<input type="button" class="btn btn-outline-secondary btn-sm" value="등록" id="insertCustomer">
			    <input type="button" class="btn btn-outline-secondary btn-sm" id="modify"value="변경">
			    <input type="button" class="btn btn-outline-secondary btn-sm" id="delete" value="삭제">
			    	<div id="customConfirmModal" class="modal">
		        		<div class="modal-content">
		        			<span class="close">&times;</span>
		        			<span class="material-symbols-outlined" style="font-size: 70px;">
							error
							</span>
				            <p>[삭제] 버튼을 클릭하면 해당 고객 정보가 삭제 됩니다. 삭제 시 복구가 불가능하므로 주의해야 합니다.</p>
				            <button id="confirmYes">확인</button>
			        	</div>
		    		</div>
<!-- 			    <input type="button" class="btn btn-outline-secondary btn-sm" value="신규"> -->
			    
			    <br>
			</div>
			
			<div class="secondLineButtons">
			        <input type="button" class="btn btn-outline-secondary btn-sm" value="고객조회">
			        <input type="button" class="btn btn-outline-secondary btn-sm" value="종료">
    		</div>
        </div>
    </div>
</body>
</html>