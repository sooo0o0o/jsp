package kr.co.jboard.filter;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.jboard.dto.UserDTO;

@WebFilter("/*")	//모든 요청에 대해 필터 작동 -> 로그인시 유저창으로 X, 로그인없이 유저활동 X
public class LoginCheckFilter implements Filter {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		
		logger.debug("LoginCheckFilter...1");
		
		//로그인 여부 검사 (= session 검사)
		HttpServletRequest request = (HttpServletRequest)req; 	//다운캐스팅
		HttpSession session = request.getSession();
		
		UserDTO userDTO = (UserDTO) session.getAttribute("sessUser");
		
		//요청 URI 확인 (로그인 후인지 전인지 확인하기 위함)
		String uri = request.getRequestURI();	//호스트 명을 제외한 주소 = ex ) /jboard/...../list.do
		logger.debug("LoginCheckFilter...2");
		
		String ctxPath = request.getContextPath();	//jboard
		logger.debug("LoginCheckFilter...3");
		
		String path = uri.substring(ctxPath.length());	// /article/*, /user/*
		logger.debug("LoginCheckFilter...4");
		
		if(path.startsWith("/user") && !path.contains("logout.do")){
			//로그인을 한 상태에서 /user/* 요청을 하는 경우
			
			
			if(userDTO!=null) {
				//로그인 하지 않은 경우, 로그인 페이지로 이동
				HttpServletResponse response = (HttpServletResponse) resp;
				response.sendRedirect("/jboard/user/login.do?result=102");
				return;
			}
			
		}else if(path.startsWith("/article")){
			//로그인을 하지않은 상태에서 /user/* 요청을 하는 경우
			
			if(userDTO == null) {
				//로그인을 하지않은 경우
				HttpServletResponse response = (HttpServletResponse) resp;
				response.sendRedirect("/jboard/user/login.do?result=102");
				return;
			}
		}
		
	
		
	
		
		//다음 필터 이동
		chain.doFilter(req, resp);
		
		
	}

}
