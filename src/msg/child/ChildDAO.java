package msg.child;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import msg.child.configuration.ChildConfiguration;

public class ChildDAO {
	private BasicDataSource bds = new BasicDataSource();

	private ChildDAO() {
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		bds.setUsername("msg");
		bds.setPassword("msg");
		bds.setInitialSize(30);
	}

	private static ChildDAO instance;
	
	public synchronized static ChildDAO getInstance() {  // synchronized를 작성하면 한 번에 하나의 thread만 접속 가능함
		if(instance == null) {  // 첫 번째 사람만 instance를 만들고, 두 번째 사람부터는 만들어진 instance를 사용함
			instance = new ChildDAO();
		}
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}
	
	public String getPageNavi(int currentPage) throws Exception {  // 현재 내가 위치한 페이지

		// 게시판 내의 글의 총 개수 (DB에 있는 글의 개수)
		int recordTotalCount = this.getPostCount();
		System.out.println("DB에 있는 글의 개수 : " + recordTotalCount);

		// 페이지당 글의 개수 설정 (static 변수로 수정)
		//		int recordCountPerPage = 10;

		// 한 페이지에서 보여지는 네비게이터의 개수 설정 (static 변수로 수정)
		//		int naviCountPerPage = 10;

		// 페이지의 총 개수
		int pageTotalCount = 0;

		if(recordTotalCount % ChildConfiguration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / ChildConfiguration.recordCountPerPage + 1;
		}
		else {
			pageTotalCount = recordTotalCount / ChildConfiguration.recordCountPerPage;
		}

		// 현재 내가 위치한 페이지 값이 비정상 값일 때, 조정하는 보안 코드
		if(currentPage < 1) {
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// 현재 내가 위치한 페이지에 따라 네비게이터 시작 페이지 값을 구하는 공식
		int startNavi = ((currentPage - 1) / ChildConfiguration.naviCountPerPage) * ChildConfiguration.naviCountPerPage + 1;

		int endNavi = startNavi + ChildConfiguration.naviCountPerPage - 1;

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
			sb.append("<a href='childList.child?cpage=" + (startNavi - 1) + "'>");
			sb.append("< ");
			sb.append("</a>");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='childList.child?cpage=" + i + "'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		if(needNext == true) {
			sb.append("<a href='childList.child?cpage=" + (endNavi + 1) + "'>");
			sb.append(">");
			sb.append("</a>");
		}

		return sb.toString();
	}
	
	private int getPostCount() throws Exception {
		String sql = "select count(*) from child";
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
	
	public int insert(ChildDTO dto) throws Exception{
	      String sql = "insert into child values(child_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	      try(
	            Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);
	            ){
	         
	         
	         pstat.setString(1, dto.getTarget());
	         pstat.setString(2, dto.getGender());
	         pstat.setString(3, dto.getName());
	         pstat.setString(4, dto.getBirth_date());
	         pstat.setTimestamp(5, dto.getMissing_date());
	         pstat.setInt(6, dto.getMissing_area());
	         pstat.setString(7, dto.getMissing_area_detail());
	         pstat.setInt(8, dto.getHeight());
	         pstat.setInt(9, dto.getWeight());
	         pstat.setInt(10, dto.getHair());
	         pstat.setInt(11, dto.getBlood_type());
	         pstat.setString(12, dto.getFeature());
	         pstat.setInt(13, dto.getTop());
	         pstat.setInt(14, dto.getTop_kind());
	         pstat.setInt(15, dto.getBottoms());
	         pstat.setInt(16, dto.getBottoms_kind());
	         pstat.setInt(17, dto.getShoes());
	         pstat.setInt(18, dto.getShoes_size());
	         pstat.setString(19, dto.getReporter());
	         pstat.setString(20, dto.getReporter_id());
	         pstat.setString(21, dto.getRe_birth_date());
	         pstat.setInt(22, dto.getRe_relation());
	         pstat.setString(23, dto.getRe_contact1());
	         pstat.setString(24, dto.getRe_contact2());
	         pstat.setString(25, dto.getAgreeYN());      

	         int result = pstat.executeUpdate();
	         con.commit();

	         return result;
	      }
	   }
	
	public List<ChildDTO> selectByPage(int begin, int end) throws Exception {
		String sql = "select * from"
				+ "(select child.*, row_number() over (order by seq desc) as rown from child)"
				+ "where rown between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)
				){
			pstat.setInt(1, begin);
			pstat.setInt(2, end);

			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<ChildDTO> list = new ArrayList<>();
				while(rs.next()) {
					ChildDTO dto = new ChildDTO();

					dto.setSeq(rs.getInt("seq"));
					dto.setTarget(rs.getString("target"));
					dto.setGender(rs.getString("gender"));
					dto.setName(rs.getString("name"));
					dto.setBirth_date(rs.getString("birth_date"));
					dto.setMissing_date(rs.getTimestamp("missing_date"));
					dto.setMissing_area(rs.getInt("missing_area"));
					dto.setMissing_area_detail(rs.getString("missing_area_detail"));
					dto.setHeight(rs.getInt("height"));
					dto.setWeight(rs.getInt("weight"));
					dto.setHair(rs.getInt("hair"));
					dto.setBlood_type(rs.getInt("blood_type"));
					dto.setFeature(rs.getString("feature"));
					dto.setTop(rs.getInt("top"));
					dto.setTop_kind(rs.getInt("top_kind"));
					dto.setBottoms(rs.getInt("bottoms"));
					dto.setBottoms_kind(rs.getInt("bottoms_kind"));
					dto.setShoes(rs.getInt("shoes"));
					dto.setShoes_size(rs.getInt("shoes_size"));
					dto.setReporter(rs.getString("reporter"));
					dto.setReporter_id(rs.getString("reporter_id"));
					dto.setRe_birth_date(rs.getString("re_birth_date"));
					dto.setRe_relation(rs.getInt("re_relation"));
					dto.setRe_contact1(rs.getString("re_contact1"));
					dto.setRe_contact2(rs.getString("re_contact2"));
					dto.setAgreeYN(rs.getString("agreeYN"));

					list.add(dto);
				}

				con.commit();
				return list;
			}
		}
	}
	
	public List<ChildDTO> selectAll() throws Exception {
		String sql = "select * from child order by seq desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<ChildDTO> list = new ArrayList<>();
			while(rs.next()) {
				ChildDTO dto = new ChildDTO();
				
				dto.setSeq(rs.getInt("seq"));
				dto.setTarget(rs.getString("target"));
				dto.setGender(rs.getString("gender"));
				dto.setName(rs.getString("name"));
				dto.setBirth_date(rs.getString("birth_date"));
				dto.setMissing_date(rs.getTimestamp("missing_date"));
				dto.setMissing_area(rs.getInt("missing_area"));
				dto.setMissing_area_detail(rs.getString("missing_area_detail"));
				dto.setHeight(rs.getInt("height"));
				dto.setWeight(rs.getInt("weight"));
				dto.setHair(rs.getInt("hair"));
				dto.setBlood_type(rs.getInt("blood_type"));
				dto.setFeature(rs.getString("feature"));
				dto.setTop(rs.getInt("top"));
				dto.setTop_kind(rs.getInt("top_kind"));
				dto.setBottoms(rs.getInt("bottoms"));
				dto.setBottoms_kind(rs.getInt("bottoms_kind"));
				dto.setShoes(rs.getInt("shoes"));
				dto.setShoes_size(rs.getInt("shoes_size"));
				dto.setReporter(rs.getString("reporter"));
				dto.setReporter_id(rs.getString("reporter_id"));
				dto.setRe_birth_date(rs.getString("re_birth_date"));
				dto.setRe_relation(rs.getInt("re_relation"));
				dto.setRe_contact1(rs.getString("re_contact1"));
				dto.setRe_contact2(rs.getString("re_contact2"));
				dto.setAgreeYN(rs.getString("agreeYN"));
				
				list.add(dto);
			}
			con.commit();
			return list;
		}
	}
	
	public ChildDTO selectBySeq(int seq) throws Exception {
		String sql = "select * from child where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			
			try(
					ResultSet rs = pstat.executeQuery();
					){
				ChildDTO dto = new ChildDTO();
				rs.next();
				dto.setSeq(rs.getInt("seq"));
				dto.setTarget(rs.getString("target"));
				dto.setGender(rs.getString("gender"));
				dto.setName(rs.getString("name"));
				dto.setBirth_date(rs.getString("birth_date"));
				dto.setMissing_date(rs.getTimestamp("missing_date"));
				dto.setMissing_area(rs.getInt("missing_area"));
				dto.setMissing_area_detail(rs.getString("missing_area_detail"));
				dto.setHeight(rs.getInt("height"));
				dto.setWeight(rs.getInt("weight"));
				dto.setHair(rs.getInt("hair"));
				dto.setBlood_type(rs.getInt("blood_type"));
				dto.setFeature(rs.getString("feature"));
				dto.setTop(rs.getInt("top"));
				dto.setTop_kind(rs.getInt("top_kind"));
				dto.setBottoms(rs.getInt("bottoms"));
				dto.setBottoms_kind(rs.getInt("bottoms_kind"));
				dto.setShoes(rs.getInt("shoes"));
				dto.setShoes_size(rs.getInt("shoes_size"));
				dto.setReporter(rs.getString("reporter"));
				dto.setReporter_id(rs.getString("reporter_id"));
				dto.setRe_birth_date(rs.getString("re_birth_date"));
				dto.setRe_relation(rs.getInt("re_relation"));
				dto.setRe_contact1(rs.getString("re_contact1"));
				dto.setRe_contact2(rs.getString("re_contact2"));
				dto.setAgreeYN(rs.getString("agreeYN"));
				
				con.commit();
				return dto;
			}
		}
	}
}
