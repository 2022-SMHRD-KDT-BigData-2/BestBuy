package kr.pro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.pro.entity.Member;
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
   
   @GetMapping("/UserMain.do")
   public String UserMain() {
	   return "UserMain";
   }
   
   @GetMapping("/updateMember")
   public String updateMember() {
	   return "updateMember";
   }
   
   @GetMapping("/OwnerMain.do")
   public String OwnerMain() {
	   return "OwnerMain";
   }
   
   @GetMapping("/Myproduct")
   public String Myproduct() {
	   return "Myproduct";
   }
   // 기능처리
   //로그인
   @PostMapping("/login.do")
   public String login(Member mvo, HttpServletRequest request) {
      Member theVo = proMapper.userLogin(mvo);
      if(theVo!=null) {
         HttpSession session = request.getSession();
         session.setAttribute("mvo", theVo);
      }
      if(theVo.getU_num() == null) {
    	  return "redirect:UserMain.do";
      }else
    	  return "redirect:OwnerMain.do";
   }
   
   //회원가입
   @RequestMapping("/join.do")
   public String join(Member vo) {
	 proMapper.userJoin(vo);
	 return "redirect:/main.do";
   }
   
   //사업자회원업데이트
   @RequestMapping("/updateMember.do")
   public String updateMember(Member vo) {
	   proMapper.updateMember(vo);
	   return "redirect:/main.do";
   }
   
}