package msg.member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import msg.board.BoardDTO;
import msg.support.SupportDTO;
import msg.utils.Configuration;
import msg.utils.EncryptionUtils;

public class MemberDAO {
	private static MemberDAO instance;

	private BasicDataSource bds = new BasicDataSource();

	public MemberDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("msg");
		bds.setPassword("msg");
		bds.setInitialSize(30);
	}

	public synchronized static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	public Connection getConnection() throws Exception{
		return bds.getConnection();
	}

	// 로그인
	public boolean isLoginOk(String id, String pw) throws Exception{
		String sql = "select * from member where id = ? and pw =? and black='N'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, EncryptionUtils.getSHA512(pw));
			try(
					ResultSet rs = pstat.executeQuery();
					){
				boolean result = rs.next();
				con.commit();
				return result;
			}
		}
	}

	// session 저장용
	public MemberDTO selectByID(String input_id) throws Exception {
		String sql = "select * from member where id =?";
		try (Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, input_id);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				MemberDTO dto = new MemberDTO();
				if (rs.next()) {
					int seq = rs.getInt(1);
					String id = rs.getString(2);
					String pw = rs.getString(3);
					String pw_find_hint = rs.getString(4);
					String pw_find_answer = rs.getString(5);
					String name = rs.getString(6);
					String phone = rs.getString(7);
					String email = rs.getString(8);
					String zipcode = rs.getString(9);
					String address1 = rs.getString(10);
					String address2 = rs.getString(11);
					String email_receive = rs.getString(12);
					String manager_check = rs.getString(13);
					String black = rs.getString(14);
					dto = new MemberDTO(seq, id, pw, pw_find_hint, pw_find_answer, name, phone, email, zipcode, address1,
							address2, email_receive, manager_check,black);
				}
				con.commit();
				return dto;
			}
		}
	}

	// 회원 가입
	public int joinMember(MemberDTO dto) throws Exception{
		String sql = "insert into member values (member_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getId());
			pstat.setString(2, EncryptionUtils.getSHA512(dto.getPw()));
			pstat.setString(3, dto.getPw_find_hint());
			pstat.setString(4, dto.getPw_find_answer());
			pstat.setString(5, dto.getName());
			pstat.setString(6, dto.getPhone());
			pstat.setString(7, dto.getEmail());
			pstat.setString(8, dto.getZipcode());
			pstat.setString(9, dto.getAddress1());
			pstat.setString(10, dto.getAddress2());
			pstat.setString(11, dto.getEmail_receive());
			pstat.setString(12, dto.getManager_check());
			pstat.setString(13, dto.getBlack());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 중복 체크
	public boolean duplCheck(String id) throws Exception{
		String sql = "select * from member where id =?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				boolean result = rs.next();
				return !result;
			}
		}
	}

	// 아이디찾기 (이름, 전화번호, 이메일이 같은 사람이 여러명일 수 있으니 list에 담는다)
	public List<String> findID(String name, String phone, String email) throws Exception{
		String sql = "select id from member where name=? and phone=? and email=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, name);
			pstat.setString(2, phone);
			pstat.setString(3, email);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<String> ids = new ArrayList<>();
				while(rs.next()) {
					ids.add(rs.getString(1));
				}
				return ids;
			}
		}
	}

	// 이메일
	public boolean selectByEmail(String email) throws Exception{
		String sql = "select * from member where email=?";
		Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, email);
		ResultSet rs = pstat.executeQuery();
		boolean result = rs.next();
		return result;
	}

	// 비밀번호 재확인
	public boolean reloginResult(String id, String pw) throws Exception{
		String sql = "select * from member where id=? and pw=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, pw);
			ResultSet rs = pstat.executeQuery();
			boolean result = rs.next();
			return result;
		}
	}

	// 비밀번호 수정하기
	public int modifyPW(String new_pw, String id, String email, String pw_find_hint, String pw_find_answer) throws Exception{
		String sql = "update member set pw=? where id=? and email=? and pw_find_hint=? and pw_find_answer=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, EncryptionUtils.getSHA512(new_pw));
			pstat.setString(2, id);
			pstat.setString(3, email);
			pstat.setString(4, pw_find_hint);
			pstat.setString(5, pw_find_answer);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 회원 전체 목록
	public List<MemberDTO> viewAll() throws Exception{
		String sql = "select * from member order by seq";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<MemberDTO> memberList = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String id = rs.getString("id");
					String pw_find_hint = rs.getString("pw_find_hint");
					String pw_find_answer = rs.getString("pw_find_answer");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					String zipcode = rs.getString("zipcode");
					String address1 = rs.getString("address1");
					String address2 = rs.getString("address2");
					String email_receive = rs.getString("email_receive");
					String manager_check = rs.getString("manager_check");
					String black = rs.getString("black");

					MemberDTO temp = new MemberDTO(seq,id,null,pw_find_hint,pw_find_answer,name,phone,email,zipcode,address1,address2,email_receive,manager_check,black);
					memberList.add(temp);
				}
				return memberList;
			}
		}
	}

	// 블랙리스트 추가
	public int blackIn(String id) throws Exception {
		String sql = "update member set black='Y' where id=?";
		try (Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 블랙리스트 제거
	public int blackOut(String id) throws Exception {
		String sql = "update member set black='N' where id=?";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 내 정보 목록
	public MemberDTO myinfoById(String inputId) throws Exception{
		String sql = "select * from member where id=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setString(1, inputId);
			ResultSet rs = pstat.executeQuery();

			MemberDTO dto = new MemberDTO();
			while(rs.next()) {
				String id = rs.getString("id");
				String pw_find_hint = rs.getString("pw_find_hint");
				String pw_find_answer = rs.getString("pw_find_answer");
				String name  = rs.getString("name");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String zipcode = rs.getString("zipcode");
				String address1 = rs.getString("address1");
				String address2 = rs.getString("address2");
				String email_receive = rs.getString("email_receive");
				String manager_check = rs.getString("manager_check");
				String black = rs.getString("black");
				dto = new MemberDTO(0,id,null,pw_find_hint,pw_find_answer,name,phone,email,zipcode,address1,address2,email_receive,manager_check,black);
			}
			return dto;
		}
	}

	// 정보 수정
	public int memModify(String id, String pw, String pw_find_hint, String pw_find_answer, String phone, String email, String zipcode,
			String address1, String address2, String email_receive) throws Exception {
		String sql = "update member set pw=?, pw_find_hint=?, pw_find_answer=?, phone=?,"
				+ "email=?, zipcode=?, address1=?, address2=?, email_receive=? where id=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, EncryptionUtils.getSHA512(pw));
			pstat.setString(2, pw_find_hint);
			pstat.setString(3, pw_find_answer);
			pstat.setString(4, phone);
			pstat.setString(5, email);
			pstat.setString(6, zipcode);
			pstat.setString(7, address1);
			pstat.setString(8, address2);
			pstat.setString(9, email_receive);
			pstat.setString(10, id);
			int result = pstat.executeUpdate();

			con.commit();
			return result;			
		}
	}

	// 회원 탈퇴
	public int memOut(String id, String pw) throws Exception{
		String sql = "delete from member where id=? and pw=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, pw);
			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}

	// 내가 쓴 글 목록
	public List<BoardDTO> mywriteList(String inputId) throws Exception{
		String sql = "select * from board where writer=? order by 1 desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, inputId);
			ResultSet rs = pstat.executeQuery();

			List<BoardDTO> result = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String board = rs.getString("board");
				int area = rs.getInt("area");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				int view_count = rs.getInt("view_count");

				BoardDTO dto = new BoardDTO(seq, board, area, null, writer, title, contents, write_date, view_count);
				result.add(dto);
			}
			return result;
		}
	}

	// 내 기부 목록
	public List<SupportDTO> mydonateList(String inputId) throws Exception{
		String sql = "select * from support where id=? order by 1 desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, inputId);
			ResultSet rs = pstat.executeQuery();

			List<SupportDTO> result = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String id = rs.getString("id");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String card_name = rs.getString("card_name");
				String method_name = rs.getString("method_name");
				String pg = rs.getString("pg");
				int donation = rs.getInt("donation");
				Timestamp support_date = rs.getTimestamp("support_date");
				String receipt_id = rs.getString("receipt_id");
				String agency_name = rs.getString("agency_name");

				SupportDTO dto = new SupportDTO(seq, id, name, phone, email, card_name, method_name, pg, donation, support_date, receipt_id, agency_name);
				result.add(dto);
			}
			return result;
		}
	}

	// 후원 개인 총 금액
	public String totalDonation(String inputId) throws Exception{
		String sql = "select to_char(sum(donation),'999,999,999,999') from support where id=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, inputId);
			ResultSet rs = pstat.executeQuery();

			SupportDTO dto = new SupportDTO();
			rs.next();
			return rs.getString(1);

		}
	}

	// 블랙리스트 전용 총 회원 목록 페이징
	private int getArticleCount() throws Exception{
		String sql = "select count(*) from member";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);
		}
	}

	public String getPageNavi(int currentPage) throws Exception{
		int recordTotalCount = this.getArticleCount();

		int pageTotalCount = 0;

		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = (recordTotalCount / Configuration.recordCountPerPage)+1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage>pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage -1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + Configuration.naviCountPerPage - 1;
		// endNavi는 pageTotalCount보다 클 수 업쑤
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		StringBuilder sb = new StringBuilder();

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi==1) {
			needPrev = false;
		}

		if(endNavi == pageTotalCount) {
			needNext = false;
		}


		if(needPrev) {sb.append("<a href='viewAll.man?currentPage="+(startNavi -1)+"'></a>");}
		for(int i=startNavi; i<=endNavi;i++) {
			sb.append("<a href ='viewAll.man?currentPage="+i+"'>");
			sb.append(i+" ");
			sb.append("</a>");
		}
		if(needNext) {sb.append("<a href='viewAll.man?currentPage="+(endNavi -1)+"'></a>");}

		System.out.println(needPrev);
		System.out.println(needNext);

		System.out.println(sb.toString());
		System.out.println(startNavi);
		System.out.println(endNavi);
		return sb.toString();
	}

	public List<MemberDTO> selectByPage(int startNum, int endNum) throws Exception{
		String sql = "select * from (select member.*, row_number() over(order by seq desc) as rown from member) where rown between ? and ? and manager_check = 'N'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);
			ResultSet rs = pstat.executeQuery();

			List<MemberDTO> list = new ArrayList<>();
			while (rs.next()) {
				int seq = rs.getInt(1);
				String id = rs.getString(2);
				String pw_find_hint = rs.getString(4);
				String pw_find_answer = rs.getString(5);
				String name = rs.getString(6);
				String phone = rs.getString(7);
				String email = rs.getString(8);
				String zipcode = rs.getString(9);
				String address1 = rs.getString(10);
				String address2 = rs.getString(11);
				String email_receive = rs.getString(12);
				String manager_check = rs.getString(13);
				String black = rs.getString(14);

				MemberDTO temp = new MemberDTO(seq, id, "", "", "", name, phone, email, zipcode, address1, address2, email_receive, manager_check, black);
				list.add(temp);
			}
			return list;
		}
	}

	//	-------------------------------------------------------------------------

	// 페이지 선택 (내 글)
	public List<BoardDTO> selectByPageW(String inputId, int start, int end) throws Exception{
		String sql = "select * from (select board.*, row_number() over (order by seq desc) rown from board where writer=?) where rown between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, inputId);
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			ResultSet rs = pstat.executeQuery();

			List<BoardDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt(1);
				String board = rs.getString(2);
				int area = rs.getInt(3);
				String writer = rs.getString(4);
				String title = rs.getString(5);
				String contents = rs.getString(6);
				Timestamp writedate = rs.getTimestamp(7);
				int view_count = rs.getInt(8);

				BoardDTO dto = new BoardDTO(seq, board, area, null, writer, title, contents, writedate, view_count);
				list.add(dto);
			}
			return list;
		}
	}

	// 글 개수 세기 (내 글)
	private int getArticleCountW(String inputId) throws Exception{
		String sql = "select count(*) from board where writer=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, inputId);
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}

	// 글 페이지 (내 글)
	public String getPageNaviW(String inputId, int currentPage) throws Exception{
		int recordTotalCount = this.getArticleCountW(inputId);
		int pageTotalCount = 0;

		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		System.out.println("현재 페이지 번호 : " + currentPage);
		System.out.println("네비게이터 시작 번호 : " + startNavi);
		System.out.println("네비게이터 끝 번호 : " + endNavi);

		StringBuilder sb = new StringBuilder();

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		if(needPrev) { sb.append("<a href='mywrite.mem?cpage="+(startNavi-1)+"'>< </a>"); }
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='mywrite.mem?cpage="+i+"'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		if(needNext) { sb.append("<a href='mywrite.mem?cpage="+(endNavi+1)+"'> ></a>"); }
		System.out.println(needPrev);
		System.out.println(needNext);

		System.out.println(sb.toString());
		return sb.toString();

	}

	// 페이지 선택 (후원)
	public List<SupportDTO> selectByPageD(String inputId, int start, int end) throws Exception{
		String sql = "select * from (select support.*, row_number() over (order by seq desc) rown from support where id=?) where rown between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, inputId);
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			ResultSet rs = pstat.executeQuery();

			List<SupportDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt(1);
				String id = rs.getString(2);
				String name = rs.getString(3);
				String phone = rs.getString(4);
				String email = rs.getString(5);
				String card_name = rs.getString(6);
				String method_name = rs.getString(7);
				String pg = rs.getString(8);
				int donation = rs.getInt(9);
				Timestamp support_date = rs.getTimestamp(10);
				String receipt_id = rs.getString(11);
				String agency_name = rs.getString(12);

				SupportDTO dto = new SupportDTO(seq, id, name, phone, email, card_name, method_name, pg, donation, support_date, receipt_id, agency_name);
				list.add(dto);
			}
			return list;
		}
	}

	// 글 개수 세기 (후원)
	private int getArticleCountD(String inputId) throws Exception{
		String sql = "select count(*) from support where id=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, inputId);
			ResultSet rs = pstat.executeQuery();

			rs.next();
			return rs.getInt(1);
		}
	}

	// 글 페이지 (후원)
	public String getPageNaviD(String inputId, int currentPage) throws Exception{
		int recordTotalCount = this.getArticleCountD(inputId);
		int pageTotalCount = 0;

		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		System.out.println("현재 페이지 번호 : " + currentPage);
		System.out.println("네비게이터 시작 번호 : " + startNavi);
		System.out.println("네비게이터 끝 번호 : " + endNavi);

		StringBuilder sb = new StringBuilder();

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		if(needPrev) { sb.append("<a href='mydonate.mem?cpage="+(startNavi-1)+"'>< </a>"); }
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='mydonate.mem?cpage="+i+"'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		if(needNext) { sb.append("<a href='mydonate.mem?cpage="+(endNavi+1)+"'> ></a>"); }
		System.out.println(needPrev);
		System.out.println(needNext);

		System.out.println(sb.toString());
		return sb.toString();

	}

	public List<MemberDTO> selectAll() throws Exception{
		String sql = "select * from member where email_receive='Y'";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<MemberDTO> result = new ArrayList<>();

			while(rs.next()) {
				int seq = rs.getInt("seq");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String pw_find_hint = rs.getString("pw_find_hint");
				String pw_find_answer = rs.getString("pw_find_answer");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String zipcode = rs.getString("zipcode");
				String address1 = rs.getString("address1");
				String address2 = rs.getString("address2");
				String email_receive = rs.getString("email_receive");
				String manager_check = rs.getString("manager_check");
				String black = rs.getString("black");

				MemberDTO dto = new MemberDTO(seq,id,pw,pw_find_hint,pw_find_answer,name,phone,email,zipcode,address1,address2,email_receive,manager_check,black);
				result.add(dto);
			}
			return result;
		}	
	}
	public int update(MemberDTO dto) throws Exception{
		String sql = 
				"update member set black ='Y' where id=?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setString(1, dto.getId());


			int result = pstat.executeUpdate();
			con.commit();

			return result;
		}
	}

}