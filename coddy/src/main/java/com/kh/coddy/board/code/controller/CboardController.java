package com.kh.coddy.board.code.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.coddy.board.code.model.service.CboardService;
import com.kh.coddy.board.code.model.vo.Cboard;
import com.kh.coddy.board.code.model.vo.Creply;
import com.kh.coddy.board.recruitment.model.service.RecruitmentService;
import com.kh.coddy.board.recruitment.model.vo.Prelation;
import com.kh.coddy.common.Pagination;
import com.kh.coddy.common.tag.ReadTag;
import com.kh.coddy.common.tag.controller.TagsController;
import com.kh.coddy.common.vo.PageInfo;
import com.kh.coddy.member.model.vo.Member;

@Controller
public class CboardController {

		@Autowired
		private CboardService cboardService;
		
		@Autowired 
		private TagsController tagsController;
		
		@GetMapping("search.co")
		public void selectSearchList(
				@RequestParam(value = "cpage", defaultValue = "1") int currentPage
				//@RequestParam(value="search", defaultValue="") String search,
				) {
			// 검색용 요청 (마바에서 배운거 토대로 스프링에 로직 적용)
			
			
		}
		
		@GetMapping("list.co")
		public ModelAndView selectList(
				@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
				//@RequestParam(value="tag", defaultValue="") String tag,
				//@RequestParam(value="sort", defaultValue="new") String sort,
				ModelAndView mv) {
			
			// 검색창 태그
			/*
			String tags = "";
			if(tag.equals("")) { 
				tags=tagsController.getTagsNameString(); } 
			else { 
				tags = tag; 
			}
			System.out.println(tags);
			
			Csearch cs = new Csearch(search, null, tags.split(","));
			
			if(sort.equals("new") || sort.equals("")) {
				cs.setSort("CBOARD_INSERT");
			} else if(sort.equals("view")) {
				cs.setSort("CBOARD_VIEWS");
			} else {
				cs.setSort("LIKES_MEMBER");
			}
			*/
			
			int listCount = cboardService.selectListCount();
			
			int pageLimit = 10;
			int boardLimit = 10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, 
							currentPage, pageLimit, boardLimit);
			
			ArrayList<Cboard> list = cboardService.selectList(pi);
			
			
			mv.addObject("list", list)
			  .addObject("pi", pi)
			  .setViewName("board/code/codeListView");
			  
			return mv;
		}
		
		@RequestMapping("detail.co")
		public ModelAndView selectBoard(int cno, 
										ModelAndView mv) {
			
			
			int result = cboardService.increaseCount(cno);
			
			if(result > 0) { // 성공
				
				Cboard c = cboardService.selectBoard(cno);
				
				mv.addObject("c", c)
				  .setViewName("board/code/codeDetailView"); 
				
			} else { 
				mv.addObject("errorMsg", "게시글 상세조회 실패")
				  .setViewName("common/errorPage");
			}
			
			return mv;
		}
	
		@GetMapping("enrollForm.co")
		public String enrollForm(HttpSession session, Model model) {
			if(session.getAttribute("loginMember") == null) {
				session.setAttribute("alertMsg", "로그인부터 해주세요.");
				return "redirect:/";
			}
			if(session.getAttribute("loginCompany") != null) {
				session.setAttribute("alertMsg", "기업회원은 이용 불가능합니다.");
				return "redirect:/";
			}
			model.addAttribute("tagTech", tagsController.getTagsNameList(0));
			return "board/code/codeEnrollForm";
		}
		
		@ResponseBody
		@PostMapping("uploadFile.co")
	    public String fileUpload(MultipartHttpServletRequest multiRequest, 
	    					   HttpServletRequest request,
	    					   HttpServletResponse response) {
		
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			MultipartFile fileload = (MultipartFile)files.get("upload");
			
			String changeName = saveFile(fileload, request.getSession());
			
			return "resources/file_upload/cboard/upload/" + changeName;
		}
		
		@PostMapping("insert.co")
		public String insertBoard(Cboard c,
								  MultipartFile upfile, String tagTechName,
								  HttpSession session,
								  Model model) {
			
			System.out.println(c.getCboardContent());
			

			System.out.println(tagTechName);

		   
			if(!upfile.getOriginalFilename().equals("")) {
				
				String changeName = saveFile(upfile, session);
				
				c.setOriginName(upfile.getOriginalFilename());
				c.setChangeName("resources/file_upload/cboard/upload/" + changeName);	
			}
			
		    // c.setCboardContent("ss");
		    System.out.println(c);
		    
		    c.setCboardWriter(String.valueOf(((Member)(session.getAttribute("loginMember"))).getMemberNo()));
		    
		    int result = cboardService.insertBoard(c);

		    if(result > 0) { // 게시글 작성 성공
		    	
		    	// 태그 insert
				if(!tagTechName.equals("")) {
					String[] tags = ReadTag.read(tagTechName);
					
					int result2 = 1;
					for(String tag : tags) {
						result2 *= cboardService.insertTag(tag);
					}				
				}
				
				session.setAttribute("alertMsg", "게시글이 등록되었습니다.");
				
				return "redirect:/list.co"; 
				
			} else { // 게시글 작성 실패
				
				model.addAttribute("errorMsg", "게시글 등록 실패");
				
				return "common/errorPage";
		    }
		}
		    
		@PostMapping("updateForm.co")
		public String updateForm(int cno, Model model) {
				
			Cboard c = cboardService.selectBoard(cno);
				
			model.addAttribute("c", c);
				
			return "board/code/codeUpdateForm";
			}   
		    
		
		@PostMapping("update.co")
		public String updateBoard(Cboard c, 
								  MultipartFile reupfile,
								  HttpSession session,
								  Model model) {
			
			System.out.println(c);
			
			// c.setCboardContent(String.valueOf(session.getAttribute("cboardContent")));
			
			if (reupfile != null && !reupfile.getOriginalFilename().equals("")) {
				
				if(c.getChangeName() != null) {
					
					String realPath = session.getServletContext()
										.getRealPath(c.getChangeName());
					
					new File(realPath).delete();
				}
				String changeName = saveFile(reupfile, session);
				
				c.setOriginName(reupfile.getOriginalFilename());
				c.setChangeName("/resources/file_upload/cboard/upload/" + changeName);
			}
			int result = cboardService.updateBoard(c);
			
			if(result > 0) { 
				session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
				
				return "redirect:/detail.co?cno=" + c.getCboardNo();
				
			} else {
				
				model.addAttribute("errorMsg", "게시글 수정 실패");
				
				return "common/errorPage";
			}   
		    
		}
		
		public String saveFile(MultipartFile upfile,
				   HttpSession session) {

			String originName = upfile.getOriginalFilename();
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss")
													.format(new Date());
			
			int ranNum = (int)(Math.random() * 90000 + 10000);
			
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + ranNum + ext;
			
			String savePath = session.getServletContext()
					.getRealPath("/resources/file_upload/cboard/upload/");
			
			try {
				
				upfile.transferTo(new File(savePath + changeName));
			
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
		}
		
		
		@RequestMapping("delete.co")
		public String deleteBoard(int cno,
								  String filePath,
								  Model model,
								  HttpSession session) {
			
			int result = cboardService.deleteBoard(cno);
			
			if(result > 0) {
				if(!filePath.equals("")) {
					
					String realPath = session.getServletContext()
									.getRealPath(filePath);
					
					new File(realPath).delete();
				}
				
				session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
				
				return "redirect:/list.co";
				
			} else { 
				
				model.addAttribute("errorMsg", "게시글 삭제 실패");
				
				return "common/errorPage";
			}
		}
		
		@ResponseBody
		@RequestMapping(value = "rlist.co", produces = "application/json; charset=UTF-8")
		public String ajaxSelectReplyList(int cno) {
			
			ArrayList<Creply> list = cboardService.selectReplyList(cno);
			
			// Gson gson = new Gson();
			// return gson.toJson(list);
			
			return new Gson().toJson(list);
		}
		
		@ResponseBody
		@RequestMapping(value = "rinsert.co", produces = "text/html; charset=UTF-8")
		public String ajaxInsertReply(Creply r) {
			
			// System.out.println(r);
			
			int result = cboardService.insertReply(r);
			
			return (result > 0) ? "success" : "fail";
		}
		
		
		}
		
		
