package kr.pro.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.pro.entity.Member;
import kr.pro.entity.Product;
import kr.pro.entity.Productimage;


@Mapper
public interface ProMapper {

	public Member userLogin(Member mvo);

	public void userJoin(Member vo);

	public void updateMember(Member vo);

	public void pwcheck(Member vo);

	public void product(Product vo);

	public void productimg(Productimage vo);

	public Product productp_num(Product pvo);
	
	public List<Product> myproduct();
	
	public List<Productimage> myproductimg();
}
