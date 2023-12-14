package com.kh.coddy.board.free.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

import com.kh.coddy.board.free.model.service.FboardService;
import com.kh.coddy.board.free.model.vo.Fboard;
import com.kh.coddy.board.free.model.vo.Freply;
import com.kh.coddy.common.Pagination;
import com.kh.coddy.common.vo.PageInfo;
import com.kh.coddy.member.model.vo.Member;

@Controller
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
		
		@PostMapping(value = "/resources/file_upload/fboard/upload")
		public ModelAndView image(MultipartHttpServletRequest request) throws Exception {
		    ModelAndView mav = new ModelAndView("jsonView");

		    try {
		        MultipartFile uploadFile = request.getFile("uploadFile");

		        if (uploadFile != null && !uploadFile.isEmpty()) {
		            String originalFileName = uploadFile.getOriginalFilename();
		            String ext = originalFileName.substring(originalFileName.indexOf("."));
		            String newFileName = UUID.randomUUID() + ext;

		            String savePath = System.getProperty("user.dir") + "/src/main/webapp/resources/file_upload/fboard/" + newFileName;

		            String uploadPath = "./fboard/" + newFileName;

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
		    
		@PostMapping("update.fr")
		public String updateForm(int fno, Model model) {
				
			Fboard f = fboardService.selectBoard(fno);
				
			model.addAttribute("f", f);
				
			return "board/free/freeUpdateForm";
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
					.getRealPath("/src/main/webapp/resources/file_upload/fboard/");
			
			try {
				
				upfile.transferTo(new File(savePath + changeName));
			
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
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
		
		
