package servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;

import bean.Calory;
import bean.Community;
import bean.Goal;
import bean.GoalCount;
import bean.Member;
import bean.Menu;
import bean.Schedule;
import bean.Sport;
import bean.WiseSaying;

@WebServlet("")
@MultipartConfig(maxFileSize=1024*1024*2, location="C:/java/workspace/Diet/src/main/webapp/images")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService;
	private SportService sportService;
	private MenuService menuService;
	private ScheduleService scheduleService;
	private WiseSayingService wisesayingService;
	private GoalService goalService;
	private CommunityService communityService;
	private CaloryService caloryService;
	private CommentService commentService;

	final private int REDIRECT_LENGTH = 9;
	final private List<String> publicPaths;
	final private List<String> goToLoginPaths;

	public Controller() {
		super();
		memberService = new MemberService();
		sportService = new SportService();
		menuService = new MenuService();
		scheduleService = new ScheduleService();
		wisesayingService = new WiseSayingService();
		goalService = new GoalService();
		communityService = new CommunityService();
		caloryService = new CaloryService();
		commentService = new CommentService();

		DateConverter dc = new DateConverter();
		dc.setPattern("yyyy-MM-dd");
		ConvertUtils.register(dc, Date.class);

		publicPaths = new ArrayList<>();
		publicPaths.add("signUp"); // 비회원도 접근가능한 페이지, i
		publicPaths.add("login");
		publicPaths.add("doLogin");
		publicPaths.add("doLogout");
		publicPaths.add("bmi");
		publicPaths.add("dictionary");
		publicPaths.add("searchDictionary");
		publicPaths.add("index");
		publicPaths.add("findID");
		publicPaths.add("findPWD");
		publicPaths.add("doFindPWD");
		publicPaths.add("newMember");
		publicPaths.add("doFindID"); 
		publicPaths.add("doSignUp");


		goToLoginPaths = new ArrayList<>();
		goToLoginPaths.add("community"); // 비회원은 로그인 페이지로 보내짐, 로그인으로 유도하는 액션
		goToLoginPaths.add("menuTest");
		goToLoginPaths.add("sportTest");
		goToLoginPaths.add("scheduler");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		if (!isPassed(request)) { // 로그인을 하지않는 상황
			if (goToLoginPaths.contains(request.getParameter("action"))) {
				response.sendRedirect("?action=login");
			} else {
				response.sendRedirect("?action=index");
			}
			return;
		}

		String action = StringUtils.defaultIfEmpty(request.getParameter("action"), "index");
		String view = "";

		switch (action) {
		case "index":
			view = index(request, response);
			break;
		case "login":
			view = login(request, response);
			break;
		case "signUp":
			view = signUp(request, response);
			break;
		case "myPage":
			view = myPage(request, response);
			break;
		case "menuTest":
			view = menuTest(request, response);
			break;
		case "sportTest":
			view = sportTest(request, response);
			break;
		case "scheduler":
			view = scheduler(request, response);
			break;
		case "dictionary":
			view = dictionary(request, response);
			break;
		case "community":
			view = community(request, response);
			break;
		case "communityInfo":
			view = communityInfo(request, response);
			break;
		case "bmi":
			view = bmi(request, response);
			break;
		case "home":
			view = home(request, response);
			break;
		case "SportTestResult":
			view = SportTestResult(request, response);
			break;
		case "MenuTestResult":
			view = MenuTestResult(request, response);
			break;
		case "report":
			view = report(request, response);
			break;
		case "post":
			view = post(request, response);
			break;
		case "editPWD":
			view = editPWD(request, response);
			break;
		case "findID":
			view = findId(request, response);
			break;
		case "findPWD":
			view = findPwd(request, response);
			break;
		case "doLogin":
			doLogin(request, response);
			break;
		case "doSignUp":
			doSignUp(request, response);
			break;
		case "doLogout":
			doLogout(request, response);
			break;
		case "doSportTest":
			doSportTest(request, response);
			break;
		case "doMenuTest":
			doMenuTest(request, response);
			break;
		case "doEdit":
			doEdit(request, response);
			break;
		case "doFindPWD":
			doFindPWD(request, response);
			break;
		case "doFindID":
			doFindID(request, response);
			break;
		case "addSchedule":
			addSchedule(request, response);
			break;
		case "sendDate":
			sendDate(request, response);
			break;
		case "doGoal":
			doGoal(request, response);
			break;
		case "addPost":
			addPost(request, response);
			break;
		case "deletePost":
			deletePost(request, response);
			break;
		case "updatePost":
			updatePost(request, response);
			break;
		case "searchDictionary":
			searchDictionary(request, response);
			break;
		case "comment":
			comment(request, response);
			break;
		case "goalDelete":
			goalDelete(request, response);
			break;
		case "resign":
			resign(request, response);
			break;
		case "deleteComment":
			deleteComment(request, response);
			break;									
		}
		if (StringUtils.isNotBlank(view)) {
			getServletContext().getRequestDispatcher(view).forward(request, response);
		}
	}

	boolean isPassed(HttpServletRequest request) {// 로그인 필요 유무판정
		boolean rtn = true;
		if (!publicPaths.contains(request.getParameter("action"))
				&& request.getSession().getAttribute("user") == null) {
			rtn = false;
		}
		return rtn;
	}
	private void resign(HttpServletRequest request, HttpServletResponse response) { //회원탈퇴
		try{
			Member m = (Member) request.getSession().getAttribute("user");
			long userId= m.getId();
			memberService.resignAccount(userId);
			request.getRequestDispatcher("?action=index").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private String index(HttpServletRequest request, HttpServletResponse response) {
		List<WiseSaying> wiseSayingList = new ArrayList<>();
		wiseSayingList = wisesayingService.randomWiseSaying();
		request.setAttribute("wiseSayingList", wiseSayingList);
		return "/index.jsp";
	}

	private String login(HttpServletRequest request, HttpServletResponse response) {
		return "/login.jsp";
	}

	private String signUp(HttpServletRequest request, HttpServletResponse response) {
		return "/signUp.jsp";
	}

	private String myPage(HttpServletRequest request, HttpServletResponse response) {
		try{
		
		Member m = (Member) request.getSession().getAttribute("user");
		request.getSession().setAttribute("user", m);
		
		request.getSession().setAttribute("menuNickname", menuService.find(m.getMenuType()).getNickname());
		request.getSession().setAttribute("sportNickname", sportService.find(m.getSportType()).getNickname());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/myPage.jsp";
	}

	private String menuTest(HttpServletRequest request, HttpServletResponse response) {
		return "/menuTest.jsp";
	}

	private String sportTest(HttpServletRequest request, HttpServletResponse response) {
		return "/sportTest.jsp";
	}

	private String scheduler(HttpServletRequest request, HttpServletResponse response) {
		try {
			Date nowDate = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String strNowDate = simpleDateFormat.format(nowDate);

			Member m = (Member) request.getSession().getAttribute("user");
			request.getSession().setAttribute("user", m);
			
			//월간스케쥴 부분
			request.getSession().setAttribute("myScheduleList", scheduleService.findByUser(m.getId()));
			request.getSession().setAttribute("type", StringUtils.defaultIfEmpty(request.getParameter("type"), "주간스케쥴"));
			request.setAttribute("date", StringUtils.defaultIfEmpty(request.getParameter("date"), strNowDate));			
			Date date = simpleDateFormat.parse(StringUtils.defaultIfEmpty(request.getParameter("date"), strNowDate));
			request.setAttribute("myGoalList", goalService.findByUserAndDate(m.getId(), date));
			List<Goal> list = goalService.findByUserAndDate(m.getId(), date); 
			request.setAttribute("count", list.size());
			
			
			List<Goal> totalList = goalService.find(m.getId());				
			request.setAttribute("totalCount", totalList.size());			
	
			request.getSession().setAttribute("scheduleCount", scheduleService.sumOfSchedule(m.getId()));			
			double MonthProbability = ((double)totalList.size() / (double)scheduleService.sumOfSchedule(m.getId()));
			MonthProbability = Math.round(MonthProbability * 100) / 100.0;
			request.getSession().setAttribute("MonthProbability", MonthProbability);
			
			
			List<String> jsonGoalList = new ArrayList<>();
			for (GoalCount goalCount : goalService.findCountByAchieveDate(m.getId())) {
				jsonGoalList.add(goalCount.toJsonString());
			}
			String jsonArrayGoalList = StringUtils.join(jsonGoalList);
			request.setAttribute("goalCountList", jsonArrayGoalList);
			
			
			
			//주간스케쥴 부분
			String dateForWeek =  StringUtils.defaultIfEmpty(request.getParameter("dateForWeek"), strNowDate); 
			Date today = DateUtils.truncate(simpleDateFormat.parse(dateForWeek), Calendar.DATE);
			List<Schedule> todoListByMenu = scheduleService.findTodoListByMenu(m.getId(), dateForWeek);
			List<Schedule> todoListBySport = scheduleService.findTodoListBySport(m.getId(), dateForWeek);
			List<Integer>counts=scheduleService.achievePercent(m.getId(),dateForWeek); //rtn[int,int]반환됨
			String weekOfYear = scheduleService.findOneWeek(dateForWeek);
			String monthOfYear = "";
			
			String D[] = dateForWeek.split("-"); 
			for(int i=0 ; i<D.length ; i++) { monthOfYear=D[1]; }
			
			int num = date.compareTo(today); //today가 date날보다 이전이면 음수값리턴, 이후면 양수, 같으면 0
	
			request.setAttribute("todoListByMenu", todoListByMenu);
			request.setAttribute("todoListBySport", todoListBySport);
			request.setAttribute("clickedDate", dateForWeek);
			request.setAttribute("monthOfYear", monthOfYear);
			request.setAttribute("weekOfYear", weekOfYear);
			request.setAttribute("counts", counts);
			request.setAttribute("today", today);
			request.setAttribute("num", num);
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/scheduler.jsp";
	}
	
	void goalDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
		System.out.println(request.getParameter("deleteId"));
		long deleteGoalId =  Long.parseLong(request.getParameter("deleteId"));
		goalService.removeGoal(deleteGoalId);
		response.sendRedirect("?action=scheduler");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	private String dictionary(HttpServletRequest request, HttpServletResponse response) {

		List<Calory> allList = new ArrayList<>();
		allList = caloryService.findByType(StringUtils.defaultIfEmpty(request.getParameter("type"), "음식"));
		request.setAttribute("allList", allList);
		
		return "/dictionary.jsp";
	}

	private String community(HttpServletRequest request, HttpServletResponse response) {
		try {
		Member m = (Member) request.getSession().getAttribute("user");
		String type = StringUtils.defaultIfEmpty(request.getParameter("type"), null);
		String testString = null;
		
		if(StringUtils.equals(type, testString) == true) { //타입이 없는 경우, 초기화면
			request.setAttribute("lists", communityService.getAll(
					StringUtils.defaultIfEmpty(request.getParameter("searchType"), null), StringUtils.defaultIfEmpty(request.getParameter("searchContent"), null)));				
		}else{
			request.setAttribute("lists", communityService.getPostByType(type));
		}
			
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/community.jsp";
	}

	
	
	private String communityInfo(HttpServletRequest request, HttpServletResponse response) {		
		Member m = (Member) request.getSession().getAttribute("user");
		long listId = Long.parseLong(request.getParameter("listId"));
		
		
		request.setAttribute("post", communityService.getPost(listId));
		request.setAttribute("user", m);
		request.setAttribute("comments", commentService.getComment(listId));
		
		return "/communityInfo.jsp";
	}

	private void comment(HttpServletRequest request, HttpServletResponse response) { //댓글달기
		long listId = 0;
		try{
			Member m = (Member) request.getSession().getAttribute("user");
			String context = request.getParameter("commentText");
			listId = Long.parseLong(request.getParameter("listId"));
			long memberId = m.getId();
			commentService.addComment(listId, memberId, context);
			response.sendRedirect("?action=communityInfo&listId="+listId);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	private String bmi(HttpServletRequest request, HttpServletResponse response) {
		return "/bmi.jsp";
	}

	private String home(HttpServletRequest request, HttpServletResponse response) {
		List<WiseSaying> wiseSayingList = new ArrayList<>();
		wiseSayingList = wisesayingService.randomWiseSaying();
		request.setAttribute("wiseSayingList", wiseSayingList);
		
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strNowDate = simpleDateFormat.format(nowDate);

		Member m = (Member) request.getSession().getAttribute("user");
		request.getSession().setAttribute("user", m);
		
		String dateForWeek =  StringUtils.defaultIfEmpty(request.getParameter("dateForWeek"), strNowDate); 
		List<Integer>counts=scheduleService.achievePercent(m.getId(),dateForWeek); //rtn[int,int]반환됨
		request.setAttribute("counts", counts);
		
		
		return "/home.jsp";
	}

	private String MenuTestResult(HttpServletRequest request, HttpServletResponse response) {
		Member m = (Member) request.getSession().getAttribute("user");
		memberService.setMenuType(m);
		Menu menu = menuService.find(m.getMenuType());
		request.getSession().setAttribute("menu", menu);
		
		return "/menuTestResult.jsp";
	}

	private String SportTestResult(HttpServletRequest request, HttpServletResponse response) {
		Member m = (Member) request.getSession().getAttribute("user");
		memberService.setSportType(m);
		Sport s = sportService.find(m.getSportType());
		request.getSession().setAttribute("sport", s);
		
		return "/sportTestResult.jsp";
	}
	
	private String report(HttpServletRequest request, HttpServletResponse response) {
		Member m = (Member) request.getSession().getAttribute("user");
		request.getSession().setAttribute("user", m);
		long memberId= m.getId();
		List<Schedule> countList = new ArrayList<>();
		List<Schedule> reportList = goalService.findReportList(memberId);
		
		for(Schedule s : reportList) {
			long scheduleId = s.getId();			
			List<Schedule> ssList = goalService.findCountList(scheduleId);
			for(Schedule ss : ssList) {
				//s.setCount(ss.getCount());
				
				if(s.getPeriod()==1) {
					double temp = ss.getCount();
					double percent=Math.round((temp/4)*30);
					s.setPercent(percent);
					
				}
				if(s.getPeriod()==7) {
					double temp = ss.getCount();
					double percent = Math.round((temp/4)*100);
					
					s.setPercent(percent);
					
				}
				if(s.getPeriod()==30) {
					double temp = ss.getCount();
					double percent=Math.round((temp/1)*100) ;
					s.setPercent(percent);
					
				}
				countList.add(s);
			}
			
		}
		
		List<Goal> totalList = goalService.find(m.getId());
		request.setAttribute("totalCount", totalList.size());			
		request.getSession().setAttribute("scheduleCount", scheduleService.sumOfSchedule(m.getId()));			
		double MonthProbability = ((double)totalList.size() / (double)scheduleService.sumOfSchedule(m.getId()));
		MonthProbability = Math.round(MonthProbability * 100) / 100.0;
		request.getSession().setAttribute("MonthProbability", MonthProbability);
		
		List<String> jsonGoalList = new ArrayList<>();
		for (GoalCount goalCount : goalService.findCountByAchieveDate(m.getId())) {
			jsonGoalList.add(goalCount.toJsonString());
		}
		String jsonArrayGoalList = StringUtils.join(jsonGoalList);
		request.setAttribute("goalCountList", jsonArrayGoalList);
		request.setAttribute("countList", countList);
		return "/report.jsp";
	}
	
	private String post(HttpServletRequest request, HttpServletResponse response) {
		Member m = (Member) request.getSession().getAttribute("user");
		request.getSession().setAttribute("user", m);
		
		return "/post.jsp";
	}

	private String editPWD(HttpServletRequest request, HttpServletResponse response) {
		return "/editPwd.jsp";
	}

	private String findId(HttpServletRequest request, HttpServletResponse response) {
		return "/findId.jsp";
	}

	private String findPwd(HttpServletRequest request, HttpServletResponse response) {
		return "/findPwd.jsp";
	}

	private void doLogin(HttpServletRequest request, HttpServletResponse response) {
		try {
			// if문 돌아서 로그인 여부 판단 메서드 실행. 성공하면 home페이지로, 실패하면 index페이지로.
			try {
				Member m = memberService.loginCheck(request.getParameter("username"), request.getParameter("password"));
				request.getSession().setAttribute("user", m);
				response.sendRedirect("/Diet?action=home");
				System.out.println("");

			} catch (NotUserException nue) {
				request.getSession().setAttribute("msg", nue.getMessage());
				response.sendRedirect("/Diet?action=login");
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
	

	private void doLogout(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getSession().invalidate();
			response.sendRedirect("/Diet?action=index");

		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}

	private void doSignUp(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Member member = new Member();
		try {
			BeanUtils.populate(member, request.getParameterMap());
			memberService.addOrRefuse(member);			
			member.setMenuType(null);
			member.setSportType(null);
			request.getSession().setAttribute("user", member);
			response.sendRedirect("/Diet?action=home");
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
			response.sendRedirect("/Diet?action=signUp");
		} catch (MemberException e) {
			response.sendRedirect("/Diet?action=signUp");
			e.printStackTrace();
		}
	}

	private void doSportTest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Member m = (Member) request.getSession().getAttribute("user");
		m.setSportType(request.getParameter("sportType"));
		memberService.setSportType(m);
		Sport s = sportService.find(request.getParameter("sportType"));
		request.getSession().setAttribute("sport", s);

		request.getRequestDispatcher("?action=SportTestResult").forward(request, response);
	}

	private void doMenuTest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Member m = (Member) request.getSession().getAttribute("user");
		m.setMenuType(request.getParameter("menuType"));
		memberService.setMenuType(m);
		Menu menu = menuService.find(request.getParameter("menuType"));
		request.getSession().setAttribute("menu", menu);

		request.getRequestDispatcher("?action=MenuTestResult").forward(request, response);
	}

	void doEdit(HttpServletRequest request, HttpServletResponse response) {
		try {
			Member m = (Member) request.getSession().getAttribute("user");
			String password = request.getParameter("password");
			m.setPassword(password);
			memberService.editPassword(m);
			request.getRequestDispatcher("?action=myPage").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void doFindID(HttpServletRequest request, HttpServletResponse response) {
		try {
			String email = request.getParameter("email");
			String userName = memberService.findId(email);
			
			request.setAttribute("userName", userName);
			request.getRequestDispatcher("?action=findID").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void doFindPWD(HttpServletRequest request, HttpServletResponse response) {
		try {
			String userName = request.getParameter("username");
			String passWord = memberService.findPwd(userName);
			request.setAttribute("passWord", passWord);
			request.getRequestDispatcher("?action=findPWD").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void addSchedule(HttpServletRequest request, HttpServletResponse response) {
		Schedule schedule = new Schedule();
		Member m = (Member) request.getSession().getAttribute("user");

		try {
			schedule.setMemberId(m.getId());
			schedule.setType(request.getParameter("type"));
			schedule.setGoal(request.getParameter("goal"));
			schedule.setPeriod(Long.parseLong(request.getParameter("period")));
			schedule.setDueDate(java.sql.Date.valueOf(request.getParameter("dueDate")));

			System.out.println(request.getParameter("type"));

			scheduleService.addSchedule(schedule);
			response.sendRedirect("?action=scheduler");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("등록 에러");
			request.setAttribute("error", "스케쥴이 정상적으로 등록되지 않았습니다.");
		}

	}
	
	void sendDate(HttpServletRequest request, HttpServletResponse response) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

			Member m = (Member) request.getSession().getAttribute("user");
			request.getSession().setAttribute("user", m);

			Date date = simpleDateFormat.parse(request.getParameter("date"));
			request.setAttribute("myGoalList", goalService.findByUserAndDate(m.getId(), date));
			
			request.setAttribute("type", StringUtils.defaultIfEmpty(request.getParameter("type"), "월간스케쥴"));
			request.getRequestDispatcher("?action=scheduler").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void doGoal(HttpServletRequest request, HttpServletResponse response) {
		try {
			Member m = (Member) request.getSession().getAttribute("user");
			long mid = Long.parseLong(request.getParameter("id"));
			goalService.addGoal(mid, m.getId());
			response.sendRedirect("?action=scheduler");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void addPost(HttpServletRequest request, HttpServletResponse response) {
		
		Member m = (Member) request.getSession().getAttribute("user");
		request.getSession().setAttribute("user", m);
		
		String update = StringUtils.defaultIfEmpty(request.getParameter("update"), null);
		System.out.println(update);
		
		try {
			
			if(update == null) {
				Community community = new Community();
				Part part = request.getPart("file");
				String fileName = getFileName(part);
				BeanUtils.populate(community, request.getParameterMap());
				
				if(fileName == null) {
					community.setImage(null);
					
				}else if(fileName != null && !fileName.isEmpty()) {
					part.write(fileName);
					community.setImage("images/" + fileName);
				}
				Date nowDate = new Date();
				Date today = DateUtils.truncate(nowDate, Calendar.DATE);

				community.setDate(today);
				community.setMemberId(m.getId());
				communityService.addPost(community);			
				
				
			}else if(update != null) {
				Community community = new Community();
				community.setId(Long.parseLong(update));
				Part part = request.getPart("file");
				String fileName = getFileName(part);
				BeanUtils.populate(community, request.getParameterMap());
				
				if(fileName == null) {
					community.setImage(request.getParameter("image"));
					
				}else if(fileName != null && !fileName.isEmpty()) {
					part.write(fileName);
					community.setImage("images/" + fileName);
				}
				Date nowDate = new Date();
				Date today = DateUtils.truncate(nowDate, Calendar.DATE);

				community.setDate(today);
				community.setMemberId(m.getId());
				communityService.setPost(community);							
			}			
			response.sendRedirect("?action=community");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private String getFileName(Part part) {
		String fileName = null;
		String header = part.getHeader("content-disposition");
		System.out.println("Header => " + header);
		
		int start = header.indexOf("filename=");
		fileName = header.substring(start+10, header.length()-1);
		System.out.println("파일명: " + fileName);
		return fileName;
	}
	
	void deletePost(HttpServletRequest request, HttpServletResponse response) {
		Member m = (Member) request.getSession().getAttribute("user");
		request.getSession().setAttribute("user", m);
		
		try {
			long listId = Long.parseLong(request.getParameter("listId"));
			communityService.deletePost(listId);
			
			response.sendRedirect("?action=community");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void updatePost(HttpServletRequest request, HttpServletResponse response) {
		Member m = (Member) request.getSession().getAttribute("user");
		request.getSession().setAttribute("user", m);
		
		try {
			Community c = communityService.getByCommunityId(Long.parseLong(request.getParameter("listId")));
			request.setAttribute("c", c);
			
			request.getRequestDispatcher("?action=post").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void searchDictionary(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			List<Calory> searchList = new ArrayList<>();
			searchList = caloryService.findByTitle(request.getParameter("searchContent"));
			request.setAttribute("searchList", searchList);
			request.setAttribute("search", request.getParameter("search"));
			
			request.getRequestDispatcher("?action=dictionary").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	void searchCommunity(HttpServletRequest request, HttpServletResponse response) {
		try{
		Member m = (Member) request.getSession().getAttribute("user");
		
		String searchType = request.getParameter("searchType");
		String searchContent = request.getParameter("searchContent");
		
		request.getSession().setAttribute("user", m);
		request.getRequestDispatcher("?action=community").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void deleteComment(HttpServletRequest request, HttpServletResponse response) {
		Member m = (Member) request.getSession().getAttribute("user");
		request.getSession().setAttribute("user", m);
		
		try {
			long listId = Long.parseLong(request.getParameter("listId"));
			long commentId = Long.parseLong(request.getParameter("commentId"));
			commentService.deleteComment(commentId);
			
			response.sendRedirect("?action=communityInfo&listId="+listId);

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
