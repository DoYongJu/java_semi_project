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

<img width="80%" src="https://github.com/DoYongJu/java_semi_project/assets/43160573/c6d56174-95f1-48dc-a8d8-8cea93df7c35"/>
### 4. JAVA Beans 만들기
- Java beans: 데이터베이스에서 가져온 데이터들을 담는 class객체
- beans.java에 데이터 베이스 테이블의 정보와 동일한 이름과 형을 반영하여 변수로 입력
- [Java Beans 폴더](https://github.com/DoYongJu/java_semi_project/tree/master/Diet/src/main/java/bean, "JavaBeans link")
### 5.DAO(데이터 베이스 접근 객체)만들기
- Connection/PreparedStatement/open/close관련 파트
- db와 연결하고 query를 날려 원하는 데이터의 내용과 구조를 결정하는 페이지
- [DAO files](https://github.com/DoYongJu/java_semi_project/tree/master/Diet/src/main/java/servlet, "daofiles link") 
