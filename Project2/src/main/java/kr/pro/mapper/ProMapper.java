package kr.pro.mapper;

import org.apache.ibatis.annotations.Mapper;
import kr.pro.entity.Member;

@Mapper
public interface ProMapper {
	// 로그인
	public Member userLogin(Member mvo);

	// 회원가입
	public void userJoin(Member vo);
	
	// 사업자번호 업데이트
	public void updateMember(Member vo);
}
