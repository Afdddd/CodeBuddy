package com.kh.coddy.board.code.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.UUID;


import org.apache.commons.io.FilenameUtils;


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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.coddy.board.code.model.service.CboardService;
import com.kh.coddy.board.code.model.vo.Cboard;
import com.kh.coddy.common.Pagination;
import com.kh.coddy.common.vo.PageInfo;
import com.kh.coddy.member.model.vo.Member;

@Controller
public class CboardController {

		@Autowired
		private CboardService cboardService;
		
		@GetMapping("list.co")
		public ModelAndView selectList(
				@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
				ModelAndView mv) {
			
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
		public String enrollForm() {
			
			return "board/code/codeEnrollForm";
		}
		
		@PostMapping(value = "/resources/file_upload/cboard/upload")
		public ModelAndView image(MultipartHttpServletRequest request) throws Exception {
		    ModelAndView mav = new ModelAndView("jsonView");

		    try {
		        MultipartFile uploadFile = request.getFile("uploadFile");

		        if (uploadFile != null && !uploadFile.isEmpty()) {
		            String originalFileName = uploadFile.getOriginalFilename();
		            String ext = originalFileName.substring(originalFileName.indexOf("."));
		            String newFileName = UUID.randomUUID() + ext;

		            String savePath = System.getProperty("user.dir") + "/src/main/webapp/resources/file_upload/cboard/" + newFileName;

		            String uploadPath = "./cboard/" + newFileName;

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

		
		@PostMapping("insert.co")
		public String insertBoard(Cboard c,
								  HttpSession session,
								  Model model) {
		   
		    // c.setCboardContent("ss");
		    System.out.println(c);
		    c.setCboardWriter(String.valueOf(((Member)(session.getAttribute("loginMember"))).getMemberNo()));
		    int result = cboardService.insertBoard(c);

		    if(result > 0) { // 게시글 작성 성공
				
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
			c.setCboardContent(String.valueOf(session.getAttribute("cboardContent")));
			
			if (reupfile != null && !reupfile.getOriginalFilename().equals("")) {
				
				if(c.getChangeName() != null) {
					
					String realPath = session.getServletContext()
										.getRealPath(c.getChangeName());
					
					new File(realPath).delete();
				}
				String changeName = saveFile(reupfile, session);
				
				c.setOriginName(reupfile.getOriginalFilename());
				c.setChangeName("/src/main/webapp/resources/file_upload/cboard/" + changeName);
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
					.getRealPath("/src/main/webapp/resources/file_upload/cboard/");
			
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
		
		
		
		
		}
		
		
