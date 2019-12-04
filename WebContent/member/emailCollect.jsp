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
            #emailClose{
                padding-top: 30px;
                width: 800px; height: 50px;
                text-align: center;
            }
            #closeBtn{
                width: 100px; height: 40px;
                background-color: #7ac9d8;
                border: none; border-radius: 5px;
                color: white;
                font-size: 15px;
            }
            #cont1{
                float: left;
                width: 200px; height: 200px;
                margin-top: 80px;
                margin-left: 70px; margin-right: 40px;
            }
            #cont2{
                float: left;
                width: 50%;
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
                    <h3><img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px;"> 이메일 무단 수집 거부</h3><br><br>

                    본 사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, 이를 위반 시 정보통신망법에 의해 <b>형사 처벌</b>됨을 유념하시기 바랍니다.
                    <br><br>

                    <p style="background-color: #c5c9c5; width: 350px; height: 40px; font-size: 15px; text-align: center; padding: 10px;">정보통신망 이용 촉진 및 정보보호 등에 관한 법률<br>
                        제50조의 2 (전자우편 주소의 무단 수집행위 등 금지)</p>
                </div>
            </div>

            <div id=emailClose>
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