<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
              
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>실종아동 상세정보</title>
        <style>
            *{
                box-sizing:border-box;
            }
            .cont1{
                border:1px solid black;
                border-radius:10px;
                margin:auto;
                min-width:500px;
                max-width:1100px;
            }

            .slide{
            	width:400px;
            	margin:auto;
            }

            .info{
                font-size:12px;
                height:30px;
                line-height:30px;
            }
            .info_key{
                text-align:right;
                background-color:#d6d6d6;
                margin-right:1px;
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
                background-color:#26679f;
                font-size:25px;
                text-align:center;
            }
            .to_write>a{
                color:white;
                width:100%;
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
                <div class="col-12 info_box img_info">
	                <div id="carousel_img" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<c:choose>
								<c:when test="${file_names_list[0] != null}">
									<li data-target="#carousel_img" data-slide-to="0" class="active"></li>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${file_names_list[1] != null}">
									<li data-target="#carousel_img" data-slide-to="1"></li>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${file_names_list[2] != null}">
									<li data-target="#carousel_img" data-slide-to="2"></li>
								</c:when>
							</c:choose>
						</ol>
						<div class="carousel-inner">
							<c:choose>
								<c:when test="${file_names_list[0] != null}">
									<div class="carousel-item active">
										<img src="${file_names_list[0]}" class="d-block w-100" alt="...">
									</div>	
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${file_names_list[1] != null}">
									<div class="carousel-item">
										<img src="${file_names_list[1]}" class="d-block w-100" alt="...">
									</div>	
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${file_names_list[2] != null}">
									<div class="carousel-item">
										<img src="${file_names_list[2]}" class="d-block w-100" alt="...">
									</div>	
								</c:when>
							</c:choose>
						</div>
						<a class="carousel-control-prev" href="#carousel_img" role="button" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="carousel-control-next" href="#carousel_img" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
			<div class="row">
                <div class="col-12 col-md-6 info_box text_info1">
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
                    <br>
                </div>
                <div class="col-12 col-md-6 info_box text_info2">
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
                    <br>
                </div>
            </div>
            <hr>
            <br>
            <div class="row">
                <div class="col-12 col-md-6">
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
                <div class="col-12 d-md-none"><hr></div>
                <div class="col-12 col-md-6">
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
        </div>
        <br>
    </body>
</html>