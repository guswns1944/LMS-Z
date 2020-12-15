<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionOne</title>
</head>
<body>
	<h1>질문 상세보기</h1>
		<table border="1">
			<tr>
				<th>question_no</th>
				<td>${question.questionNo}</td>
			</tr>
			<tr>
				<th>question_writer</th>
				<td>${question.questionWriter}</td>
			</tr>
			<tr>
				<th>question_title</th>
				<td>${question.questionTitle}</td>
			</tr>
			<tr>
				<th>question_content</th>
				<td>${question.questionContent}</td>
			</tr>
		</table>
		
		<h3>질문댓글게시판</h3>
		<table border="1">
			<thead>
				<tr>
					<th>question_comment_no</th>
					<th>question_comment_writer</th>
					<th>question_comment_content</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="qc" items="${question.questionCommentList}">
					<tr>
						<td>${qc.questionCommentNo}</td>
						<td>${qc.questionCommentWriter}</td>
						<td>${qc.questionCommentContent}</td>
						<td><a href="${path}/teacher/removeQuestionComment/${qc.accountId}/${qc.questionNo}/${qc.questionCommentNo}">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form method="post" action="${path}/teacher/addQuestionComment">
			<input type="hidden" name="questionNo" value="${question.questionNo}">
			<input type="hidden" name="accountId" value="123123">
			<textarea name="questionCommentWriter" rows="3" cols="50"></textarea>
			<textarea name="questionCommentContent" rows="3" cols="50"></textarea>
			<button type="submit">댓글입력</button>
		</form>
</body>
</html>