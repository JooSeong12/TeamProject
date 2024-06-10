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

	private String pic_sn_vl;
	private String pic_nm;
	private String tkcg_dept_nm;
	private String pic_role;
	private String pic_telno;
	
}
