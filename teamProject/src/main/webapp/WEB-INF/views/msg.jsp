<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script type="text/javascript">
	const msg = '${msg}';
	const url = '${page}';
	
	alert(msg);

	if(url == ''){
		location.href = '${cpath}';
	}
	else {
		location.replace('${cpath}');	// GET으로 새로 요청하면 스프링 컨트롤러가 처리한다
	}
</script>
