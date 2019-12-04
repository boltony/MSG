package msg.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
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

@WebServlet("*.mail")
public class MailController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String requestURI =	request.getRequestURI();
			String ctxPath = request.getContextPath();
			String cmd = requestURI.substring(ctxPath.length());
			
			if(cmd.equals("/findPW.mail")) {
			
		// 한글 깨지지 않도록!
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			String pw_find_id = request.getParameter("pw_find_id");
			String pw_find_email = request.getParameter("pw_find_email");
			String pw_find_answer = request.getParameter("pw_find_answer");
			String pw_find_hint = request.getParameter("pw_find_hint");
			
			// 비번찾기 폼에 입력한 이메일 값이 DB에 있으면 이메일로 임시비번 보내기 함! 없으면 다시 main으로!

			boolean result = MemberDAO.getInstance().selectByEmail(pw_find_email);
			System.out.println("DB에 존재하는 이메일인지? : "+result);
		
			if (result == true) {
				String host = "smtp.naver.com";
				String user = "msg_account_jy";
				String password = "msgmsg123!";

				String to_email = pw_find_email;

				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", 587);
				props.put("mail.smtp.auth", "true");
				// props.put("mail.smtp.ssl.enable","true"); 이거 넣으면 왜 안됨?

				// 임시 비밀번호 생성
				StringBuffer temp = new StringBuffer();
				Random rnd = new Random();

				for (int i = 0; i < 10; i++) {
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
				
				System.out.println("임시비밀번호: "+AuthenticationKey);
				// AuthenticationKey: 임시비밀번호!
				System.out.println(AuthenticationKey + " : " + pw_find_id + " : " + pw_find_email + " : " + pw_find_hint + " : " + pw_find_answer);
				
				int result2 = MemberDAO.getInstance().modifyPW(AuthenticationKey, pw_find_id, pw_find_email,pw_find_hint,pw_find_answer);

				System.out.println("비번 수정여부 : " + result2);

				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(user, password);
					}
				});

				MimeMessage msg = new MimeMessage(session);

				msg.setFrom(new InternetAddress(user, "MSG"));

				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				msg.setSubject("안녕하세요. MSG 입니다. 회원님의 임시 비밀번호를 발급해드립니다.");
				msg.setText(pw_find_id + " 회원님의 임시비밀번호는 [" + AuthenticationKey + "] 입니다.");
				Transport.send(msg);
				System.out.println("이메일 전송함...");

				HttpSession saveKey = request.getSession();
				saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
				request.setAttribute("pw_find_id", pw_find_id);
				
				response.sendRedirect("main.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}else if(cmd.equals("/emailConfirm.mail")) {		
		try {
			String CheckEmail = request.getParameter("email");

				String host = "smtp.naver.com";
				String user = "msg_account_jy";
				String password = "msgmsg123!";

				String to_email = CheckEmail;

				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", 587);
				props.put("mail.smtp.auth", "true");
				// props.put("mail.smtp.ssl.enable","true"); 이거 넣으면 왜 안됨?

				// 임시 비밀번호 생성
				StringBuffer temp = new StringBuffer();
				Random rnd = new Random();

				for (int i = 0; i < 10; i++) {
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
				
				System.out.println("이메일 인증번호: "+AuthenticationKey);
				// AuthenticationKey: 메일 인증번호! 
				
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(user, password);
					}
				});

				MimeMessage msg = new MimeMessage(session);

				msg.setFrom(new InternetAddress(user, "MSG"));

				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				msg.setSubject("안녕하세요. MSG 입니다. 회원가입 이메일 인증번호를 보내드립니다.");
				msg.setText("이메일 인증번호는 [" + AuthenticationKey + "] 입니다.");
				Transport.send(msg);
				System.out.println("이메일 전송함...");

				HttpSession saveKey = request.getSession();
				saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
				request.setAttribute("email_key", AuthenticationKey);
				request.getRequestDispatcher("member/emailCheck.jsp").forward(request, response);
				
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("member/error.jsp");
		}
		
	}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
