package com.kh.coddy.board.notice.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.coddy.board.notice.model.service.NboardService;
import com.kh.coddy.board.notice.model.vo.Nboard;
import com.kh.coddy.common.Pagination;
import com.kh.coddy.common.vo.PageInfo;
import com.kh.coddy.member.model.vo.Member;

@Controller
public class NboardController {

	@Autowired NboardService nboardService;
	
	@GetMapping("list.no")
	public ModelAndView selectList(
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = nboardService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, 
						currentPage, pageLimit, boardLimit);
		
		ArrayList<Nboard> list = nboardService.selectList(pi);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("board/notice/noticeListView");
		
		System.out.println(list);
		System.out.println(pi);
		  
		return mv;
	}
	
	@GetMapping("detail.no")
	public ModelAndView selectBoard(int nno, 
			ModelAndView mv) {

	int result = nboardService.increaseCount(nno);
		
		if(result > 0) { // 성공
		
		Nboard n = nboardService.selectBoard(nno);
		
		mv.addObject("n", n)
		.setViewName("board/notice/noticeDetailView"); 
		
		} else { 
		mv.addObject("errorMsg", "게시글 상세조회 실패")
		.setViewName("common/errorPage");
		}
		
		return mv;
		}
		
	public String enrollForm() {
		
		return "board/notice/noticeEnrollForm";
	}
	
	@PostMapping(value = "/resources/file_upload/nboard/upload")
	public ModelAndView image(MultipartHttpServletRequest request) throws Exception {
	    ModelAndView mav = new ModelAndView("jsonView");

	    try {
	        MultipartFile uploadFile = request.getFile("uploadFile");

	        if (uploadFile != null && !uploadFile.isEmpty()) {
	            String originalFileName = uploadFile.getOriginalFilename();
	            String ext = originalFileName.substring(originalFileName.indexOf("."));
	            String newFileName = UUID.randomUUID() + ext;

	            String savePath = System.getProperty("user.dir") + "/src/main/webapp/resources/file_upload/nboard/" + newFileName;

	            String uploadPath = "./nboard/" + newFileName;

	            File file = new File(savePath);

	            uploadFile.transferTo(file);

	            mav.addObject("uploaded", true);
	            mav.addObject("url", uploadPath);
	        } else {
	            mav.addObject("uploaded", false);
	            mav.addObject("message", "업로드된 파일이 없습니다.");
	        }
	    } catch (Exception e) {
	        mav.addObject("uploaded", false);
	        mav.addObject("message", "파일 업로드 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }

	    return mav;
	}
	
	@PostMapping("insert.no")
	public String insertBoard(Nboard n,
							  HttpSession session,
							  Model model) {
	  

	    int result = nboardService.insertBoard(n);

	    if(result > 0) { // 게시글 작성 성공
			
			session.setAttribute("alertMsg", "게시글이 등록되었습니다.");
			
			return "redirect:/list.no"; 
			
		} else { // 게시글 작성 실패
			
			model.addAttribute("errorMsg", "게시글 등록 실패");
			
			return "common/errorPage";
	    }
	}
	
	@GetMapping("update.no")
	public String updateForm(int nno, Model model) {
		
		Nboard n = nboardService.selectBoard(nno);
			
		model.addAttribute("n", n);
			
		return "board/notice/noticeUpdateForm";
		}   
	
}
