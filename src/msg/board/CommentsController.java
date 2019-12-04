package msg.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import msg.member.MemberDTO;
import msg.utils.Configuration;

@WebServlet("*.co")
public class CommentsController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF8");
		response.setCharacterEncoding("UTF8");
		String requestURI = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = requestURI.substring(ctx.length());
		CommentsDAO dao = CommentsDAO.getInstance();
		
		try {
			if(cmd.contentEquals("/write.co")) {
				System.out.println("write.co");
				int root = Integer.parseInt(request.getParameter("root"));
				String writer = ((MemberDTO)request.getSession().getAttribute("loginInfo")).getId();
				String comments = request.getParameter("comments");
				int seq = dao.getSeq();
				
				CommentsDTO dto = new CommentsDTO(seq, root, writer, comments, null, null);
				dao.write(dto);
//				댓글 currentCoPage
				int currentCoPage=1;
				System.out.println("currentCoPage : "+request.getParameter("currentCoPage"));
				String currentPageRecv = request.getParameter("currentCoPage");
				if(currentPageRecv!=null) {
					currentCoPage=Integer.parseInt(currentPageRecv);
				}
				System.out.println("currentCoPage : "+currentCoPage);
				int startNum = currentCoPage*Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
				int endNum = currentCoPage*Configuration.recordCountPerPage;
				
				List<CommentsDTO> pageList = CommentsDAO.getInstance().selectCommentByPage(root, startNum, endNum);
				Gson g = new Gson();
				String coNavi = CommentsDAO.getInstance().getPageNavi(currentCoPage, root);

				JsonObject json = new JsonObject();
				json.addProperty("list", g.toJson(pageList));
				json.addProperty("coNavi", coNavi);
				json.addProperty("currentCoPage", 1);

				PrintWriter pw = response.getWriter();
				pw.append(json.toString());
				
			}else if(cmd.contentEquals("/delete.co")) {
				System.out.println("delete.co 도착");
				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.delete(seq);
				int root = Integer.parseInt(request.getParameter("root"));
				int currentCoPage=1;
				System.out.println("currentCoPage : "+request.getParameter("currentCoPage"));
				String currentPageRecv = request.getParameter("currentCoPage");
				if(currentPageRecv!=null) {
					currentCoPage=Integer.parseInt(currentPageRecv);
				}
				System.out.println("currentCoPage : "+currentCoPage);
				int startNum = currentCoPage*Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
				int endNum = currentCoPage*Configuration.recordCountPerPage;
				
				List<CommentsDTO> pageList = CommentsDAO.getInstance().selectCommentByPage(root, startNum, endNum);
				Gson g = new Gson();
				String coNavi = CommentsDAO.getInstance().getPageNavi(currentCoPage, root);

				JsonObject json = new JsonObject();
				json.addProperty("list", g.toJson(pageList));
				json.addProperty("coNavi", coNavi);
				json.addProperty("currentCoPage", 1);

				PrintWriter pw = response.getWriter();
				pw.append(json.toString());
			}else if(cmd.contentEquals("/update.co")) {
				System.out.println("update.co 도착");
				int seq = Integer.parseInt(request.getParameter("seq"));
				String comments = request.getParameter("comments");
				int root = Integer.parseInt(request.getParameter("root"));
				dao.update(seq, comments);
				int currentCoPage=1;
				System.out.println("currentCoPage : "+request.getParameter("currentCoPage"));
				String currentPageRecv = request.getParameter("currentCoPage");
				if(currentPageRecv!=null) {
					currentCoPage=Integer.parseInt(currentPageRecv);
				}
				System.out.println("currentCoPage : "+currentCoPage);
				int startNum = currentCoPage*Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
				int endNum = currentCoPage*Configuration.recordCountPerPage;
				
				List<CommentsDTO> pageList = CommentsDAO.getInstance().selectCommentByPage(root, startNum, endNum);
				Gson g = new Gson();
				String coNavi = CommentsDAO.getInstance().getPageNavi(currentCoPage, root);

				JsonObject json = new JsonObject();
				json.addProperty("list", g.toJson(pageList));
				json.addProperty("coNavi", coNavi);
				json.addProperty("currentCoPage", 1);

				PrintWriter pw = response.getWriter();
				pw.append(json.toString());
			}else if(cmd.contentEquals("/commetsList.co")) {
				int root = Integer.parseInt(request.getParameter("root"));
//				댓글 currentCoPage
				int currentCoPage=1;
				System.out.println("currentCoPage : "+request.getParameter("currentCoPage"));
				String currentPageRecv = request.getParameter("currentCoPage");
				if(currentPageRecv!=null) {
					currentCoPage=Integer.parseInt(currentPageRecv);
				}
				System.out.println("currentCoPage : "+currentCoPage);
				int startNum = currentCoPage*Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
				int endNum = currentCoPage*Configuration.recordCountPerPage;
				
				List<CommentsDTO> pageList = CommentsDAO.getInstance().selectCommentByPage(root, startNum, endNum);
				Gson g = new Gson();
				String coNavi = CommentsDAO.getInstance().getPageNavi(currentCoPage, root);

				JsonObject json = new JsonObject();
				json.addProperty("list", g.toJson(pageList));
				json.addProperty("coNavi", coNavi);
				json.addProperty("currentCoPage", currentCoPage);

				PrintWriter pw = response.getWriter();
				pw.append(json.toString());
				
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
