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
	private Long CUST_SN;
	private String CUST_NM;
	private String EML_ADDR;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate BRDT;
	private String HOME_TELNO;
	private String MBL_TELNO;
	private String PRIDTF_NO;
	private String CR_NM;
	private String ROAD_NM_ADDR;
	private String  PIC_SN_VL;
	private String  PIC_NM;
	private String TKCG_DEPT_NM;
	private String  PIC_ROLE;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate  FRST_REG_DT;
	private BigDecimal  FRST_RGTR_SN;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate LAST_MDFCN_DT;
	private String USE_YN;

}
