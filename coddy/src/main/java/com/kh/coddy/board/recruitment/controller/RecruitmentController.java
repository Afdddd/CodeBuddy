package com.kh.coddy.board.recruitment.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coddy.board.recruitment.model.service.RecruitmentService;
import com.kh.coddy.board.recruitment.model.vo.Prelation;
import com.kh.coddy.board.recruitment.model.vo.Project;
import com.kh.coddy.board.recruitment.model.vo.Rattachment;
import com.kh.coddy.board.recruitment.model.vo.Recruitment;
import com.kh.coddy.board.recruitment.model.vo.RecruitmentState;
import com.kh.coddy.board.recruitment.model.vo.RecruitmentWishList;
import com.kh.coddy.common.Pagination;
import com.kh.coddy.common.tag.ReadTag;
import com.kh.coddy.common.vo.PageInfo;
import com.kh.coddy.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller @Slf4j
public class RecruitmentController {
	
	@Autowired
	RecruitmentService rService;
	
	@GetMapping("detail.rec")
	public String recruitmentDetail() {
		return "board/recruitment/recruitmentDetailView";
	}
	@GetMapping("enrollForm.rec")
	public String enrollForm(){
		return "board/recruitment/recruitmentEnrollForm";
	}
	
	@PostMapping("insert.rec")
	public String recruitmentInsert(Recruitment r, MultipartFile titleImg ,ArrayList<MultipartFile> img, HttpServletRequest request, Model model, String tagTechName, String[] position, int[] personnelMax) {		
		// 게시글 insert
		int result = rService.insertRecruitment(r);
		log.info("r = {}",r);
		log.info("tag = {}",tagTechName);
		log.info("files = {}", img);
		log.info("position = {}",position.length);
		log.info("personnel = {}",personnelMax.length);
		
		// 첨부파일 insert
		if(result>0) {
			String path = request.getRealPath("resources\\file_upload\\recruitment\\");
			log.info("titleImg={}",titleImg);
			log.info("img = {}",img);
			
			if(titleImg != null) {
				UUID uuid = UUID.randomUUID();
				File file = new File(path + "\\" + uuid + "_" + titleImg.getOriginalFilename());
				try { 
					titleImg.transferTo(file);
				}catch (IllegalStateException | IOException e) { 
					e.printStackTrace();
					model.addAttribute("errorMsg", "게시글은 작성하였으나 첨부파일 및 태그설정이 잘못됨"); 
					return "common/errorPage";
				}
				Rattachment ra = new Rattachment();
				ra.setRAttachmentOrigin(titleImg.getOriginalFilename()); 
				ra.setRAttachmentLevel(0);
				ra.setRAttachmentChange(uuid + "_" + titleImg.getOriginalFilename()); 
				ra.setRAttachmentPath("resources\\file_upload\\recruitment\\");
				int result2 = rService.insertImg(ra);
				if(result2 <= 0) { 
					model.addAttribute("errorMsg", "게시글은 작성하였으나 첨부파일 및 태그설정이 잘못됨"); 
					return "common/errorPage"; 
				}
			}
			if(img != null) {
				for (MultipartFile mf: img) { 
					
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
						ra.setRAttachmentLevel(1);
						ra.setRAttachmentChange(uuid + "_" + mf.getOriginalFilename()); 
						ra.setRAttachmentPath("resources\\file_upload\\recruitment\\");
						int result2 = rService.insertImg(ra);
						if(result2 <= 0) { 
							model.addAttribute("errorMsg", "게시글은 작성하였으나 첨부파일 및 태그설정이 잘못됨"); 
							return "common/errorPage"; 
						}
					}
				}		
			}
			// 태그 insert
			if(!tagTechName.equals("")) {
				String[] tags = ReadTag.read(tagTechName);
				for(String tag : tags) {
					Prelation rel = new Prelation(r.getRecruitmentNo(),tag);
					rService.insertTag(rel);
				}				
			}
			// 모집인원 insert
			if(position != null && personnelMax !=null && position.length == personnelMax.length) {		
				for(int i=0; i<position.length; i++) {
					RecruitmentState state = new RecruitmentState(r.getRecruitmentNo(),position[i],personnelMax[i],0);
					log.info("Insert State={}",state);
					rService.insertState(state);
				}							
			}else {
				model.addAttribute("errorMsg","게시글 작성 실패");
				return "common/errorPage";
			}
			
			// 프로젝트 대기방 생성
			Project p = new Project();
			p.setProjectOwner(r.getRecruitmentWriter()); 
			p.setProjectName(r.getRecruitmentContent());
			p.setProjectInfo(r.getRecruitmentContent());
			p.setProjectStart(r.getRecruitmentStart());
			p.setProjectEnd(r.getRecruitmentEnd());
			rService.createProject(p);

			return "redirect:list.rec";			
			
		}else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "common/errorPage";
		}
	}
	
	@GetMapping("list.rec")
	public String recruitmentList(@RequestParam(value="rpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		int listCount = rService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 20;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		Map<String,Integer> wishMap = new HashMap<>(); 		
		
		if((currentPage > pi.getMaxPage()) || (currentPage <= 0)) { 
			model.addAttribute("errorMsg", "잘못된 페이지"); 
			return "common/errorPage"; 
		}else {
			ArrayList<Recruitment> list = rService.selectList(pi);		
			ArrayList<Rattachment>at_list = new ArrayList<Rattachment>();	
			ArrayList<ArrayList<Prelation>>tg_list = new ArrayList<ArrayList<Prelation>>();
			ArrayList<ArrayList<RecruitmentState>>pos_list = new ArrayList<>();
			ArrayList<Boolean>ws_list = new ArrayList<Boolean>();
			
			
			
			for(Recruitment r:list) {
				
				Rattachment ra = rService.getThumbOne(r);
				at_list.add(ra);				
				ArrayList<Prelation> pr = rService.getTagInfo(r);
				tg_list.add(pr);
				ArrayList<RecruitmentState> rs = rService.getState(r);
				pos_list.add(rs);
				
				if(session.getAttribute("loginMember")!=null) {					
					wishMap.put("mno",((Member)session.getAttribute("loginMember")).getMemberNo());
					wishMap.put("rno",r.getRecruitmentNo());
					ws_list.add(rService.getWishList(wishMap));
					wishMap.clear();					
				}				
			}			
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("at_list", at_list);
			model.addAttribute("tg_list", tg_list);
			model.addAttribute("ws_list", ws_list);
			model.addAttribute("pos_list", pos_list);
								
			return "board/recruitment/recruitmentListView";				
		}	
	}
	
	 
	@GetMapping("boardWish.rec")
	@ResponseBody
	public String wish(HttpSession session, int recruitmentNo) {
		RecruitmentWishList rw = new RecruitmentWishList( ((Member)session.getAttribute("loginMember")).getMemberNo(),recruitmentNo );
		return (rService.getWish(rw) > 0) ? rService.deleteWish(rw): rService.insertWish(rw);
	}
	
	
	
	
	
	
	
}
