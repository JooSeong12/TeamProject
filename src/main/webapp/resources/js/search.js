$(document).ready(function() {
	allData();
	function formatPhoneNumber(phoneNumber) {
		  return phoneNumber.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
		}
	function formatTelNumber(telNumber) {
		  return telNumber.replace(/(\d{2})(\d{3,4})(\d{4})/, '$1-$2-$3');
		}
	function formatPridtfNumber(pridtfNumber) {
		  return pridtfNumber.replace(/(\d{6})(\d{7})/, '$1-$2');
		}
	// 레디오 버튼 선택 시 고객 detail 화면 
	$(document).on("click", "input:radio[name='result']", function(){
	var targetId = $(this).attr('id');
    var keyname = "keyword";
    var obj = {};
    obj[keyname] = targetId;
		$.ajax({
      url : "/customerInfo",
      type : "post",
      data : JSON
          .stringify(obj),
      dataType : "json",
      contentType : "application/json",
      success : function(data) {
    	  customerDetails(data);
      }
    });
});
	// 조건 검색
	$("#condition").on("click", function() {
	    var keyword = $("#keyword").val().trim();
	    if (keyword == "") {
	      alert('검색어를 입력하세요')
	    } else {
	      var keyname = "keyword";
	      var obj = {};
	      obj[keyname] = keyword;
	      searchDate(obj);
	    }
    });
	
	function searchDate(obj) {
	      $.ajax({
	        url : "/customerOne",
	        type : "post",
	        data : JSON
	            .stringify(obj),
	        dataType : "json",
	        contentType : "application/json",
	        success : function(data) {
	        	customerList(data)
	        },
	        error : function(
	            errorThrown) {
	          alert(errorThrown.statusText);
	        }
	      });
	    }

	// 전체 데이터
	function allData() {
        $.ajax({
            url: "/customerList",
            type: "post",
            dataType: "json",
            contentType: "application/json",
            success: function(data) {
            	customerList(data);
            },
            error: function(errorThrown) {
                alert(errorThrown.statusText);
            }
        });
    }
	
	// 전체/조건 검색 공통
	 function customerList(data) {
	        $("#result").empty();
	        for (var i = 0; i < data.length; i++) {
	            var str = "<label><input type='radio' id='" + data[i].pridtf_no + "' name='result' class='result' " + (i == 0 ? "checked" : "") + ">"
	                + data[i].cust_nm
	                + "</label><br>";
	            $("#result").append(str);

	            if (i == 0) {
	                customerDetails(data[i]);
	            }
	        }
	 }
	
    function customerDetails(data) {
        const currentDate = new Date();
        const formattedDate =
            currentDate.getFullYear() + "-" +
            String(currentDate.getMonth() + 1).padStart(2, '0') + "-" +
            String(currentDate.getDate()).padStart(2, '0');

        var strContent = "<tr> <td> **작성일자: </td>" + "<td><input type='text'  class='form-control form-control-sm' value='" + formattedDate + "' readonly disabled>" +
            "<input type='hidden' name='last_mdfcn_dt' value='" + formattedDate + "'></td> </tr>" +
            "<tr> <td> *고객명: </td>" + "<td><input type='text' name='cust_nm' class='form-control form-control-sm' value='" + data.cust_nm + "'></td> </tr>" +
            "<tr> <td> *실명번호: </td>" + "<td><input type='text' name='pridtf_no' class='form-control form-control-sm' value='" + formatPridtfNumber(data.pridtf_no)  + "'></td> </tr>" +
            "<tr> <td> *E-mail: </td>" + "<td><input type='text' name='eml_addr' class='form-control form-control-sm' value='" + data.eml_addr  + "'></td> </tr>" +
            "<tr> <td> *전화번호: </td>" + "<td><input type='text' name='home_telno' class='form-control form-control-sm' value='" + formatTelNumber(data.home_telno)  + "'></td> </tr>" +
            "<tr> <td> *핸드폰번호: </td>" + "<td><input type='text' name='mbl_telno' class='form-control form-control-sm' value='" + formatPhoneNumber(data.mbl_telno)  + "'></td> </tr>" +
            "<tr> <td> *직업: </td>" + "<td><input type='text' name='cr_nm' class='form-control form-control-sm' value='" + data.cr_nm  + "'></td> </tr>" +
            "<tr> <td> *주소: </td>" + "<td><textarea name='road_nm_addr' class='form-control' rows='2'>" + data.road_nm_addr + "</textarea></td> </tr>";
        
        var strManager = "<tr> <td> 관리담당자: </td>" + "<td><div class='input-group input-group-sm'>" +
            "<input type='text'class='form-control' name='pic_nm' aria-label='Text input with icon' value='" + data.pic_nm + "'>" +
            "<span id='searchIcon' class='input-group-text search-icon'><i class='bi bi-search'></i></span></div></td> </tr>" +
            "<tr> <td> **부서: </td>" + "<td><input type='text' name='tkcg_dept_nm' class='form-control form-control-sm' value='" + data.tkcg_dept_nm  + "' readonly disabled></td> </tr>" +
            "<tr> <td> **직위: </td>" + "<td><input type='text'name='pic_role' class='form-control form-control-sm' value='" + data.pic_role  + "' readonly disabled></td> </tr>" +
            "<tr> <td> **연락처: </td>" + "<td><input type='text' name='pic_telno' class='form-control form-control-sm' value='"+ formatPhoneNumber(data.pic_telno) + "' readonly disabled></td> </tr>";

        $("#customer").html(strContent);
        $("#manager").html(strManager);
        $(".defalut").hide();
    }
	
	$("#all").on("click", function() {
		allData();
	});
	
	$(document).on('click', '.search-icon', function() {
		    var jspPath = '/managerList';
		    window.open(jspPath, '_blank', 'width=300, height=500, top=50, left=50, scrollbars=yes');
	});
	
	// 고객 삭제 코드
	$("#delete").click(function() {
	    var targetId = $("input:radio[name='result']:checked").attr('id'); // 선택된 라디오 버튼(고객)의 ID
	    if (!targetId) {
	        alert("삭제할 고객을 선택해주세요.");
	        return;
	    }
	    console.log(targetId)
	    $.ajax({
	        type: "POST",
	        url: "/deleteCustomer",
	        contentType: "application/json",
	        data: JSON.stringify({ pridtf_no: targetId }),
	        success: function(response) {
	            if (response === "success") { // 서버에서 문자열로 반환하므로 비교할 값도 문자열로 변경
	                alert("고객이 삭제되었습니다.");
	                
	                if($("#keyword").val().trim() != ""){
	                	searchDate(keyword)
	                } else {
	                	allData();
	                } 
	            } else {
	                alert("고객 삭제에 실패했습니다. 다시 시도해주세요.");
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX 요청 중 에러 발생:", error);
	            alert("고객 삭제에 실패했습니다. 서버와의 통신에 문제가 발생했습니다.");
	        }
	    });
	});
	//신규버튼
	$(clearValue).on('click', function(){
		$("input[type='text']").val("");
		$("input[type='email']").val("");
		$("input[type='date']").val("");
		$("textarea").val("");
	});
	
	//신규고객 등록
	$("#insertCustomer").on("click", function() {
		
		var cust_nm = $("#cust_nm").val();
		var pridtf_no = $("#pridtf_no").val();
		var eml_addr = $("#eml_addr").val();
		var home_telno = $("#home_telno").val();
		var mbl_telno = $("#mbl_telno").val();
		var cr_nm = $("#cr_nm").val();
		var road_nm_addr = $("#road_nm_addr").val();
		
        var dto = {
            cust_nm: cust_nm,
            pridtf_no: pridtf_no,
            eml_addr: eml_addr,
            home_telno: home_telno,
            mbl_telno: mbl_telno,
            cr_nm: cr_nm,
            road_nm_addr: road_nm_addr
        };
        
        $.ajax({
        	anyne:true,
    		type:'POST',
    		data: JSON.stringify(dto),
    		url:"/insertCustomer",
    		dataType: "text",
    		success : function(data) {
                alert("Data successfully sent to the server.");
            },
            error: function(xhr, status, error) {
                console.error(error);
                alert("An error occurred while sending the data.");
            }
        });
    });
});
