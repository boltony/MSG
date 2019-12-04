<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Signup</title>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    
  <body>
  
        <!-- ----- navi 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/navi.jsp"></jsp:include>
        <!-- ----- navi 끝 ------------------------------------------  -->

        <!-- ----- quick menu 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/quickMenu.jsp"></jsp:include>
        <!-- ----- quick menu 끝 ------------------------------------------  -->
        

        <!-- ----- signup form 시작 ---------------  -->
    <form action="${pageContext.request.contextPath}/signup.mem" method="post" id="signup_form">
    <div id="signup_header">
        <div id="signup_header_container">회원가입</div>
        <span style="font-size: 13px;">본 사이트를 보다 편리하게 이용하실 수 있게 도와드립니다.</span>
    </div>
    <div class="signup_title_container">
       <div class="signup_title_img"><img src="${pageContext.request.contextPath}/resources/images/icon_checkbox.png" style="width: 20px;" alt=""></div>
        <div class="signup_title" id="header">기본정보</div>
        </div>
        <div class="basic_info">
            <p id="alert_id_form" style="font-size: 11px; margin-bottom: 0px; position: relative; left: 160px; color: red"></p>
            <br><span>아이디</span>
            <input type="text" id="id" name="id" placeholder=" 4~12자 이내 영문(대소문자 구분), 숫자">
            <p class="alert1" id="alert_id"></p>
            <br>
        </div>
        <div class="basic_info">
            <span>비밀번호</span>
            <input type="password" id="pw" name="pw" placeholder=" 9~20자 이내 영문, 숫자, 특문(!,@,#,$,%,^,&,*)">
            <p class="alert2" id="alert_pw_form"></p>
        </div> 
        <div class="basic_info">
            <span>비밀번호 확인</span>
            <input type="password" id="pw_check" name="pw_check" placeholder=" 비밀번호 한번 더 입력">
            <p class="alert1" id="alert_pw"></p>
        </div>
        <div class="basic_info">
            <span>비밀번호 확인 질문</span>
            <select name="pw_find_hint" id="pw_find_hint" size=1>
                <option value="hint1">기억에 남는 추억의 장소는?</option>
                <option value="hint2">자신의 인생 좌우명은?</option>
                <option value="hint3">자신의 보물 1호는?</option>
                <option value="hint4">가장 기억에 남는 선생님 성함은?</option>
                <option value="hint5">타인이 모르는 자신만의 신체 비밀이 있다면?</option>
                <option value="hint6">추억하고 싶은 날짜가 있다면?</option>
                <option value="hint7">받았던 선물 중 기억에 남는 독특한 선물은?</option>
                <option value="hint8">유년시절 가장 생각나는 친구 이름은?</option>
                <option value="hint9">인상 깊게 읽은 책 이름은?</option>
                <option value="hint10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
                <option value="hint11">자신이 두번째로 존경하는 인물은?</option>
                <option value="hint12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
                <option value="hint13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
                <option value="hint14">다시 태어나면 되고 싶은 것은?</option>
                <option value="hint15">내가 좋아하는 캐릭터는?</option>
            </select>
        </div>
        <div class="basic_info">
            <span>비밀번호 확인 답변</span>
            <input type="text" id="pw_find_answer" name="pw_find_answer">
        </div>
        <div class="basic_info">
            <span>이름</span>
            <input type="text" id="name" name="name">
            <p class="alert2" id="alert_name_form"></p>
        </div>
        <div class="basic_info">
            <span>전화번호</span>
            <input type="text" id="phone" name="phone">
            <p class="alert2" id="alert_phone_form"></p>
        </div>
        <div class="basic_info">
            <span>이메일</span>
            <input type="text" id="email" name="email" placeholder=" 이메일 입력 후 인증버튼을 클릭하세요">
            <p class="alert2" id="alert_email_form"></p>
            <input type="button" id="email_confirm_btn" value="이메일 인증">
            
        </div>
        <div class="basic_info">
            <span>우편번호</span>
            <input type="text" id="zipcode" name="zipcode">
            <input type="button" id="zipcode_btn" value="우편번호 찾기" onclick="sample4_execDaumPostcode()">
        </div>
        <div class="basic_info">
            <span>기본주소</span>
            <input type="text" id="address" name="address">
        </div>
        <div class="basic_info">
            <span>나머지주소</span>
            <input type="text" id="address2" name="address2">
        </div>
        <div class="basic_info">
            <span>이메일 수신여부</span>
            <input type="radio" name="email_receive" value="Y">수신함
            <input type="radio" name="email_receive" value="N">수신하지 않음
            <p style="font-size: 11px; color: gray;">본 항목에 '수신함' 체크시 실종아동 긴급신고 메일이 발송됩니다.</p>
        </div>
        <div></div>
    <div class="signup_title_container">
       <div class="signup_title_img">
       <img src="${pageContext.request.contextPath}/resources/images/icon_checkbox.png" style="width: 20px;" alt=""></div>
        <div class="signup_title">이용약관동의</div>
    </div>
    <div>
        <div class="terms">
            <p><b>[이용약관]</b><br><br>

                <b>제1조 (목적)</b> <br>
                이용약관은 실종아동전문기관 (이하 '기관'이라 함)이 이용자에게 제공하는 웹사이트에서 제공하는 인터넷 관련 서비스 (이하 “서비스”)를 이용함에 있어 기관과 회원 간의 권리, 의무 및 이용에 관한 제반 사항 등을 규정함을 목적으로 합니다.
                <br><br>

                <b>제 2 조 (정의)</b> <br>
                이 약관에서 사용하는 용어의 정의는 다음과 같습니다. <br>
                1. “이용자”라 함은 기관의 서비스에 접속하여 본 약관에 따라 기관이 제공하는 콘텐츠를 이용하는 회원 및 비회원을 말합니다. <br>
                2. "회원"이라 함은 기관이 제공하는 서비스를 받기 위하여 기관과 이용계약을 체결하고 이용자 아이디(ID)를 부여 받은 자를 말합니다. <br>
                3. “비회원”이라 함은 회원에 가입하지 않고 서비스를 이용하는 자를 말합니다. <br>
                4. "아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "기관"이 승인하는 문자와 숫자의 조합을 의미합니다. <br>
                5. "비밀번호"라 함은 "회원"이 부여 받은 아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다. <br>
                6. "게시물"이라 함은 "이용자"가 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다. <br>
                7. “해지”라 함은 기관 또는 회원이 이용계약을 해약하는 것을 말합니다. <br><br>

                <b>제 3 조 (약관의 게시와 개정)</b><br>
                1. 기관은 이 약관의 내용을 회원들이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다. <br>
                2. 기관은 관계법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. <br>
                3. 기관이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 서비스 초기화면에 그 적용일자 7일 전부터 적용일자 전일까지 공지합니다. <br>
                4. 전항에 따라 시행일 이후에 회원이 서비스를 이용하는 경우에는 개정약관에 동의한 것으로 간주합니다. 회원은 변경된 약관에 동의하지 않을 경우 이용계약을 해지할 수 있습니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 피해는 기관이 책임을 지지 않습니다. <br><br>

                <b>제 4 조 (약관의 해석)</b><br>
                1. 이 약관에서 정하지 아니한 사항이나 해석에 대해서는 관계법령 또는 상관례에 따릅니다. <br><br>

                <b>제 5 조 (서비스 이용계약 체결)</b><br>
                1. 이용계약은 회원이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 기관이 이러한 신청에 대하여 승낙함으로써 체결됩니다. <br>
                2. 회원으로 가입하여 본 서비스를 이용하고자 하는 이용자는 기관에서 요청하는 정보(이름,생년월일,연락처 등)를 제공하여야 합니다. 단 회원이 제공한 정보는 개인정보보호정책에 따라 관리됩니다. <br>
                3. 기관에서는 서비스를 이용하는 이용자에 따라 서비스 메뉴 등의 이용에 차등을 둘 수 있습니다. <br>
                4. 기관은 가입신청자의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, 기관은 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다. <br>
                4-1. 실명이 아니거나 타인의 명의를 이용한 경우 <br>
                4-2. 허위의 정보를 기재하거나, 기관이 제시하는 내용을 기재하지 않은 경우 <br>
                4-3. 형법에서 규정한 범죄 행위의 목적으로 본 서비스를 이용하고자 하는 경우 <br>
                4-4. 실종인 가족이 전용 서비스를 이용하고자 할 때 실종신고를 하지 않은 경우 <br>
                4-5. 영리를 추구할 목적으로 본 서비스를 이용하고자 하는 경우 <br>
                4-6. 기타 현행 법령에 위배되는 목적으로 본 서비스를 이용하고자 하는 경우 <br>
                5. 기관은 회원의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다. <br>
                6. 회원가입을 승낙 하지 아니하거나 유보한 경우, 기관은 이를 가입신청자에게 알리도록 합니다. <br>
                7. 기관은 서비스관련 설비의 여유가 없거나 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다. <br>
                8. 이용계약의 성립 시기는 기관이 가입완료를 신청절차 상에서 표시한 시점으로 합니다. <br><br>

                <b>제 6 조 (회원정보의 변경)</b><br>
                1. 회원은 마이페이지를 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 아이디 등은 수정이 불가능합니다. <br>
                2. 회원은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 기관에 대하여 그 변경사항을 알려야 합니다. <br>
                3. 전항의 변경사항을 기관에 알리지 않아 발생한 불이익에 대하여 기관은 책임을 지지 않습니다. <br><br>

                <b>제 7 조 (개인정보보호 의무)</b><br>
                기관은 정보통신망법 등 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 어린이재단의 개인정보보호정책이 적용됩니다. 다만, 기관의 공식 사이트 이외의 링크된 사이트에서는 기관의 개인정보보호정책이 적용되지 않습니다. <br><br>

                <b>제 8 조 (회원의 아이디 및 비밀번호의 관리에 대한 의무)</b><br>
                1. 회원의 아이디와 비밀번호에 관한 관리책임은 회원에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다. <br>
                2. 기관은 회원의 아이디가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나. 기관의 운영자로 오인한 우려가 있는 경우, 해당 아이디의 이용을 제한 및 변경할 수 있습니다. 또한 회원은 아이디 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 기관에 통지하고 기관의 안내에 따라야 합니다. <br><br>

                <b>제 9 조 (회원에 대한 통지)</b><br>
                1. 기관이 회원에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 회원이 지정한 전자우편주소 등으로 할 수 있습니다.<br>
                2. 기관은 회원 전체에 대한 통지의 경우 5일 이상 기관의 게시판에 게시함으로써 제9조1항의 통지에 갈음할 수 있습니다.<br><br>

                <b>제 10 조 (기관의 의무)</b><br>
                1. 기관은 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다하여 노력합니다.<br>
                2. 기관은 계속적이고 안정적인 서비스의 제공을 위하여 설비에 장애가 생길 때에는 지체 없이 이를 수리 또는 복구해야 합니다.<br>
                3. 기관은 회원이 안전하게 서비스를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보보호정책을 공시하고 준수합니다.<br>
                4. 기관은 서비스이용과 관련하여 회원으로부터 제기된 의견이나 불만이 정당하다고 인정될 경우에는 이를 처리하여야 합니다. 회원이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 회원에게 처리과정 및 결과를 전달합니다.<br><br>

                <b>제 11 조 (회원의 의무)</b><br>
                1. 회원은 청소년보호법 등의 관계 법령을 준수하여야 합니다.<br>
                2. 회원은 주소, 연락처, 전자우편 등 이용계약 사항이 변경된 경우에 온라인상에서 이를 수정해야 합니다. 수정을 하지 않거나 수정 지연으로 발생되는 문제에 대한 책임은 회원에게 있습니다.<br>
                3. 회원은 회원에게 부여된 아이디와 비밀번호를 직접 관리해야 합니다. 회원의 관리 소홀로 발생하는 문제의 책임은 회원에게 있습니다.<br>
                4. 특수한 경우를 제외하고는 만 14세 미만의 아동이 회원가입을 하기 위해서는 법정 대리인이 아동의 회원가입에 대해 동의를 해야만 합니다.<br>
                5. "회원"은 다음 행위를 하여서는 안 됩니다.<br>
                5-1. 신청 또는 변경 시 허위내용의 등록<br>
                5-2. 타인의 정보도용<br>
                5-3. 기관이 게시한 정보의 변경<br>
                5-4. 기관이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br>
                5-5. 기관과 기타 제3자의 저작권 등 지적재산권에 대한 침해<br>
                5-6. 기관 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>
                5-7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 서비스에 공개 또는 게시하는 행위<br>
                5-8. 기관의 동의 없이 영리를 목적으로 서비스를 사용하는 행위<br>
                5-9. 기관의 승인을 받지 않고 다른 이용자의 개인정보를 수집 또는 저장하는 행위<br>
                5-10. 기타 불법적이거나 부당한 행위<br>
                6. 회원은 관계법, 이 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항, 기관이 통지하는 사항 등을 준수하여야 하며, 기타 기관의 업무에 방해되는 행위를 하여서는 안 됩니다.<br><br>

                <b>제 12 조 (서비스의 제공 등)</b><br>
                1. 서비스 이용은 기관의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간 운영을 원칙으로 합니다. 단, 시스템 정기점검, 증설 및 교체를 위해 기관이 정한 날이나 시간에 서비스를 일시 중단할 수 있으며, 예정되어 있는 작업으로 인한 서비스 일시 중단은 서비스 페이지를 통해 사전에 공지합니다.<br>
                2. 기관은 긴급한 시스템 점검, 비상사태 등 부득이한 사유로 인하여 예고 없이 일시적으로 서비스를 중단할 수 있고 사후공지 할 수 있습니다.<br>
                3. 기관은 서비스를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.<br><br>

                <b>제 13 조 (서비스의 변경)</b><br>
                1. 기관은 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있습니다.<br>
                2. 기관은 기관의 정책 변화 또는 수준 높은 서비스의 제공을 위해 서비스의 일부 또는 전부를 수정, 중단, 변경, 삭제할 수 있습니다.<br>
                3. 기관은 서비스의 수정, 삭제 등의 변화로 인해 회원들에게 심각한 불이익이 발생할 수 있는 사항에 대해서는 내용을 사전에 공지합니다.<br><br>

                <b>제 14 조 (정보의 제공 및 광고의 게재)</b><br>
                1. 기관은 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 회원에게 제공할 수 있습니다.<br>
                2. 기관은 서비스의 운영과 관련하여 서비스 화면, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편 등을 수신한 회원은 수신거절을 기관에 할 수 있습니다.<br>
                3. 기관은 서비스에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래의 결과로 발생하는 모든 손실 또는 손해에 대해서는 책임을 지지 않습니다.<br>
                4. 기관은 서비스 개선 및 회원 대상의 서비스 소개 등의 목적으로 회원의 동의 하에 추가적인 개인정보를 요구할 수 있습니다.<br><br>

                <b>제 15 조 (권리의 귀속)</b><br>
                1. 서비스에 대한 저작권 및 지적재산권은 기관에 귀속됩니다. 단, 회원의 게시물 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.<br>
                2. 기관은 서비스와 관련하여 회원에게 기관이 정한 이용조건에 따라 계정, 아이디, 콘텐츠, 활동지수 등을 이용할 수 있는 이용권만을 부여하며, 회원은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.<br><br>

                <b>제 16 조 (계약 해지 등)</b><br>
                1. 회원은 언제든지 서비스초기화면의 마이 페이지 메뉴를 통하여 이용계약 해지 신청을 할 수 있으며, 기관은 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.<br>
                2. 회원이 계약을 해지하는 경우, 회원이 작성한 게시물 중 본인 계정에 등록된 게시물 일체는 삭제됩니다.<br><br>

                <b>제 17 조 (이용제한 등)</b><br>
                1. 기관은 회원이 약관의 의무를 위반 하거나 또는 아래 각 항에 해당될 경우 사전통보 없이 서비스 이용을 제한할 수 있습니다.<br>
                1-1. 서비스의 정상적인 운영을 방해한 경우<br>
                1-2. 주민등록법을 위반한 명의도용 및 결제도용, 저작권법 및 컴퓨터프로그램보호법을 위반한 불법프로그램의 제공 및 운영방해, 정보통신망법을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우<br>
                1-3. 회원이 계속해서 1년 이상 로그인하지 않는 경우<br>
                1-4. 정보통신윤리위원회 등 관련 공공기관의 시정 요구가 있을 경우<br>
                1-5. 기관과 관련된 법령에 금지되어 있는 정보를 전송 또는 게시했을 경우<br>
                1-6. 서비스에 위해를 가하거나 고의로 방해한 경우<br>
                1-7. 본 약관을 포함하여 기타 기관이 정한 제반 규정 및 이용 조건을 위반한 경우<br><br>

                <b>제 18 조 (면책조항 및 손해배상)</b><br>
                1. 기관은 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br>
                2. 기관은 회원의 귀책사유로 인한 서비스 이용의 장애 또는 손해에 대하여 책임을 지지 않습니다.<br>
                3. 기관은 회원 간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.<br>
                4. 기관은 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.<br>
                5. 기관은 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다. 또한 무료서비스 이용과 관련하여 회원에게 발생한 어떠한 손해에 대해서도 책임을 지지 않습니다.<br>
                6. 기관이 개별서비스 제공자와 제휴 협정을 맺고 회원에게 개별서비스를 제공함에 있어 회원이 개별서비스 이용약관에 동의를 한 뒤 개별서비스 제공자의 귀책사유로 인해 손해가 발생한 경우 개별서비스 제공자가 책임을 집니다.<br>
                7. 기관은 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다.<br>
                8. 기관은 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.<br><br>

                <b>제 19 조 (분쟁조정)</b><br>
                1. 이 약관에 명시되어 있지 않은 사항이 관계법령에 규정되어 있을 경우 그 규정에 따릅니다.<br>
                2. 서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 법령에 정한 절차에 따른 법원을 관할 법원으로 합니다.<br>
                고 우편 및 이메일로 발송하여 기관의 재정을 투명하게 공개합니다.<br><br>

                <b>부칙</b><br>
                1. 본 약관은 2014년 8월 7일부터 적용됩니다. <br>
                2. 2008년 12월 1일부터 시행되던 종전의 약관은 본 약관으로 대체합니다.
                <br><br>
            </p>
        </div>
    </div>
    <div class="agreement_container">
        <input type="radio" name="terms_agreement1" value="agree">
        <span>동의</span>
        <input type="radio" name="terms_agreement1" value="disagree">
        <span>동의하지 않음</span>
    </div>
    <br><br>
    <div class="signup_title_container">
       <div class="signup_title_img"><img src="${pageContext.request.contextPath}/resources/images/icon_checkbox.png" style="width: 20px;" alt=""></div>
        <div class="signup_title">개인정보처리방침</div>
    </div>
    <div>
        <div class="terms">
            <p>
                <b>[개인정보 수집 및 이용에 대한 안내]</b><br><br>
                실종아동전문기관 (이하 '기관') 은 개인정보를 중요시하며 [개인정보보호법][실종아동등 보호 및 지원에 관한 법]등 관련 법령상의 개인정보보호규정을 준수하고 있습니다. 기관은 회원의 동의를 기반으로 개인정보를 수집․ 이용 및 제공하고 있으며, 이용자의 권리 및 보호에 최선을 다하고 있습니다. 기관은 본 개인정보처리방침을 통하여 회원께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드리고 있습니다. <br><br>

                <b>1. 개인정보의 처리 목적</b><br>
                기관은 수집한 개인정보를 다음의 목적을 위해 활용합니다. <br><br>

                [일반인]<br>
                ￭ 본인확인식별, 참여내역 및 회원정보 관리, 가입 및 탈퇴 의사 확인, 불량회원 부정 이용방지, 불만처리 등 민원 처리, 고지사항 전달 <br><br>

                [실종인가족]<br>
                ￭ 실종가족확인식별, 회원정보 관리, 가입 및 탈퇴 의사 확인, 불량회원 부정 이용방지, 불만처리 등 민원 처리, 고지사항 전달 <br><br>


                [실종아동등 신상카드]<br>
                ￭ 실종아동등 보호자 확인 <br><br>

                <b>2. 개인정보의 처리 및 보유 기간</b><br>
                기관은 법령의 규정과 정보주체의 동의에 의해서만 개인정보를 수집하며 아래의 이유로 명시한 기간 동안 개인정보를 보존합니다. <br><br>

                ￭ 일반인<br>
                − 보존 기간 : 홈페이지 회원 탈퇴 시 까지
                − 보존 근거 : 회원가입 시 정보주체의 동의 <br><br>

                ￭ 실종인가족<br>
                − 보존 기간: 실종아동등 발견 시 까지
                − 보존 근거: 「실종아동등 보호 및 지원에 관한 시행규칙 제4조」<br><br>

                ￭ 실종아동등 신상카드<br>
                − 보존 기간: 실종아동등 보호자 확인 시 까지
                − 보존 근거: 「실종아동등 보호 및 지원에 관한 법률」제 6조<br><br>

                <b>3. 개인정보 제 3자의 제공</b><br>
                기관은 정보주체의 개인정보를 개인정보보호법 제 1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 법률의 특별한 규정 등 개인정보 보호법 제 17조 및 제 18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다. 기관은 다음과 같이 개인정보를 제 3자에게 제공하고 있습니다. <br><br>

                - 개인정보를 제공받는 자: 경찰청, 실종아동등의 보호자<br>
                - 제공받는 자의 개인정보 이용목적: 실종아동등의 보호자 발견<br>
                - 제공받는 개인정보 항목: 실종아동등 보호 및 지원에 관한 법률 시행규칙 제 3조4항 별지 제2호서식<br>
                - 제공받는 자의 보유․이용기간: 실종아동등의 보호자 발견시 까지<br><br>

                <b>4. 개인정보처리위탁</b><br>
                기관은 안정적인 서비스 제공을 위해서 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.<br>
                기관의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.<br>
                또한 동의를 거부하시고자 하는 경우 회원정보변경을 통해 직접 탈퇴 진행 또는 기관으로 요청할 수 있습니다.<br>
                단,동의거부에 따른 서비스사용에 제한이 있을 수 있습니다.<br><br>

                전화번호: 02-777-0182<br>
                이메일: reunion@childfund.or.kr<br><br>

                <b>5. 정보주체의 권리와 의무 및 행사방법</b><br>
                회원은 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수 있습니다. 회원은 개인정보 조회, 수정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을, 가입해지(동의철회)를 위해서는 '회원탈퇴'를 선택하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다. 회원께서 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제 3자에게 이미 제공한 경우에는 정정 처리결과를 제 3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다. 기관은 회원의 요청에 의해 해지 또는 삭제된 개인정보는 "개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.<br><br>

                <b>6. 수집하는 개인정보 항목 및 수집방법</b><br>
                첫째. 기관은 회원가입, 원활한 회원상담, 각종 서비스 등 기본적인 서비스 제공을 위해 아래와 같이 개인정보를 수집하고 있습니다.<br><br>

                ￭ 수집항목<br>
                [일반인 회원가입 시]<br>
                필수항목: 성명,생년월일,연락처,휴대전화,이메일,주소<br><br>

                [실종인가족 회원가입 시]<br>
                필수항목:성명,생년월일,연락처,전자우편주소,주소,실종자성명,실종바성별,실종자관계,실종자생년월일,실종자실종년월일<br><br>

                [신상카드]<br>
                필수항목:성명,주민등록번호(생년월일),발견일자, 발생지역(주소), 치아,눈모양,얼굴색,
                선택항목:발견장소,응급진료,무연고자확인일자,행려병자번호,치아,눈모양,얼굴색,흉터,수술자국,점,문신,병력,신장,체중<br><br>

                둘째. 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br>
                - IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록<br><br>

                셋째. 일부 서비스 이용 시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.<br>
                - 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시)<br><br>

                <b>￭ 개인정보 수집방법</b><br>
                홈페이지 회원가입,서면양식,전화/팩스,회원정보수정,기관문의<br><br>

                <b>7. 개인정보의 안전성 확보 조치</b><br>
                기관은 이용자들의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다. <br><br>

                가. 해킹 등에 대비한 대책<br>
                기관은 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다. 개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신프로그램을 이용하여 이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지하고 있으며, 암호화 통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다. 그리고 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로 보안성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.<br><br>

                나. 취급 직원의 최소화 및 교육<br>
                기관의 개인정보관련 취급 직원은 담당자에 한정시키고 있고 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 개인정보취급방침의 준수를 항상 강조하고 있습니다.<br><br>

                <b>8. 개인정보의 파기절차 및 방법</b><br>
                ￭ 파기절차<br>
                - 이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조)일정 기간 저장된 후 파기됩니다.<br>
                - 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.<br><br>

                ￭ 파기방법<br>
                파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br><br>

                <b>9. 개인정보관리책임자 및 담당자</b><br>
                기관은 회원의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리 책임자를 지정하고 있습니다.<br><br>

                - 개인정보관리 책임자<br>
                성명: 김 진<br>
                소속/직위: 기관장<br>
                전화번호 : 02-777-0182<br>
                이메일 : jin@childfund.or.kr<br><br>

                회원께서는 기관의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 기관은 회원의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다. 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br><br>

                1. 1 개인정보침해신고센터(http://privacy.kisa.or.kr/kor/main.jsp / 국번없이 118)<br>
                1. 2 경찰청 사이버테러대응센터 (http://www.ctrc.go.kr / 02-392-0330)<br><br>

                <b>10. 개인정보 처리방침의 변경</b><br>
                현 개인정보취급방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 홈페이지의 '공지사항'을 통해 고지 할 것입니다. 다만, 개인정보의 수집 및 활용, 제3자 제공 등과 같이 이용자 권리의 중요한 변경이 있을 경우에는 최소 30일 전에 고지합니다.<br><br>

                시행일자: 2016년 06월 29일 <br><br>
            </p>
        </div>
    </div>
    <div class="agreement_container">
        <input type="radio" name="terms_agreement2" value="agree">
        <span>동의</span>
        <input type="radio" name="terms_agreement2" value="disagree">
        <span>동의하지 않음</span>
    </div>
      <div class="signup_btn_container">
       <button type="button" class="signup_btn" id="signup_join">회원가입</button>
       <button type="button" class="signup_btn" id="signup_cancel">회원가입 취소</button>
       </div>
    </form>
        <!-- ----- signup form 끝 ---------------  -->


        <!-- ----- footer 시작 ------------------------------------------  -->
        <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
        <!-- ----- footer 끝 ------------------------------------------  -->

	<script>
	var idValid = 0;
	var idduplValid = 0;
	var pwValid = 0;
	var nameValid = 0;
	var phoneValid = 0;
	var emailValid = 0;
	var emailCheckValid = 0;
	var pwcheckValid = 0;
	
	
	// 우편번호 찾기 실행 함수
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var roadAddr = data.roadAddress;
					document.getElementById('zipcode').value = data.zonecode;
					document.getElementById('address').value = roadAddr;
				}
			}).open();
		}
	// 아이디 중복검사
		$("#id").on("blur",function(){
			var check_id = $("#id").val();			
			$.ajax({
				url:"${pageContext.request.contextPath}/dupl.mem",
				data:{id:check_id},
				type:"post",
				dataType:"json"
			}).done(function(data){
				if(data.duplResult=="true"){
					$("#alert_id").html("사용 가능한 ID입니다.").css("color","blue");
					idduplValid = 1;
				}else{
					$("#alert_id").html("사용 불가한 ID입니다.").css("color","red");
					idduplValid = 0;
				}
			}).fail(function(a,b,c) {
				alert("비동기통신 실패로 중복검사에 실패하였습니다.");
			});
		})
	// 아이디 정규식 검사
		$("#id").on("blur",function(){
			var regex = /^[a-zA-Z0-9]{4,12}$/;
			var data = $("#id").val();
			var result = regex.exec(data);
			
			if(result != null){
				$("#alert_id_form").html("올바른 아이디 형식입니다.").css("color","blue");
				idValid = 1;
			}else{
				$("#alert_id_form").html("잘못된 아이디 형식입니다.").css("color","red");
				idValid = 0;
			}			
		})
		
	// 비밀번호 정규식 검사
		$("#pw").on("blur",function(){
			var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{9,20}$/;
			var data = $("#pw").val();
			var result = regex.exec(data);
			
			if(result != null){
				$("#alert_pw_form").html("올바른 비밀번호 형식입니다.").css("color","blue");
				pwValid = 1;
			}else{
				$("#alert_pw_form").html("잘못된 비밀번호 형식입니다.").css("color","red");
				pwValid = 0;
			}
		})
		
	// 이름 정규식 검사
		$("#name").on("blur",function(){
			var regex = /^[가-힣]+$/;
			var data = $("#name").val();
			var result = regex.exec(data);
			
			if(result != null){
				$("#alert_name_form").html("올바른 이름 형식입니다.").css("color","blue");
				nameValid = 1;
			}else{
				$("#alert_name_form").html("잘못된 이름 형식입니다.").css("color","red");
				nameValid = 0;
			}
		})
	// 전화번호 정규식 검사
		$("#phone").on("blur",function(){
			var regex = /^010[0-9]{3,4}[0-9]{4}$/;
			var data = $("#phone").val();
			var result = regex.exec(data);
			
			if(result != null){
				$("#alert_phone_form").html("올바른 전화번호 형식입니다.").css("color","blue");
				phoneValid = 1;
			}else{
				$("#alert_phone_form").html("잘못된 전화번호 형식입니다.").css("color","red");
				phoneValid = 0;
			}
		})
	// 이메일 정규식 검사
		$("#email").on("blur",function(){
			var regex = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
			var data = $("#email").val();
			var result = regex.exec(data);
			
			if(result != null){
				//$("#alert_email_form").html("올바른 이메일 형식입니다.").css("color","blue");
				emailValid = 1;
			}else{
				//$("#alert_email_form").html("잘못된 이메일 형식입니다.").css("color","red");
				emailValid = 0;
			}
		})
	// 비밀번호-비밀번호체크 일치 여부
	$("#pw_check").on("input",function(){
		if($("#pw").val() == $("#pw_check").val()){
			$("#alert_pw").html("비밀번호가 일치합니다.").css("color","blue");
			pwcheckValid = 1;
		}else{
			$("#alert_pw").html("비밀번호가 일치하지 않습니다.").css("color","red");
			pwcheckValid = 0;
		}
	})
	
	// 각 칸이 비어있으면 alert 창 띄우고 return 시키기!
		$("#signup_join").on("click",function(){
			if($("#id").val()=="" || $("#pw").val()=="" || $("#pw_check").val()=="" 
					|| $("#name").val()==""||$("#phone").val()==""||$("#email").val()==""||
					$("#zipcode").val()==""|| $("#address1").val()==""||$("#address2").val()==""||
					$(":radio[name='email_receive']:checked").length<1 
					||$(":radio[name='terms_agreement1']:checked").length<1
					||$(":radio[name='terms_agreement2']:checked").length<1){
				alert("모든 항목은 필수 입력 사항입니다.");
					
				return;
			}		
			
			if(idValid * pwValid * nameValid * phoneValid * emailValid * emailCheckValid * pwcheckValid * idduplValid == 0){
				alert("입력한 정보를 다시 확인해주세요!");
				return;
			}
			
			// 동의 구하는 radio 버튼이 동의가 아니면 return false하기!
			if($(":radio[name='terms_agreement1']:checked").val()=="disagree"){
				alert("이용약관에 동의하지 않으면 회원가입이 불가능합니다.");
				return;
			}
			if($(":radio[name='terms_agreement2']:checked").val()=="disagree"){
				alert("개인정보처리방침에 동의하지 않으면 회원가입이 불가능합니다.");
				return;
			}
			
			$("#signup_form").submit();
		})
		
		$("#signup_cancel").on("click",function(){
			location.href = "${pageContext.request.contextPath}/main.jsp";
		})
		
		$("#email_confirm_btn").on("click",function(){
			var email = $("#email").val();
			window.open("../emailConfirm.mail?email=" + email,"회원가입 이메일 인증","width=500,height=300,resizable=no");
		})
	
	</script>

    </body>
</html>