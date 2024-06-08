package kr.co.wecky.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ManagerDto {

	private String PIC_SN_VL;
	private String PIC_NM;
	private String TKCG_DEPT_NM;
	private String PIC_ROLE;
}
