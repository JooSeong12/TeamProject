package kr.co.wecky.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.wecky.dto.CustomerDto;
import kr.co.wecky.dto.ManagerDto;
import kr.co.wecky.mapper.CustomerMapper;

@Service
public class CustomerService {
	
	@Autowired
	CustomerMapper mapper;

	public List<CustomerDto> customerList() {
		return mapper.customerList();
	}

	public List<CustomerDto> searchCustomer(String keyword) {
		return mapper.searchCustomer(keyword);
	}

	public CustomerDto customerInfo(String keyword) {
		return mapper.customerInfo(keyword);
	}

	public List<ManagerDto> managerList() {
		return mapper.managerList();
	}
	
	public void deleteCustomer(String pridtf_no) {
		mapper.deleteCustomer(pridtf_no);
	}


	public void insertCustomer(CustomerDto customerDto) {
		mapper.insertCustomer(customerDto);

	public void updateCustomer(CustomerDto customerDto) {
		mapper.updateCustomer(customerDto);
		

	}
	
}
