package com.ani.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ani.dao.IF_likeDao;
import com.ani.vo.LikeVO;

@Service
public class LikeServiceImplement implements IF_likeService {

	@Inject
	IF_likeDao likedao;
	
	//관심등록 insert
	@Override
	public void insert(LikeVO lvo) {
		likedao.insert(lvo);
	}

	//관심등록 된 동물 리스트 selectAll
	@Override
	public List<LikeVO> selectList(String mid) {
		return likedao.selectList(mid);
	}

	@Override
	public int selectCont(HashMap<String, String> params) {	
		return likedao.selectCont(params);
	}

}
