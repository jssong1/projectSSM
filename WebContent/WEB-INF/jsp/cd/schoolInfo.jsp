<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>schoolInfo</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){
				console.log("ready");
				
				$.ajax({
					type : "GET",
					url: "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=961f47ce54cb960e4f6929a39c6b83dc&svcType=api&svcCode=SCHOOL&contentType=json&gubun=univ_list&perPage=9999",
					success : function(data){
						console.log(data);
					},
					error : function(){
						alert("error");
					}
				});
			});
		
		</script>
	</head>
	<body>
	
	</body>
</html>