package kr.pro.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;
import kr.pro.entity.Productimage;
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
		System.out.println(vo.getU_num());
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
					e.printStackTrace();
				}

				Productimage.setU_num(u_num);
				Productimage.setP_num(p_num);
				Productimage.setI_raw(f.getOriginalFilename());
				Productimage.setI_path(saveDir);
				Productimage.setI_save(reName);

				proMapper.productimg(vo);
				HttpSession session = request.getSession();
				session.setAttribute("vo", vo);
				System.out.println(vo.getU_num());
			}

		}
		return "redirect:/myproduct.do";

	}	
	
	@RequestMapping("/myproduct.do")
	public String boardList(Model model) {
		List<Product> list = proMapper.myproduct();
		model.addAttribute("mlist", list);
		return "myproduct";
	}
}