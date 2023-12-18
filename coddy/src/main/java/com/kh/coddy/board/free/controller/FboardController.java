package com.kh.coddy.board.free.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.coddy.board.free.model.service.FboardService;
import com.kh.coddy.board.free.model.vo.Fattachment; 
import com.kh.coddy.board.free.model.vo.Fboard;
import com.kh.coddy.board.free.model.vo.Freply;
import com.kh.coddy.common.Pagination;
import com.kh.coddy.common.vo.PageInfo;
import com.kh.coddy.member.model.vo.Member;

@Controller
@RequestMapping
public class FboardController {

		@Autowired
		private FboardService fboardService;
		
		@GetMapping("list.fr")
		public ModelAndView selectList(
				@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
				ModelAndView mv) {
			
			int listCount = fboardService.selectListCount();
			
			int pageLimit = 10;
			int boardLimit = 10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, 
							currentPage, pageLimit, boardLimit);
			
			ArrayList<Fboard> list = fboardService.selectList(pi);
			
			mv.addObject("list", list)
			  .addObject("pi", pi)
			  .setViewName("board/free/freeListView");
			
			System.out.println(list);
			System.out.println(pi);
			  
			return mv;
		}
		
		@RequestMapping("detail.fr")
		public ModelAndView selectBoard(int fno, 
										ModelAndView mv) {
			
			
			int result = fboardService.increaseCount(fno);
			
			if(result > 0) { // 성공
				
				Fboard f = fboardService.selectBoard(fno);
				
				mv.addObject("f", f)
				  .setViewName("board/free/freeDetailView"); 
				
			} else { 
				mv.addObject("errorMsg", "게시글 상세조회 실패")
				  .setViewName("common/errorPage");
			}
			
			return mv;
		}
	
		@GetMapping("enrollForm.fr")
		public String enrollForm() {

			return "board/free/freeEnrollForm";
		}
		
		public String saveFile(MultipartFile upfile, HttpSession session, HttpServletRequest request) {

			String fboardOrigin = upfile.getOriginalFilename();
			
		    if (fboardOrigin == null || fboardOrigin.isEmpty()) {
		        // 업로드된 파일이 없으면 빈 문자열 반환
		        return "";
		    }
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			int ranNum = (int)(Math.random() * 90000 + 10000);
			
			String ext = FilenameUtils.getExtension(fboardOrigin);
			
			String fboardChange = currentTime + ranNum + "." + ext;
			String savePath = request.getRealPath("resources\\file_upload\\fboard\\");
			
			try {
				
		        File uploadDir = new File(savePath);
		        if (!uploadDir.exists()) {
		            uploadDir.mkdirs();
		        }
				
				upfile.transferTo(new File(savePath + "\\" + fboardChange));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			return fboardChange;
		}
		
		@PostMapping("insert.fr")
		public String insertBoard(Fboard f,
								  HttpSession session,
								  Model model) {
		  
		    f.setFboardWriter(String.valueOf(((Member)(session.getAttribute("loginMember"))).getMemberNo()));
		    System.out.println(f);
		    int result = fboardService.insertBoard(f);

		    if(result > 0) { // 게시글 작성 성공
				
				session.setAttribute("alertMsg", "게시글이 등록되었습니다.");
				
				return "redirect:/list.fr"; 
				
			} else { // 게시글 작성 실패
				
				model.addAttribute("errorMsg", "게시글 등록 실패");
				
				return "common/errorPage";
		    }
		}
		    
		@PostMapping("updateForm.fr")
		public String updateForm(int fno, Model model) {
				
			Fboard f = fboardService.selectBoard(fno);
				
			model.addAttribute("f", f);
				
			return "board/free/freeUpdateForm";
			}   
		
		@PostMapping("update.fr")
		public String updateBoard(@ModelAttribute("f") Fboard f, 
								  @RequestParam(name = "reupfile", required = false) MultipartFile reupfile,
		                          HttpSession session,
		                          Model model) throws IOException {
		    
		    // System.out.println(f);
		    
		    // 기존 게시글 내용을 세션에서 가져와서 설정
		    f.setFboardContent(String.valueOf(session.getAttribute("fboardContent")));

		    if (reupfile != null && !reupfile.getOriginalFilename().equals("")) {

			    // 첨부 파일이 존재하고 변경된 파일명이 있을 경우 기존 파일 삭제
			    if (f.getFboardChange() != null) {
			        String realPath = session.getServletContext().getRealPath(f.getFboardChange());
			        new File(realPath).delete();
			    }

			    // 새로운 파일 저장 및 정보 설정
			    String fboardChange = saveFile(reupfile, session, null);
			    f.setFboardOrigin(reupfile.getOriginalFilename());
			    f.setFboardChange("/resources/file_upload/fboard/upload/" + fboardChange);
			}
		   
		    // 게시글 업데이트 수행
		    int result = fboardService.updateBoard(f);
		    
		    if (result > 0) { 
		        // 성공적으로 업데이트된 경우 상세 페이지로 리다이렉트
		        session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
		        return "redirect:/detail.fr?fno=" + f.getFboardNo();
		    } else {
		        // 업데이트 실패 시 에러 페이지로 이동
		        model.addAttribute("errorMsg", "게시글 수정 실패");
		        return "common/errorPage";
		    }   
		}	
		
		@RequestMapping("delete.fr")
		public String deleteBoard(int fno,
								  String filePath,
								  Model model,
								  HttpSession session) {
			
			int result = fboardService.deleteBoard(fno);
			
			if(result > 0) {
				if(!filePath.equals("")) {
					
					String realPath = session.getServletContext()
									.getRealPath(filePath);
					
					new File(realPath).delete();
				}
				
				session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
				
				return "redirect:/list.fr";
				
			} else { 
				
				model.addAttribute("errorMsg", "게시글 삭제 실패");
				
				return "common/errorPage";
			}
		}

		@GetMapping("rlist.fr")
		@ResponseBody
		public ArrayList<Freply> getReplyList(int fno) {
		    // fno에 해당하는 게시글의 댓글 목록 조회
			ArrayList<Freply> replyList = fboardService.selectReplyList(fno);
		    return replyList;
		}
		
}
		
		
