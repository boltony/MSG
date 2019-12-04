<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>　</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
            @font-face { font-family: 'GoyangIlsan'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff') format('woff'); font-weight: normal; font-style: normal; }
            *{
                font-family: 'GoyangIlsan';
            }

            .termsNote{
                padding: 15px;
                width: 800px; height: 300px;
                overflow: scroll;
                overflow-x: hidden;
                border: 1px solid #aaaaaa;
                background-color: #f0f0f0;
            }
            #termsClose{
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

            table{
                border-top: 1px solid black; border-bottom: 1px solid black;
                margin: 10px; padding: 10px;
            }
            th{
                width: 200px; height: 50px;
            }
            td{
                width: 700px;
                padding: 10px;
            }
        </style>
</head>
<body>
	<div class=policyContainer>
            <div class="termsNote">
                <div class="hx">
                    <h3 class="check"><img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px; position: relative; top:5px;">
                        안전 Dream의 지문 등 사전 등록제</h3>
                </div>
                실종을 방지하고, 발생 시 신속한 발견을 위해 사전에 등록하는 제도를 운영합니다.<br><br>
          <b>지문 등 사전 등록제</b><br>
                미리 지문, 사진, 보호자 인적 사항 등을 등록해 놓고, 실종되었을 때 등록된 자료를 활용해 신속히 발견하는 제도<br><br>
           <b>지문 등 사전 등록 대상</b><br>
                18세 미만 아동, 지적장애인과 치매질환자 중 보호자가 원하는 사람<br><br>
           <b> 신청 방법</b><br>
                ① 안전 Dream 사이트(<a href="http://www.safe182.go.kr">www.safe182.go.kr</a>)에서 등록. 단, 지문 등록은 방문<br>
② 경찰서 지구대/파출소에 방문하여 등록
            </div>
            <div id=termsClose>
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