package msg.sos;

public class SosDTO {
private int seq;
private String writer;
private String area;
private String title;
private String contents;
private String accept;
public SosDTO(int seq, String writer, String area, String title, String contents, String accept) {
	super();
	this.seq = seq;
	this.writer = writer;
	this.area = area;
	this.title = title;
	this.contents = contents;
	this.accept = accept;
}
public int getSeq() {
	return seq;
}
public void setSeq(int seq) {
	this.seq = seq;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public String getArea() {
	return area;
}
public void setArea(String area) {
	this.area = area;
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
public String getAccept() {
	return accept;
}
public void setAccept(String accept) {
	this.accept = accept;
}

}
