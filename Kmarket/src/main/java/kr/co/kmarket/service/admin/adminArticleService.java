package kr.co.kmarket.service.admin;

import java.util.List;

import kr.co.kmarket.dao.admin.adminArticleDAO;
import kr.co.kmarket.dto.admin.adminArticleDTO;

public enum adminArticleService {

	instance;
	
	private adminArticleDAO dao = new adminArticleDAO();
	
	public List<adminArticleDTO> selectArticles(String group, String cate, int start){
		return dao.selectArticles(group, cate, start);
	}
	
	public int selectCountArticleTotal(String group,String cate) {
		return dao.selectCountArticleTotal(group, cate);
	}
}
