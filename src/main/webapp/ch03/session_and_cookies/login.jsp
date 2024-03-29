<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); //클라이언트로부터 전송되는 데이터 인코딩
		//파라미터 값 가져오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String loginChk = request.getParameter("loginChk");
		
		System.out.println("클라이언트로부터 전달받은 값: " + id + ", " + pw + ", " + "loginChk");
		
		//DB의 사용자 id, pw (가라로 강제 셋팅)
		String dbId = "user", dbPw = "1234";
		
		if(dbId.equals(id)) { //아이디가 같으면
			if(dbPw.equals(pw)) { //비밀번호가 같으면
				//로그인 성공 시 세션 생성(아이디, 비밀번호 저장)
				// - session 객체 사용
				// - session 저장 시, setAttribute 사용
				session.setAttribute("id", id); //아이디 저장
				session.setAttribute("pw", pw); //비밀번호 저장
				
				//사용자가 기억 체크 시 사용자의 아이디를 쿠키에 저장
				if(loginChk != null) { //아이디 기억 체크 시
					Cookie c = new Cookie("id", id); // (key, value) 사용 시, 보통 Map 사용
					c.setMaxAge(60 * 60); //쿠키를 얼마동안 저장할건지 (초단위 입력) - 60분
					c.setPath("/"); //쿠키를 사용할 경로를 지정
					response.addCookie(c); //사용자 pc에 저장하기 위해 response 객체에 담아서 응답
				} else { //아이디 기억을 체크하지 않을 시
					Cookie c = new Cookie("id", null);
					c.setMaxAge(60 * 60);
					c.setPath("/");
					response.addCookie(c);
				}
				
				%>
				<script>
					location.href = "main.jsp"; //로그인 성공 시 main.jsp로 이동
				</script>
				<%
			} else { //비밀번호가 같지 않을 때
				%>
				<script>
					alert("비밀번호가 올바르지 않습니다.");
					location.href = "index.jsp";
				</script>
				<%
			}
		}
	%>
</body>
</html>