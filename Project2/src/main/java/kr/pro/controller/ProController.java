package kr.pro.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;
import kr.pro.entity.Productimage;
import kr.pro.entity.product2;
import kr.pro.entity.Market;
import kr.pro.entity.Member;
import kr.pro.entity.Product;
import kr.pro.mapper.ProMapper;

@Controller
public class ProController {

	@Autowired
	private ProMapper proMapper;

	// 페이지 이동처리
	@GetMapping("/main.do")
	public String main() {
		return "Main";
	}

	@GetMapping("/join")
	public String join() {
		return "Join";
	}

	@GetMapping("/login")
	public String login() {
		return "Login";
	}

	@GetMapping("/updateMember")
	public String updateMember() {
		return "updateMember";
	}

	@GetMapping("/productinsert")
	public String productinsert() {
		return "productinsert";
	}

	@GetMapping("/product")
	public String product() {
		return "product";
	}

	@GetMapping("/myproduct")
	public String myproduct() {
		return "myproduct";
	}

	@GetMapping("/searchproduct")
	public String searchproduct() {
		return "searchproduct";
	}

	// 기능처리
	// 로그인
	@PostMapping("/login.do")
	public String login(Member mvo, HttpServletRequest request) {
		Member theVo = proMapper.userLogin(mvo);
		if (theVo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("mvo", theVo);
		}
		return "redirect:/main.do";
	}

	// 회원가입
	@RequestMapping("/join.do")
	public String join(Member vo) {
		proMapper.userJoin(vo);
		return "redirect:/main.do";
	}

	// 사업자회원업데이트
	@RequestMapping("/updateMember.do")
	public String updateMember(Member vo, HttpServletRequest request) {
		proMapper.updateMember(vo);
		if (vo != null) {
			HttpSession session = request.getSession();
			session.invalidate();
		}
		return "redirect:/main.do";
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/main.do";
	}

	// 비밀번호 확인
	@RequestMapping("/pwcheck.do")
	public String pwcheck(Member vo) {
		proMapper.pwcheck(vo);
		return "redirect:/updateMember";
	}

	// 물품등록 (상세정보)
	@RequestMapping("/product.do")
	public String product(Product vo, HttpServletRequest request, Product pvo) {

		proMapper.product(vo);
		HttpSession session = request.getSession();
		session.setAttribute("vo", vo);
		return "redirect:/productinsert";
	}

	@RequestMapping("/upload.do")
	public String uploadFile(MultipartFile[] upload, HttpServletRequest request, Productimage vo,
			Productimage Productimage, Product pvo) {

		Product vo2 = proMapper.productp_num(pvo);
		int p_num = vo2.getP_num();
		String u_num = vo2.getU_num();
		String saveDir = "C:\\Users\\SM014\\git\\BestBuy\\Project2\\src\\main\\webapp\\resources\\css\\image";
		File dir = new File(saveDir);

		if (!dir.exists())
			dir.mkdirs();

		for (MultipartFile f : upload) {
			if (!f.isEmpty()) {
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
				int rand = (int) (Math.random() * 1000);
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
				try {
					f.transferTo(new File(saveDir + "/" + reName));
				} catch (IllegalStateException | IOException e) {
				}
				
				Productimage.setU_num(u_num);
				Productimage.setP_num(p_num);
				Productimage.setI_raw(f.getOriginalFilename());
				Productimage.setI_path(saveDir);
				Productimage.setI_save(reName);

				proMapper.productimg(vo);
				HttpSession session = request.getSession();
				session.setAttribute("vo", vo);
			}

		}
		return "redirect:/myproduct.do";
	}

	@RequestMapping("/searchproduct.do")
	public String searchproduct(Model model, Product p_kind) {
		List<Product> slist = proMapper.searchproduct(p_kind);
		model.addAttribute("slist", slist);
		return "searchproduct";
	}

	@RequestMapping("/myproduct.do")
	public String myproduct(Model model) {
		List<product2> list = proMapper.myproduct();		
		model.addAttribute("mlist", Deduplication_List(list));

		return "myproduct";
	}
	
	@RequestMapping("/myproduct2.do/{p_num}")
	public String myproduct2(@PathVariable("p_num") int p_num, Model model) {
		List<product2> list = proMapper.myproduct2(p_num);
		System.out.println(list.get(0));
		model.addAttribute("list", list);
		return "myproduct2";
	}

	@RequestMapping("/myproductDelete.do/{p_num}")
	public String myproductDelete(@PathVariable("p_num") int p_num, Model model) {
		proMapper.myproductDelete(p_num);
		return "redirect:/myproduct.do";
	}

	@RequestMapping("/myproductUpdate.do/{p_num}")
	public String myproductUpdate(@PathVariable("p_num") int p_num, Model model) {
		return "redirect:/myproduct.do";
	}

	@RequestMapping("/Market")
	public String market(Model model) {
		List<product2> list = proMapper.market();
		model.addAttribute("market_list", Deduplication_List(list));
		return "market";
	}
	
	@RequestMapping("/market2.do/{p_num}")
	public String market2(@PathVariable("p_num") int p_num, Model model) {
		List<product2> list = proMapper.myproduct2(p_num);
		model.addAttribute("list", list);
		return "market2";
	}
	
	@RequestMapping("/ShoppingListinsert.do")
	public String ShoppingListinsert(HttpServletRequest request, Market vo) {
		proMapper.ShoppingListinsert(vo);
		HttpSession session = request.getSession();
		session.setAttribute("vo", vo);
		return "ShoppingList";
	}
	
	
	@RequestMapping("/ShoppingList")
	public String ShoppingList(Model model) {
		
		return "ShoppingList";
	}
	

	private List<product2> Deduplication_List(List<product2> _input_list)
	{
		List<product2> unique_list = new ArrayList<product2>();
		
		unique_list.add(_input_list.get(0));
		for (int i = 1; i < _input_list.size(); i++) {
			for (int j = 0; j < unique_list.size(); j++) {
				if (_input_list.get(i).getP_num() == unique_list.get(j).getP_num())
					break;
				if (j == unique_list.size() - 1)
					unique_list.add(_input_list.get(i));
			}
		}
		
		return unique_list;
	}
}