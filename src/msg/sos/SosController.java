package msg.sos;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import msg.member.MemberDTO;
import msg.utils.XSS_protect;

/**
 * Servlet implementation class ddd
 */
@WebServlet("*.sos")
public class SosController extends HttpServlet {
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



		String url = request.getRequestURL().toString();
		System.out.println(url);

		if(cmd.contentEquals("/accept.sos")) { //긴급제보 Y로 승인


			int seq = Integer.parseInt(request.getParameter("seq"));
			System.out.println(seq);
			try {
				System.out.println(seq);
				SosDAO dao = SosDAO.getInstance();
				int result = dao.update(new SosDTO(seq,null,null, null, null, null)); 
				if(result>0) {
					System.out.println("승인성공");
					response.sendRedirect("list.mem");

				}}catch(Exception e) {
					e.printStackTrace();
				}
		}
		else if(cmd.contentEquals("/all.sos")) { //전체발송
			String title = "긴급실종신고메일 일괄전송";
			String contents = request.getParameter("content");
			System.out.println(contents);
			String host = "smtp.naver.com";
			String user = "msg_account_jy@naver.com"; //아이디
			String password = "msgmsg123!";//비번
			String id[] = request.getParameterValues("id1");

			for(int i=0; i<id.length; i++) {
				System.out.println(id[i]);				
			}


			String email[] = request.getParameterValues("email1");

			for(int j = 0; j<email.length; j++) {

				System.out.println(email[j]);
				String to_email = email[j];
				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", 465);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");


				StringBuffer temp =new StringBuffer();
				Random rnd = new Random();
				for(int i=0;i<10;i++)
				{
					int rIndex = rnd.nextInt(3);
					switch (rIndex) {
					case 0:
						// a-z
						temp.append((char) ((int) (rnd.nextInt(26)) + 97));
						break;
					case 1:
						// A-Z
						temp.append((char) ((int) (rnd.nextInt(26)) + 65));
						break;
					case 2:
						// 0-9
						temp.append((rnd.nextInt(10)));
						break;
					}
				}
				String AuthenticationKey = temp.toString();
				//System.out.println(AuthenticationKey);

				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(user,password);
					}
				});
				try {
					MimeMessage msg = new MimeMessage(session);
					msg.setFrom(new InternetAddress(user, "실종자긴급신고"));
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

					//���� ����
					msg.setSubject(title);
					//���� ����
					msg.setText("작성자 : 관리자 , 내용 : "+contents);

					Transport.send(msg);
					System.out.println("메일보내기성공");
					response.sendRedirect("sos/mailsuccess.jsp");


				}catch (Exception e) {
					e.printStackTrace();
					System.out.println("실패");
				}

			}



		}
		else if(cmd.contentEquals("/black.sos")) { //블랙처리된유저글 삭제
			String writer = request.getParameter("writer");
			System.out.println(writer);
			SosDAO dao = SosDAO.getInstance();
			try {
				int result = dao.delete(new SosDTO(0, writer, null, null, null, null));
				if(result>0) {
					System.out.println("블랙리스트");
					response.sendRedirect("list.mem");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(cmd.contentEquals("/sendmail.sos")) { //관리자한테 신고
			String email = "msg_account_jy@naver.com";// 보낼대상
			System.out.println("dd");
			//���� ���̵�� ȸ�������� �޾ƿ��� ������ �����Ϳ��� email���� ���Ͽ� �������� ������ �������� ������ ����


			//mail server ����
			String host = "smtp.naver.com";
			String user = "msg_account_jy@naver.com"; //�ڽ��� ���̹� ����
			String password = "msgmsg123!";//�ڽ��� ���̹� �н�����

			//���� ���� �ּ�
			String to_email = email;

			//SMTP ���� ������ �����Ѵ�.
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");

			//���� ��ȣ ������
			StringBuffer temp =new StringBuffer();
			Random rnd = new Random();
			for(int i=0;i<10;i++)
			{
				int rIndex = rnd.nextInt(3);
				switch (rIndex) {
				case 0:
					// a-z
					temp.append((char) ((int) (rnd.nextInt(26)) + 97));
					break;
				case 1:
					// A-Z
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 2:
					// 0-9
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			String AuthenticationKey = temp.toString();
			//System.out.println(AuthenticationKey);

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user,password);
				}
			});



			String title = XSS_protect.replaceParameter(request.getParameter("title"));
			String contents = XSS_protect.replaceParameter(request.getParameter("content"));
			/////////////////////////////////////////////
			/////////////////////////////////////////////
			/////////////////////////////////////////////
			/////////////////////////////////////////////
			/////////////////////////////////////////////
			/////////////////////////////////////////////
			//			String writer = "dd"; //세션값으로 아이디인데 일단보류
			MemberDTO ldto = (MemberDTO)request.getSession().getAttribute("loginInfo");
			String writer = ldto.getId();


			/////////////////////////////////////////////
			/////////////////////////////////////////////
			/////////////////////////////////////////////
			/////////////////////////////////////////////
			/////////////////////////////////////////////
			String accept = "N"; //기본값

			String are[] = request.getParameterValues("missing_area"); //지역 value값들 뽑아오는코드
			String area = "";
			for(int i=0; i<are.length; i++) {
				area += are[i];
			}
			System.out.println("지역 : "+area);

			//email ����
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "실종자긴급신고"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				//���� ����
				msg.setSubject(title);
				//���� ����
				msg.setText("작성자 : "+writer+", 내용 : "+contents);

				Transport.send(msg);
				System.out.println("메일보내기성공");

				SosDAO dao = SosDAO.getInstance();
				int result = dao.insert(new SosDTO(0,writer,area, title, contents, accept)); 
				if(result>0) {
					System.out.println("긴급db등록 성공");
				}


			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("실패");
			}

			HttpSession saveKey = request.getSession();
			saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
			//�н����� �ٲܶ� �� �ٲ��� ���ǿ� ���� id
			//                request.setAttribute("id", memberId);
			response.sendRedirect("main.jsp");
		}
		else if(cmd.contentEquals("/del.sos")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			SosDAO dao = SosDAO.getInstance();
			try {
				int result = dao.deletesos(new SosDTO(seq, null, null, null, null, null));
				if(result>0) {
					System.out.println("신고삭제완료");
					response.sendRedirect("Ylist.mem");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}

		}

		else if(cmd.contentEquals("/Ndel.sos")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			SosDAO dao = SosDAO.getInstance();
			try {
				int result = dao.deletesos(new SosDTO(seq, null, null, null, null, null));
				if(result>0) {
					System.out.println("신고삭제완료");
					response.sendRedirect("list.mem");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
