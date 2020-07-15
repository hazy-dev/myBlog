<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- head -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="../../smart2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

			<div class="cover-wide-panel">
				<div class="board_box">
					<div class="qna_ask">
					<form id='recipeForm' method="post" role="form" enctype="multipart/form-data">
					<table>
						<colgroup>
							<col width="230px" />
							<col width="900px"/>
						</colgroup>
						<tbody>
							<tr>
								<th> 제목</th>
								<td>
									<input type="text" class="form-control" name="reSubject" id="reSubject" style="width:60%;" />
								</td>
							</tr>
							<tr>
								<th> 분류</th>
								<td>
									<span class="select_wrap2">
										<select class="form-control" id="reSelect" name="reSelect"  style="width:30%;" >
											<option value="0">분류</option>
											<option value="1">중식</option>
											<option value="2">양식</option>
										</select>
									</span>
								</td>
							</tr>
							<tr>
								<th> 대표 이미지</th>
								<td>
									<input type="file" class="form-control" name="reImage" id="reImage" style="width:60%;" />
						 		</td>
							</tr>						
							<tr>
								<th> 필수 재료</th>
								<td>
									<textarea class="form-control" name="reNecessary" id="reNecessary" style="resize: none;" >필수</textarea>
						 		</td>
							</tr>
							<tr>
								<th> 선택 재료</th>
								<td>
									<textarea class="form-control" name="reChoice" id="reChoice" style="resize: none;" >선택</textarea>
						 		</td>
							</tr>
							<tr>
								<th> 요리 설명</th>
								<td>
									<textarea class="form-control" name="reAccount" id="reAccount" style="resize: none;" >설명</textarea>
						 		</td>
							</tr>
							<tr style="height:460px;">
								<th> 내용</th>
								<td>
									<textarea name="reContent" id="reContent" style="display:none;"  >asdasd</textarea>
								</td>
							</tr>						
						</tbody>
					</table>
					
					<!-- <input type="hidden" name="editImageValues" id="editImageValues" /> -->
					
					</form>
					</div> 
					<div class="btnBax">
						<button type="button" class="reBtn reBtnCencle">취소</button>
						<button type="button" class="reBtn reBtnSucc" onclick="insertFn();">저장</button>
					</div>
				</div> 
			</div>
<script>

/*  네이버 스마트 에디터  */
$(document).ready(function(){
	document.onkeydown = function(){
		if(event.srcElement.type != "text" && event.srcElement.type != "textarea"){
			if(event.keyCode == 116){
				event.keyCode = 2;
				return false;
			} else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)){
				return false;
			}else if(event.keyCode == 8){
				return false;
			}else if( event.ctrlKey && (event.keyCode == 85) ){
				return false;
			}
		}
	}
	document.ondragstart = function(){
		if(event.srcElement.type != "text" && event.srcElement.type != "textarea"){
			return false;
		}
	}
	document.onselectstart = function(){
		if(event.srcElement.type != "text" && event.srcElement.type != "textarea"){
			return false;
		}
	}
	document.oncontextmenu = function(){
		if(event.srcElement.type != "text" && event.srcElement.type != "textarea"){
			return false;
		}
	}
});


var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "reContent",
 sSkinURI: "../../smart2/SmartEditor2Skin.html",
 htParams : {
     // 툴바 사용 여부
     bUseToolbar : true,
     // 입력창 크기 조절바 사용 여부
     bUseVerticalResizer : true,
     // 모드 탭(Editor | HTML | TEXT) 사용 여부
     bUseModeChanger : true,
 }
});

function insertFn(){
	oEditors.getById["reContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	console.log($('#reContent').val());
	
	
  	$("#recipeForm").ajaxForm({	
		url:"/adminRecipeIns",
		processData: false,
		contentType: "application/x-www-form-urlencoded;charset=UTF-8",
        dataType: "json",
        beforeSubmit:function(){
        	//확장자체크
        },
        success: function (result) {
        	
        	console.log(result);
        },

        error: function () {
        	alert("에러가 발생했습니다.");
        }
        	
	}).submit();
}

</script>

<script src="https://tistory1.daumcdn.net/tistory/2948280/skin/images/script.js"></script>
<script src="//search1.daumcdn.net/search/statics/common/js/g/search_dragselection.min.js"></script>

<script>
    lightbox.option({
		"fadeDuration": 200,
	    "resizeDuration": 200,
	    "wrapAround": false,
		"albumLabel": "%1 / %2",
		"fitImagesInViewport":true ,
		"stopEvent": false
    })
</script>            
</body>
</html>





