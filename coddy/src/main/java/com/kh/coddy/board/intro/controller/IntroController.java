package com.kh.coddy.board.intro.controller;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.coddy.board.intro.model.service.IntroService;
import com.kh.coddy.board.intro.model.vo.IBoard;
import com.kh.coddy.board.intro.model.vo.Iattachment;
import com.kh.coddy.common.Pagination;
import com.kh.coddy.common.vo.PageInfo;
import com.kh.coddy.member.model.vo.Member;


@Controller
public class IntroController {
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired 
	private IntroService introService;
	
	@GetMapping("introlist.bo")
	public ModelAndView selectList(@RequestParam(value="", defaultValue=" 1")int currentPage, ModelAndView mv) {
		
		int listCount = introService.selectListCount();
		
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<IBoard> list = introService.selectList(pi);
		
		mv.addObject("list", list).addObject("pi", pi).setViewName("IBoard/introListView");
		
		return mv;
	
		
	}
	
	@GetMapping("introForm.bo")
	public String selectEnrollForm(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용해 주세요.");
			return "redirect:/introlist.bo";
		}
		
		return "board/intro/introEnrollForm";
	
	}
	
	@PostMapping(value="introinsert.bo")
	public String insertBoard(IBoard i, Iattachment ia, MultipartFile[] upfile, HttpSession session, Model model, HttpServletRequest request) {
		i.setIboardWriter(String.valueOf(((Member)(session.getAttribute("loginMember"))).getMemberNo()));
		int result = introService.insertBoard(i);
		

		if(upfile != null) {
			for(int ie = 0; ie < upfile.length; ie++) {
				if(!upfile[ie].getOriginalFilename().equals("")) {
					ia.setIAttachmentPath("resources\\file_upload\\iboard\\");
					if(ie == 0) {
						ia.setIAttachmentLevel(1);
					} else {
						ia.setIAttachmentLevel(2);
					}
					
					
					// 게시글만 넣기 위한 것
					String changeName = saveFile(upfile[ie], session, request);
					ia.setIAttachmentOrigin(upfile[ie].getOriginalFilename());
					ia.setIAttachmentChange(changeName);
					
	
					
					// 이미지 넣기 위한 것
					introService.insertBoardImg(ia);
					
				}
			}
		}

		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:/introlist.bo";
			
		} else {			
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session, HttpServletRequest request) {

		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		String savePath = request.getRealPath("resources\\file_upload\\iboard\\");
		// String savePath = session.getServletContext().getRealPath("/resources/image/intro/");
		
		try {
			upfile.transferTo(new File(savePath + "\\" + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	

}