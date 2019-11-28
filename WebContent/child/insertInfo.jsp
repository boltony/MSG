<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.MalformedURLException"%>
<%@page import="java.io.IOException"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>실종정보등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
body {margin:0px; padding:0px; font-size:12px; font-family:"돋움",Dotum,Helvetica,AppleGothic,Sans-serif; line-height:1.5em; color:#666;}
.btn{
background-color: #69e39d;
         padding: 15px 30px;
         margin: 10px;
         border: none;
         color: white;
         text-align: center;
         text-decoration: none;
         font-size: 20px;
         display: inline-block;
         cursor: pointer;
         transition: all 0.35s;
            border-radius: 15px 15px 15px 15px;
            box-shadow: 0 9px #B0B0B0;

}
    .btn:hover{
            text-shadow: 2px 2px 5px;
        }
      .btn span {
         display: inline-block;
         position: relative;
         transition: 0.5s;
      }
      .btn span::after {
         
         
         position: absolute;
         
         opacity: 10;
         font-size: 30px;
         transition: 0.35s;
            color: white;
            transition-duration: 0.35s;
      }
      .btn:hover span {color: white;
            transition-duration: 1s; }
      .btn:hover span::after {
         opacity: 1;
         right: 0px;
      }
        .btn:active {
         background-color: #269f8c;
         box-shadow: 0 5px #808080;
         transform: translateY(4px);
      }
 
input button:hover{
            text-shadow: 2px 2px 5px;
            cursor : pointer;
        }
</style> 
</head> 
<body> 
   <form id="frm" method="post" action="../insert.child"> enctype="multipart/form-data"
      <table border="1" width="100%">
      <div> 
         <caption><h1><img src="Resource/images/logo.png" style="width: 60px; top: 20px;">실종아동등 신고 사전등록 신청 기본정보 입력</h1></caption>
         <colgroup>
            <col width="17%" />
            <col width="33%" />
            <col width="17%" />
            <col width="33%" />
         </colgroup>
         <tbody>
            <tr>
               <th>대상</th>
               <td colspan="3">
                  <input type="radio" class="target" id="child" name="target" value="010" checked="checked" /> 아동(만18세 미만)
                  <input type="radio" class="target" id="disabled_down" name="target" value="060" /> 정신장애인등(만 18세 이상)
                  <input type="radio" class="target" id="dotard" name="target" value="070" /> 치매노인
               </td>      
            </tr>
            <tr>
               
               <th style="width: 181px;">성별</th>
               <td>
                  <input type="radio" id="man" name="gender" value="M" checked="checked" />남자
                  <input type="radio" id="woman" name="gender" value="W" />여자
               </td>
            </tr>
            <tr>
               <th>성명</th>
               <td>
                  <input type="text" id="name" name="name" placeholder="홍길동" /><label id="nameck"style="color:red">입력해주세요</label>
               </td><th>생년월일</th><td><input type=text id="birth_date" name="birth_date" placeholder="20150422"><label id="birck"style="color:red">입력해주세요</label></td>
            
            
                     
            </tr>
            <tr>
               <th>발생장소</th>
               <td colspan="3">
                  <select name="missing_area" id="missing_area">
  
   <option value="999" selected="selected">선택</option>
   <option value="1" name="missing_area">서울특별시</option>
   <option value="2" name="missing_area">부산광역시</option>
   <option value="3" name="missing_area">대구광역시</option>
   <option value="4" name="missing_area">인천광역시</option>
   <option value="5" name="missing_area">광주광역시</option>
   <option value="6" name="missing_area">대전광역시</option>
   <option value="7" name="missing_area">울산광역시</option>
   <option value="8" name="missing_area">강원</option>
   <option value="9" name="missing_area">경기</option>
   <option value="10" name="missing_area">경남</option>
   <option value="11" name="missing_area">경북</option>
   <option value="12" name="missing_area">전남</option>
   <option value="13" name="missing_area">전북</option>
   <option value="14" name="missing_area">제주</option>
   <option value="15" name="missing_area">충남</option>
   <option value="16" name="missing_area">충북</option>
   <option value="17" name="missing_area">세종</option>  </select>
   <label id="whereck" style="color:red">선택해주세요</label>
  <input type="text" id="addr" name="missing_area_detail" placeholder="상세주소(예시 : OO시 OO구)" style="width: 240px;">
  <label id="detailck" style="color:red">입력해주세요</label>
               </td>      
            </tr>
            <tr>
            <th>발생일</th>
               <td colspan="3">
                  <input type="text" name="missing_date" id="missing_date" placeholder="날짜(예 :20191126)" maxlength=8/><label id="misdate"style="color:red">입력해주세요</label>
                  <input type="text" name="missing_time" id="missing_time" placeholder="시간(예 : 14:43 ( : 제외))" maxlength=4 />
                  <label id="mistime"style="color:red">입력해주세요</label>
               </td>
            </tr>
            <tr>
               <th>실종아동등 사진(jpg,gif파일)</th>
               <td colspan="3">
                  <input type="file" name="file1" id="file1"/><br />
                  <input type="file" name="file2" id="file2"/><br />
                  <input type="file" name="file3" id="file3"/><br />
                  <input type="file" name="file4" id="file4"/><br />
                  <input type="file" name="file5" id="file5"/><br />
                  <input type="file" name="file6" id="file6"/>
               </td>
            </tr>
         </tbody>
         </div>
      </table>
      
      <table border="1" width="100%">
         <caption><h3>신체특징 입력</h3></caption>
         <colgroup>
            <col width="13%" />
            <col width="12%" />
            <col width="13%" />
            <col width="12%" />
            <col width="14%" />
            <col width="36%" /> 
         </colgroup>
         <tbody>
            <tr>
               <th>신장</th>
               <td colspan="3">
                  <input type="text" id="height" name="height" placeholder="135" maxlength=3/ style="width: 80px;">Cm 
                  <label id="heick"style="color:red"> 입력해주세요</label>
               </td>
               <th>체중</th>
               <td colspan="3">
                  <input type="text" id="weight" name="weight" placeholder="30" maxlength=3/ style="width: 80px;">Kg 
                  <label id="weick"style="color:red"> 입력해주세요</label>
               </td>
               
            </tr>
            <tr>
               <th>두발형태</th>
               <td colspan="3">
                  <select id="hair" name="hair">
                     <option value="999" selected="selected">선택</option>
                     <option value="110">대머리</option>
                     <option value="120">삭발</option>
                     <option value="130">삭발</option>
                     <option value="140">묶음머리</option>
                     <option value="150">짧은 생머리</option>
                     <option value="155">짧은 파마머리</option>
                     <option value="160">단발 생머리</option>
                     <option value="165">단발 파마머리</option>
                     <option value="170">긴 생머리</option>
                     <option value="175">긴 파마머리</option>
                     <option value="990">기타</option>
                  </select>
                  <label id="hairck" style="color:red">입력해주세요</label>
               </td>
               <th>혈액형</th>
               <td>
                  <select id="blood_type" name="blood_type">
                     <option value="999"  selected="selected">선택</option>
                     <option value="1">A(RH+)</option>
                     <option value="2">B(RH+)</option>
                     <option value="3">O(RH+)</option>
                     <option value="4">AB(RH+)</option>
                     <option value="5">A(RH-)</option>
                     <option value="6">B(RH-)</option>
                     <option value="7">O(RH-)</option>
                     <option value="8">AB(RH-)</option>
                     <option value="9">기타</option>
                  </select>
                  <label id="bloodck" style="color:red">선택해주세요</label>
               </td>      
            </tr>
            <tr>
               <th>신체특징 및 특이사항</th>
               <td colspan="5">
                  <textarea id="feature" cols="90" rows="8" name="feature" placeholder="아이의 왼쪽손등에 화상이있어요"></textarea>
               <label id="feack" style="color: red">신체특징 및 특이사항입력은 필수입니다.</label></td>
            </tr>
            
            
         </tbody>
      </table>
      <table border="1" width="100%">
         <caption><h3>옷차림 입력</h3></caption>
         <colgroup>
            <col width="13%" />
            <col width="87%" />
         </colgroup>
         <tbody>
            <tr>
               <th>상의</th>
               <td>
                  <input type="radio" id="longTop" name="top" value="10" checked="checked" />긴팔
                  <input type="radio" id="shortTop" name="top" value="20" />반팔
                  <select id="top_kind" name="top_kind">
                     <option value="999" selected="selected">선택</option>
                     <option value="110">속옷차림</option>
                     <option value="120">운동복</option>
                     <option value="130">캐주얼</option>
                     <option value="140">티셔츠</option>
                     <option value="150">와이셔츠</option>
                     <option value="160">원피스</option>
                     <option value="170">가디건(스웨터)</option>
                     <option value="180">코트류</option>
                     <option value="190">정장</option>
                     <option value="990">기타</option>
                  </select>
                  <label id="topck" style="color:red">선택해주세요</label>
                    </td>
            </tr>
            <tr>
               <th>하의</th>
               <td>
                  <input type="radio" id="longBottom" name="bottoms" value="10" checked="checked" />긴
                  <input type="radio" id="shortBottom" name="bottoms" value="20" />짧은
                  <select id="bottoms_kind" name="bottoms_kind">
                     <option value="999" selected="selected">선택</option>
                     <option value="110">속옷차림</option>
                     <option value="120">운동복</option>
                     <option value="130">캐쥬얼</option>
                     <option value="140">청바지</option>
                     <option value="150">통바지</option>
                     <option value="160">면바지</option>
                     <option value="170">치마</option>
                     <option value="180">정장바지</option>
                     <option value="990">기타</option>
                  </select>
                  <label id="bottomck" style="color:red">선택해주세요</label>
               
               </td>
            </tr>
            <tr>
               <th>신발</th>
               <td>
                  <select id="shoes" name="shoes">
                     <option value="999" selected="selected">선택</option>
                     <option value="110">맨발</option>
                     <option value="120">슬리퍼</option>
                     <option value="130">샌들</option>
                     <option value="140">단화</option>
                     <option value="150">운동화</option>
                     <option value="160">등산화</option>
                     <option value="170">장화</option>
                     <option value="180">부츠</option>
                     <option value="190">구두</option>
                     <option value="990">기타</option>
                  </select>
                  <label id="shoesck" style="color:red">선택해주세요</label>
                  
                  신발 사이즈
                  <input type="text" id="shoes_size" name="shoes_size" maxlength=3/ placeholder="210">    
                  <label id="fotck" style="color:red">입력해주세요</label>
               </td>
            </tr>
         </tbody>
      </table>
      <table border="1" width="100%">
         <caption><h3>신고 및 접수자 정보 입력</h3></caption>
         <colgroup>
            <col width="13%" />
            <col width="37%" />
            <col width="13%" />
            <col width="37%" />
         </colgroup>
         <tbody>
            <tr>
               <th>성명</th>
               <td>
                  <input type="text" id="reporter" name="reporter" placeholder="보호자"/><label id="re_nameck" style="color:red">입력해주세요</label>
               </td>
                  <th>생년월일</th>   <td>
                  <input type="text" id="re_birth_date" name="re_birth_date" placeholder="19781204" maxlength=8>
                  <label id="re_btck" style="color:red">입력해주세요</label></td>
            </tr>
            <tr>
               <th>관계</th>
               <td colspan="3">
                  <input type="radio" id="parents" name="re_relation" value="10" checked="checked" />부모
                  <input type="radio" id="children" name="re_relation"  value="20" />자녀
                  <input type="radio" id="spouse" name="re_relation"  value="30" />배우자
                  <input type="radio" id="relative" name="re_relation"  value="40" />친척
                  <input type="radio" id="sibling" name="re_relation"  value="50" />형제
                  <input type="radio" id="cohab" name="re_relation" value="70" />동거자
                  <input type="radio" id="codhab" name="re_relation" value="90" />기타
                  
               </td>   
            </tr>
            <tr>
               <th>휴대폰</th>
               <td>
                  <input type="text" id="re_phone" name="re_contact1" placeholder="01099997777" maxlength=11/>
                  <label id="pck" style="color:red">입력해주세요( - 제외)</label>
               </td>
               <th>전화번호</th>
               <td>
                  <input type="text" id="re_tel"name="re_contact2" placeholder="021234567" maxlength=11 />
                  <label id="telck">필수입력사항은아닙니다. 입력시 ( - 제외)</label>
               </td>      
            </tr>
            
         </tbody>
         
      </table>
      <div style="text-align: center; font-size:20px;">
      <p>
         
      </p>
      <input type="button" class="btn" id="send" value="접수" />
      <input type="reset" class="btn" value="취소" />
      </div>
      
   </form>
   
   <script>
    
    $("#birth_date").on("input",function(){
       var birthreg = /[0-9]{8}/g;
       var birthdata = $("#birth_date").val();
       var birthresult = birthreg.exec(birthdata);


    
              if(birthresult != null){
                 $("#birck").css("color","skyblue");
                 $("#birck").html("정상적으로 입력되었습니다");
              }else{
                 $("#birck").css("color","red");
                 $("#birck").html("형식을 맞춰주세요");
              }
           
    })
    $("#birth_date").on("focusout",function(){
       var birthdata = $("#birth_date").val();
       var date = new Date();
        var year = date.getFullYear();
        var month = (date.getMonth() + 1);
        var day = date.getDate();        
        
        var realage = year-(birthdata.substring(0,4));
        var target = $("input:radio[name='target']:checked").val();
      console.log(target);
        if(target=="010" && realage>18 && birthdata != ""){
           alert("만 18세이상은 실종아동으로 등록할수 없습니다.");
           $("#birth_date").val("");
           $("#bitrh_date").focus();
           $("#birck").css("color","red");
          $("#birck").html("다시 입력해주세요");
        }else{
           $("#birth_date").css("background-color","white");
           $("#birck").css("color","skyblue");
          $("#birck").html("정상적으로 입력되었습니다");
          $("#target").attr( "disabled" );

        }
    }) 
    $("input:radio[name='target']").on("click",function(){
       var target = $("input:radio[name='target']:checked").val();
       var birthdata = $("#birth_date").val();
       var date = new Date();
        var year = date.getFullYear();
        var month = (date.getMonth() + 1);
        var day = date.getDate();    
        var realage = year-(birthdata.substring(0,4));
        var target = $("input:radio[name='target']:checked").val();
       
        if(target=="010" && realage>18 && birthdata !=""){
           $("#birth_date").val("");
           $("#bitrh_date").focus();
           $("#birck").css("color","red");
          alert("만 18세이상은 등록할수 없습니다.");
        }else{
           $("#birth_date").css("background-color","white");
           
        }
        if(birthdata == ""){
           $("#birck").css("color","red");
           $("#bitck").html("입력해주세요");
        }
    })
    
    $("#missing_date").on("input",function(){
       var misreg = /[0-9]{8}/g;
       var misdata = $("#missing_date").val();
       var misresult = misreg.exec(misdata);
       if(misresult != null){
          $("#misdate").css("color","skyblue");
          $("#misdate").html("정상적으로 입력되었습니다. 옆의 시간을 입력하세요")
       }else{
          $("#misdate").css("color","red");
          $("#misdate").html("형식을 맞춰주세요");
       }
    })
    $("#missing_time").on("input",function(){
       var timereg = /[0-9]{4}/g;
       var timedata = $("#missing_time").val();
       var timeresult = timereg.exec(timedata);
       if(timeresult != null){
          $("#mistime").css("color","skyblue");
          $("#mistime").html("정상적으로 입력되었습니다.");
       }else{
          $("#mistime").css("color","red");
          $("#mistime").html("형식을 맞춰주세요");
       }
    })
    $("#feature").on("input",function(){
       var feature = $("#feature").val();
       if(feature != ""){
          $("#feack").css("color","skyblue");
          $("#feack").html("입력되었습니다");
       }else{
          $("#feack").css("color","red");
          $("#feack").html("신체특징 및 특이사항을 입력해주세요");
       }
    })
    $("#shoes_size").on("input",function(){
       var fotreg = /[0-9]{3}/g;
       var fotdata = $("#shoes_size").val();
       var fotresult = fotreg.exec(fotdata);
       if(fotresult != null){
          $("#fotck").css("color","skyblue");
          $("#fotck").html("입력되었습니다");
       }else{
          $("#fotck").css("color","red");
          $("#fotck").html("형식을 맞춰주세요");
       }
    })
    $("#name").on("input",function(){
       var namereg = /[가-힣]{2,}/g;
       var namedata = $("#name").val();
       var nameresult = namereg.exec(namedata);
       if(nameresult != null){
       $("#nameck").css("color","skyblue");
       $("#nameck").html("입력되었습니다");
       }else{
          $("#nameck").css("color","red");
          $("#nameck").html("한글이름을 입력하세요");
       }
    })
     $("#reporter").on("input",function(){
       var repreg = /[가-힣]{2,}/g;
       var repdata = $("#reporter").val();
       var represult = repreg.exec(repdata);
       if(represult != null){
       $("#re_nameck").css("color","skyblue");
       $("#re_nameck").html("입력되었습니다");
       }else{
          $("#re_nameck").css("color","red");
          $("#re_nameck").html("한글이름을 입력하세요");
       }
    })
    $("#re_birth_date").on("input",function(){
       var rebtreg = /[0-9]{8}/g;
       var rebtdata = $("#re_birth_date").val();
       var rebtresult = rebtreg.exec(rebtdata);
       if(rebtresult != null){
          $("#re_btck").css("color","skyblue");
          $("#re_btck").html("입력되었습니다");
       }else{
          $("#re_btck").css("color","red");
          $("#re_btck").html("형식을 맞춰주세요");
       }
    })
    $("#re_phone").on("input",function(){
        var phonereg = /[01]+[\w]{9,}/g;
       var phonedata = $("#re_phone").val();
       var phoneresult = phonereg.exec(phonedata);
       if(phoneresult != null){
          $("#pck").css("color","skyblue");
          $("#pck").html("입력되었습니다");
       }else{
          $("#pck").css("color","red");
          $("#pck").html("휴대폰번호를 입력하세요");
       }
    })
    $("#re_tel").on("input",function(){
       var telreg = /[0]+[\w]{8,}/g;
       var teldata = $("#re_tel").val();
       var telresult = telreg.exec(teldata);
       if(telresult != null){
          $("#telck").css("color","skyblue");
          $("#telck").html("입력되었습니다");
       }else{
          $("#telck").css("color","red");
          $("#telck").html("집전화번호를 입력하세요");
       }
    });   
    $("#hair").on("click",function(){
       var hair = $("#hair option:selected").val();
        if(hair!=999){
           $("#hairck").css("color","skyblue");
           $("#hairck").html("선택되었습니다");
        }else{
           $("#hairck").css("color","red");
           $("#hairck").html("선택해주세요");
        }   
    })
    $("#blood_type").on("click",function(){
       var blood = $("#blood_type option:selected").val();
          if(blood != 999){
             $("#bloodck").css("color","skyblue");
             $("#bloodck").html("선택되었습니다");
          }else{
             $("#bloodck").css("color","red");
             $("#bloodck").html("선택해주세요");
          }
    })
    $("#top_kind").on("click",function(){
       var top = $("#top_kind option:selected").val();
       if(top != 999){
          $("#topck").css("color","skyblue");
          $("#topck").html("선택되었습니다")
       }else{
          $("#topck").css("color","red");
          $("#topck").html("선택해주세요");
       }
    })
    $("#bottoms_kind").on("click",function(){
       var bottom = $("#bottoms_kind option:selected").val();
       if(bottom != 999){
          $("#bottomck").css("color","skyblue");
          $("#bottomck").html("선택되었습니다");
       }else{
          $("#bottomck").css("color","red");
          $("#bottomck").html("선택해주세요");
       }
    })
    $("#shoes").on("click",function(){
       var shoes = $("#shoes option:selected").val();
       if(shoes != 999){
          $("#shoesck").css("color","skyblue");
          $("#shoesck").html("선택되었습니다");
       }else{
          $("#shoesck").css("color","red");
          $("#shoesck").html("선택해주세요");
       }
    })
    $("#missing_area").on("click",function(){
       var area = $("#missing_area option:selected").val();
       if(area != 999){
          $("#whereck").css("color","skyblue");
          $("#whereck").html("입력되었습니다");
       }else{
          $("#whereck").css("color","red");
          $("#whereck").html("입력해주세요");
       }
    })
     $("#addr").on("input",function(){
       var addr = $("#addr").val();
       if(addr != ""){
          $("#detailck").css("color","skyblue");
          $("#detailck").html("입력되었습니다");
       }else{
          $("#detailck").css("color","red");
          $("#detailck").html("상세주소를 입력하세요");
       }
    })
    $("#height").on("input",function(){
       var heireg = /[\w]{2,}/g;
       var heidata = $("#height").val();
       var heiresult = heireg.exec(heidata);
       if(heiresult != null){
          $("#heick").css("color","skyblue");
          $("#heick").html("입력되었습니다");
       }else{
          $("#heick").css("color","red");
          $("#heick").html("정확한 키를 입력해주세요");
       }
    })
    $("#weight").on("input",function(){
       var weireg = /[\w]{1,}/g;
       var weidata = $("#weight").val();
       var weiresult = weireg.exec(weidata);
       if(weiresult != null){
          $("#weick").css("color","skyblue");
          $("#weick").html("입력되었습니다");
       }else{
          $("#weick").css("color","red");
          $("#weick").html("몸무게를 입력해주세요");
       }
    })
    $("#send").on("click",function(){
       var birthreg = /[0-9]{8}/g;
       var birthdata = $("#birth_date").val();
       var birthresult = birthreg.exec(birthdata);
       var misreg = /[0-9]{8}/g;
       var misdata = $("#missing_date").val();
       var misresult = misreg.exec(misdata);
       var timereg = /[0-9]{4}/g;
       var timedata = $("#missing_time").val();
       var timeresult = timereg.exec(timedata);
       var feature = $("#feature").val();
       var fotreg = /[0-9]{3}/g;
       var fotdata = $("#shoes_size").val();
       var fotresult = fotreg.exec(fotdata);   
       var namereg = /[가-힣]{2,}/g;
       var namedata = $("#name").val();
       var nameresult = namereg.exec(namedata);   
       var repreg = /[가-힣]{2,}/g;
       var repdata = $("#reporter").val();
       var represult = repreg.exec(repdata);
       var rebtreg = /[0-9]{8}/g;
       var rebtdata = $("#re_birth_date").val();
       var rebtresult = rebtreg.exec(rebtdata);
        var phonereg = /[01]+[\w]{9,}/g;
        var phonedata = $("#re_phone").val();
        var phoneresult = phonereg.exec(phonedata);
        var telreg = /[0]+[\w]{8,}/g;
       var teldata = $("#re_tel").val();
       var telresult = telreg.exec(teldata);
       var hair = $("#hair option:selected").val();
       var blood = $("#blood_type option:selected").val();
       var top = $("#top_kind option:selected").val();
       var bottom = $("#bottoms_kind option:selected").val();
       var shoes = $("#shoes option:selected").val();
       var area = $("#missing_area option:selected").val();
       var addr = $("#addr").val();
       var heireg = /[\w]{2,}/g;
       var heidata = $("#height").val();
       var heiresult = heireg.exec(heidata);
       var weireg = /[\w]{1,}/g;
       var weidata = $("#weight").val();
       var weiresult = weireg.exec(weidata);
       if(birthresult != null && misresult != null && timeresult != null && feature != "" &&
             fotresult != null && nameresult != null && represult != null && represult != null &&
             rebtresult != null && phoneresult != null && hair != 999 && blood != 999 &&
             top != 999 && bottom != 999 && shoes != 999 && area != 999 && addr != 999 &&
             heiresult != null && weiresult != null){
          $("#frm").submit();
       }else{
          alert("모두 입력하세요");
       }
       
          
        
    })
    </script>
</body>
</html>