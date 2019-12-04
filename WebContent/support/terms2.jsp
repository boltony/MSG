<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
        td{
            border-right: 1px solid;
            border-top: 1px solid;
        }
    </style>
</head>
<body>
<div id="PersonalInfoAgreement" class="panel panel-default modal fade in" role="dialog" style="display: block;  max-width: 790px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">개인정보 수집·이용 동의</h3>
            </div>
            <div class="modal-body" style="border: 1px solid black;">
                <div class="Policy">
                    <h4>아래와 같이 개인정보를 수집·이용하고자 합니다.</h4>
                    <table style="text-align: center;" >
                        <tbody style="border: 1px solid;">
                            <tr style="background-color: gainsboro">
                                <th class="col-xs-3">수집 목적</th>
                                <th class="col-xs-6">수집·이용 항목</th>
                                <th class="col-xs-3">보유기간</th>
                            </tr>
                            <tr>
                                <td>홈페이지 회원가입 및 관리</td>
                                <td>이름, 휴대폰번호, 이메일</td>
                                <td><agreement-b style="color: red">회원탈퇴시까지</agreement-b></td>
                            </tr>
                            <tr>
                                <td>자동이체</td>
                                <td>은행명, 계좌번호, 예금주명, 예금주생년월일</td>
                                <td><agreement-b style="color: red">회원탈퇴시까지</agreement-b></td>
                            </tr>
                            <tr>
                                <td>신용카드</td>
                                <td>카드명, 카드번호, 유효기간, 카드주명</td>
                                <td><agreement-b style="color: red">회원탈퇴시까지</agreement-b></td>
                            </tr>
                            <tr>
                                <td>기부금영수증 발행</td>
                                <td>이름, <agreement-b style="color: red">주민등록번호</agreement-b>(기부금영수증 수령선택 시), 주소, 연락처, 기부금액, 기부금, 기부일자, 기부금영수증 발급일자</td>
                                <td><agreement-b style="color: red">5년<br>(법인세법, 국세기본법)</agreement-b></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div style="text-align: center">
                <input type="button" value="닫기" id="close" style="width: 60px; height: 40px;">
            </div>
        </div>
    </div>
</div>
<script>
	$("#close").on("click",function(){
		window.close();
	})
</script>	
</body>
</html>