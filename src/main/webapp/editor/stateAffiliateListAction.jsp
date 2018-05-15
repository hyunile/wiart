<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
  		<script type="text/javascript" src="/scripts/jquery/jquery.dataTables.js"></script>
<!--   		<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css"> -->
		<script type="text/javascript">
		  	$(document).ready(function() {
	 			$('#myTable').DataTable({
	 				"searching": false
	 			});
			});   
		</script> 
		
<div class="datatable-list">
	<table id="myTable" class="">	
		<thead>
			<tr>
				<th scope="col" rowspan="2">순번</th>
				<th scope="col" rowspan="2">지역</th>
				<th scope="col" rowspan="2">구분</th>
				<th scope="col" rowspan="2">업체명</th>
				<th scope="col" rowspan="2">배차완료</th>
				<th scope="col" colspan="3">네트워킹</th>
				<th scope="col" rowspan="2">M 운송점</th>
				<th scope="col" rowspan="2">주선점</th>
				<th scope="col" rowspan="2">운송사</th>
				<th scope="col" rowspan="2">공차제공</th>
				<th scope="col" colspan="5">배차협의 메시지 전송 건수</th>
				<th scope="col" colspan="5">운송점 수</th>
				<th scope="col" rowspan="2">휴대폰 공차<br />배차</th>
				<th scope="col" rowspan="2">VIP회원</th>
				<th scope="col" rowspan="2">보험 가입 유무</th>
				<th scope="col" rowspan="2">전화번호</th>
				<th scope="col" rowspan="2">대표자</th>
				<th scope="col" rowspan="2">휴대폰</th>
				<th scope="col" rowspan="2">FAX</th>
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
				<th scope="col">P운송점</th>
				<th scope="col">개인운송점</th>
				<th scope="col">소속운송점</th>
				<th scope="col">M운송점</th>
				<th scope="col">합계</th>
			</tr>
		</thead>
		<c:if test="${not empty affiliate}">
			<c:forEach items="${affiliate}" var="list" varStatus="status">
				<tr>
						<td>${status.count}</td>
						<td>${list.areaNm}</td>
						<td>${list.agGbn}</td>
						<td>${list.agencyNm}</td>
						<td>${list.compCarCnt}</td>
						<td>${list.netMemCnt}</td>
						<td>${list.netSSCnt}</td>
						<td>${list.netSum}</td>
						<td>${list.netPdaCnt}</td>
						<td>${list.netAgenCnt}</td>
						<td>${list.rentCnt}</td>
						<td>${list.uCarCnt}</td>
						<td>${list.smsMemCnt}</td>
						<td>${list.smsSsCnt}</td>
						<td>${list.smsSosokCnt}</td>
						<td>${list.smsSearchCnt}</td>
						<td>${list.smsSum}</td>
						<td>${list.memPreCnt}</td>
						<td>${list.memPerCnt}</td>
						<td>${list.memComCnt}</td>
						<td>${list.memMobCnt}</td>
						<td>${list.memSum}</td>
						<td>${list.cellRecCnt}</td>
						<td>${list.vIPCnt}</td>
						<td>${list.insuCnt}</td>
						<td>${list.phone}</td>
						<td>${list.repNm}</td>
						<td>${list.cellPhone}</td>
						<td>${list.fax}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty affiliate}">
				<tr class="odd">
					<td colspan="29"></td>
	   			</tr>
			</c:if>	
		</c:if>
	</table>
</div>
