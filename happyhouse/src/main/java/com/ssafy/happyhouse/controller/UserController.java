package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.http.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response) {
		try {
			System.out.println("hihi222222");
			MemberDto memberDto = userService.login(map);
			if(memberDto != null) {
				session.setAttribute("userinfo", memberDto);
				Cookie cookie = new Cookie("ssafy_id", memberDto.getUserid());
				cookie.setPath("/");
				if("saveok".equals(map.get("idsave"))) {
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);//40년간 저장.
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);
				return "redirect:/";
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "index";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(HttpSession session) {
		
		return "user/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberDto memberDto, Model model, HttpSession session) {
		System.out.println(memberDto.getUserid());
		System.out.println(memberDto.getUserpwd());
		userService.userRegister(memberDto);
		return "user/login";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "user/list";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify() {
		return "user/modify";
	}
	
	
	@RequestMapping(value = "/searchPW", method = RequestMethod.GET)
	public String searchPW() {
		return "user/searchPW";
	}
	
	@RequestMapping(value = "/searchPW", method = RequestMethod.POST)
	public String searchPW(MemberDto memberDto, Model model, HttpSession session) {
		MemberDto memberDto2=userService.userInfo(memberDto.getUserid());
		session.setAttribute("pw", memberDto2.getUserpwd());
		System.out.println(memberDto2.getUsername());
		System.out.println(memberDto2.getUserpwd());
		return "user/searchPWres";
	}
	
	@RequestMapping(value = "/modifypassword", method = RequestMethod.POST)
	public String modifypassword(MemberDto memberDto, Model model, HttpSession session) {
		MemberDto memberDto2 = (MemberDto) session.getAttribute("userinfo");
		
		memberDto.setUserid(memberDto2.getUserid());
		
		userService.userModify(memberDto);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(MemberDto memberDto, Model model, HttpSession session) {
		MemberDto memberDto2 = (MemberDto) session.getAttribute("userinfo");
		System.out.println(memberDto2.getUserid());
		userService.userDelete(memberDto2.getUserid());
		session.invalidate();
		return "user/login";
	}
}
