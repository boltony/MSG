<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
            @font-face { font-family: 'GoyangIlsan'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff') format('woff'); font-weight: normal; font-style: normal; }
            *{
                font-family: 'GoyangIlsan';
            }
            .policyNote{
                padding: 15px;
                width:  800px; height: 300px;
                overflow: scroll;
                overflow-x: hidden;
                border: 1px solid #aaaaaa;
                background-color: #f0f0f0;
            }
            #inquiryClose{
                padding-top: 30px;
                width: 800px; height: 50px;
                text-align: center;
            }
            #closeBtn{
                width: 120px; height: 40px;
                background-color: #66b5d0;
                border: none; border-radius: 5px;
                color: white;
                font-size: 16px;
            }
            #cont1{
                float: left;
                width: 200px; height: 200px;
                margin-top: 80px;
                margin-left: 70px; margin-right: 40px;
            }
            #cont2{
                float: left;
                width: 51%;
                margin-top: 30px;
            }

        </style>
</head>
<body>
<div class=policyContainer>
            <div class=policyNote>
                <div id=cont1>
                    <img src="${pageContext.request.contextPath}/resources/images/emailNo.png" style="width: 150px;">
                </div>

                <div id=cont2>
                    <h3><img src="${pageContext.request.contextPath}/resources/images/inquiry_i.png" style="width: 20px;"> 문의하기</h3><br><br>
                    
                    사이트를 이용하시면서 궁금하신 사항이 있으시다면<br>
                    아래 <b>이메일 주소</b>를 통해 언제든지 문의하여 주시기 바랍니다.
                    <br><br>

                    <p style="background-color: #c5c9c5; width: 350px; height: 25px; font-size: 20px; text-align: center; padding: 10px;">msg_account_jy@naver.com<br>
                        </p>
                </div>
            </div>

            <div id=inquiryClose>
                <input type="button" value="닫기" id=closeBtn>
            </div>
        </div>
        
        <script>
    $(function(){
    	$("#closeBtn").on("click",function(){
    		window.close();
    	})
    })
    
    </script>

</body>
</html>