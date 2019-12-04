package msg.board;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardDTO {
	private int seq;
	private String board;
	private int area;
	private String s_area; //area占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙환占쌔쇽옙 占쏙옙占� 占쏙옙占쏙옙 占쏙옙占쏙옙
	private String writer;
	private String title;
	private String contents;
	private Timestamp write_date;
	private int view_count;
	
	public BoardDTO() {}
	public BoardDTO(int seq, String board, int area, String s_area, String writer, String title, String contents, Timestamp write_date,
			int view_count) {
		super();
		this.seq = seq;
		this.board = board;
		this.area = area;
		this.s_area = s_area;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.view_count = view_count;
	}
	
	
	public String getFormed_date() {
	      SimpleDateFormat sdf = new SimpleDateFormat("YYYY/MM/dd");
	      
	      long write_date = this.write_date.getTime();
	      long current_date = System.currentTimeMillis();
	      
	      long gapTime = (current_date - write_date)/1000;
	      
	      if(gapTime <= 60) {
	         return "1분전";
	      }else if(gapTime < 300) {
	         return "5분전";
	      }else if(300 < gapTime && gapTime <= 3600) {
	         return "1시간 이내";
	      }else if(3600 < gapTime && gapTime <= 86400) {
	         return "오늘";
	      }else {
	         return sdf.format(this.write_date.getTime());
	      }
	}
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getBoard() {
		return board;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public String getS_area() {
		return s_area;
	}
	public void setS_area(int area) {
		if(area==1) {this.s_area = "서울";}
		else if(area==2) {this.s_area = "경기";}
		else if(area==3) {this.s_area = "인천";}
		else if(area==4) {this.s_area = "부산";}
		else if(area==5) {this.s_area = "대전";}
		else if(area==6) {this.s_area = "대구";}
		else if(area==7) {this.s_area = "울산";}
		else if(area==8) {this.s_area = "광주";}
		else if(area==9) {this.s_area = "강원";}
		else if(area==10) {this.s_area = "충북";}
		else if(area==11) {this.s_area = "충남";}
		else if(area==12) {this.s_area = "경북";}
		else if(area==13) {this.s_area = "경남";}
		else if(area==14) {this.s_area = "전북";}
		else if(area==15) {this.s_area = "전남";}
		else if(area==16) {this.s_area = "제주";}
		else if(area==17) {this.s_area = "세종";}

	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	
}
