package com.library.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.library.dao.userdao;

import com.library.vo.Criteria;
import com.library.vo.PageDto;
import com.library.vo.User;

public class UserService {
	userdao dao = new userdao();
	
	public Map<String, Object> getList(Criteria cri){
		Map<String, Object> usermap = new HashMap<>();

		// 리스트 조회
		List<User> userlist = dao.getPageList(cri);
		// 총 건수
		int totalCnt = dao.getTotalCount(cri);
		
		// 페이지DTO
		PageDto pageDto = new PageDto(totalCnt, cri);
		
		
		usermap.put("userlist", userlist);
		usermap.put("usertotalCnt", totalCnt);
		usermap.put("userpageDto", pageDto);
		

		System.out.println(userlist);
		System.out.println("totalCnt" + totalCnt);
		System.out.println("getStartNo" + pageDto.getStartNo());
		System.out.println("getEndNo" + pageDto.getEndNo());
		
		
		return usermap;
	}
	public UserService() {
		// TODO Auto-generated constructor stub
	}
}
