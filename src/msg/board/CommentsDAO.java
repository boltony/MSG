package msg.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import msg.utils.Configuration;
import msg.utils.Statics;

public class CommentsDAO {
	private static CommentsDAO instance;
	
	public synchronized static CommentsDAO getInstance() {
		if(instance==null) {
			instance=new CommentsDAO();
		}
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		return Statics.bds.getConnection();
	}
	
	private int getArticleCount(int root) throws Exception{
		String sql = "select count(*) from comments where root = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, root);
			try(
					ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	
	public String getPageNavi(int currentPage, int root) throws Exception{
		int recordTotalCount = this.getArticleCount(root);

		int pageTotalCount = 0;
		
		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = (recordTotalCount / Configuration.recordCountPerPage)+1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}
		
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
		

		if(needPrev) {sb.append("<a href='#' class ='pageNavi' currentNaviPage="+(startNavi -1)+"></a>");}
		for(int i=startNavi; i<=endNavi;i++) {
			sb.append("<a href='#' class ='pageNavi' currentNaviPage="+i+">");
			sb.append(i+" ");
			sb.append("</a>");
		}
		if(needNext) {sb.append("<a  href='#' class ='pageNavi' 'currentNaviPage="+(endNavi -1)+"></a>");}


		System.out.println(needPrev);
		System.out.println(needNext);
		
		System.out.println(sb.toString());
		System.out.println(startNavi);
		System.out.println(endNavi);
		return sb.toString();
	}
	
	
	public List<CommentsDTO> selectCommentByPage(int root, int startNum, int endNum) throws Exception{
		String sql = "select * from (select comments.*, row_number() over(order by seq desc) as rown from comments where root=?) where rown between ? and ?";
		try(
		Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, root);
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
			ResultSet rs = pstat.executeQuery();
			List<CommentsDTO> result = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt(1);
				String writer = rs.getString(3);
				String contents = rs.getString(4);
				Timestamp write_date = rs.getTimestamp(5);
				CommentsDTO dto = new CommentsDTO(seq, root, writer, contents, write_date, null);
				dto.setFormed_date(dto.getFormed_date());
				result.add(dto);
			}
		return result;
		}
	}
	
	
	
	
	
	public int getSeq() throws Exception{
		String sql = "select board_seq.nextval from dual";
		try(
		Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();){
		rs.next();
		int seq = rs.getInt(1);
		con.commit();
		return seq;
		}
	}
	
	public int write(CommentsDTO dto) throws Exception{
		String sql = "insert into comments values(?, ?, ?, ?, sysdate)";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, dto.getSeq());
			pstat.setInt(2, dto.getRoot());
			pstat.setString(3, dto.getWriter());
			pstat.setString(4, dto.getContents());
			
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public List<CommentsDTO> selectAll(int root) throws Exception{
		String sql = "select * from comments where root = ?";
		try(		
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, root);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<CommentsDTO> result = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(3);
					String contents = rs.getString(4);
					Timestamp write_date = rs.getTimestamp(5);
					CommentsDTO dto = new CommentsDTO(seq, root, writer, contents, write_date, null);
					String formed_date = dto.getFormed_date();
					dto.setFormed_date(formed_date);
					result.add(dto);
				}
				return result;
			}
		}
	}
	
	public CommentsDTO selectBySeq(int seq) throws Exception{
		String sql = "select * from comments where seq = ?";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(
					ResultSet rs = pstat.executeQuery();){
				CommentsDTO result = null;
				if(rs.next()) {
					int root = rs.getInt(2);
					String writer = rs.getString(3);
					String contents = rs.getString(4);
					Timestamp write_date = rs.getTimestamp(5);
					CommentsDTO dto = new CommentsDTO(seq, root, writer, contents, write_date, null);
					String formed_date = dto.getFormed_date();
					dto.setFormed_date(formed_date);
					result = dto;
				}
				return result;
			}
		}
	}
	
	public int delete(int seq) throws Exception{
		String sql = "delete from comments where seq=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int update(int seq, String contents) throws Exception{
		String sql = "update comments set contents=? ,write_date=sysdate where seq=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(2, seq);
			pstat.setString(1, contents);
			
			int result = pstat.executeUpdate();
			return result;
		}
	}
}
