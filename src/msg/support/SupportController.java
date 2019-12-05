package msg.support;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import msg.member.MemberDAO;
import msg.member.MemberDTO;
import msg.utils.XSS_protect;

@WebServlet("*.sup")
public class SupportController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SupportDAO dao = SupportDAO.getInstance();

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestURI = request.getRequestURI();
		System.out.println(requestURI);
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		String cmd = requestURI.substring(contextPath.length());
		System.out.println(cmd);

		if(cmd.contentEquals("/pay.sup")) {
			String name = request.getParameter("rname");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String donation = request.getParameter("donation");
			System.out.println(name);
			System.out.println(donation); 

			request.setAttribute("rname", name);
			request.setAttribute("phone", phone);
			request.setAttribute("email", email);
			request.setAttribute("donation", donation);

			request.getRequestDispatcher("support/payApi.jsp").forward(request, response);
		}else if(cmd.contentEquals("/paySuccess.sup")) {

			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String card_name = request.getParameter("card_name");
			String method_name = request.getParameter("method_name");
			String pg = request.getParameter("pg");
			int donation = Integer.parseInt(request.getParameter("price"));
			String date = request.getParameter("purchased_at");
			Timestamp support_date = Timestamp.valueOf(date);
			System.out.println(id);

			String receipt_id = request.getParameter("receipt_id");
			SupportDTO dto = new SupportDTO(0,id,name,phone,email,card_name,method_name,pg,donation,support_date,receipt_id,null);
			int result;
			try {
				result = dao.insertSupport(dto);

			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(cmd.contentEquals("/pay_delete.sup")) {
			String receipt_id = request.getParameter("receipt_id");
			System.out.println(receipt_id);
			ExecuteCancel.goGetToken();
			String rs = ExecuteCancel.goCancel(receipt_id);
			JsonParser parser = new JsonParser();
			JsonElement data = parser.parse(rs);
			String value = data.getAsJsonObject().get("status").getAsString();
			System.out.println(value);
			int result = 0;
			String msg = "";
			if(value.contentEquals("200")) {
				try {
					result = dao.deleteSupport(receipt_id);
					if(result > 0) {
						response.sendRedirect("member/cancelFin.jsp");  // 취소 완료 페이지 이동
					}else {
						response.sendRedirect("member/error.jsp");
					}


				}catch(Exception e) {
					e.printStackTrace();
				}
			}

		}else if(cmd.contentEquals("/loginToSupport.sup")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			boolean result;
			try {
				result = MemberDAO.getInstance().isLoginOk(id, pw);

				if(result==true) {	// session을 dto에 담기
					MemberDTO dto =	MemberDAO.getInstance().selectByID(id);
					request.getSession().setAttribute("loginInfo", dto);
					request.setAttribute("loginResult", result);
					request.getRequestDispatcher("support/support_form.jsp").forward(request, response);
				}else {
					response.setContentType("text/html; charset=UTF8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('비밀번호가 올바르지 않습니다'); location.href='support/support_form.jsp'</script>");
					out.flush();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}


		}
		else if(cmd.contentEquals("/xssProtect.sup")) {
			XSS_protect xs = new XSS_protect();
			String rname = xs.replaceParameter(request.getParameter("rname"));
			String phone = xs.replaceParameter(request.getParameter("phone"));
			String email = xs.replaceParameter(request.getParameter("email"));

			JsonObject obj = new JsonObject();
			obj.addProperty("rname", rname);
			obj.addProperty("phone", phone);
			obj.addProperty("email", email);

			response.getWriter().append(obj.toString());

		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
