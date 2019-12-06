package msg.board;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CommentsDTO {
	private int seq;
	private int root;
	private String writer;
	private String contents;
	private Timestamp write_date;
	private String formed_date;
			
	public CommentsDTO() {}
	public CommentsDTO(int seq, int root, String writer, String contents, Timestamp write_date, String formed_date) {
		super();
		this.seq = seq;
		this.root = root;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
		this.formed_date = formed_date;
	}
	
	public String getFormed_date() {
	      SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");
	      
	      long write_date = this.write_date.getTime();
	      long current_date = System.currentTimeMillis();
	      
	      long gapTime = (current_date - write_date)/1000;
	      
	      if(gapTime <= 60) {
	         return "방금 전";
	      }else if(gapTime < 300) {
	         return "5분 이내";
	      }else if(300 < gapTime && gapTime <= 3600) {
	         return "1시간 이내";
	      }else {
	         return sdf.format(this.write_date.getTime());
	      }
	}
	public void setFormed_date(String formed_date) {
		this.formed_date = formed_date;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	
}
