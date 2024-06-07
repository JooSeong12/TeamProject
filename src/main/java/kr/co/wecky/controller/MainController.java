package kr.co.wecky.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("customer")
public class MainController {
	
	@GetMapping("/manage")
	public String customerManage(){
		return "customer/customer_manage";
	}

}
