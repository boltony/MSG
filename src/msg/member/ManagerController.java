package msg.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import msg.utils.Configuration;

@WebServlet("*.man")
public class ManagerController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=UTF-8");
		
		try {
		if (cmd.equals("/viewAll.man")) {
				int currentPage=1;

				String currentPageRecv = request.getParameter("currentPage");
				if(currentPageRecv!=null) {
					currentPage=Integer.parseInt(currentPageRecv);
				}

				int startNum = currentPage*Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
				int endNum = currentPage*Configuration.recordCountPerPage;

				List<MemberDTO> pageList = MemberDAO.getInstance().selectByPage(startNum, endNum);

				String navi = MemberDAO.getInstance().getPageNavi(currentPage);
				
				//dto에는 비밀번호를 제외한 모든 회원의 정보가 입력됨!
				request.setAttribute("cpage", currentPage);
				request.setAttribute("navi", navi);
				request.setAttribute("list", pageList);
				request.getRequestDispatcher("member/memberManaging.jsp").forward(request, response);
			
		}else if(cmd.equals("/blackIn.man")) {
			
			String id = request.getParameter("id");
			System.out.println(id);
			
			int result = MemberDAO.getInstance().blackIn(id);
			if(result>0) {
//				List<MemberDTO> dto = MemberDAO.getInstance().viewAll();
//				request.setAttribute("list", dto);
				
				
				int currentPage=1;

				String currentPageRecv = request.getParameter("currentPage");
				if(currentPageRecv!=null) {
					currentPage=Integer.parseInt(currentPageRecv);
				}

				int startNum = currentPage*Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
				int endNum = currentPage*Configuration.recordCountPerPage;

				List<MemberDTO> pageList = MemberDAO.getInstance().selectByPage(startNum, endNum);

				String navi = MemberDAO.getInstance().getPageNavi(currentPage);
				
				//dto에는 비밀번호를 제외한 모든 회원의 정보가 입력됨!
				request.setAttribute("cpage", currentPage);
				request.setAttribute("navi", navi);
				request.setAttribute("list", pageList);
				
				request.getRequestDispatcher("member/memberManaging.jsp").forward(request, response);
				
			}else {
				PrintWriter writer = response.getWriter();
	            writer.println("<script>alert('Error! 변경 실패!'); location.href='memberManaging.jsp';</script>");
			}
		
		}else if(cmd.equals("/blackOut.man")) {
			String id = request.getParameter("id");
			int result = MemberDAO.getInstance().blackOut(id);
			if(result>0) {
//				List<MemberDTO> dto = MemberDAO.getInstance().viewAll();
//				request.setAttribute("list", dto);
				
				
				int currentPage=1;

				String currentPageRecv = request.getParameter("currentPage");
				if(currentPageRecv!=null) {
					currentPage=Integer.parseInt(currentPageRecv);
				}

				int startNum = currentPage*Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
				int endNum = currentPage*Configuration.recordCountPerPage;

				List<MemberDTO> pageList = MemberDAO.getInstance().selectByPage(startNum, endNum);

				String navi = MemberDAO.getInstance().getPageNavi(currentPage);
				
				//dto에는 비밀번호를 제외한 모든 회원의 정보가 입력됨!
				request.setAttribute("cpage", currentPage);
				request.setAttribute("navi", navi);
				request.setAttribute("list", pageList);
				
				
				request.getRequestDispatcher("member/memberManaging.jsp").forward(request, response);
				
			}else {
				PrintWriter writer = response.getWriter();
	            writer.println("<script>alert('Error! 변경 실패!'); location.href='managerPage.jsp';</script>");
			}
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
