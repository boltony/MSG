package msg.notice;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class NoticeDTO {
    private int seq;
    private String title;
    private String contents;
    private Timestamp write_date;
    private int view_count;
    
	public NoticeDTO() {}
	public NoticeDTO(int seq, String title, String contents, Timestamp write_date, int view_count) {
		super();
		this.seq = seq;
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
