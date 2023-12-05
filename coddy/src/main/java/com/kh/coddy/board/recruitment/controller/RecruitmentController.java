package com.kh.coddy.board.recruitment.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coddy.board.recruitment.model.service.RecruitmentService;
import com.kh.coddy.board.recruitment.model.vo.Rattachment;
import com.kh.coddy.board.recruitment.model.vo.Recruitment;
import com.kh.coddy.common.tag.ReadTag;

import lombok.extern.slf4j.Slf4j;

@Controller @Slf4j
public class RecruitmentController {
	
	@Autowired
	RecruitmentService rService;

	@GetMapping("list.rec")
	public String recruitmentList() {
		return "board/recruitment/recruitmentListView";
	}	
	@GetMapping("detail.rec")
	public String recruitmentDetail() {
		return "board/recruitment/recruitmentDetailView";
	}
	@GetMapping("room.rec1")
	public String roomEnter1(){
		return "project/room1";
	}
	@GetMapping("room.rec2")
	public String roomEnter2(){
		return "project/room2";
	}
	@GetMapping("enrollForm.rec")
	public String enrollForm(){
		return "board/recruitment/recruitmentEnrollForm";
	}
	
	@PostMapping("insert.rec")
	public String insertRecruitment(Recruitment r, ArrayList<MultipartFile> files, HttpServletRequest request, Model model, String tagTechName) {		
		int result = rService.insertRecruitment(r);
		log.info("tag = {}",tagTechName);
		log.info("files = {}", files);
		if(result>0) {
			String path = request.getRealPath("resources\\file_upload\\recruitment\\");
			if(files != null) {
				for (MultipartFile mf: files) { 
					
					if(!mf.isEmpty()) {
						UUID uuid = UUID.randomUUID();
						File file = new File(path + "\\" + uuid + "_" + mf.getOriginalFilename());
						try { 
							mf.transferTo(file);
						}catch (IllegalStateException | IOException e) { 
							e.printStackTrace();
							model.addAttribute("errorMsg", "게시글은 작성하였으나 첨부파일 및 태그설정이 잘못됨"); 
							return "common/errorPage";
						}
						Rattachment ra = new Rattachment();
						ra.setRAttachmentOrigin(mf.getOriginalFilename()); 
						ra.setRAttachmentLevel(0);
						ra.setRAttachmentChange(uuid + "_" + mf.getOriginalFilename()); 
						ra.setRAttachmentPath("resources\\file_upload\\recruitment\\");
						int result2 = rService.insertImg(ra);
						if(result2 <= 0) { 
							model.addAttribute("errorMsg", "게시글은 작성하였으나 첨부파일 및 태그설정이 잘못됨"); 
							return "common/errorPage"; 
						}
					}
				}
			}if(!tagTechName.equals("")) {
				String[] tags = ReadTag.read(tagTechName);
				for(String tag : tags) {
					
				}
				
				
				log.info("tags={}",tags);
			}
			return "redirect:list.rec";
		}else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
		
		
	}
	
}
