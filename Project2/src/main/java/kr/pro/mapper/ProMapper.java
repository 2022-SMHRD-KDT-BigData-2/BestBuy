package kr.pro.mapper;

import org.apache.ibatis.annotations.Mapper;
import kr.pro.entity.Member;
import kr.pro.entity.Product;
import kr.pro.entity.Productimage;

@Mapper
public interface ProMapper {
	// 로그인
	public Member userLogin(Member mvo);

	// 회원가입
	public void userJoin(Member vo);
	
	// 사업자번호 업데이트
	public void updateMember(Member vo);
	
	// 비밀번호 확인
	public void pwcheck(Member vo);
	
	// 물품등록
	public void product(Product vo);

	public void productimg(Productimage vo);
}
