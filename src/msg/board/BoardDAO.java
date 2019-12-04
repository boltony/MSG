package msg.board;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import msg.utils.Configuration;
import msg.utils.Statics;

public class BoardDAO {
	private static BoardDAO instance;
	
	private BoardDAO() {
		
	}
	
	public synchronized static BoardDAO getInstance() {
		if(instance==null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		return Statics.bds.getConnection();
	}
	
	private int getArticleCount(String board, String choice, String content) throws Exception{
		String sql=null;
		content="%"+content+"%";
		if(choice==null) {
			sql = "select count(*) from board where board = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, board);
			try(
					ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		}
		}else {
			if(content.contentEquals("")||choice==null) {
				sql = "select count(*) from board where board = ?";
			}else if(choice.contentEquals("writer")) {
				sql = "select count(*) from board where  board = ? and writer = ?";
			}else if(choice.contentEquals("title")) {
				sql = "select  count(*)  from board where  board = ? and title LIKE '%"+content+"%'";
			}else if(choice.contentEquals("contents")) {
				sql = "select  count(*) from board where  board = ? and contents LIKE '%"+content+"%'";
			}else if(choice.contentEquals("area")) {
				sql = "select  count(*) from board where  board = ? and area = ?";
				if(content.contentEquals("%서울%")) {content = "1";}
				else if(content.contentEquals("%경기%")) {content = "2";}
				else if(content.contentEquals("%인천%")) {content = "3";}
				else if(content.contentEquals("%부산%")) {content = "4";}
				else if(content.contentEquals("%대전%")) {content = "5";}
				else if(content.contentEquals("%대구%")) {content = "6";}
				else if(content.contentEquals("%울산%")) {content = "7";}
				else if(content.contentEquals("%광주%")) {content = "8";}
				else if(content.contentEquals("%강원%")) {content = "9";}
				else if(content.contentEquals("%충북%")) {content = "10";}
				else if(content.contentEquals("%충남%")) {content = "11";}
				else if(content.contentEquals("%경북%")) {content = "12";}
				else if(content.contentEquals("%경남%")) {content = "13";}
				else if(content.contentEquals("%전북%")) {content = "14";}
				else if(content.contentEquals("%전남%")) {content = "15";}
				else if(content.contentEquals("%제주%")) {content = "16";}
				else if(content.contentEquals("%세종%")) {content = "17";}
				else {content="";
				sql = "select count(*) from board where board = ?";
				}
				
			}else {
				sql = "select  count(*) from board where board = ?";
			}
			
			try(
					Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
					){
				pstat.setString(1, board);
				
				if(!(content.contentEquals("")||choice==null)&&(choice.contentEquals("area") || choice.contentEquals("writer"))){
					pstat.setString(2, content);
				}
				try(
						ResultSet rs = pstat.executeQuery();){
					rs.next();
					System.out.println("getArticleCount : "+rs.getInt(1));
					return rs.getInt(1);
				}
			}
		}
	}
	
	public List<BoardDTO> searchByChoice(String choice, String content,  String board, int startNum, int endNum) throws Exception{
		String sql = null;
		content="%"+content+"%";
		if(content.contentEquals("")) {
			sql = "select * from (select board.*, row_number() over(order by seq desc) as rown from board where board = ?) where rown between ? and ?";
		}else if(choice.contentEquals("writer")) {
			sql = "select * from (select board.*, row_number() over(order by seq desc) as rown from board where board = ? and writer = ?) where rown between ? and ?";
		}else if(choice.contentEquals("title")) {
			sql = "select * from (select board.*, row_number() over(order by seq desc) as rown from board where board = ? and title LIKE '%"+content+"%') where rown between ? and ?";
		}else if(choice.contentEquals("contents")) {
			sql = "select * from (select board.*, row_number() over(order by seq desc) as rown from board where board = ? and contents LIKE '%"+content+"%') where rown between ? and ?";
		}else if(choice.contentEquals("area")) {
			sql = "select * from (select board.*, row_number() over(order by seq desc) as rown from board where board = ? and area = ?) where rown between ? and ?";
			if(content.contentEquals("%서울%")) {content = "1";}
			else if(content.contentEquals("%경기%")) {content = "2";}
			else if(content.contentEquals("%인천%")) {content = "3";}
			else if(content.contentEquals("%부산%")) {content = "4";}
			else if(content.contentEquals("%대전%")) {content = "5";}
			else if(content.contentEquals("%대구%")) {content = "6";}
			else if(content.contentEquals("%울산%")) {content = "7";}
			else if(content.contentEquals("%광주%")) {content = "8";}
			else if(content.contentEquals("%강원%")) {content = "9";}
			else if(content.contentEquals("%충북%")) {content = "10";}
			else if(content.contentEquals("%충남%")) {content = "11";}
			else if(content.contentEquals("%경북%")) {content = "12";}
			else if(content.contentEquals("%경남%")) {content = "13";}
			else if(content.contentEquals("%전북%")) {content = "14";}
			else if(content.contentEquals("%전남%")) {content = "15";}
			else if(content.contentEquals("%제주%")) {content = "16";}
			else if(content.contentEquals("%세종%")) {content = "17";}
			else {
				content="";
				sql = "select * from (select board.*, row_number() over(order by seq desc) as rown from board where board = ?) where rown between ? and ?";
			}
			
		}else {
			sql = "select * from (select board.*, row_number() over(order by seq desc) as rown from board where board = ?) where rown between ? and ?";
		}
		try(
		Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);
				){
			
			
			if(content.contentEquals("")) {
				pstat.setInt(2, startNum);
				pstat.setInt(3, endNum);
			}else if(choice.contentEquals("area") || choice.contentEquals("writer")){
				pstat.setString(2, content);
				pstat.setInt(3, startNum);
				pstat.setInt(4, endNum);
			}else{
				pstat.setInt(2, startNum);
				pstat.setInt(3, endNum);
			}
			pstat.setString(1, board);
			
			ResultSet rs = pstat.executeQuery();
			List<BoardDTO> result = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt(1);
				int area = rs.getInt(3);
				String writer = rs.getString(4);
				String title = rs.getString(5);
				String contents = rs.getString(6);
				Timestamp write_date = rs.getTimestamp(7);
				int view_count = rs.getInt(8);
				BoardDTO dto = new BoardDTO(seq, board, area, null, writer, title, contents, write_date, view_count);
				dto.setS_area(area);
				result.add(dto);
			}
		return result;
		}
	}
	
	public String getPageNavi(int currentPage, String board, String choice, String contents, int size) throws Exception{
		int recordTotalCount = this.getArticleCount(board, choice,contents);
		
		
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
			if(board.contentEquals("M")) {
				if(needPrev) {sb.append("<a href='missing.bo?currentPage="+(startNavi -1)+"&choice="+choice+"&contents="+contents+"'></a>");}
				for(int i=startNavi; i<=endNavi;i++) {
					sb.append("<a href ='missing.bo?currentPage="+i+"&choice="+choice+"&contents="+contents+"'>");
					sb.append(i+" ");
					sb.append("</a>");
				}
				if(needNext) {sb.append("<a href='missing.bo?currentPage="+(endNavi -1)+"&choice="+choice+"&contents="+contents+"'></a>");}
				
			}else if(board.contentEquals("P")) {
				if(needPrev) {sb.append("<a href='protect.bo?currentPage="+(startNavi -1)+"&choice="+choice+"&contents="+contents+"'></a>");}
				for(int i=startNavi; i<=endNavi;i++) {
					sb.append("<a href ='protect.bo?currentPage="+i+"&choice="+choice+"&contents="+contents+"'>");
					sb.append(i+" ");
					sb.append("</a>");
				}
				if(needNext) {sb.append("<a href='protect.bo?currentPage="+(endNavi -1)+"&choice="+choice+"&contents="+contents+"'></a>");}
			}
		}else {
			if(board.contentEquals("M")) {
				if(needPrev) {sb.append("<a href='missing.bo?currentPage="+(startNavi -1)+"'></a>");}
				for(int i=startNavi; i<=endNavi;i++) {
					sb.append("<a href ='missing.bo?currentPage="+i+"'>");
					sb.append(i+" ");
					sb.append("</a>");
				}
				if(needNext) {sb.append("<a href='missing.bo?currentPage="+(endNavi -1)+"'></a>");}
				
			}else if(board.contentEquals("P")) {
				if(needPrev) {sb.append("<a href='protect.bo?currentPage="+(startNavi -1)+"'></a>");}
				for(int i=startNavi; i<=endNavi;i++) {
					sb.append("<a href ='protect.bo?currentPage="+i+"'>");
					sb.append(i+" ");
					sb.append("</a>");
				}
				if(needNext) {sb.append("<a href='protect.bo?currentPage="+(endNavi -1)+"'></a>");}
			}
		}
		
		

		System.out.println(needPrev);
		System.out.println(needNext);
		
		System.out.println(sb.toString());
		System.out.println(startNavi);
		System.out.println(endNavi);
		return sb.toString();
	}
	
	public List<BoardDTO> selectByPage(String board, int startNum, int endNum, int size) throws Exception{
		String sql = "select * from (select board.*, row_number() over(order by seq desc) as rown from board where board = ?) where rown between ? and ?";
		try(
		Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, board);
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
			ResultSet rs = pstat.executeQuery();
			List<BoardDTO> result = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt(1);
				int area = rs.getInt(3);
				String writer = rs.getString(4);
				String title = rs.getString(5);
				String contents = rs.getString(6);
				Timestamp write_date = rs.getTimestamp(7);
				int view_count = rs.getInt(8);
				BoardDTO dto = new BoardDTO(seq, board, area, null, writer, title, contents, write_date, view_count);
				dto.setS_area(area);
				result.add(dto);
			}
		return result;
		}
	}
	

	
	
	public List<Integer> allSeq() throws Exception{
		String sql = "select seq from board";
		List<Integer> result = new ArrayList<>();
		try(
		Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
				){
			while(rs.next()) {
				int seq = rs.getInt(1);
				result.add(seq);
			}
		return result;
		}
	}
	
	public BoardDTO detailView(int seq) throws Exception{
		String sql = "select * from board where seq =? order by seq";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				BoardDTO dto = null;
				if(rs.next()) {
					String board = rs.getString(2);
					int area = rs.getInt(3);
					String writer = rs.getString(4);
					String title = rs.getString(5);
					String contents = rs.getString(6);
					Timestamp write_date = rs.getTimestamp(7);
					int view_count = rs.getInt(8);
					dto = new BoardDTO(seq, board, area, null, writer, title, contents, write_date, view_count);
					dto.setS_area(area);
				}
				return dto;
			}
		}
	}
	
	public int viewCount(int seq) throws Exception{
		String sql = "update board set view_count=view_count+1 where seq=?";
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
	
	
	public int write(BoardDTO dto) throws Exception{
		String sql = "insert into board values(?, ?, ?, ?, ?, ?, sysdate, 0)";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getSeq());
			pstat.setString(2, dto.getBoard());
			pstat.setInt(3, dto.getArea());
			pstat.setString(4, dto.getWriter());
			pstat.setString(5, dto.getTitle());
			pstat.setString(6, dto.getContents());

			int result = pstat.executeUpdate();
			con.commit();
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
	
	public int delete(int seq) throws Exception{
		String sql = "delete from board where seq=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	 
	public int update(BoardDTO dto) throws Exception{
		String sql = "update board set area=?, writer=?, title=?, contents=? where seq=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getArea());
			pstat.setString(2, dto.getWriter());
			pstat.setString(3, dto.getTitle());
			pstat.setString(4, dto.getContents());
			pstat.setInt(5, dto.getSeq());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	
}
