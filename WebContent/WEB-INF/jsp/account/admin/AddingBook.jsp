<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="localization.local" var="loc" />
<fmt:message bundle="${loc}" key="local.locbutton.name.ru" var="ru_button" />
<fmt:message bundle="${loc}" key="local.locbutton.name.en" var="en_button" />
<fmt:message bundle="${loc}" key="local.field.name.author" var="author" />
<fmt:message bundle="${loc}" key="local.field.name.name" var="authorName" />
<fmt:message bundle="${loc}" key="local.field.name.surname" var="authorSurname" />
<fmt:message bundle="${loc}" key="local.field.name.title" var="title" />
<fmt:message bundle="${loc}" key="local.field.name.genre" var="genre" />
<fmt:message bundle="${loc}" key="local.addBookPage.select.option.name.genreSelection" var="genreSelection" />
<fmt:message bundle="${loc}" key="local.addBookPage.select.option.name.fiction" var="fiction" />
<fmt:message bundle="${loc}" key="local.addBookPage.select.option.name.technical" var="technical" />
<fmt:message bundle="${loc}" key="local.button.name.addBook" var="addBookButton" />
<fmt:message bundle="${loc}" key="local.button.name.goToAccount" var="goToAccount_button" />
<fmt:message bundle="${loc}" key="local.button.name.logOut" var="logOutButton" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
        $(function()
        {
            alert('Подключена последняя версия jQuery через Google хостинг');
        });
</script>
<script>
$('#addDynamicExtraFieldButton').click(function(event) {
    addDynamicExtraField();
    return false;
 });
function addDynamicExtraField() {
    var div = $('<div/>', {
        'class' : 'DynamicExtraField'
    }).appendTo($('#DynamicExtraFieldsContainer'));
    var br = $('<br/>').appendTo(div);
    var label = $('<label/>').html("Доп. поле ").appendTo(div);
    var input = $('<input/>', {
        value : 'Удаление',
        type : 'button',
        'class' : 'DeleteDynamicExtraField'
    }).appendTo(div);
    input.click(function() {
        $(this).parent().remove();
    });
    var br = $('<br/>').appendTo(div);
    var textarea = $('<textarea/>', {
        name : 'DynamicExtraField[]',
        cols : '50',
        rows : '3'
    }).appendTo(div);
}
//Для удаления первого поля
$('.DeleteDynamicExtraField').click(function(event) {
                $(this).parent().remove();
                return false;
            });
</script>

</head>
<body>

	<table>
		<tr>
			<th>
				<form action="FrontController" method="get">
					<input type="hidden" name="command" value="changeLocal" />
					<input type="hidden" name="local" value="ru" /> 
					<input type="submit" value="${ru_button}" />
				</form>
			</th>
			<th>
				<form action="FrontController" method="get">
					<input type="hidden" name="command" value="changeLocal" />
					<input type="hidden" name="local" value="en" /> 
					<input type="submit" value="${en_button}" /><br />
				</form>
			</th>
	</table>
	
	<form action="FrontController" method="post">
		<input type="hidden" name="command" value="addBook"/>
	
		<b><c:out value="${author}" /></b>:<br/>
		<c:out value="${authorSurname}" />:<input type="text" name="surname" value=""/>
		<c:out value="${authorName}" />:<input type="text" name="name" value=""/>
		<br/>
	
		<b><c:out value="${title}" /></b>:<br/>
		<input type="text" name="title" value=""/><br/>
	
		<b><c:out value="${genre}" /></b>:<br/>
		<select name="genre" required>
			<option disabled><c:out value="${genreSelection}" /></option>
			<option value="fiction"><c:out value="${fiction}" /></option>
			<option value="technical"><c:out value="${technical}" /></option>
		</select><br/>
	
		<input type="submit" value="${addBookButton}">
	</form>
	
	<form action="" method="post" name="Form">
    	<div id="DynamicExtraFieldsContainer">
      		<div id="addDynamicField">
        		<input type="button" id="addDynamicExtraFieldButton" value="Добавить динамическое поле">
      		</div>
       		<div class="DynamicExtraField">
           		<br>
            	<label for="DynamicExtraField">Доп. поле </label> <input value="Удаление" type="button" class="DeleteDynamicExtraField">
            	<br>
            	<textarea name="DynamicExtraField[]" cols="50">test</textarea>
        	</div>
       	</div>
	</form>
	
	<form action="FrontController" method="post">
		<input type="hidden" name="command" value="goToAccount"/>
		<input type="submit" value="${goToAccount_button}">
	</form>
	
	<form action="FrontController" method="post">
		<input type="hidden" name="command" value="logOutCommand"/>
		<input type="submit" value="${logOutButton}">
	</form>


</body>
</html>