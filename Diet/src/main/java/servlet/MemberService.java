package servlet;

import bean.Member;


public class MemberService {
	MemberDAO memberdao;

	public MemberService() {
		memberdao = new MemberDAO();
	}

	// 회원가입 판단 메서드
	public void addOrRefuse(Member member) throws MemberException {
		boolean result = memberdao.check(member.getUserName());
		if(result == false) { //닉네임 중복없음, 회원가입가능
			System.out.println("안됨");
			throw new MemberException();
		}
		memberdao.addMember(member);
		
	}
	public void resignAccount(long userId) { //계정삭제 함수
		memberdao.deleteAccountById(userId);
	}

	// 로그인 판단 메서드
	public Member loginCheck(String username, String password) throws NotUserException {
		Member m = memberdao.selectByUsername(username);
		if (m.getUserName() == null) {
			// 아이디가 존재하지 않을 경우 ==> 예외 발생
			throw new NotUserException(username + " (이)란 아이디는 존재하지 않아요");
		}

		// 비밀번호 체크
		String dbPwd = m.getPassword();
		if (!password.equals(dbPwd)) {

			// 비밀번호가 불일치라면
			throw new NotUserException("비밀번호가 일치하지 않아요");
		}

		// 회원이 맞다면
		return m;// 해당 회원 반환
	}
	
	//비밀번호 수정 메서드
	public void editPassword(Member member) {
		memberdao.updatePwdByUserName(member);
	}
	
	//비밀번호 찾기 메서드
	public String findPwd(String userName) {
		Member m = memberdao.selectByUsername(userName);
		return m.getPassword();
	}
	
	//아이디 찾기 메서드
	public String findId(String email) {
		Member m =memberdao.selectByEmail(email);
		return m.getUserName();
	}
	
	public void setSportType(Member m) {		
		memberdao.updateSportType(m);
	}
	
	public void setMenuType(Member m) {		
		memberdao.updateMenuType(m);
	}


}
