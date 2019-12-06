package msg.member;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import msg.board.BoardDTO;
import msg.sos.SosDAO;
import msg.sos.SosDTO;
import msg.support.SupportDTO;
import msg.utils.Configuration;
import msg.utils.EncryptionUtils;
import msg.utils.XSS_protect;

@WebServlet("*.mem")
public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");

		MemberDAO dao = MemberDAO.getInstance();
		try {
			if (cmd.equals("/login.mem")) {
				String id = XSS_protect.replaceParameter(request.getParameter("id"));
				String pw = XSS_protect.replaceParameter(request.getParameter("pw"));
				boolean result = MemberDAO.getInstance().isLoginOk(id, pw);

				if(result==true) {
					// 로그인 성공시 로그인 한 사람의 정보를 dto로 담아서 session에 저장
					MemberDTO dto =	MemberDAO.getInstance().selectByID(id);
					request.getSession().setAttribute("loginInfo", dto);
					request.setAttribute("loginResult", result);
					request.getRequestDispatcher("main.jsp").forward(request, response);
				}else {
					//로그인 실패시...
					response.setContentType("text/html; charset=UTF8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('로그인 실패하였습니다. 다시 확인해주세요.'); location.href='member/login.jsp'</script>");
				}


			}
			else if (cmd.equals("/signup.mem")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String pw_find_hint = request.getParameter("pw_find_hint");
				String pw_find_answer = XSS_protect.replaceParameter(request.getParameter("pw_find_answer"));
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String zipcode = XSS_protect.replaceParameter(request.getParameter("zipcode"));
				String address = XSS_protect.replaceParameter(request.getParameter("address"));
				String address2 = XSS_protect.replaceParameter(request.getParameter("address2"));
				String email_receive = request.getParameter("email_receive");
				System.out.println(email_receive);

				int result = MemberDAO.getInstance().joinMember(new MemberDTO(0,id,pw,pw_find_hint,pw_find_answer,name,phone,email,zipcode,address,address2,email_receive,"N","N"));

				if(result>0) {
					response.sendRedirect("main.jsp");
				}else {
					response.sendRedirect("error.jsp");
				}

			}
			else if(cmd.equals("/dupl.mem")) {
				String check_id = request.getParameter("id");
				System.out.println(check_id);

				boolean result = MemberDAO.getInstance().duplCheck(check_id);
				System.out.println(result);

				PrintWriter pw = response.getWriter();
				pw.append("{\"duplResult\":"+ "\"" + result + "\"" +"}");

			}
			else if(cmd.equals("/logout.mem")) {
				request.getSession().invalidate();
				response.setContentType("text/html; charset=UTF8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('안전하게 로그아웃 되었습니다! 또 오세요~! ^.^'); location.href='main.jsp'</script>");

			}
			else if(cmd.equals("/findID.mem")) {
				String name = XSS_protect.replaceParameter(request.getParameter("id_find_name"));
				String phone = XSS_protect.replaceParameter(request.getParameter("id_find_phone"));
				String email = XSS_protect.replaceParameter(request.getParameter("id_find_email"));

				List<String> ids = MemberDAO.getInstance().findID(name, phone, email);

				if(ids.size()==0) {
					response.setContentType("text/html; charset=UTF8");
					PrintWriter out = response.getWriter();
					out.append("<script>alert('입력값에 해당하는 정보가 없습니다.'); location.href='member/findID.jsp'; </script>");
				}else {
					request.setAttribute("ids", ids);
					request.getRequestDispatcher("member/findID.jsp").forward(request, response);}

			}
			// 정보 비밀번호 재확인
			if(cmd.contentEquals("/relogin_info.mem")) {
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginInfo");
				String id = request.getParameter("id");
				String pw = XSS_protect.replaceParameter(EncryptionUtils.getSHA512(request.getParameter("pw")));
				Boolean result = dao.reloginResult(dto.getId(), pw);
				System.out.println("아이디 : " + dto.getId() + " 비번 : " + pw);
				System.out.println("결과 : " + result);
				if(result) {
					response.sendRedirect("member/mypage_Info.jsp");
				}else {
					response.setContentType("text/html; charset=UTF8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('비밀번호가 올바르지 않습니다'); location.href='member/mypage.jsp'</script>");
					out.flush();
				}

				// 수정 비밀번호 재확인
			}else if(cmd.contentEquals("/relogin_modify.mem")) {
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginInfo");
				String pw = XSS_protect.replaceParameter(EncryptionUtils.getSHA512(request.getParameter("pw")));
				Boolean result = dao.reloginResult(dto.getId(), pw);
				if(result) {
					response.sendRedirect("member/mypage_modify.jsp");
				}else {
					response.setContentType("text/html; charset=UTF8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('비밀번호가 올바르지 않습니다'); location.href='member/mypage.jsp'</script>");
					out.flush();
				}


			}
			else if(cmd.contentEquals("/mylogin.mem")) {
				String id = XSS_protect.replaceParameter(request.getParameter("id"));
				String pw = XSS_protect.replaceParameter(request.getParameter("pw"));
				boolean result = MemberDAO.getInstance().isLoginOk(id, pw);

				if(result==true) {	// session을 dto에 담기
					MemberDTO dto =	MemberDAO.getInstance().selectByID(id);
					request.getSession().setAttribute("loginInfo", dto);
					request.setAttribute("loginResult", result);
					request.getRequestDispatcher("member/mypage.jsp").forward(request, response);
				}else {
					response.setContentType("text/html; charset=UTF8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('비밀번호가 올바르지 않습니다'); location.href='member/mypage.jsp'</script>");
					out.flush();
				}

			}
			else if(cmd.contentEquals("/memOut.mem")) {
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginInfo");
				String check_pw = XSS_protect.replaceParameter(EncryptionUtils.getSHA512(request.getParameter("outcheck1")));

				Boolean result = dao.reloginResult(dto.getId(), check_pw);
				if(result) {
					int outResult = dao.memOut(dto.getId(), check_pw);
					if(outResult > 0) {
						request.getSession().invalidate();
						response.sendRedirect("member/outFin.jsp");
					}else {
						response.sendRedirect("error.jsp");
					}
				}else {
					response.setContentType("text/html; charset=UTF8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('비밀번호가 올바르지 않습니다'); location.href='member/mypage.jsp'</script>");
					out.flush();
				}

				// 내 글 리스트
			}else if(cmd.contentEquals("/mywrite.mem")) {
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginInfo");

				int cpage = 1;
				String param = request.getParameter("cpage");
				if(param!=null) {
					cpage = Integer.parseInt(param);
				}

				int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
				int end = cpage * Configuration.recordCountPerPage;
				List<BoardDTO> pageList = dao.selectByPageW(dto.getId(), start, end);
				String navi = dao.getPageNaviW(dto.getId(), cpage);

				List<BoardDTO> list = dao.mywriteList(dto.getId());
				for(int i = 0; i < list.size(); i++) {
					list.get(i);
				}
				request.setAttribute("pageList", pageList);
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("member/mypage_write.jsp").forward(request, response);	
			}

			// 내 기부 내역
			else if(cmd.contentEquals("/mydonate.mem")) {
				if(request.getSession().getAttribute("loginInfo") == null) {
					response.sendRedirect("member/login.jsp");
				}
				else {
					MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginInfo");

					int cpage = 1;
					String param = request.getParameter("cpage");
					if(param!=null) {
						cpage = Integer.parseInt(param);
					}

					int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
					int end = cpage * Configuration.recordCountPerPage;

					List<SupportDTO> pageList = dao.selectByPageD(dto.getId(), start, end);
					String navi = dao.getPageNaviD(dto.getId(), cpage);

					List<SupportDTO> list = dao.mydonateList(dto.getId());
					String totalDonation = dao.totalDonation(dto.getId());
					request.setAttribute("pageList", pageList);
					request.setAttribute("list", list);
					request.setAttribute("navi", navi);
					request.setAttribute("totalDonation", totalDonation);
					request.getRequestDispatcher("member/mypage_donate.jsp").forward(request, response);
				}

				// 수정한 정보 db로 입력
			}else if(cmd.contentEquals("/infoModify.mem")) {
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginInfo");
				String pw = request.getParameter("pw");
				String pw_find_hint = request.getParameter("pw_find_hint");
				String pw_find_answer = XSS_protect.replaceParameter(request.getParameter("pw_find_answer"));
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String zipcode = XSS_protect.replaceParameter(request.getParameter("zipcode"));
				String address1 = XSS_protect.replaceParameter(request.getParameter("address1"));
				String address2 = XSS_protect.replaceParameter(request.getParameter("address2"));
				String email_receive = request.getParameter("email_receive");
				System.out.println(email_receive);

				int result = dao.memModify(dto.getId(),pw,pw_find_hint,pw_find_answer,phone,email,zipcode,address1,address2,email_receive);

				if(result>0) {
					dto = MemberDAO.getInstance().selectByID(dto.getId());
					request.getSession().setAttribute("loginInfo", dto);
					response.setContentType("text/html; charset=UTF8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('수정이 정상적으로 완료되었습니다.'); location.href='member/mypage.jsp'</script>");
					out.flush();
				}else {
					response.sendRedirect("error.jsp");
				}

			}
			else if(cmd.contentEquals("/acceptY.mem")) {
				String contents = XSS_protect.replaceParameter(request.getParameter("contents"));
				List<MemberDTO> list = dao.selectAll();
				request.setAttribute("con", contents);
				request.setAttribute("list", list);
				request.getRequestDispatcher("sos/accept.jsp").forward(request, response);
			}
			else if(cmd.contentEquals("/black.mem")) { //블랙추가
				String id = request.getParameter("writer");
				int result = dao.update(new MemberDTO(0, id, null, null, null, null, null, null, null, null, null, null, null, null));
				if(result>0) {
					System.out.println("블랙리스트");
					request.setAttribute("writer", id);
					request.getRequestDispatcher("black.sos").forward(request, response);
				}

			}
			else if(cmd.contentEquals("/list.mem")) {
				SosDAO sosdao = SosDAO.getInstance();

				int cpage = 1;
				String tmpPage = request.getParameter("cpage");
				if(tmpPage != null) {
					cpage = Integer.parseInt(tmpPage);
				}

				int begin = cpage * Configuration.recordCountPerPage -(Configuration.recordCountPerPage - 1);
				int end = cpage * Configuration.recordCountPerPage;

				List<SosDTO> list = sosdao.selectByPage(begin, end);
				String pageNavi = sosdao.getPageNavi(cpage);

				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);


				request.getRequestDispatcher("sos/list.jsp").forward(request, response);
			}
			else if(cmd.contentEquals("/Ylist.mem")) {
				SosDAO sosdao = SosDAO.getInstance();

				int cpage = 1;
				String tmpPage = request.getParameter("cpage");
				if(tmpPage != null) {
					cpage = Integer.parseInt(tmpPage);
				}

				int begin = cpage * Configuration.recordCountPerPage -(Configuration.recordCountPerPage - 1);
				int end = cpage * Configuration.recordCountPerPage;

				List<SosDTO> list = sosdao.selectByYPage(begin, end);
				String pageNavi = sosdao.getYPageNavi(cpage);

				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);

				request.getRequestDispatcher("sos/Ylist.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
