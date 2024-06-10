
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>담당자 선택</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${path}/resources/css/customer.css" rel="stylesheet">
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<%--     <script src="${contextPath}/resources/js/manager.js"></script> --%>
<%--     <script src="${contextPath}/resources/js/search.js"></script> --%>
    
</head>
<body>
        <table style="margin-top: 30px;">
    <tr>
        <th>담당자명</th>
    </tr>
    <c:forEach var="dto" items="${dtos}">
        <tr>
            <td>
                <!-- 담당자 이름을 클릭하여 선택 -->
                <a href="#" onclick="selectManager(this)" id="manager-name">${dto.pic_nm}</a>
                <input type="hidden" class="hidden-value" id="p" data-type="picNm" value="${dto.pic_nm}">
                <input type="hidden" class="hidden-value" id="d" data-type="deptNm" value="${dto.tkcg_dept_nm}">
                <input type="hidden" class="hidden-value" id="r" data-type="role" value="${dto.pic_role}">
                <input type="hidden" class="hidden-value" id="t" data-type="telno" value="${dto.pic_telno}">
            </td>
        </tr>
    </c:forEach>
</table>
<script type="text/javascript">function selectManager(element) {
    var hiddenValues = element.parentElement.querySelectorAll('.hidden-value');

    var values = {};
    hiddenValues.forEach(function(hidden) {
        values[hidden.dataset.type] = hidden.value;
    });

    alert("선택된 관리자: " + values.picNm + "\n부서: " + values.deptNm + "\n역할: " + values.role + "\n전화번호: " + values.telno);

    // 부모 창에 데이터 전달
    window.opener.receiveManagerValues(values.picNm, values.deptNm, values.role, values.telno);

    // 자식 창 닫기
    window.close();
}</script>

</body>
</html>
