package kr.co.wecky.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class managerDto {

	private String  PIC_SN_VL;
	private String TKCG_DEPT_NM;
	private String FRST_REG_DT;
	private String FRST_RGTR_SN;
	private String LAST_MDFCN_DT;
	private String USE_YN;
	

}
