$(document).ready(function() {
	//신규고객 등록
	$("#insertCustomer").on("click", function() {
        var cust_nm = $("#cust_nm_1").val();
        var pridtf_no = $("#pridtf_no_1").val();
        var eml_addr = $("#eml_addr_1").val();
        var home_telno = $("#home_telno_1").val();
        var mbl_telno = $("#mbl_telno_1").val();
        var cr_nm = $("#cr_nm_1").val();
        var road_nm_addr = $("#road_nm_addr_1").val();

        // 가져온 값들을 객체로 만듦
        var customerDto = {
        	cust_nm: cust_nm,
        	pridtf_no: pridtf_no,
        	eml_addr: eml_addr,
        	home_telno: home_telno,
        	mbl_telno: mbl_telno,
        	cr_nm: cr_nm,
        	road_nm_addr: road_nm_addr
        };
        console.log(customerDto);
        
        // AJAX 요청으로 서버에 데이터 전송
        $.ajax({
            url: "/insertCustomer",
            type: "post",
            data: JSON.stringify(customerDto),
            contentType: "application/json",
            success: function(response) {
                alert("고객 정보가 성공적으로 저장되었습니다.");
                allData();
            },
            error: function(error) {
                alert("고객 정보 저장 중 오류가 발생했습니다.");
            }
			
        });
    });
});