package kr.co.wecky.dto;

import java.math.BigDecimal;
import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CustomerDto {
	private Long cust_sn;
	private String cust_nm;
	private String eml_addr;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate brdt;
	private String home_telno;
	private String mbl_telno;
	private String pridtf_no;
	private String cr_nm;
	private String road_nm_addr;
	private String pic_sn_vl;
	private String pic_nm;
	private String tkcg_dept_nm;
	private String pic_role;
	private String pic_telno;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate frst_reg_dt;
	private BigDecimal frst_retr_sn;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate last_mdfcn_dt;
	private String use_yn;

}
