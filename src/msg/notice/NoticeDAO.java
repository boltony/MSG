package msg.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import msg.board.BoardDAO;
import msg.board.BoardDTO;
import msg.utils.Configuration;
import msg.utils.Statics;

public class NoticeDAO {
	private static NoticeDAO instance;

	private NoticeDAO() {
	}

	public synchronized static NoticeDAO getInstance() {
		if(instance==null) {
			instance = new NoticeDAO();
		}
		return instance;
	}
	public Connection getConnection() throws Exception{
		return Statics.bds.getConnection();
	}


	public int getSeq() throws Exception{
		String sql = "select notice_seq.nextval from dual";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			int seq = 0;
			if(rs.next()) {
				seq = rs.getInt(1);
			}
			return seq;
		}
	}


	public String getPageNavi(int currentPage, String choice, String contents, int size) throws Exception{
		int recordTotalCount = this.getArticleCount(choice,contents);


		int pageTotalCount = 0;

		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = (recordTotalCount / Configuration.recordCountPerPage)+1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}

		System.out.println("pageTotalCount"+pageTotalCount);
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage-1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + Configuration.naviCountPerPage - 1;
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

		if(choice!=null) {

			if(needPrev) {sb.append("<a href='notice.no?currentPage="+(startNavi -1)+"&choice="+choice+"&contents="+contents+"'></a>");}
			for(int i=startNavi; i<=endNavi;i++) {
				sb.append("<a href ='notice.no?currentPage="+i+"&choice="+choice+"&contents="+contents+"'>");
				sb.append(i+" ");
				sb.append("</a>");
			}
			if(needNext) {sb.append("<a href='notice.no?currentPage="+(endNavi -1)+"&choice="+choice+"&contents="+contents+"'></a>");}

		}else {

			if(needPrev) {sb.append("<a href='notice.no?currentPage="+(startNavi -1)+"'></a>");}
			for(int i=startNavi; i<=endNavi;i++) {
				sb.append("<a href ='notice.no?currentPage="+i+"'>");
				sb.append(i+" ");
				sb.append("</a>");
			}
			if(needNext) {sb.append("<a href='notice.no?currentPage="+(endNavi -1)+"'></a>");}


		}



		System.out.println(needPrev);
		System.out.println(needNext);

		System.out.println(sb.toString());
		System.out.println(startNavi);
		System.out.println(endNavi);
		return sb.toString();
	}

	public List<NoticeDTO> searchByChoice(String choice, String content, int startNum, int endNum) throws Exception{
		String sql = null;
		content="%"+content+"%";
		choice="%"+choice+"%";
		System.out.println(content+":"+choice);
		if(choice.contentEquals("%title%")) {
			sql = "select * from (select notice.*, row_number() over(order by seq desc) as rown from notice where title LIKE '%"+content+"%') where rown between ? and ?";
		}else if(choice.contentEquals("%contents%")) {
			sql = "select * from (select notice.*, row_number() over(order by seq desc) as rown from notice where contents LIKE '%"+content+"%') where rown between ? and ?";
		}else {
			sql = "select * from (select notice.*, row_number() over(order by seq desc) as rown from notice) where rown between ? and ?";
		}
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);

			ResultSet rs = pstat.executeQuery();
			List<NoticeDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt(1);
				String title = rs.getString(2);
				String contents = rs.getString(3);
				Timestamp write_date = rs.getTimestamp(4);
				int view_count = rs.getInt(5);
				list.add(new NoticeDTO(seq, title, contents, write_date, view_count));
			}
			return list;
		}
	}

	public List<NoticeDTO> selectByPage(int startNum, int endNum) throws Exception{
		String sql = "select * from (select notice.*, row_number() over(order by seq desc) as rown from notice) where rown between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);
			ResultSet rs = pstat.executeQuery();
			List<NoticeDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt(1);
				String title = rs.getString(2);
				String contents = rs.getString(3);
				Timestamp write_date = rs.getTimestamp(4);
				int view_count = rs.getInt(5);
				list.add(new NoticeDTO(seq, title, contents, write_date, view_count));
			}
			return list;
		}
	}

	private int getArticleCount(String choice, String content) throws Exception{
		String sql=null;
		content="%"+content+"%";
		choice="%"+choice+"%";
		if(choice.contentEquals("%title%")) {
			sql = "select  count(*)  from notice where  title LIKE '%"+content+"%'";
		}else if(choice.contentEquals("%contents%")) {
			sql = "select  count(*) from notice where contents LIKE '%"+content+"%'";
		}else {
			sql = "select  count(*) from notice";
		}

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				ResultSet rs = pstat.executeQuery();){
			rs.next();
			System.out.println("getArticleCount : "+rs.getInt(1));
			return rs.getInt(1);
		}
	}




	public List<NoticeDTO> selectAll() throws Exception{
		String sql = "select * from notice";
		List<NoticeDTO> list = new ArrayList<>();
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			while(rs.next()) {
				int seq = rs.getInt(1);
				String title = rs.getString(2);
				String contents = rs.getString(3);
				Timestamp write_date = rs.getTimestamp(4);
				int view_count = rs.getInt(5);
				list.add(new NoticeDTO(seq, title, contents, write_date, view_count));
			}
			return list;
		}
	}

	public int viewCount(int seq) throws Exception{
		String sql = "update notice set view_count=view_count+1 where seq=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int write(NoticeDTO dto) throws Exception{
		String sql = "insert into notice values(?, ?, ?, sysdate, 0)";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getSeq());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getContents());
			int result = pstat.executeUpdate();
			return result;
		}
	}

	public int delete(int seq) throws Exception{
		String sql = "delete from notice where seq=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	public int update(NoticeDTO dto) throws Exception{
		String sql = "update notice set title=?, contents=? where seq=?";
		try (
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContents());
			pstat.setInt(3, dto.getSeq());
			int result = pstat.executeUpdate();
			return result;
		}
	}

	public NoticeDTO detailView(int seq) throws Exception{
		String sql = "select * from notice where seq=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				NoticeDTO dto = null;
				if(rs.next()) {
					String title = rs.getString(2);
					String contents = rs.getString(3);
					Timestamp write_date = rs.getTimestamp(4);
					int view_count = rs.getInt(5);
					dto = new NoticeDTO(seq, title, contents, write_date, view_count);
				}
				return dto;
			}
		}
	}
}
