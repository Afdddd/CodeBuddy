package com.kh.coddy.board.code.controller;

import java.io.File;
import java.util.Map;
import java.util.UUID;

<<<<<<< Updated upstream
import org.apache.commons.io.FilenameUtils;
=======
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

>>>>>>> Stashed changes
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

import com.kh.coddy.board.code.model.service.CboardService;
import com.kh.coddy.board.code.model.vo.Cboard;

@Controller
public class CboardController {

		@Autowired
		private CboardService cboardService;
		
		@GetMapping("list.co")
		public String cboardList() {
	           
	        return "board/code/codeListView";
	    }
		
		@GetMapping("detail.co")
		public String cboardDetail() {
			return "board/code/codeDetailView";
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
<<<<<<< Updated upstream

=======
		
		@PostMapping("insert.co")
		public String insertBoard(Cboard c,
								  HttpSession session,
								  Model model) {
		    System.out.println(c);
		    
		    int result = cboardService.insertBoard(c);

		    if(result > 0) { // 게시글 작성 성공
				
				session.setAttribute("alertMsg", "게시글이 등록되었습니다.");
				
				return "redirect:/list.co"; 
				
			} else { // 게시글 작성 실패
				
				model.addAttribute("errorMsg", "게시글 등록 실패");
				
				return "common/errorPage";
		    }
		}
		
		
>>>>>>> Stashed changes
}
