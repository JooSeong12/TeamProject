var allData;
$(document).ready(function() {
	function formatPhoneNumber(phoneNumber) {
		  return phoneNumber.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
		}
	function formatTelNumber(telNumber) {
		  return telNumber.replace(/(\d{2})(\d{3,4})(\d{4})/, '$1-$2-$3');
		}
	function formatPridtfNumber(pridtfNumber) {
		  return pridtfNumber.replace(/(\d{6})(\d{7})/, '$1-$2');
		}
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
    	  const currentDate = new Date();
    	  const formattedDate =
    	    currentDate.getFullYear() + "-" +
    	    String(currentDate.getMonth() + 1).padStart(2, '0') + "-" +
    	    String(currentDate.getDate()).padStart(2, '0');
    	  var strContent = 
    		 "<tr> <td> **작성일자: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + formattedDate + "' readonly disabled>" +
    		 		"<input type='hidden' name='last_mdfcn_dt' value='" + formattedDate + "'></td> </tr>" +
			 "<tr> <td> *고객명: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + data.cust_nm + "'</td> </tr>" +
			 "<tr> <td> *실명번호: </td>" + "<td><input type='text' class='form-control form-control-sm'value='" + formatPridtfNumber(data.pridtf_no)  + "'</td> </tr>" +
			 "<tr> <td> *E-mail: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + data.eml_addr  + "'</td> </tr>" +
			 "<tr> <td> *전화번호: </td>" + "<td><input type='text'class='form-control form-control-sm' value='" + formatTelNumber(data.home_telno)  + "'</td> </tr>" +
			 "<tr> <td> *핸드폰번호: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + formatPhoneNumber(data.mbl_telno)  + "'</td> </tr>" +
			 "<tr> <td> *직업: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + data.cr_nm  + "'</td> </tr>" +
			 "<tr> <td> *주소: </td>" + "<td><textarea class='form-control' rows='2'>" + data.road_nm_addr + "</textarea></td> </tr>";
        $("#customer").html(strContent);
         	var strManager = "<tr> <td> 관리담당자: </td>" + "<td><div class='input-group input-group-sm'>" +
         					"<input type='text'class='form-control' aria-label='Text input with icon' value='" + data.pic_nm + "'>" +
         							"<span id='searchIcon' class='input-group-text search-icon'><i class='bi bi-search'></i></span></div></td> </tr>" +
  			 "<tr> <td> **부서: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + data.tkcg_dept_nm  + "'</td> </tr>" +
  			 "<tr> <td> **직위: </td>" + "<td><input type='text' class='form-control form-control-sm'value='" + data.pic_role  + "'</td> </tr>" +
			 "<tr> <td> **연락처: </td>" + "<td><input type='text' class='form-control form-control-sm'value='" + formatPhoneNumber(data.pic_telno) +"'></td> </tr>";
        $("#manager").html(strManager);
        $(".defalut").hide();
      },
      error : function(
          errorThrown) {
        alert(errorThrown.statusText);
      }
    });
});
	
	$("#condition").on("click", function() {
	    var keyword = $("#keyword").val().trim();
	    if (keyword == "") {
	      alert('검색어를 입력하세요')
	    } else {
	      var keyname = "keyword";
	      var obj = {};
	      obj[keyname] = keyword;
	      $.ajax({
	        url : "/customerOne",
	        type : "post",
	        data : JSON
	            .stringify(obj),
	        dataType : "json",
	        contentType : "application/json",
	        success : function(data) {
	          $("#result").empty();
	          for (var i = 0; i < data.length; i++) {
	            if(i == 0){
	            	var str = "<label><input type='radio' id='" + data[i].pridtf_no + "' name='result' class='result' checked>"
	                + data[i].cust_nm
	                + "</label><br>";
		            console.log(str);
		            console.log(data[i]);
		            $("#result").append(str);
		            const currentDate = new Date();
		            const formattedDate =
		        	    currentDate.getFullYear() + "-" +
		        	    String(currentDate.getMonth() + 1).padStart(2, '0') + "-" +
		        	    String(currentDate.getDate()).padStart(2, '0');
	            	var strContent = "<tr> <td> **작성일자: </td>" + "<td><input type='text'  class='form-control form-control-sm' value='" + formattedDate + "' readonly disabled>" +
			    		 		"<input type='hidden' name='last_mdfcn_dt' value='" + formattedDate + "'></td> </tr>" +
			    				 "<tr> <td> *고객명: </td>" + "<td><input type='text'  class='form-control form-control-sm' value='" + data[i].cust_nm + "'</td> </tr>" +
			    				 "<tr> <td> *실명번호: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + formatPridtfNumber(data[i].pridtf_no)  + "'</td> </tr>" +
			    				 "<tr> <td> *E-mail: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + data[i].eml_addr  + "'</td> </tr>" +
			    				 "<tr> <td> *전화번호: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + formatTelNumber(data[i].home_telno)  + "'</td> </tr>" +
			    				 "<tr> <td> *핸드폰번호: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + formatPhoneNumber(data[i].mbl_telno)  + "'</td> </tr>" +
			    				 "<tr> <td> *직업: </td>" + "<td><input type='text'  class='form-control form-control-sm' value='" + data[i].cr_nm  + "'</td> </tr>" +
			    				 "<tr> <td> *주소: </td>" + "<td><textarea class='form-control' rows='2'>" + data[i].road_nm_addr + "</textarea></td> </tr>";
	            	var strManager = "<tr> <td> 관리담당자: </td>" + "<td><div class='input-group input-group-sm'>" +
 					"<input type='text'class='form-control' aria-label='Text input with icon' value='" + data[i].pic_nm + "'>" +
 							"<span id='searchIcon' class='input-group-text search-icon'><i class='bi bi-search'></i></span></div></td> </tr>" +
						   			 "<tr> <td> **부서: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + data[i].tkcg_dept_nm  + "'</td> </tr>" +
						   			 "<tr> <td> **직위: </td>" + "<td><input type='text' class='form-control form-control-sm' value='" + data[i].pic_role  + "'</td> </tr>" +
									 "<tr> <td> **연락처: </td>" + "<td><input type='text' class='form-control form-control-sm' value='"+ formatPhoneNumber(data[i].pic_telno) + "'></td> </tr>";
	            	$("#customer").html(strContent);
	            	$("#manager").html(strManager);
	            	$(".defalut").hide();
	            } else {
	            	var str = "<label><input type='radio' id='" + data[i].pridtf_no + "' name='result'>"
	                + data[i].cust_nm
	                + "</label><br>";
		            $("#result").append(str);
	            }
	          }
	        },
	        error : function(
	            errorThrown) {
	          alert(errorThrown.statusText);
	        }
	      });
	    }
    });
	$(document).on('click', '.search-icon', function() {
		    var jspPath = '/managerList';
		    window.open(jspPath, '_blank', 'width=300, height=500, top=50, left=50, scrollbars=yes');
		  });
});