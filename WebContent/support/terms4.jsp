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
  <div id="PersonalIdentityAgreement" class="panel panel-default modal fade in" role="dialog" style="display: block;  max-width: 640px;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">고유식별정보 처리 동의</h3>
                    </div>
                    <div class="modal-body">
                        <div class="Policy">
                            <h4>아래와 같이 고유식별정보를 처리하고자 합니다.</h4>
                            <table style="text-align: center; border: 1px solid">
                                <tbody style="border: 1px solid black;">
                                    <tr style="background-color: gainsboro">
                                        <th class="col-xs-3">항목</th>
                                        <th class="col-xs-6">수집 목적</th>
                                        <th class="col-xs-3">보유기간</th>
                                    </tr>
                                    <tr>
                                        <td><agreement-b>주민등록번호</agreement-b></td>
                                        <td>기부금 영수증 발행, 기부사실 확인 및 세액 감면 등</td>
                                        <td><agreement-b>5년<br>(법인세법, 국세기본법)</agreement-b></td>
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