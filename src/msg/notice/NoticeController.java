package msg.notice;

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

import msg.board.BoardDAO;
import msg.board.BoardDTO;
import msg.member.MemberDTO;
import msg.utils.Configuration;
import msg.utils.XSS_protect;

@WebServlet("*.no")
public class NoticeController extends HttpServlet {
	
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
		NoticeDAO dao = NoticeDAO.getInstance();
		
		try {
			if(cmd.contentEquals("/notice.no")) {
				int currentPage=1;
				
				String currentPageRecv = request.getParameter("currentPage");
				System.out.println(currentPageRecv);
				if(currentPageRecv!=null&&!(currentPageRecv.contentEquals(""))) {
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
					List<NoticeDTO> pageList = dao.searchByChoice(choice, contents, startNum, endNum);
					System.out.println("pageList.size:"+pageList.size());
					System.out.println("board는 "+board);
					String navi = null;
					String path = null;
					navi = NoticeDAO.getInstance().getPageNavi(currentPage, choice, contents,pageList.size());
					path = "board/missingBoard.jsp";
					request.setAttribute("navi", navi);
					request.setAttribute("list", pageList);
					request.setAttribute("currentPage", currentPage);
					request.getRequestDispatcher("notice/notice.jsp").forward(request, response);
				}else {
					List<NoticeDTO> pageList = dao.selectByPage(startNum, endNum);
					
					String navi = NoticeDAO.getInstance().getPageNavi(currentPage, choice, contents, pageList.size());
					request.setAttribute("navi", navi);
					request.setAttribute("list", pageList);
					request.setAttribute("currentPage", currentPage);
					System.out.println("noticejsp로 출발");
					request.getRequestDispatcher("notice/notice.jsp").forward(request, response);
				}
				
			}else if(cmd.contentEquals("/writejsp.no")){
				int seq = dao.getSeq();
				request.setAttribute("seq", seq);
				String currentPage = request.getParameter("currentPage");
				request.setAttribute("currentPage", currentPage);
				request.getRequestDispatcher("notice/write.jsp").forward(request, response);

			}else if(cmd.contentEquals("/write.no")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println("등록할때 seq: "+seq);
				String title = XSS_protect.replaceParameter(request.getParameter("title"));
				System.out.println("title: "+title);
				String summernote = request.getParameter("summernote");
				System.out.println("summernote :"+summernote);
				String currentPage = request.getParameter("currentPage");
				
				dao.write(new NoticeDTO(seq, title, summernote, null, 0));
				request.getRequestDispatcher("detailView.no?seq="+seq+"&currentPage="+currentPage).forward(request, response);

			}else if(cmd.contentEquals("/imgSend.no")) {
				int root = Integer.parseInt(request.getParameter("seq"));
				System.out.println("img에서 seq: "+root);
				
				String realPath = request.getServletContext().getRealPath("/notice_files");
				File uploadRealPath = new File(realPath);
				if(!uploadRealPath.exists()) {
					uploadRealPath.mkdir();
				}
				
				String uploadPath = request.getServletContext().getRealPath("/notice_files/file"+root);
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

				String url = "notice_files/file"+root+"/" + multi.getOriginalFileName("img");
				System.out.println("url : " + url);
				System.out.println();

				PrintWriter pw = response.getWriter();
				pw.append("{\"url\":\""+url+"\"}");
				
				
			}else if(cmd.contentEquals("/imgDelete.bo")) {
				System.out.println("imgDelete.bo도착");
				int root = Integer.parseInt(request.getParameter("root"));
				//String path = request.getContextPath()+"/board_files/file"+root;
				//       /MSGProject/board_files/file

				String path = request.getServletContext().getRealPath("/board_files/") + "file"+root;
				// d:...meta../rea

				System.out.println("경로 : "+path);
				File folder = new File(path);
				int result = 0;

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
						result+=1;
					}
				}
			}else if(cmd.contentEquals("/detailView.no")) {
				
				String currentPage = request.getParameter("currentPage");
				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.viewCount(seq);
				NoticeDTO dto = dao.detailView(seq);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("seq", seq);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("notice/detailView.jsp").forward(request, response);
			}else if(cmd.contentEquals("/delete.no")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String currentPage = request.getParameter("currentPage");
				request.setAttribute("currentPage", currentPage);
				dao.delete(seq);
				request.getRequestDispatcher("notice.no").forward(request, response);
			}else if(cmd.contentEquals("/updatejsp.no")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println("seq : "+seq);
				String currentPage = request.getParameter("currentPage");
				request.setAttribute("currentPage", currentPage);
				NoticeDTO dto = dao.detailView(seq);
				
				request.setAttribute("dto", dto);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("seq", seq);
				request.getRequestDispatcher("notice/update.jsp").forward(request, response);
			}else if(cmd.contentEquals("/update.no")) {
				
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println("seq : "+seq);
				String title = XSS_protect.replaceParameter(request.getParameter("title"));
				System.out.println("title: "+title);
				String summernote = request.getParameter("summernote");
				System.out.println("summernote :"+summernote);
				String currentPage = request.getParameter("currentPage");
				
				dao.update(new NoticeDTO(seq, title, summernote, null, 0));
				
				String path = request.getServletContext().getRealPath("/notice_files/") + "file"+seq;
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
				
				
				
				request.getRequestDispatcher("detailView.no?seq="+seq+"&currentPage="+currentPage).forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
