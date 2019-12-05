package msg.sos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import msg.utils.Configuration;

public class SosDAO {
	private static SosDAO instance;
	private BasicDataSource bds = new BasicDataSource();
	private SosDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("msg");
		bds.setPassword("msg");
		bds.setInitialSize(30);
	}
	public synchronized static SosDAO getInstance() {
		if(instance==null) {
			instance = new SosDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception {
		return bds.getConnection();
	}

	public String getPageNavi(int currentPage) throws Exception {  // 현재 내가 위치한 페이지

		// 게시판 내의 글의 총 개수 (DB에 있는 글의 개수)
		int recordTotalCount = this.getNPostCount();
		System.out.println("DB에 있는 글의 개수 : " + recordTotalCount);

		// 페이지당 글의 개수 설정 (static 변수로 수정)
		//      int recordCountPerPage = 10;

		// 한 페이지에서 보여지는 네비게이터의 개수 설정 (static 변수로 수정)
		//      int naviCountPerPage = 10;

		// 페이지의 총 개수
		int pageTotalCount = 0;

		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}
		else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}

		// 현재 내가 위치한 페이지 값이 비정상 값일 때, 조정하는 보안 코드
		if(currentPage < 1) {
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// 현재 내가 위치한 페이지에 따라 네비게이터 시작 페이지 값을 구하는 공식
		int startNavi = ((currentPage - 1) / Configuration.naviCountPerPage) * Configuration.naviCountPerPage + 1;

		int endNavi = startNavi + Configuration.naviCountPerPage - 1;

		// 페이지 끝 값이 비정상 값일 때, 조정하는 보안 코드
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		System.out.println("현재 페이지 : " + currentPage);
		System.out.println("내비게이터 시작 번호 : " + startNavi);
		System.out.println("내비게이터 끝 번호 : " + endNavi);
		System.out.println();

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		// String 덧셈 역할을 해주는 class
		StringBuilder sb = new StringBuilder();
		if(needPrev == true) {
			sb.append("<a href='list.mail?cpage=" + (startNavi - 1) + "'>");
			sb.append("< ");
			sb.append("</a>");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='list.mail?cpage=" + i + "'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		if(needNext == true) {
			sb.append("<a href='list.mail?cpage=" + (endNavi + 1) + "'>");
			sb.append(">");
			sb.append("</a>");
		}

		return sb.toString();
	}public String getYPageNavi(int currentPage) throws Exception {  // 현재 내가 위치한 페이지

		// 게시판 내의 글의 총 개수 (DB에 있는 글의 개수)
		int recordTotalCount = this.getYPostCount();
		System.out.println("DB에 있는 글의 개수 : " + recordTotalCount);

		// 페이지당 글의 개수 설정 (static 변수로 수정)
		//      int recordCountPerPage = 10;

		// 한 페이지에서 보여지는 네비게이터의 개수 설정 (static 변수로 수정)
		//      int naviCountPerPage = 10;

		// 페이지의 총 개수
		int pageTotalCount = 0;

		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}
		else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}

		// 현재 내가 위치한 페이지 값이 비정상 값일 때, 조정하는 보안 코드
		if(currentPage < 1) {
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// 현재 내가 위치한 페이지에 따라 네비게이터 시작 페이지 값을 구하는 공식
		int startNavi = ((currentPage - 1) / Configuration.naviCountPerPage) * Configuration.naviCountPerPage + 1;

		int endNavi = startNavi + Configuration.naviCountPerPage - 1;

		// 페이지 끝 값이 비정상 값일 때, 조정하는 보안 코드
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		System.out.println("현재 페이지 : " + currentPage);
		System.out.println("내비게이터 시작 번호 : " + startNavi);
		System.out.println("내비게이터 끝 번호 : " + endNavi);
		System.out.println();

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		// String 덧셈 역할을 해주는 class
		StringBuilder sb = new StringBuilder();
		if(needPrev == true) {
			sb.append("<a href='Ylist.mem?cpage=" + (startNavi - 1) + "'>");
			sb.append("< ");
			sb.append("</a>");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='Ylist.mem?cpage=" + i + "'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		if(needNext == true) {
			sb.append("<a href='Ylist.mem?cpage=" + (endNavi + 1) + "'>");
			sb.append(">");
			sb.append("</a>");
		}

		return sb.toString();
	}

	private int getNPostCount() throws Exception {
		String sql = "select count(*) from sos where accept='N'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			int result = rs.getInt(1);

			con.commit();
			return result;
		}
	}
	private int getYPostCount() throws Exception {
		String sql = "select count(*) from sos where accept='Y'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			int result = rs.getInt(1);

			con.commit();
			return result;
		}
	}

	public int insert(SosDTO dto) throws Exception{
		String sql = "insert into sos values(sos_seq.nextval,?,?,?,?,?)";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){


			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getArea());
			pstat.setString(3, dto.getTitle());
			pstat.setString(4, dto.getContents());
			pstat.setString(5, dto.getAccept());


			int result = pstat.executeUpdate();
			con.commit();

			return result;
		}
	}

	public List<SosDTO> selectByPage(int begin, int end) throws Exception {
		String sql = "select * from"
				+ "(select sos.*, row_number() over (order by seq desc) as rown from sos where accept='N')"
				+ "where rown between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, begin);
			pstat.setInt(2, end);

			try(					
					ResultSet rs = pstat.executeQuery();
					){
				List<SosDTO> result = new ArrayList<>();

				while(rs.next()) {
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String area = rs.getString("area");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					String accept = rs.getString("accept");


					SosDTO dto = new SosDTO(seq,writer,area,title,contents,accept);
					result.add(dto);
				}
				return result;
			}
		}
	}
	public List<SosDTO> selectByYPage(int begin, int end) throws Exception {
		String sql = "select * from"
				+ "(select sos.*, row_number() over (order by seq desc) as rown from sos where accept='Y')"
				+ "where rown between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, begin);
			pstat.setInt(2, end);

			try(					
					ResultSet rs = pstat.executeQuery();
					){
				List<SosDTO> result = new ArrayList<>();

				while(rs.next()) {
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String area = rs.getString("area");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					String accept = rs.getString("accept");


					SosDTO dto = new SosDTO(seq,writer,area,title,contents,accept);
					result.add(dto);
				}
				return result;
			}
		}
	}

	public List<SosDTO> selectAll() throws Exception{
		String sql = "select * from sos where accept='N'";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<SosDTO> result = new ArrayList<>();

			while(rs.next()) {
				int seq = rs.getInt("seq");
				String writer = rs.getString("writer");
				String area = rs.getString("area");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String accept = rs.getString("accept");


				SosDTO dto = new SosDTO(seq,writer,area,title,contents,accept);
				result.add(dto);
			}
			return result;
		}	
	}
	public List<SosDTO> selectY() throws Exception{
		String sql = "select * from sos where accept='Y'";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<SosDTO> result = new ArrayList<>();

			while(rs.next()) {
				int seq = rs.getInt("seq");
				String writer = rs.getString("writer");
				String area = rs.getString("area");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String accept = rs.getString("accept");


				SosDTO dto = new SosDTO(seq,writer,area,title,contents,accept);
				result.add(dto);
			}
			return result;
		}	
	}
	public int update(SosDTO dto) throws Exception{
		String sql = 
				"update sos set accept ='Y' where seq=?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getSeq());


			int result = pstat.executeUpdate();
			con.commit();

			return result;
		}
	}
	public int delete(SosDTO dto)throws Exception{
		String sql = "delete sos where writer=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getWriter());


			int result = pstat.executeUpdate();
			con.commit();

			return result;
		}
	}

	public int deletesos(SosDTO dto) throws Exception{
		String sql = 
				"delete sos where seq=?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getSeq());


			int result = pstat.executeUpdate();
			con.commit();

			return result;
		}
	}

}
