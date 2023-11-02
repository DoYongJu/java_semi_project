# JSP_Diet_HomePage(java_semi_project)
:page_with_curl: JSP로 건강관리 웹페이지 만들기</br>
## JSP (Java Server Pages)이란?

- server programming 언어. Java를 이용한 서버 사이드 템플릿 엔진.</br>
- 서버 사이드 템플릿 엔진이란? 서버에서 DB 혹은 API에서 가져온 데이터를 미리 정의된 Templete에 넣어 Html을 그려서 클라이언트에 전달해주는 역할. ex)JSP, Thymeleaf, Velocity, Freemarker 

### 0.다운로드 및 개발환경
- [JDK Download](https://www.oracle.com/java/technologies/downloads/#java8, "JDK link")
- [Apache Tomcat Download](https://tomcat.apache.org/download-80.cgi, "Apache Tomcat link")
- [Eclipse Download](https://www.eclipse.org/downloads/, "Eclipse link")
- [H2 Download](https://www.h2database.com/html/download.html, "H2 link")
- [H2 Visualizer Download](https://www.dbvis.com/, "H2 Visualizer link")

### 1.프로젝트 생성 및 서버 연결
- Eclipse IDE => Create a Dynamic Web project
  - Project Name: Diet
  - Target runtime에서 New Runtime 클릭 후 Apache Tomcat 9.0.78v 선택 후 Next
  - Tomcat Installation directory에 설치한 apache-tomcat-8.5.14 경로 입력
    
### 2.웹페이지 파일 만들기 & 부트스트랩
- Jsp파일위치: WebApp (WEB-INF에 종종 들어가는 경우 발생. 추후에는 따로 폴더를 만들어서 관리하는게 좋을꺼 같음.)
- [BootStrap Download](https://getbootstrap.com/docs/4.4/getting-started/download/, "BootStrap link")

### 3. 데이터베이스 구축
<img width="50%" src="https://github.com/DoYongJu/java_semi_project/assets/43160573/c6d56174-95f1-48dc-a8d8-8cea93df7c35"/>
</br>

### 4. JAVA Beans 만들기
- Java beans: 데이터베이스에서 가져온 데이터들을 담는 class객체
- beans.java에 데이터 베이스 테이블의 정보와 동일한 이름과 형을 반영하여 변수로 입력
- [Java Beans 폴더](https://github.com/DoYongJu/java_semi_project/tree/master/Diet/src/main/java/bean, "JavaBeans link")

### 5.DAO(데이터 베이스 접근 객체)만들기
- Connection/PreparedStatement/open/close관련 파트
- db와 연결하고 query를 날려 원하는 데이터의 내용과 구조를 결정하는 페이지
- [DAO files](https://github.com/DoYongJu/java_semi_project/tree/master/Diet/src/main/java/servlet, "daofiles link")

### 6.Service(Controller와 DAO 사이에서 비지니스 로직을 핸들링)만들기 
- Service: controller에서 넘어온 입력값과 DAO의 매서드의 return값이 만나는 공간
   - input값과 dao의 리턴값으로 조건문과 반복문을 사용하여 비지니스 로직을 구현
- 원하는 dao를 상단에 변수로 선언. 보통 Service와 DAO는 1:1로 매칭
- [Service files](https://github.com/DoYongJu/java_semi_project/tree/master/Diet/src/main/java/servlet, "Servicefiles link")
  (필자는 JSP프로젝트가 처음이라 Servlet 폴더안에 DAO, Servlet, Controller를 다 넣었지만 보다보니 정리의 필요성을 느낌. 폴더를 잘 만들자!)
### 7.Controller 만들기
- view에서 다른 화면에 접근할때 Form action 값을 보고 어떤 데이터를 담은 화면으로 연결해줄지 정해주는 방향지시등 같은 Servlet.
- Service는 dao를 핸들링 하였다면 Controller는 Service를 핸들링하기 때문에 상단에 service선언 입력 필요.
- Controller도 servlet이기 때문에 init():서블릿 초기화, Service(),doGet(),doPost():요청과 응답, destory():서블릿 종료로 작동하기  때문에 필자는 Service()에 action 값에 따라 필요에 따라 view를 바로 연결해주기도 하고 데이터가 필요한 경우 다른 매서드를 호출하고 그 매서드의 return으로 view를 연결 해주기도 하였음. 
- [Controller](https://github.com/DoYongJu/java_semi_project/blob/master/Diet/src/main/java/servlet/Controller.java, "daofiles link")
- 필자가 생각했을때 이 프로젝트의 indentity는 스케쥴링, 식단/유형검사이라고 여겼으며 이 기능들은 등록된 유저만이 접근을 하도록 기획함. 그래서 Controller에서 publicPaths ArrayList를 선언하고 비회원일 경우 접근할 수 있는 action값을 등록하였음. 비회원이 그 외의 기능을 사용하려 접근 한다면 로그인으로 유도하는 goToLoginPath ArrayList를 만들어서 관리함.
   - ```java
     if (!isPassed(request)) { // 로그인을 하지않는 상황
			if (goToLoginPaths.contains(request.getParameter("action"))) {
				response.sendRedirect("?action=login");
			} else {
				response.sendRedirect("?action=index");
			}
			return;
		}
## 프로젝트 기능 
