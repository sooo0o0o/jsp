package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class FilterB implements Filter {
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		// 필터 내용
		System.out.println("FilterB doFilter...");
		
		//HTML 출력
		resp.setContentType("text/html;charset=utf-8");
				
		//다음 필터 호출
		chain.doFilter(req, resp);
	}

}
