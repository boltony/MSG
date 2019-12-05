package msg.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import msg.member.MemberDAO;
import msg.member.MemberDTO;
import msg.utils.Configuration;
import msg.utils.XSS_protect;


//session - loginInfo - memberDTO
@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	
	private String xssProtect(String text) {
		text = text.replaceAll("<script>", "");
		text = text.replaceAll("</script>", "");
		return text;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF8");
		response.setCharacterEncoding("UTF8");
		String requestURI = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = requestURI.substring(ctx.length());
		System.out.println(cmd);
		BoardDAO dao = BoardDAO.getInstance();


		try {
			if(cmd.contentEquals("/missing.bo")) {
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginInfo");
				
				int currentPage=1;

				String currentPageRecv = request.getParameter("currentPage");
				if(currentPageRecv!=null) {
					currentPage=Integer.parseInt(currentPageRecv);
				}

				int startNum = currentPage*Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
				int endNum = currentPage*Configuration.recordCountPerPage;

				String choice = request.getParameter("choice");
				String contents = request.getParameter("contents");
				String board = "M";
				System.out.println("contents는 "+contents);
				System.out.println("choice는 "+choice);
				
				if(choice!=null) {
					System.out.println("검색");
					List<BoardDTO> pageList = dao.searchByChoice(choice, contents, board, startNum, endNum);
					System.out.println("pageList.size:"+pageList.size());
					System.out.println("board는 "+board);
					String navi = null;
					String path = null;
					navi = BoardDAO.getInstance().getPageNavi(currentPage, "M", choice, contents,pageList.size());
					path = "board/missingBoard.jsp";
					request.setAttribute("navi", navi);
					request.setAttribute("list", pageList);
					request.setAttribute("currentPage", currentPage);
				}else {
					List<BoardDTO> pageList = BoardDAO.getInstance().selectByPage("M", startNum, endNum, 0);

					String navi = BoardDAO.getInstance().getPageNavi(currentPage, "M",null,null,0);
					request.setAttribute("navi", navi);
					request.setAttribute("list", pageList);
					request.setAttribute("currentPage", currentPage);
				}
				request.getRequestDispatcher("board/missingBoard.jsp").forward(request, response);
				
			}else if(cmd.contentEquals("/protect.bo")) {
				int currentPage=1;
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginInfo");


				String currentPageRecv = request.getParameter("currentPage");
				if(currentPageRecv!=null) {
					currentPage=Integer.parseInt(currentPageRecv);
				}

				int startNum = currentPage*Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
				int endNum = currentPage*Configuration.recordCountPerPage;

				String choice = request.getParameter("choice");
				String contents = "%"+request.getParameter("contents")+"%";
				String board = "P";
				System.out.println("choice는 "+choice);
				
				if(choice!=null) {
					System.out.println("검색");
					List<BoardDTO> pageList = dao.searchByChoice(choice, contents, board, startNum, endNum);
					System.out.println("pageList.size:"+pageList.size());
					System.out.println("board는 "+board);
					String navi = null;
					String path = null;

					navi = BoardDAO.getInstance().getPageNavi(currentPage, "P", choice, contents,pageList.size());
					path = "board/protectBoard.jsp";

					request.setAttribute("navi", navi);
					request.setAttribute("list", pageList);
					request.setAttribute("currentPage", currentPage);
				}else {
					List<BoardDTO> pageList = BoardDAO.getInstance().selectByPage("P", startNum, endNum, 0);

					String navi = BoardDAO.getInstance().getPageNavi(currentPage, "P",null,null,0);
					request.setAttribute("navi", navi);
					request.setAttribute("list", pageList);
					request.setAttribute("currentPage", currentPage);
				}
				request.getRequestDispatcher("board/protectBoard.jsp").forward(request, response);
				
				
				

			}else if(cmd.contentEquals("/detailView.bo")) {

				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.viewCount(seq);
				BoardDTO dto = dao.detailView(seq);
				String currentPage = request.getParameter("currentPage");
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("dto", dto);
				CommentsDAO cdao = CommentsDAO.getInstance();
				List<CommentsDTO> commentsList = cdao.selectAll(seq);
				request.setAttribute("commentsList", commentsList);
				String board = request.getParameter("board");
				request.setAttribute("board", board);

				//				댓글 currentCoPage
				int currentCoPage=1;

				int startNum = currentCoPage*Configuration.recordCountPerPage-(Configuration.recordCountPerPage-1);
				int endNum = currentCoPage*Configuration.recordCountPerPage;

				List<CommentsDTO> pageList = CommentsDAO.getInstance().selectCommentByPage(seq, startNum, endNum);

				String coNavi = CommentsDAO.getInstance().getPageNavi(currentCoPage, seq);
				request.setAttribute("coNavi", coNavi);
				request.setAttribute("list", pageList);
				request.setAttribute("currentCoPage", currentCoPage);

				request.getRequestDispatcher("board/detailView.jsp").forward(request, response);
			}else if(cmd.contentEquals("/writejsp.bo")){
				int root = dao.getSeq();
				String board = xssProtect(request.getParameter("board"));
				String currentPage = request.getParameter("currentPage");
				request.setAttribute("board", board);
				request.setAttribute("root", root);
				request.setAttribute("currentPage", currentPage);
				request.getRequestDispatcher("board/write.jsp").forward(request, response);

			}else if(cmd.contentEquals("/write.bo")) {
				int root = Integer.parseInt(request.getParameter("root"));
				System.out.println("root: "+root);
				String writer = ((MemberDTO)request.getSession().getAttribute("loginInfo")).getId(); //이후에 session에서 꺼내온 아이디로 바꿔주기
				System.out.println("writer: "+writer);
				String board = request.getParameter("board");
				System.out.println("board: "+board);
				int area = Integer.parseInt(request.getParameter("area"));
				System.out.println("area: "+area);
				String title = XSS_protect.replaceParameter(request.getParameter("title"));
				
				System.out.println("title: "+title);
				
				String summernote = request.getParameter("summernote");
				System.out.println("summernote :"+summernote);
				
				BoardDTO bdto = new BoardDTO(root, board, area, null, writer, title, summernote, null, 0);
				dao.write(bdto);

				String currentPage = request.getParameter("currentPage");
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("seq", root);
				System.out.println("write.bo seq : "+root);
				request.getRequestDispatcher("detailView.bo?seq="+root+"&currentPage="+currentPage).forward(request, response);

				
				
				
			}else if(cmd.contentEquals("/imgSend.bo")) {
				int root = Integer.parseInt(request.getParameter("root"));
				
				
				String realPath = request.getServletContext().getRealPath("/board_files");
				File uploadRealPath = new File(realPath);
				if(!uploadRealPath.exists()) {
					uploadRealPath.mkdir();
				}
				
				String uploadPath = request.getServletContext().getRealPath("/board_files/file"+root);
				System.out.println(uploadPath);
				
				File uploadFilePath = new File(uploadPath);
				if(!uploadFilePath.exists()) {
					uploadFilePath.mkdir();
				}

				int maxSize = 1024 * 1024 * 10;
				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF8", new DefaultFileRenamePolicy());
				
				
				if(multi.getFile("img") != null) {
					String fileName = multi.getFilesystemName("img");  // upload 된 파일 이름
					String oriFileName = multi.getOriginalFileName("img");  // upload 되는 파일의 원래 이름

					System.out.println("file name : " + fileName);
					System.out.println("original name : " + oriFileName);
				}

				String url = "board_files/file"+root+"/" + multi.getOriginalFileName("img");
				System.out.println("url : " + url);
				System.out.println();

				PrintWriter pw = response.getWriter();
				pw.append("{\"url\":\""+url+"\"}");
				
				
			}else if(cmd.contentEquals("/delete.bo")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String currentPage = request.getParameter("currentPage");
				request.setAttribute("currentPage", currentPage);
				dao.delete(seq);
				String board = request.getParameter("board");
				if(board.contentEquals("M")) {
					request.getRequestDispatcher("missing.bo").forward(request, response);
				}else {
					request.getRequestDispatcher("protect.bo").forward(request, response);
				}
			}else if(cmd.contentEquals("/updatejsp.bo")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String currentPage = request.getParameter("currentPage");
				request.setAttribute("currentPage", currentPage);
				String board = request.getParameter("board");
				BoardDTO dto = dao.detailView(seq);
				
				request.setAttribute("dto", dto);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("seq", seq);
				request.getRequestDispatcher("board/update.jsp").forward(request, response);

			}else if(cmd.contentEquals("/update.bo")) {
				String writer = ((MemberDTO)request.getSession().getAttribute("loginInfo")).getId(); //이후에 session에서 꺼내온 아이디로 바꿔주기
				System.out.println(writer);
				int seq = Integer.parseInt(request.getParameter("seq"));
				String board = xssProtect(request.getParameter("board"));
				int area = Integer.parseInt(request.getParameter("area"));
				String title = XSS_protect.replaceParameter(request.getParameter("title"));
				String summernote = request.getParameter("summernote");
				BoardDTO dto = new BoardDTO(seq, board, area, null, writer, title, summernote, null, 0);
				dao.update(dto);
				
				String path = request.getServletContext().getRealPath("/board_files/") + "file"+seq;
				
				System.out.println("경로 : "+path);
				File folder = new File(path);
				try {
					if(folder.exists()) {
						System.out.println("folder.exist");
						File[] folder_list = folder.listFiles(); //파일리스트 얻어오기
						System.out.println("폴더안의 파일갯수 : " +folder_list.length);
						
						for (int j = 0; j < folder_list.length; j++) {
							System.out.println(folder_list[j]);
							if(summernote.contains(folder_list[j].getName())) {
								System.out.println("파일존재");
							}else {
								folder_list[j].delete();
								System.out.println("수정하면서 이미지를 지워 파일이 삭제되었습니다.");
							}

						}
						
						File[] folder_list1 = folder.listFiles(); //파일리스트 얻어오기
						if(folder_list1.length == 0 && folder.isDirectory()){ 
							folder.delete(); //대상폴더 삭제
							System.out.println("폴더가 삭제되었습니다.");
						}
					}
				} catch (Exception e) {
					e.getStackTrace();
				}
				
				String currentPage = request.getParameter("currentPage");
				request.setAttribute("seq", seq);
				request.setAttribute("currentPage", currentPage);
				request.getRequestDispatcher("detailView.bo").forward(request, response);
			}else if(cmd.contentEquals("/blackCheckWindow.bo")) {
				String id = request.getParameter("id");
				request.setAttribute("id", id);
				request.getRequestDispatcher("board/blackCheckWindow.jsp").forward(request, response);

			}else if(cmd.contentEquals("/blackIn.bo")) {
				String id = request.getParameter("id");
				MemberDAO mDao = MemberDAO.getInstance();
				mDao.blackIn(id);
			}else if(cmd.contentEquals("/imgDelete.bo")) {
				System.out.println("imgDelete.bo도착");
				int root = Integer.parseInt(request.getParameter("root"));
				String path = request.getServletContext().getRealPath("/board_files/") + "file"+root;
				
				System.out.println("경로 : "+path);
				File folder = new File(path);
				try {
					while(folder.exists()) {
						System.out.println("folde.exist");
						File[] folder_list = folder.listFiles(); //파일리스트 얻어오기
						System.out.println("폴더안의 파일갯수 : " +folder_list.length);
						for (int j = 0; j < folder_list.length; j++) {
							System.out.println(folder_list[j]);
							folder_list[j].delete(); //파일 삭제 
							System.out.println("파일이 삭제되었습니다.");
						}
						if(folder_list.length == 0 && folder.isDirectory()){ 
							folder.delete(); //대상폴더 삭제
							System.out.println("폴더가 삭제되었습니다.");
						}
					}
				} catch (Exception e) {
					e.getStackTrace();
				}
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
