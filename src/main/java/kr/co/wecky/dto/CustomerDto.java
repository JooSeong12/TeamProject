package kr.co.wecky.dto;

import java.math.BigDecimal;
import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class CustomerDto {
	@JsonProperty("cust_sn")
    private Long cust_sn;
    
    @JsonProperty("cust_nm")
    private String cust_nm;
    
    @JsonProperty("eml_addr")
    private String eml_addr;
    
    @JsonProperty("brdt")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate brdt;
    
    @JsonProperty("home_telno")
    private String home_telno;
    
    @JsonProperty("mbl_telno")
    private String mbl_telno;
    
    @JsonProperty("pridtf_no")
    private String pridtf_no;
    
    @JsonProperty("cr_nm")
    private String cr_nm;
    
    @JsonProperty("road_nm_addr")
    private String road_nm_addr;
    
    @JsonProperty("pic_sn_vl")
    private String pic_sn_vl;
    
    @JsonProperty("pic_nm")
    private String pic_nm;
    
    @JsonProperty("tkcg_dept_nm")
    private String tkcg_dept_nm;
    
    @JsonProperty("pic_role")
    private String pic_role;
    
    @JsonProperty("pic_telno")
    private String pic_telno;
    
    @JsonProperty("frst_reg_dt")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate frst_reg_dt;
    
    @JsonProperty("frst_retr_sn")
    private BigDecimal frst_retr_sn;
    
    @JsonProperty("last_mdfcn_dt")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate last_mdfcn_dt;
    
    @JsonProperty("use_yn")
    private String use_yn;

}
