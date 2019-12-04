package msg.member;

public class MemberDTO {
	private int seq;
	private String id;
	private String pw;
	private String pw_find_hint;
	private String pw_find_answer;
	private String name;
	private String phone;
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
	private String email_receive;
	private String manager_check;
	private String black;
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(int seq, String id, String pw, String pw_find_hint, String pw_find_answer, String name,
			String phone, String email, String zipcode, String address1, String address2, String email_receive,
			String manager_check, String black) {
		super();
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.pw_find_hint = pw_find_hint;
		this.pw_find_answer = pw_find_answer;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.email_receive = email_receive;
		this.manager_check = manager_check;
		this.black = black;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPw_find_hint() {
		return pw_find_hint;
	}

	public void setPw_find_hint(String pw_find_hint) {
		this.pw_find_hint = pw_find_hint;
	}

	public String getPw_find_answer() {
		return pw_find_answer;
	}

	public void setPw_find_answer(String pw_find_answer) {
		this.pw_find_answer = pw_find_answer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getEmail_receive() {
		return email_receive;
	}

	public void setEmail_receive(String email_receive) {
		this.email_receive = email_receive;
	}

	public String getManager_check() {
		return manager_check;
	}

	public void setManager_check(String manager_check) {
		this.manager_check = manager_check;
	}

	public String getBlack() {
		return black;
	}

	public void setBlack(String black) {
		this.black = black;
	}

}