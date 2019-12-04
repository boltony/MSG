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
                width: 800px; height: 350px;
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
                    <h3 class="check">
                        <img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px; position: relative; top:5px;"> 아이를 집에 혼자 두지 마세요.</h3>
                </div>
                <div>
                    아이가 자고 있을 때, 외출하지 않는 것이 좋습니다. 아이가 집 밖으로 보호자를 찾으러 나올 수 있기 때문입니다.<br>
                    가까운 곳에 갈 때에도 아이와 함께 다니는 것이 안전해요. <span style="color: #f40000"><b>사람이 많은 공공장소, 영화관, 시장 등</b></span>에서는 특히 더 주의해 주세요.
                </div>
                <div class="hx">
                    <h3 class="check"><img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px; position: relative; top:5px;">
                        예방 용품</h3>
                </div>
                아이의 이름, 연락처를 적을 수 있는 물품을 이용하세요.<br>
                목걸이나 팔찌 등 쉽게 드러나는 것은 유괴의 위험이 있으니, 잘 안 보이는 곳(세탁 라벨)에 적어 둔 후 아이에게 교육합니다.
                
                <div class="hx">
                    <h3 class="check"><img src="${pageContext.request.contextPath}/resources/images/termsCheck.png" style="width: 20px; position: relative; top:5px;">
                        아이와 친한 친구들 기억하기</h3>
                </div>
               아이가 바깥에서 어디에서 누구와 있었는지 알아보기 위해서라도 친구들을 기억하는 것이 좋습니다.<br>
                혼자 놀다 올 경우 누구와 어디에 갈 예정인지 묻고, 집에오는 시간을 잘 지킬 수 있도록 알려 주세요.
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