package msg.child;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		PrintWriter pw = response.getWriter();

		try {
			if(cmd.contentEquals("/insert.child")) {
				int seq = 0;
				String tar[] = request.getParameterValues("target"); //대상
				String target = "";
				for(int i=0;i<tar.length;i++) {
					target += tar[i];
				}
				System.out.println(target);

				String gen[] = request.getParameterValues("gender"); //성별
				String gender = "";
				for(int i=0;i<gen.length;i++) {
					gender += gen[i];
				}
				//            String gender = "M";
				System.out.println(gender);

				String name = request.getParameter("name"); //이름
				System.out.println(name);

				String birth_date = request.getParameter("birth_date"); //생년월일
				System.out.println(birth_date);

				String str = request.getParameter("missing_date") //실종일자
						+request.getParameter("missing_time");

				//Timestamp missing_date = new Timestamp(missdate);

				System.out.println(str);

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
				Date date = sdf.parse(str);

				System.out.println(date);

				Timestamp missing_date = new Timestamp(date.getTime());

				System.out.println(missing_date);

				String area[] = request.getParameterValues("missing_area");
				String are = "";
				for(int i=0; i<area.length; i++) {
					are += area[i];
				}
				int missing_area = Integer.parseInt(are);
				System.out.println(missing_area);

				String missing_area_detail = request.getParameter("missing_area_detail"); //상세주소
				System.out.println(missing_area_detail);

				int height = Integer.parseInt(request.getParameter("height")); //키
				System.out.println(height);

				int weight = Integer.parseInt(request.getParameter("weight")); //체중
				System.out.println(weight);

				String hai[] = request.getParameterValues("hair"); //머리스타일
				String ha = "";
				for(int i=0;i<hai.length;i++) {
					ha += hai[i];
				}
				int hair = Integer.parseInt(ha);
				System.out.println(hair);

				String blood[] = request.getParameterValues("blood_type"); //혈액형
				String blood_typ = "";
				for(int i=0;i<blood.length;i++) {
					blood_typ += blood[i];
				}
				int blood_type = Integer.parseInt(blood_typ);
				System.out.println("혈액형 "+blood_type);

				String feature = request.getParameter("feature"); //신체특징
				System.out.println(feature);

				String up[] = request.getParameterValues("top"); //긴팔,반팔
				String to = "";
				for(int i=0; i<up.length;i++) {
					to += up[i];
				}
				int top = Integer.parseInt(to);
				System.out.println("상의 "+top);

				String topkind[] = request.getParameterValues("top_kind"); //상의종류
				String top_kin = "";
				for(int i=0; i<topkind.length; i++) {
					top_kin += topkind[i];
				}
				int top_kind = Integer.parseInt(top_kin);
				System.out.println("상의종류 "+top_kind);

				String down[] = request.getParameterValues("bottoms"); //긴바지, 반바지
				String bottom = "";
				for(int i=0; i<down.length; i++) {
					bottom += down[i];
				}
				int bottoms = Integer.parseInt(bottom);
				System.out.println("하의 "+bottoms);


				String bottomskind[] = request.getParameterValues("bottoms_kind"); //하의종류
				String bottoms_kin = "";
				for(int i=0; i<bottomskind.length; i++) {
					bottoms_kin += bottomskind[i];
				}
				int bottoms_kind = Integer.parseInt(bottoms_kin);
				System.out.println("하의종류 "+bottoms_kind);


				String foot[] = request.getParameterValues("shoes"); //신발종류
				String shoe = "";
				for(int i=0; i<foot.length; i++) {
					shoe += foot[i];
				}
				int shoes = Integer.parseInt(shoe);
				System.out.println("신발 "+shoes);

				int shoes_size = Integer.parseInt(request.getParameter("shoes_size"));
				System.out.println(shoes_size);


				String reporter = request.getParameter("reporter");  //제보자이름
				System.out.println(reporter);

				////////////////////////////////////////////////////////////////
				////////////////////////////////////////////////////////////////
				////////////////////////////////////////////////////////////////
				String reporter_id = "dd"; //세션값으로 로그인아이디 들어가는자린데 일단 임의값넣음
				////////////////////////////////////////////////////////////////
				////////////////////////////////////////////////////////////////
				////////////////////////////////////////////////////////////////

				String re_birth_date = request.getParameter("re_birth_date");//제보자 생년월일
				System.out.println(re_birth_date);

				String relation[] = request.getParameterValues("re_relation"); //실종자와의 관계
				String re_relatio = "";
				for(int i=0; i<relation.length; i++) {
					re_relatio += relation[i];
				}
				int re_relation = Integer.parseInt(re_relatio);
				System.out.println("실종자와 관계 "+re_relation);

				String re_contact1 = request.getParameter("re_contact1"); //보호자 폰번호
				System.out.println(re_contact1);

				String re_contact2 = request.getParameter("re_contact2"); //not null아님, 집전화

				System.out.println(re_contact2);

				String agreeYN = "N";

				int result = childDAO.insert(new ChildDTO(0, target, gender, name, birth_date, missing_date,   missing_area, missing_area_detail,
						height, weight, hair, blood_type, feature, top, top_kind, bottoms, bottoms_kind, shoes, shoes_size, reporter, reporter_id,
						re_birth_date, re_relation, re_contact1, re_contact2, agreeYN));
				if(result>0) {
					System.out.println("등록성공!");
					response.sendRedirect("index.jsp");
					pw.append("<script>alert('등록에 성공했습니다\n실종자가 하루빨리 가족의품으로 돌아오길 기원합니다');"
							+ "location.href='index.jsp';</script>");
				}else {
					System.out.println("등록실패");
				}
			}
			else if(cmd.contentEquals("/childList.child")) {

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
			else if(cmd.contentEquals("/childDetail.child")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println("글 번호  : " + seq);
				System.out.println();
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
