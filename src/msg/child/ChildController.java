package msg.child;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		ChildFileDAO fileDAO = ChildFileDAO.getInstance();
		PrintWriter pw = response.getWriter();

		try {
			if(cmd.contentEquals("/insert.child")) {
				String uploadPath = request.getServletContext().getRealPath("/files");
				System.out.println(uploadPath);

				File uploadFilePath = new File(uploadPath);
				if(!uploadFilePath.exists()) {
					uploadFilePath.mkdir();
				}

				int maxSize = 1024 * 1024 * 10;
				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF8", new DefaultFileRenamePolicy());

				int seq = 0;
				String tar[] = multi.getParameterValues("target"); //대상
				String target = "";
				for(int i=0;i<tar.length;i++) {
					target += tar[i];
				}

				String gen[] = multi.getParameterValues("gender"); //성별
				String gender = "";
				for(int i=0;i<gen.length;i++) {
					gender += gen[i];
				}

				String name = multi.getParameter("name"); //이름
				String birth_date = multi.getParameter("birth_date"); //생년월일

				String date_str = multi.getParameter("missing_date") //실종일자
						+ multi.getParameter("missing_time");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
				Date date = sdf.parse(date_str);
				Timestamp missing_date = new Timestamp(date.getTime());

				String area[] = multi.getParameterValues("missing_area");
				String are = "";
				for(int i=0; i<area.length; i++) {
					are += area[i];
				}
				int missing_area = Integer.parseInt(are);

				String missing_area_detail = multi.getParameter("missing_area_detail"); //상세주소

				int height = Integer.parseInt(multi.getParameter("height")); //키
				int weight = Integer.parseInt(multi.getParameter("weight")); //체중

				String hai[] = multi.getParameterValues("hair"); //머리스타일
				String ha = "";
				for(int i=0;i<hai.length;i++) {
					ha += hai[i];
				}
				int hair = Integer.parseInt(ha);

				String blood[] = multi.getParameterValues("blood_type"); //혈액형
				String blood_typ = "";
				for(int i=0;i<blood.length;i++) {
					blood_typ += blood[i];
				}
				int blood_type = Integer.parseInt(blood_typ);

				String feature = multi.getParameter("feature"); //신체특징

				String up[] = multi.getParameterValues("top"); //긴팔,반팔
				String to = "";
				for(int i=0; i<up.length;i++) {
					to += up[i];
				}
				int top = Integer.parseInt(to);

				String topkind[] = multi.getParameterValues("top_kind"); //상의종류
				String top_kin = "";
				for(int i=0; i<topkind.length; i++) {
					top_kin += topkind[i];
				}
				int top_kind = Integer.parseInt(top_kin);

				String down[] = multi.getParameterValues("bottoms"); //긴바지, 반바지
				String bottom = "";
				for(int i=0; i<down.length; i++) {
					bottom += down[i];
				}
				int bottoms = Integer.parseInt(bottom);

				String bottomskind[] = multi.getParameterValues("bottoms_kind"); //하의종류
				String bottoms_kin = "";
				for(int i=0; i<bottomskind.length; i++) {
					bottoms_kin += bottomskind[i];
				}
				int bottoms_kind = Integer.parseInt(bottoms_kin);

				String foot[] = multi.getParameterValues("shoes"); //신발종류
				String shoe = "";
				for(int i=0; i<foot.length; i++) {
					shoe += foot[i];
				}
				int shoes = Integer.parseInt(shoe);
				int shoes_size = Integer.parseInt(multi.getParameter("shoes_size"));

				String reporter = multi.getParameter("reporter");  //제보자이름

				////////////////////////////////////////////////////////////////
				////////////////////////////////////////////////////////////////
				String reporter_id = "dd"; //세션값으로 로그인아이디 들어가는자린데 일단 임의값넣음
				////////////////////////////////////////////////////////////////
				////////////////////////////////////////////////////////////////

				String re_birth_date = multi.getParameter("re_birth_date");//제보자 생년월일

				String relation[] = multi.getParameterValues("re_relation"); //실종자와의 관계
				String re_relatio = "";
				for(int i=0; i<relation.length; i++) {
					re_relatio += relation[i];
				}
				int re_relation = Integer.parseInt(re_relatio);

				String re_contact1 = multi.getParameter("re_contact1"); //보호자 폰번호
				String re_contact2 = multi.getParameter("re_contact2"); //not null아님, 집전화
				String agreeYN = "N";


				int result = childDAO.insert(new ChildDTO(0, target, gender, name, birth_date, missing_date,   missing_area, missing_area_detail,
						height, weight, hair, blood_type, feature, top, top_kind, bottoms, bottoms_kind, shoes, shoes_size, reporter, reporter_id,
						re_birth_date, re_relation, re_contact1, re_contact2, agreeYN));

				int root = childDAO.getSeqByPost(reporter_id);

				Enumeration<String> e = multi.getFileNames();
				while(e.hasMoreElements()) {
					String file_temp = e.nextElement();

					if(multi.getFile(file_temp) != null) {
						System.out.println("파일 : " + file_temp);
						String fileName = multi.getFilesystemName(file_temp);  // upload 된 파일 이름
						String oriFileName = multi.getOriginalFileName(file_temp);  // upload 되는 파일의 원래 이름
						System.out.println(fileName);
						System.out.println(oriFileName);

						ChildFileDTO dto = new ChildFileDTO(0, root, fileName, oriFileName);
						int fileResult = fileDAO.insert(dto);
					}
				}

				if(result>0) {
					System.out.println("등록성공!");
					response.sendRedirect("index.jsp");
					pw.append("<script>alert('등록에 성공했습니다\n실종자가 하루빨리 가족의품으로 돌아오길 기원합니다');"
							+ "location.href='index.jsp';</script>");
				}
				else {
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

				for(int i = 0; i < list.size(); i++) {
					int seq = list.get(i).getSeq();
					List<ChildFileDTO> file_list = fileDAO.getFilesByPost(seq);
					
					String val = "${pageContext.request.contextPath}/resources/images/icon_search.png";
					if(file_list.size() > 0) {
						val = "files/" + file_list.get(0).getFile_name();
					}
					request.setAttribute("rep_file" + seq, val);
				}

				request.setAttribute("list", list);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("child/childList.jsp").forward(request, response);
			}
			else if(cmd.contentEquals("/childDetail.child")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println("글 번호  : " + seq);
				System.out.println();

				ChildDTO selectResult = childDAO.selectBySeq(seq);
				String area_detail = selectResult.getMissing_area_detail().replaceAll("\n", "<br>");
				selectResult.setMissing_area_detail(area_detail);
				String feature = selectResult.getFeature().replaceAll("\n", "<br>");
				selectResult.setFeature(feature);

				List<ChildFileDTO> file_list = fileDAO.getFilesByPost(seq);
				List<String> file_names_list = new ArrayList<>(); 
				for(int i = 0; i < file_list.size(); i++) {
					String file_url = "files/" + file_list.get(i).getFile_name();
					file_names_list.add(file_url);
				}

				request.setAttribute("dto", selectResult);
				request.setAttribute("file_names_list", file_names_list);
				request.getRequestDispatcher("child/childDetail.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
