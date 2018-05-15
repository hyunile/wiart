<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html lang="ko">
<head>

<!-- 	<script type="text/javascript" src="/scripts/jquery/jquery.dataTables.js"></script> -->
<!-- 	<link rel="stylesheet" type="text/css" href='//cdn.datatables.net/responsive/1.0.0/css/dataTables.responsive.css'> -->

<!-- e:날짜 Picker -->

<!-- <script type="text/javascript">
//콤보박스 처리를 위한 스크립트
	$(document).ready(function() {
		
		
		
		getOptionItem('userGroupId', 'user_group', 'A');
		getOptionItem('userId', 'user', 'A', 'userGroupId');
	});
	
	$("#userGroupId").live('change', function(event) {
		getOptionItem('userId', 'user', 'A', 'userGroupId');
	});
</script> -->

<script type="text/javascript">
//Ajax로 첫 화면의 데이터 호출
//화면 먼저 보이고 데이터를 불러야 사용자가 덜 답답해 함
$(document).ready(function() {
	
// 	init();
	goSearch();
	
 	

	$.datepicker.setDefaults($.datepicker.regional['ko']);
	$( ".date" ).datepicker();

	//버튼 클릭시
	$("#btn_search").click(function() {
		goSearch();
	});
/* 	$("#btn_export").click(function() {
	}); */

	
});

/* function init(){
	var userGroupId = "${userGroupId}";
	var userId = "${userId}";


	var startDate = "${startDate}";
	var endDate = "${endDate}";
	$("#startDate").val(startDate);
	$("#endDate").val(endDate);
} */

/* function goExcel(){
	var param = new Object();
	param = $("#condition").serialize();

	$.download('exportAction.xls',param,'post' );
} */

function goSearch(){
	var param = new Object();
	param = $("#condition").serialize();

	$.post('stateAffiliateListAction.ajax', param, function(data) {
		$('#mainTable').html(data);
		
	});

}
</script>
</head>
<body>
	<div id="wrap">
		<!-- header -->
		<div id="header">
		</div>
		<!-- //header -->
		<!-- conteainer -->
		<div id="container">
			<div class="content">
			<form id="condition">
				<!-- inner cont -->
				<h2 class="cont-title">가맹점별 현황</h2>
				<!-- search -->
				<div class="search-box-wrap type1">
					<div class="search-box">
						<table>
							<fmt:parseDate value="${startDate}" var ="startDt" pattern="yyyymmdd"/>
							<fmt:parseDate value="${endDate}" var ="endDt" pattern="yyyymmdd"/>
							<caption>검색 창 - 조회일</caption>
							<colgroup>
								<col>
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="col"><label for="srchDateTy1">조회일</label></th>
									<td>
										<input type="text" id="srchDateTy1" name="Frdt" class="datepicker txt" value='<fmt:formatDate value="${startDt}" pattern="yyyy-mm-dd" />' title="조회 시작일 선택">
										<span class="hyphen">~</span>
										<input type="text" id="srchDateTy2" name="Todt" class="datepicker txt" value='<fmt:formatDate value="${endDt}" pattern="yyyy-mm-dd" />' title="조회 종료일 선택">
										<a href="#" class="btn-gray btn-small">3일</a>
										<a href="#" class="btn-gray btn-small">1주</a>
										<a href="#" class="btn-gray btn-small">2주</a>
										<a href="#" class="btn-gray btn-small">1달</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn-left">
						<a href="#" class="btn-red btn-small" id="btn_search">검색</a>
					</div>
				</div>
				<!-- //search -->
				<!-- 합계 표 -->
				<div class="sum-list">
					<table>
						<caption>배차완료, 네트워킹, M운송점, 주선점, 운송사, 공차제공, 배차협의 메시지 전송 건수, 운송점 수, 휴대폰 공차배차, VIP회원, 보험가입 유무를 보여주는 표</caption>
						<colgroup>
							<col style="width:4%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:4%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:4%">
							<col style="width:4%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:5%">
							<col style="width:4%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col" rowspan="2">배차완료</th>
								<th scope="col" colspan="3">네트워킹</th>
								<th scope="col" rowspan="2">M<br />운송점</th>
								<th scope="col" rowspan="2">주선점</th>
								<th scope="col" rowspan="2">운송사</th>
								<th scope="col" rowspan="2">공차제공</th>
								<th scope="col" colspan="5">배차협의 메시지 전송 건수</th>
								<th scope="col" colspan="5">운송점 수</th>
								<th scope="col" rowspan="2">휴대폰 공차<br />배차</th>
								<th scope="col" rowspan="2">VIP회원</th>
								<th scope="col" rowspan="2">보험<br />가입<br />유무</th>
							</tr>
							<tr class="sub-thead">
								<th scope="col">운송점</th>
								<th scope="col">주유소</th>
								<th scope="col">합계</th>
								<th scope="col">운송점</th>
								<th scope="col">주유소</th>
								<th scope="col">소속</th>
								<th scope="col">자동검색</th>
								<th scope="col">합계</th>
								<th scope="col">P<br />운송점</th>
								<th scope="col">개인<br />운송점</th>
								<th scope="col">소속<br />운송점</th>
								<th scope="col">M<br />운송점</th>
								<th scope="col">합계</th>
							</tr>
							<tr>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- //합계 표 -->
				<!-- 목록 -->
				<div class="btn-left">
					<a href="#" class="btn-white">엑셀</a>
				</div>
				<div class="mgt20" id="mainTable"></div>
				<!-- //목록 -->
				<!-- //inner cont -->
				</form>
			</div>
		</div>
		<!-- //conteainer -->
	</div>
</body>
</html>