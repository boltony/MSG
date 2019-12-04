<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
        th,td{
            border-right: 1px solid;
            border-top: 1px solid;
        }
    </style>
</head>
<body>
   <div id="PersonalInfoProvideAgreement" class="panel panel-default modal fade in" role="dialog" style="display: block;  max-width: 790px;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">개인정보 제3자 제공 동의</h3>
                    </div>
                    <div class="modal-body">
                        <div class="Policy">
                            <h4>아래와 같이 개인정보를 제3자에게 제공하고자 합니다.</h4>
                            <table style="text-align: center; border: 1px solid">
                                <tbody style="border: 1px solid black;">
                                    <tr style="background-color: gainsboro">
                                        <th class="col-xs-2">제공받는 자</th>
                                        <th class="col-xs-4">제공 목적</th>
                                        <th class="col-xs-4">제공 항목</th>
                                        <th class="col-xs-2">보유기간</th>
                                    </tr>
                                    <tr>
                                        <td><agreement-b style="color: red">국세청</agreement-b></td>
                                        <td><agreement-b style="color: red">후원자의 기부사실 확인(기부금영수증 발급명세 확인) 및 세액 감면 등 조치</agreement-b></td>
                                        <td>이름, <agreement-b style="color: red">주민등록번호</agreement-b>(기부금영수증 수령선택 시), 주소, 기부내역, 기부일자,<br> 기부금영수증 발급일자</td>
                                        <td><agreement-b style="color: red">개인정보 이용목적을 달성할때까지</agreement-b></td>
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