package com.kh.coddy.board.job.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coddy.board.job.model.service.HboardService;
import com.kh.coddy.board.job.model.vo.Hattachment;
import com.kh.coddy.board.job.model.vo.Hboard;
import com.kh.coddy.board.job.model.vo.Hrelation;
import com.kh.coddy.common.tag.ReadTag;
import com.kh.coddy.member.model.vo.Company;

@Controller
public class HboardController {
	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired private HboardService hboardService;

	@GetMapping(value="listView.hb") public String listView() { return "board/job/hboardListView"; }
	@GetMapping(value="insertForm.hb") public String insertBoardForm(HttpSession session) { 
		if(session.getAttribute("loginMember") != null) { session.setAttribute("alertMsg", "기업에게만 제공되는 서비스입니다."); return "redirect:/"; } 
		if(session.getAttribute("loginCompany") == null) { session.setAttribute("alertMsg", "로그인을 먼저해주세요."); return "redirect:/loginPage.co"; }
		return "board/job/hboardInsertForm";
	}
	@PostMapping(value="insert.hb") public String insertBoard(HttpSession session, Model model, HttpServletRequest request, Hboard h, String tagAllName, MultipartFile thumb, List<MultipartFile> files) {
		int result = hboardService.insertBoard(h);
		if(result > 0) {
			String path = request.getRealPath("resources\\file_upload\\hboard\\");
			if(!thumb.isEmpty()) {
				UUID uuid = UUID.randomUUID();
				File file = new File(path + "\\" + uuid + "_" + thumb.getOriginalFilename());
				try { thumb.transferTo(file); }
				catch (IllegalStateException | IOException e) { 
					e.printStackTrace();
					model.addAttribute("errorMsg", "게시글은 작성하였으나 첨부파일 및 태그설정이 잘못됨"); 
					return "common/errorPage";
				}
				Hattachment ha = new Hattachment();
				ha.setHattachmentOrigin(thumb.getOriginalFilename()); ha.setHattachmentLevel(1);
				ha.setHattachmentChange(uuid + "_" + thumb.getOriginalFilename()); ha.setHattachmentPath(path);
				int f = hboardService.insertThumb(ha);
				if(f <= 0) { model.addAttribute("errorMsg", "게시글은 작성하였으나 첨부파일 및 태그설정이 잘못됨"); return "common/errorPage"; }
			}
			if(files != null) {
				for (MultipartFile mf: files) { 
					if(!mf.isEmpty()) {
						UUID uuid = UUID.randomUUID();
						File file = new File(path + "\\" + uuid + "_" + mf.getOriginalFilename());
						try { mf.transferTo(file); }
						catch (IllegalStateException | IOException e) { 
							e.printStackTrace();
							model.addAttribute("errorMsg", "게시글은 작성하였으나 첨부파일 및 태그설정이 잘못됨"); 
							return "common/errorPage";
						}
						Hattachment ha = new Hattachment();
						ha.setHattachmentOrigin(mf.getOriginalFilename()); ha.setHattachmentLevel(0);
						ha.setHattachmentChange(uuid + "_" + mf.getOriginalFilename()); ha.setHattachmentPath(path);
						int f = hboardService.insertThumb(ha);
						if(f <= 0) { model.addAttribute("errorMsg", "게시글은 작성하였으나 첨부파일 및 태그설정이 잘못됨"); return "common/errorPage"; }
					}
				}
			}
			if(tagAllName.equals("")) { log.info("hboardInsertNoTag={}, ip={}", (Company)(session.getAttribute("loginCompany")), request.getRemoteAddr()); }
			else { 
				String[] tags = ReadTag.read(tagAllName);
				for(String t:tags) { if(!hboardService.insertTag(new Hrelation(h.getHboardNo(), t))) { model.addAttribute("errorMsg", "게시글은 작성하였으나 태그 설정이 잘못됨"); return "common/errorPage"; } }
				log.info("hboardInsertTags={}, ip={}", (Company)(session.getAttribute("loginCompany")), request.getRemoteAddr());
			}
			session.setAttribute("alertMsg", "게시글 작성 성공");
			return "redirect:/listView.hb";  
		}
		else { model.addAttribute("errorMsg", "게시글 작성 실패"); return "common/errorPage"; }
	}
}