<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
        <title>실종아동 상세정보</title>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <style>
            *{
                box-sizing:border-box;
            }
            .cont1{
                border:1px solid black;
                border-radius:20px;
                margin:auto;
                min-width:500px;
                max-width:1100px;
            }

            .info_box{
                height:300px;
            }

            .img_info{
                text-align:center;
            }
            .img_info>img{
                height:100%;
            }

            .info{
                font-size:12px;
                height:30px;
                line-height:30px;
            }
            .info_key{
                text-align:right;
                background-color:#d6d6d6;
                margin-bottom:1px;
            }
            .info_val{
                background-color:#d6d6d6;
            }

            .detail_info{
                font-size:20px;
                text-align:center;
            }
            .detail_key{
                background-color:#d6d6d6;
                margin-bottom:1px;
            }
            .detail_val{
                background-color:#d6d6d6;
            }
            
            .notice{
                border-radius:10px;
                color:white;
                background-color:#26679f;
                font-size:25px;
                text-align:center;
            }
            .to_write{
                border-radius:10px;
                background-color:#ffcc57;
                font-size:25px;
                text-align:center;
            }
            .to_write>a{
                color:white;
            }
            .to_write>a:hover{
                text-decoration:none;
            }
        </style>
    </head>
    <body>
    	<br>
        <div class="container cont1">
            <div class="row">
                <div class="col-12 col-lg-4 info_box img_info">
                    <img src="${pageContext.request.contextPath}/resources/images/dubuzzing.jpg">
                </div>
                <div class="col-12 col-lg-4 info_box text_info1">
                    <br><br>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">제보자</div>
                        <div class="col-5 info info_val">${dto.reporter} (${dto.get_real_relation()})</div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">실종자 분류</div>
                        <div class="col-5 info info_val">${dto.get_real_target()}</div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">이름</div>
                        <div class="col-5 info info_val">${dto.name} (${dto.get_real_gender()})</div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">생년월일</div>
                        <div class="col-5 info info_val">${dto.get_formed_birth()}</div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">실종날짜</div>
                        <div class="col-5 info info_val">${dto.get_formed_missing_date()}</div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">실종지역</div>
                        <div class="col-5 info info_val">${dto.get_real_missing_area()}</div>
                    </div>
                </div>
                <div class="col-12 col-lg-4 info_box text_info2">
                    <br><br>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">키</div>
                        <div class="col-5 info info_val">${dto.height}cm</div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">몸무게</div>
                        <div class="col-5 info info_val">${dto.weight}kg</div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">머리 스타일</div>
                        <div class="col-5 info info_val">${dto.get_real_hair()}</div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">혈액형</div>
                        <div class="col-5 info info_val">${dto.get_real_blood()}</div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">상의 (종류)</div>
                        <div class="col-5 info info_val">${dto.get_real_top()} (${dto.get_real_top_kind()})</div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">하의 (종류)</div>
                        <div class="col-5 info info_val">${dto.get_real_bottoms()} (${dto.get_real_bottoms_kind()})</div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5 info info_key">신발 (사이즈)</div>
                        <div class="col-5 info info_val">${dto.get_real_shoes()} (${dto.shoes_size})</div>
                    </div>
                </div>
            </div>
            <hr>
            <br>
            <div class="row">
                <div class="col-12 col-lg-6">
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8 detail_info detail_key">실종지역 상세정보</div>
                        <div class="col-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8 detail_info detail_val">${dto.missing_area_detail}</div>
                        <div class="col-2"></div>
                    </div>
                </div>
                <div class="col-12 d-lg-none"><hr></div>
                <div class="col-12 col-lg-6">
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8 detail_info detail_key">특징 및 특이사항</div>
                        <div class="col-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8 detail_info detail_val">${dto.feature}</div>
                        <div class="col-2"></div>
                    </div>
                </div>
            </div>
            <br><br>
        </div>
        <hr>
        <div class="container cont2">
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8 notice">
                    <div>해당 실종자를 목격하신 분께서는</div>
                    <div>제보 게시판에 제보 부탁드립니다.</div>
                </div>
                <div class="col-2"></div>
            </div>
            <br>
            <div class="row">
                <div class="col-4"></div>
                <div class="col-4 to_write"><a href="">제보하러 가기</a></div>
                <div class="col-4"></div>
            </div>
        </div>
    </body>
</html>