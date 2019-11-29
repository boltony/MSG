package msg.child;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import oracle.net.aso.d;

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

	public String get_real_gender() {
		if(this.gender.equalsIgnoreCase("M")) {
			return "남";
		}
		else {
			return "여";
		}
	}

	public String get_formed_birth() {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		Date date = null;

		try {
			date = sdf1.parse(this.birth_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월 dd일");

		return sdf2.format(date);
	}

	public String get_formed_missing_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");

		return sdf.format(this.missing_date);
	}

	public String get_real_missing_area() {
		String area = null;

		switch(this.missing_area) {
			case 1: area = "서울"; break;
			case 2: area = "부산"; break;
			case 3: area = "대구"; break;
			case 4: area = "인천"; break;
			case 5: area = "광주"; break;
			case 6: area = "대전"; break;
			case 7: area = "울산"; break;
			case 8: area = "강원"; break;
			case 9: area = "경기"; break;
			case 10: area = "경남"; break;
			case 11: area = "경북"; break;
			case 12: area = "전남"; break;
			case 13: area = "전북"; break;
			case 14: area = "제주"; break;
			case 15: area = "충남"; break;
			case 16: area = "충북"; break;
			case 17: area = "세종"; break;
			default: area = "그 외 지역"; break;
		}
		
		return area;
	}
	
	public String get_real_hair() {
		String real_hair = null;
		
		switch(this.hair) {
			case 110: real_hair = "대머리"; break;
			case 120: real_hair = "가발"; break;
			case 130: real_hair = "삭발"; break;
			case 140: real_hair = "묶음머리"; break;
			case 150: real_hair = "짧은 생머리"; break;
			case 155: real_hair = "짧은 파마머리"; break;
			case 160: real_hair = "단발 생머리"; break;
			case 165: real_hair = "단발 파마머리"; break;
			case 170: real_hair = "긴 생머리"; break;
			case 175: real_hair = "긴 파마머리"; break;
			case 990: real_hair = "기타"; break;
			default: real_hair = "미입력"; break;
		}
		
		return real_hair;
	}
	
	public String get_real_blood() {
		String blood = null;
		
		switch(this.blood_type) {
			case 1: blood = "A(RH+)"; break;
			case 2: blood = "B(RH+)"; break;
			case 3: blood = "O(RH+)"; break;
			case 4: blood = "AB(RH+)"; break;
			case 5: blood = "A(RH-)"; break;
			case 6: blood = "B(RH-)"; break;
			case 7: blood = "O(RH-)"; break;
			case 8: blood = "AB(RH-)"; break;
			case 9: blood = "기타"; break;
			default: blood = "미입력"; break;
		}
		
		return blood;
	}
	
	public String get_real_top() {
		String real_top = null;
		
		switch(this.top) {
			case 10: real_top = "긴팔";
			case 20: real_top = "반팔";
			default: real_top = "미입력";
		}
		
		return real_top;
	}
	
	public String get_real_top_kind() {
		String real_top_kind = null;
		
		switch(this.top_kind) {
			case 110: real_top_kind = "속옷차림";
			case 120: real_top_kind = "운동복";
			case 130: real_top_kind = "캐주얼";
			case 140: real_top_kind = "티셔츠";
			case 150: real_top_kind = "와이셔츠";
			case 160: real_top_kind = "원피스";
			case 170: real_top_kind = "스웨터";
			case 180: real_top_kind = "코트";
			case 190: real_top_kind = "정장";
			case 990: real_top_kind = "기타";
			default: real_top_kind = "미입력";
		}
		
		return real_top_kind;
	}
	
	public String get_real_bottoms() {
		String real_bottoms = null;
		
		switch(this.bottoms) {
			case 10: real_bottoms = "긴 바지";
			case 20: real_bottoms = "짧은 바지";
			default: real_bottoms = "미입력";
		}
		
		return real_bottoms;
	}
	
	public String get_real_bottoms_kind() {
		String real_bottoms_kind = null;
		
		switch(this.bottoms_kind) {
			case 110: real_bottoms_kind = "속옷차림";
			case 120: real_bottoms_kind = "운동복";
			case 130: real_bottoms_kind = "캐주얼";
			case 140: real_bottoms_kind = "청바지";
			case 150: real_bottoms_kind = "통바지";
			case 160: real_bottoms_kind = "면바지";
			case 170: real_bottoms_kind = "치마";
			case 180: real_bottoms_kind = "정장바지";
			case 990: real_bottoms_kind = "기타";
			default: real_bottoms_kind = "미입력";
		}
		
		return real_bottoms_kind;
	}
	
	public String get_real_shoes() {
		String real_shoes = null;
		
		switch(this.shoes) {
			case 110: real_shoes = "맨발";
			case 120: real_shoes = "슬리퍼";
			case 130: real_shoes = "샌들";
			case 140: real_shoes = "단화";
			case 150: real_shoes = "운동화";
			case 160: real_shoes = "등산화";
			case 170: real_shoes = "장화";
			case 180: real_shoes = "부츠";
			case 190: real_shoes = "구두";
			case 990: real_shoes = "기타";
			default: real_shoes = "미입력";
		}
		
		return real_shoes;
	}
	
	public String get_get_real_relation() {
		String real_relation = null;
		
		switch(this.re_relation) {
			case 10: real_relation = "부모";
			case 20: real_relation =  "자녀";
			case 30: real_relation = "배우자";
			case 40: real_relation = "친척";
			case 50: real_relation = "형제";
			case 70: real_relation = "동거자";
			case 90: real_relation = "기타";
			default: real_relation = "미입력";
		}
		
		return real_relation;
	}

}
