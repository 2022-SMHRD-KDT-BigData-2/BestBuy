package kr.pro.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import kr.pro.entity.Market;
import kr.pro.entity.Member;
import kr.pro.entity.Product;
import kr.pro.entity.Productimage;
import kr.pro.entity.product2;


@Mapper
public interface ProMapper {

	public Member userLogin(Member mvo);

	public void userJoin(Member vo);

	public void updateMember(Member vo);

	public void pwcheck(Member vo);

	public void product(Product vo);

	public void productimg(Productimage vo);

	public Product productp_num(Product pvo);
	
	public List<product2> myproduct();
	
	public List<Productimage> myproductimg();
	
	public List<Product>searchproduct(Product p_kind);
	
	public List<product2>myproduct2(int p_num);
	
	@Delete("delete from p_info where p_num=#{p_num}")
	public void myproductDelete(int p_num);
	
	public List<product2> market();
	
	public void ShoppingListinsert(Market vo);
}
