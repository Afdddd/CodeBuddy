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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coddy.board.intro.model.service.IntroService;
import com.kh.coddy.board.intro.model.vo.IBoard;
import com.kh.coddy.board.intro.model.vo.Iattachment;
import com.kh.coddy.board.intro.model.vo.Ireply;
import com.kh.coddy.board.intro.model.vo.Isearch;
import com.kh.coddy.board.intro.model.vo.Likes;
import com.kh.coddy.board.recruitment.model.vo.Prelation;
import com.kh.coddy.common.Pagination;
import com.kh.coddy.common.tag.controller.TagsController;
import com.kh.coddy.common.vo.PageInfo;
import com.kh.coddy.member.model.vo.Member;


@Controller
public class IntroController {
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired 
	private IntroService introService;
	
	@Autowired private TagsController tagsController;
	
	@GetMapping("introDetail.bo")
	public String selectBoard(HttpSession session, @RequestParam(value="ino") String iboardNo, Model model) {
		
		if(introService.plusView(Integer.parseInt(iboardNo)) < 1) {
			model.addAttribute("errorMsg", "페이지 찾기에 실패함"); return "common/errorPage"; 
		}
		IBoard ib = introService.selectBoard(Integer.parseInt(iboardNo));
		Iattachment it = introService.selectattachment(ib);
		ArrayList<Iattachment> ia = introService.getAttachmentList(ib);
		ArrayList<Prelation> ir = introService.getTagInfo(ib);
		
		session.setAttribute("ib", ib);
		session.setAttribute("it", it);
		session.setAttribute("ia", ia);
		session.setAttribute("ir", ir);
		session.setAttribute("wish", introService.getAllWish(ib.getIboardNo()));
		return "board/intro/introDetailView"; 
	}
	
	@GetMapping("introlist.bo")	
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
		@RequestParam(value="search", defaultValue="") String search,
		@RequestParam(value="tag", defaultValue="") String tag,
		@RequestParam(value="sort", defaultValue="new") String sort,
		Model model, HttpSession session) {
		
		// 검색창 태그
		String tags = "";
		if(tag.equals("")) { 
			tags=tagsController.getTagsNameString(); } 
		else { 
			tags = tag; 
		}
		
		Isearch is = new Isearch(search, null, tags.split(","));
		
		if(sort.equals("new") || sort.equals("")) {
			is.setSort("IBOARD_INSERT");
		} else if(sort.equals("old")) {
			is.setSort("IBOARD_END") ;
		} else if(sort.equals("view")) {
			is.setSort("IBOARD_VIEWS");
		} else {
			is.setSort("LIKES_MEMBER");
		}
		
		int listCount = introService.selectListCount(is);
		
		int pageLimit = 5;
		int boardLimit = 9;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		if(pi.getMaxPage() == 0) {
			return "board/intro/introListView";		

		}
		else if((currentPage > pi.getMaxPage()) || (currentPage <= 0)) {
			model.addAttribute("errorMsg", "잘못된 페이지입니다.");
			return "common/errorPage"; 
		}
	
		else {
		ArrayList<IBoard> list = introService.selectList(pi, is);
		ArrayList<Iattachment> listi = new ArrayList<Iattachment>();
		ArrayList<ArrayList<Prelation>>tg_list = new ArrayList<ArrayList<Prelation>>();
		ArrayList<Boolean>ws_list = new ArrayList<Boolean>();

		for(IBoard ib : list) { 
			listi.add(introService.selectattachment(ib));
			tg_list.add(introService.getTagInfo(ib));
			if(session.getAttribute("loginMember") != null) { ws_list.add(introService.getWishList(ib, ((Member)(session.getAttribute("loginMember"))).getMemberNo())); }
		}
		
		model.addAttribute("is", is);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("listi", listi);
		model.addAttribute("tg_list", tg_list);
		model.addAttribute("ws_list", ws_list);
		model.addAttribute("tagAll", tagsController.getTagsNameList());
		System.out.println(listi);
		System.out.println(tg_list);
		System.out.println(ws_list);
		return "board/intro/introListView";
	}
		
}
		
	@GetMapping("introForm.bo")
	public String selectEnrollForm(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용해 주세요.");
			return "redirect:/introlist.bo";
		}
		if(session.getAttribute("loginCompany") != null) {
			session.setAttribute("alertMsg", "기업회원은 이용 불가능합니다.");
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
	
	@PostMapping(value="deleteForm.ib")
	public String deleteForm(HttpSession session, Model model, String filePath, int ino) {
		
		if(session.getAttribute("loginMember") == null) { 
			session.setAttribute("alertMsg", "로그인을 먼저해주세요."); 
			return "redirect:/"; 
		}
		
		int result = introService.deleteForm(ino);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "글이 삭제되었습니다.");
		
		}
		
			return "redirect:/introlist.bo";
		
		
		
	}
	
	@GetMapping(value="introWish.hb", produces="text/html; charset=UTF-8") 
	@ResponseBody 
	public String wish(HttpSession session, String iboardNo) {
		
		Likes iw = new Likes(((Member)session.getAttribute("loginMember")).getMemberNo(), Integer.parseInt(iboardNo));
		
		return (introService.getWish(iw) > 0) ? introService.deleteWish(iw) : introService.insertWish(iw);
	}
	
	@ResponseBody
	@RequestMapping("insertReply.bo")
	public String insertReply(Ireply r, Model model) {
		
		int result = introService.insertReply(r);
		return result > 0 ? "success" : "fail"; 
		
	}
	

}