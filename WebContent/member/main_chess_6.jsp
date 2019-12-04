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
                    <h2 class="check">
                        <img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 30px; position: relative; top:5px;"> 실종 아동 현황</h2><br>
                </div>
                <div class="hx">
                        
                </div>
                우리나라에서는 <b>매년 2만 명 가량</b>의 아동 실종 사건이 접수되고 있습니다. 실종 아동 신고 접수는 1만 건이 넘었고, 이 중 <span style="color: #d10000;"><b>100여 명</b>에 이르는 아이들은 장기 미아로 아직까지 찾지 못한 상황입니다.</span><br><br>

1년 이상 찾지 못한 장기 실종 아동은 <b>2017년 기준 모두 389명</b>으로 경찰청 지방청 내 장기 실종자 전담팀을 구성해 아이들을 찾기 위한 노력을 기울이고 있습니다.<br><br>

                또한 매년 <b>5월 25일</b>은 세계 실종 아동의 날입니다. 우리나라에서는 2007년부터 실종 아동의 날을 제정하고 매년 행사를 열어 아동 실종 문제에 대한 사회적 관심을 집중시키고자 노력하고 있습니다.<br><br>

더 이상 실종 아동이 생기는 일을 방지하기 위해서라도 우리 아동 실종 문제에 큰 관심을 기울여 주시기 바랍니다.<br><br>
               
                
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