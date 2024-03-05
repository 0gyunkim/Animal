package com.ani.tet;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ani.service.IF_likeService;
import com.ani.vo.LikeVO;

@Controller
public class LikeController {

	@Inject
	IF_likeService likeservice;
	
	//관심 등록 하기
	@RequestMapping(value= "like", method = RequestMethod.POST)
	@ResponseBody
	public void like(LikeVO lvo) {
		likeservice.insert(lvo);
	}
	
	//관심등록 체크
		@RequestMapping(value = "likeChk", method = RequestMethod.GET)
		@ResponseBody
		public int likeChk(@RequestParam("animal_num") String animal_num, @RequestParam("member_email") String member_email) {
			
			HashMap<String,String> params =  new HashMap<String, String>();
			params.put("animal_num", animal_num);
			params.put("member_email", member_email);
			int cnt =likeservice.selectCont(params);
			System.out.println(cnt);
			return cnt;
		}
		
	
}
