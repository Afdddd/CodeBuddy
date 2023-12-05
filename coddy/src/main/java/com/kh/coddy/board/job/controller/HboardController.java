package com.kh.coddy.board.job.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coddy.board.job.model.service.HboardService;
import com.kh.coddy.board.job.model.vo.HSearch;
import com.kh.coddy.board.job.model.vo.Hattachment;
import com.kh.coddy.board.job.model.vo.Hboard;
import com.kh.coddy.board.job.model.vo.Hrelation;
import com.kh.coddy.board.job.model.vo.Hwishlist;
import com.kh.coddy.common.Pagination;
import com.kh.coddy.common.tag.ReadTag;
import com.kh.coddy.common.vo.PageInfo;
import com.kh.coddy.member.model.vo.Company;
import com.kh.coddy.member.model.vo.Member;

@Controller
public class HboardController {
	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired private HboardService hboardService;

	@GetMapping(value="listView.hb") public String listView(HttpSession session, @RequestParam(value="cpage", defaultValue="1") int currentPage, 
			@RequestParam(value="search", defaultValue="") String search, @RequestParam(value="education", defaultValue="none") String education, 
			@RequestParam(value="career", defaultValue="none") String career, @RequestParam(value="sort", defaultValue="new") String sort, 
			@RequestParam(value="tag", defaultValue="") String tag, Model model, @RequestParam(value="viewOn", defaultValue="") String active) {
		String tags = "";
		if(tag.equals("")) { 
			tags="C언어,C++,C#,GO,Java,JavaScript,Spring,React,Node.js,Vue,Swift,Kotlin,Python,Django," +
				"Php,Flutter,MySql,MarianDB,MongoDB,OracleDB,Unity,AWS,Docker,Kubernetes,Git,Figma,Window,Linux," +
				"PM,기획,프론트엔드,백엔드,CDN,디자인,네트워크/서버,IOS 앱 개발,AOS 앱 개발,AI학습,게임개발"; } 
		else { tags=tag; }
		HSearch hs = new HSearch(search, education.split(" "), career.split(" "), null, tags.split(","), 1);
		if(career.equals("none")) { hs.setCareer(("none,intern,newcomer,junior,middle,senior").split(",")); }
		if(education.equals("none")) { hs.setEducation(("none,highSchool,juniorCollege,university,master,doctor,professor").split(",")); }
		if(sort.equals("new") || sort.equals("")) { hs.setSort("HBOARD_INSERT"); }
		else if(sort.equals("old")) { hs.setSort("HBOARD_END"); }
		else if(sort.equals("view")) { hs.setSort("HBOARD_VIEWS"); }
		else { hs.setSort("HBOARD_SALARY"); }
		int listCount = hboardService.selectListCount(hs);
		int pageLimit = 5; int boardLimit = 8;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		if(pi.getMaxPage() == 0) { 
			ArrayList<Hboard>list = hboardService.selectList(pi, hs);
			ArrayList<Hattachment>at_list = new ArrayList<Hattachment>();
			ArrayList<ArrayList<Hrelation>>tg_list = new ArrayList<ArrayList<Hrelation>>();
			ArrayList<Boolean>ws_list = new ArrayList<Boolean>();
			for(Hboard h:list) { 
				h.setHboardLocation(getLocationByAddr(Integer.parseInt(h.getHboardLocation())));
				at_list.add(hboardService.getThumbOne(h));
				tg_list.add(hboardService.getTagInfo(h));
				if(session.getAttribute("loginMember") != null) { ws_list.add(hboardService.getWishList(h, ((Member)(session.getAttribute("loginMember"))).getMemberNo())); }
			}
			model.addAttribute("hs", hs);
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("at_list", at_list);
			model.addAttribute("tg_list", tg_list);
			model.addAttribute("ws_list", ws_list);
			return "board/job/hboardListView";
		}
		else if((currentPage > pi.getMaxPage()) || (currentPage <= 0)) { model.addAttribute("errorMsg", "잘못된 페이지"); return "common/errorPage"; }
		else {
			ArrayList<Hboard>list = hboardService.selectList(pi, hs);
			ArrayList<Hattachment>at_list = new ArrayList<Hattachment>();
			ArrayList<ArrayList<Hrelation>>tg_list = new ArrayList<ArrayList<Hrelation>>();
			ArrayList<Boolean>ws_list = new ArrayList<Boolean>();
			for(Hboard h:list) { 
				h.setHboardLocation(getLocationByAddr(Integer.parseInt(h.getHboardLocation())));
				at_list.add(hboardService.getThumbOne(h));
				tg_list.add(hboardService.getTagInfo(h));
				if(session.getAttribute("loginMember") != null) { ws_list.add(hboardService.getWishList(h, ((Member)(session.getAttribute("loginMember"))).getMemberNo())); }
			}
			model.addAttribute("hs", hs);
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("at_list", at_list);
			model.addAttribute("tg_list", tg_list);
			model.addAttribute("ws_list", ws_list);
			return "board/job/hboardListView";
		}
	}
	@GetMapping(value="insertForm.hb") public String insertBoardForm(HttpSession session) { 
		if(session.getAttribute("loginMember") != null) { session.setAttribute("alertMsg", "기업에게만 제공되는 서비스입니다."); return "redirect:/"; } 
		if(session.getAttribute("loginCompany") == null) { session.setAttribute("alertMsg", "로그인을 먼저해주세요."); return "redirect:/loginPage.co"; }
		return "board/job/hboardInsertForm";
	}
	@PostMapping(value="insert.hb") public String insertBoard(HttpSession session, Model model, HttpServletRequest request, Hboard h, String tagAllName, MultipartFile thumb, List<MultipartFile> files) {
		int result = hboardService.insertBoard(h);
		if(result > 0) {
			String path = request.getRealPath("resources\\file_upload\\hboard\\");
			// String path = "resources\\file_upload\\hboard\\";
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
				ha.setHattachmentChange(uuid + "_" + thumb.getOriginalFilename()); ha.setHattachmentPath("resources\\file_upload\\hboard\\");
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
						ha.setHattachmentChange(uuid + "_" + mf.getOriginalFilename()); ha.setHattachmentPath("resources\\file_upload\\hboard\\");
						int ha_insert = hboardService.insertThumb(ha);
						if(ha_insert <= 0) { model.addAttribute("errorMsg", "게시글은 작성하였으나 첨부파일 및 태그설정이 잘못됨"); return "common/errorPage"; }
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
	@GetMapping(value="boardWish.hb", produces="text/html; charset=UTF-8") @ResponseBody public String wish(HttpSession session, String hboardNo) {
		Hwishlist hw = new Hwishlist(((Member)session.getAttribute("loginMember")).getMemberNo(), Integer.parseInt(hboardNo));
		return (hboardService.getWish(hw) > 0) ? hboardService.deleteWish(hw): hboardService.insertWish(hw);
	}
	public String getLocationByAddr(int address) { 
		if((address >= 1000) && (address <= 8866)) return "서울특별시";
		if((address >= 10000) && (address <= 18635)) return "경기도";
		if((address >= 21000) && (address <= 23136)) return "인천광역시";
		if((address >= 24000) && (address <= 26509)) return "강원도";
		if((address >= 27000) && (address <= 29167)) return "충청북도";
		if((address >= 30000) && (address <= 30154)) return "세종시";
		if((address >= 31000) && (address <= 33677)) return "충청남도";
		if((address >= 34000) && (address <= 35428)) return "대전광역시";
		if((address >= 36000) && (address <= 40240)) return "경상북도";
		if((address >= 41000) && (address <= 43024)) return "대구광역시";
		if((address >= 44000) && (address <= 45015)) return "울산광역시";
		if((address >= 46000) && (address <= 49527)) return "부산광역시";
		if((address >= 50000) && (address <= 53337)) return "경상남도";
		if((address >= 54000) && (address <= 56469)) return "전라북도";
		if((address >= 57000) && (address <= 59792)) return "전라남도";
		if((address >= 61000) && (address <= 62466)) return "광주광역시";
		if((address >= 63000) && (address <= 63644)) return "제주도";
		else { return "알수없음"; }
	 }
}