package msg.board;

public class FileDTO {
	private int seq;
	private int root;
	private String file_name;
	private String original_file_name;
	
	public FileDTO(int seq, int root, String file_name, String original_file_name) {
		super();
		this.seq = seq;
		this.root = root;
		this.file_name = file_name;
		this.original_file_name = original_file_name;
	}

	public FileDTO() {
		super();
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

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getOriginal_file_name() {
		return original_file_name;
	}

	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
		
}
