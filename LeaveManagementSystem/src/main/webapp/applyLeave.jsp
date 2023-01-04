<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script >
let holidays=[];
fetch('/data')
.then(response => response.json())
.then(dates => {
    // process the data
    holidays=dates;
	 console.log(dates);
	 
})
.catch(error => {
    // handle errors
});

</script>
</body>
</html>