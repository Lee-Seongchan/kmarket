package kr.co.kmarket.controller.cs.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.kmarket.dto.cs.ArticleDTO;
import kr.co.kmarket.service.cs.ArticleService;

@WebServlet("/cs/board/qna/list.do")
public class QnaListController extends HttpServlet {

	private static final long serialVersionUID = 3797589361217869280L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//모듈화 
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		
		
		
		//페이지 처리
		String pg = req.getParameter("pg");
		
		//페이지 관련 변수
		int start=0;
		int currentPage =1;
		int total=0;
		int lastPageNum=0;
		int pageGroupCurrent=1;
		int pageGroupStart=1;
		int pageGroupEnd=0;
		int pageStartNum=0;
		
		
		// 현재페이지계산
		if(pg!=null){
			currentPage =Integer.parseInt(pg);
		}
		
		// 전체 상품 갯수
		total = service.selectCountTotal(group,cate);
		
		//LIMIT 시작값계산
		start =(currentPage -1)*10;

		if(total%10 == 0){
			lastPageNum =(total/10);
		}else{
			lastPageNum =(total/10)+1;
		}
		
		//페이지 그룹계산
		// 페이지 그룹 계산 (5개 단위로 나누기)
		pageGroupCurrent = (int) Math.ceil(currentPage / 5.0); // 현재 페이지 그룹 계산
		pageGroupStart = (pageGroupCurrent - 1) * 5 + 1; // 페이지 그룹의 시작 페이지 계산
		pageGroupEnd = Math.min(pageGroupCurrent * 5, lastPageNum); // 페이지 그룹의 끝 페이지 계산
		
		if(pageGroupEnd > lastPageNum){
			pageGroupEnd=lastPageNum;
		}
		
		//페이지 시작번호 계산
		pageStartNum = total-start;
		
		//게시글 출력
		List<ArticleDTO> articles = service.selectArticles(group ,cate ,start);
		
		logger.debug("group = " + group);
		logger.debug("cate = " + cate);
		logger.debug(articles.toString());
		
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("index", "list");
		req.setAttribute("articles", articles);
		
		req.setAttribute("start", start);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("total", total);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupCurrent", pageGroupCurrent);
		req.setAttribute("pageGroupStart", pageGroupStart);
		req.setAttribute("pageGroupEnd", pageGroupEnd);
		req.setAttribute("pageStartNum", pageStartNum);
		
		
		// 세션을 가져옵니다.
        //HttpSession session = req.getSession();
        // 세션에서 변수를 읽어옵니다.
        //String uid = (String)session.getAttribute("sessUser");
        
        //int typed = service.selectTypeMember(uid);

        // JSON 형식으로 응답을 생성
        //logger.debug("typed = " + typed);
        
		//json 생성
		//JsonObject json = new JsonObject();
		//json.addProperty("typed", typed);
		
	
		//resp.getWriter().print(json);

		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/board/qnalist.jsp");
		dispatcher.forward(req, resp);
		
	
	}
	
	
}
