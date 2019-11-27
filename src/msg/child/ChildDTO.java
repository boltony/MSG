package msg.child;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ChildDTO {
	private int seq;
	private String target;  // 010(아동) / 060(지적장애인) / 070(치매노인) 
	private String gender;  // M, W
	private String name;
	private String birth_date;
	private Timestamp missing_date;
	private int missing_area;  // 1, 2, 3, ... ,17 (서울, 부산, 대구, ...)
	private String missing_area_detail;
	private int height;
	private int weight;
	private int hair;  // 두발형태
	private int blood_type;
	private String feature;
	private int top;  // 긴팔, 반팔
	private int top_kind;  // 상의 종류
	private int bottoms;  // 긴바지, 반바지
	private int bottoms_kind;  // 하의 종류
	private int shoes;  // 신발 종류
	private int shoes_size;
	private String reporter;
	private String reporter_id;
	private String re_birth_date;
	private int re_relation;  // 실종자와의 관계
	private String re_contact1;
	private String re_contact2;
	private String agreeYN;  // 작성 폼 승인 여부
	
	
	
	public ChildDTO() {
		super();
	}
	public ChildDTO(int seq, String target, String gender, String name, String birth_date, Timestamp missing_date,
			int missing_area, String missing_area_detail, int height, int weight, int hair, int blood_type,
			String feature, int top, int top_kind, int bottoms, int bottoms_kind, int shoes, int shoes_size,
			String reporter, String reporter_id, String re_birth_date, int re_relation, String re_contact1,
			String re_contact2, String agreeYN) {
		super();
		this.seq = seq;
		this.target = target;
		this.gender = gender;
		this.name = name;
		this.birth_date = birth_date;
		this.missing_date = missing_date;
		this.missing_area = missing_area;
		this.missing_area_detail = missing_area_detail;
		this.height = height;
		this.weight = weight;
		this.hair = hair;
		this.blood_type = blood_type;
		this.feature = feature;
		this.top = top;
		this.top_kind = top_kind;
		this.bottoms = bottoms;
		this.bottoms_kind = bottoms_kind;
		this.shoes = shoes;
		this.shoes_size = shoes_size;
		this.reporter = reporter;
		this.reporter_id = reporter_id;
		this.re_birth_date = re_birth_date;
		this.re_relation = re_relation;
		this.re_contact1 = re_contact1;
		this.re_contact2 = re_contact2;
		this.agreeYN = agreeYN;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	public Timestamp getMissing_date() {
		return missing_date;
	}
	public void setMissing_date(Timestamp missing_date) {
		this.missing_date = missing_date;
	}
	public int getMissing_area() {
		return missing_area;
	}
	public void setMissing_area(int missing_area) {
		this.missing_area = missing_area;
	}
	public String getMissing_area_detail() {
		return missing_area_detail;
	}
	public void setMissing_area_detail(String missing_area_detail) {
		this.missing_area_detail = missing_area_detail;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getHair() {
		return hair;
	}
	public void setHair(int hair) {
		this.hair = hair;
	}
	public int getBlood_type() {
		return blood_type;
	}
	public void setBlood_type(int blood_type) {
		this.blood_type = blood_type;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	public int getTop_kind() {
		return top_kind;
	}
	public void setTop_kind(int top_kind) {
		this.top_kind = top_kind;
	}
	public int getBottoms() {
		return bottoms;
	}
	public void setBottoms(int bottoms) {
		this.bottoms = bottoms;
	}
	public int getBottoms_kind() {
		return bottoms_kind;
	}
	public void setBottoms_kind(int bottoms_kind) {
		this.bottoms_kind = bottoms_kind;
	}
	public int getShoes() {
		return shoes;
	}
	public void setShoes(int shoes) {
		this.shoes = shoes;
	}
	public int getShoes_size() {
		return shoes_size;
	}
	public void setShoes_size(int shoes_size) {
		this.shoes_size = shoes_size;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getReporter_id() {
		return reporter_id;
	}
	public void setReporter_id(String reporter_id) {
		this.reporter_id = reporter_id;
	}
	public String getRe_birth_date() {
		return re_birth_date;
	}
	public void setRe_birth_date(String re_birth_date) {
		this.re_birth_date = re_birth_date;
	}
	public int getRe_relation() {
		return re_relation;
	}
	public void setRe_relation(int re_relation) {
		this.re_relation = re_relation;
	}
	public String getRe_contact1() {
		return re_contact1;
	}
	public void setRe_contact1(String re_contact1) {
		this.re_contact1 = re_contact1;
	}
	public String getRe_contact2() {
		return re_contact2;
	}
	public void setRe_contact2(String re_contact2) {
		this.re_contact2 = re_contact2;
	}
	public String getAgreeYN() {
		return agreeYN;
	}
	public void setAgreeYN(String agreeYN) {
		this.agreeYN = agreeYN;
	}
	
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");

		return sdf.format(this.missing_date);
	}
}
