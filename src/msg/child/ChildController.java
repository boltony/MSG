package msg.child;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import msg.child.configuration.ChildConfiguration;


@WebServlet("*.child")
public class ChildController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String userIp = request.getRemoteAddr();
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());

		System.out.println(userIp);
		System.out.println(requestURI);
		System.out.println(ctxPath);
		System.out.println(cmd);
		System.out.println();
		
		ChildDAO childDAO = ChildDAO.getInstance();
		
		try {
			if(cmd.contentEquals("/childList.child")) {
				
				int cpage = 1;
				String tmpPage = request.getParameter("cpage");
				if(tmpPage != null) {
					cpage = Integer.parseInt(tmpPage);
				}
				
				int begin = cpage * ChildConfiguration.recordCountPerPage -(ChildConfiguration.recordCountPerPage - 1);
				int end = cpage * ChildConfiguration.recordCountPerPage;
				
				List<ChildDTO> list = childDAO.selectByPage(begin, end);
				String pageNavi = childDAO.getPageNavi(cpage);
				
				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("child/childList.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
