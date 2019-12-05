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
                width: 800px; height: 400px;
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
                width: 120px; height: 40px;
                background-color: #66b5d0;
                border: none; border-radius: 5px;
                color: white;
                font-size: 16px;
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
                    <h3 class="check">
                        <img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px; position: relative; top:5px;"> 실종 아동의 날</h3>
                </div>
                <div>
                    세계 실종 아동의 날(International Missing Children’s Day, 5월 25일)을 기념하여 실종 아동에 대한 일반인들의 인식 확대와 지속적인 관심을 고취하기 위한 날이며. ‘실종 아동 및 실종 예방’의 중요성을 알리는 상징적인 날입니다. 미국, 캐나다, 유럽 연합에서도 ‘실종 아동의 날’을 기념하고 있으며, 우리나라는 2007년부터 ‘실종 아동의 날 ‘제정을 위한 기념행사가 시작되었습니다
                </div>
                <div class="hx">
                    <h3 class="check"><img src="${pageContext.request.contextPath}/resources/images/greenribbon.png" style="width: 30px; position: relative; top:8px;">
                        그린 리본의 의미</h3>
                </div>
                그린 리본은 이 사회에서 희생된 실종 아동의 영혼을 추모하고,<br>
                아직까지 돌아오지 못한 실종 아동의 무사 귀환을 바라는 희망의 상징입니다.
                <div class="hx">
                    <h3 class="check"><img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px; position: relative; top:5px;">
                        실종 아동의 날 기념 행사</h3>
                </div>
                실종 아동 전문 기관은 2007년 부터 매년 세계 실종 아동의 날인 5월 25일을 맞이하여 추모와 희망의 상징인 그린 리본의 의미를 되새기며, 실종 가족, 보건복지부, 경찰청 및 유관 기관과 함께 실종 아동의 날 기념 행사를 실시하고 있습니다. 실종 아동의 날 기념 행사는 희생된 실종 아동을 추모함으로써 사회적 책임을 환기시키고, 장기 실종 아동에 대한 지속적 관심 확대와 <b>실종 아동의 날</b>을 법정 기념일로 제정하기 위함입니다.
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