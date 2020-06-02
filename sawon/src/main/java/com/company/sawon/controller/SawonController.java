package com.company.sawon.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.company.sawon.model.service.SawonService;
import com.company.sawon.model.vo.Insa;
import com.company.sawon.model.vo.Insacom;

@Controller
public class SawonController {
	
	@Autowired
	private SawonService sawonService;
	
	@RequestMapping("main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping("memberinsertForm.do")
	public String insert(Model model) {
		
		List<Insacom> list = sawonService.insacomList();		
		System.out.println("insacomList:"+list);
		model.addAttribute("list",list);
		
		return "insert";
	}
	
	@RequestMapping("selectForm.do")
	public String select(Model model) {
		
		List<Insacom> list = sawonService.insacomList();		
		System.out.println("insacomList:"+list);
		model.addAttribute("list",list);
		
		return "select";
	}
	
	@RequestMapping(value="fileupload.do")
	@ResponseBody
	public String fileupload(MultipartFile[] uploadFile, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		System.out.println("fileupload.do 제대로 실행");
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/images/imagefile");
		
		System.out.println("file:"+uploadFile.length);
		
		for(MultipartFile f : uploadFile) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				System.out.println("원본파일이름1:"+oriFileName);
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHMMssSSS");
				int rdv = (int)(Math.random() * 1000);
				String profileImg = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;
				System.out.println("바뀐파일이름1:"+profileImg);
				try {
					f.transferTo(new File(saveDir + "/" + profileImg));
					//this.inputStreamToFile((FileInputStream) f.getInputStream(), new File(saveDir + "/" + profileImg));
					System.out.println("profileImg1 제대로 실행");
				}catch(Exception e) {
					e.printStackTrace();
				}
				System.out.println("profileImg1 제대로 완료");
				
				return profileImg;
				
			}else {
				System.out.println("aaaaaaaaaaaaaa");
			}
		}//for문
		
		return null;
		
	}
	
	@RequestMapping(value="fileupload1.do")
	@ResponseBody
	public String fileupload1(MultipartFile[] uploadFile, String insaSabun, Insa insa, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		System.out.println("fileupload1.do 제대로 실행");
		System.out.println("insaSabun:"+insaSabun);
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/images/imagefile");
		
		System.out.println("file:"+uploadFile.length);
		
		for(MultipartFile f : uploadFile) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				System.out.println("원본파일이름1:"+oriFileName);
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHMMssSSS");
				int rdv = (int)(Math.random() * 1000);
				String profileImg = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;
				System.out.println("바뀐파일이름1:"+profileImg);
				try {
					f.transferTo(new File(saveDir + "/" + profileImg));
					//this.inputStreamToFile((FileInputStream) f.getInputStream(), new File(saveDir + "/" + profileImg));
					System.out.println("profileImg1 제대로 실행");
					insa.setInsa_sabun(insaSabun);
					insa.setInsa_cmp_reg_image(profileImg);
					int result = sawonService.updateFile1(insa);
				}catch(Exception e) {
					e.printStackTrace();
				}
				System.out.println("profileImg1 제대로 완료");
				
				return profileImg;
				
			}else {
				System.out.println("aaaaaaaaaaaaaa");
			}
		}//for문
		
		return null;
		
	}
	
	@RequestMapping(value="fileupload2.do")
	@ResponseBody
	public String fileupload2(MultipartFile[] uploadFile, String insaSabun, Insa insa, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		System.out.println("fileupload2.do 제대로 실행");
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/images/imagefile");
		
		System.out.println("file:"+uploadFile.length);
		
		for(MultipartFile f : uploadFile) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				System.out.println("원본파일이름1:"+oriFileName);
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHMMssSSS");
				int rdv = (int)(Math.random() * 1000);
				String profileImg = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;
				System.out.println("바뀐파일이름1:"+profileImg);
				try {
					f.transferTo(new File(saveDir + "/" + profileImg));
					//this.inputStreamToFile((FileInputStream) f.getInputStream(), new File(saveDir + "/" + profileImg));
					System.out.println("profileImg1 제대로 실행");
					insa.setInsa_sabun(insaSabun);
					insa.setInsa_carrier(profileImg);
					int result = sawonService.updateFile2(insa);
				}catch(Exception e) {
					e.printStackTrace();
				}
				System.out.println("profileImg1 제대로 완료");
				
				return profileImg;
				
			}else {
				System.out.println("aaaaaaaaaaaaaa");
			}
		}//for문
		
		return null;
		
	}
	
	@RequestMapping(value="idConfirmation.do", method = RequestMethod.POST)
	public void idcheck(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String insa_id = request.getParameter("id");
		
		System.out.println("id:"+ insa_id);
		response.setContentType("text/html;charset=utf-8");
		
		boolean idcheck = sawonService.idcheck(insa_id);
		
		PrintWriter out = response.getWriter();
		
		if(idcheck==true) {
			out.append("true");
			out.flush();
		}else if(idcheck==false) {
			out.append("false");
			out.flush();
		}
		
		
	}
	
	@RequestMapping(value="memberinsert.do", method = RequestMethod.POST)
	public ModelAndView signIn(@RequestParam(value = "insa_profile2", required = false) MultipartFile[] profileImg1,
			@RequestParam(value = "insa_cmp_reg_image2", required = false) MultipartFile[] cmpRegImg1,
			@RequestParam(value = "insa_carrier2", required = false) MultipartFile[] carrierImg1,
			HttpServletResponse response, HttpServletRequest request,
			Insa insa) throws Exception{
		ModelAndView mv = new ModelAndView();
		//사원을 등록하기 위해서 결론적으로 Insa 객체를 완성한 이후에 쿼리문에서 전송하여 올릴 것이므로
		//최종적으로 Insa 객체를 완성시키는 형식으로 진행		
		
		//아이디 가져오기
		String insaId = request.getParameter("insa_id");
		//패스워드 가져오기
		String insaPwd = request.getParameter("insa_pwd");
		//한글성명 가져오기
		String insaName = request.getParameter("insa_name");
		//영문성명 가져오기
		String insaEngName = request.getParameter("insa_eng_name");
		//전화번호 가져오기
		String insaPhone = request.getParameter("insa_phone");
		//핸드폰번호 가져오기
		String insaHp = request.getParameter("insa_hp");
		//주민등록번호 가져오기
		String insaRegNo = request.getParameter("insa_reg_no2");
		//연령 가져오기
		String insaYears = request.getParameter("insa_years");
		
		//직종체크 가져오기
		String insaJoinGbnCode = request.getParameter("insa_join_gbn_code");
		//성별 가져오기
		String insaSex = request.getParameter("insa_sex");
		//우편번호 가져오기
		String insaZip = request.getParameter("insa_zip");
		//주소 가져오기
		String insaAddr1 = request.getParameter("insa_addr1");
		//세부주소 가져오기
		String insaAddr2 = request.getParameter("insa_addr2");
		//직위 가져오기
		String insaPosGbnCode = request.getParameter("insa_pos_gbn_code");
		//부서 가져오기
		String insaDeptCode = request.getParameter("insa_dept_code");
		//연봉 가져오기
		String insaSalary = request.getParameter("insa_salary");
		//입사구분 가져오기
		String insaJoinType = request.getParameter("insa_join_type");
		//등급 가져오기
		String insaGartLevel = request.getParameter("insa_gart_level");
		//투입여부 가져오기
		String insaPutYn = request.getParameter("insa_put_yn");
		//군필여부 가져오기
		String insaMilYn = request.getParameter("insa_mil_yn");
		//군별 가져오기
		String insaMilType = request.getParameter("insa_mil_type");
		//계급 가져오기
		String insaMilLevel = request.getParameter("insa_mil_level");
		//입영일자 가져오기
		String insaMilStartdate = request.getParameter("insa_mil_startdate");
		//전역일자 가져오기
		String insaMilEnddate = request.getParameter("insa_mil_enddate");
		//KOSA등록 가져오기
		String insaKosaRegYn = request.getParameter("insa_kosa_reg_yn");
		//KOSA등급 가져오기
		String insaKosaClassCode = request.getParameter("insa_kosa_class_code");
		//입사일
		String insaJoinDay = request.getParameter("insa_join_day");
		//퇴사일
		String insaRetireDay = request.getParameter("insa_retire_day");
		//사업자번호
		String insaCmpRegNo = request.getParameter("insa_cmp_reg_no");
		//업체명
		String insaCrmName = request.getParameter("insa_crm_name");
		//자기소개
		String insaSelfIntro = request.getParameter("insa_self_intro");
		
		//이메일 가져오기
		String insaEmail1 = request.getParameter("insa_email");
		String insaEmail2 = request.getParameter("insa_email2");
		
		String insaEmail = insaEmail1 + insaEmail2;
				
		System.out.println("insaId:"+insaId);
		System.out.println("insaPwd:"+insaPwd);
		System.out.println("insaName:"+insaName);
		System.out.println("insaEngName:"+insaEngName);
		System.out.println("insaPhone:"+insaPhone);
		System.out.println("insaHp:"+insaHp);
		System.out.println("insaRegNo:"+insaRegNo);
		System.out.println("insaYears:"+insaYears);
		System.out.println("insaJoinGbnCode:"+insaJoinGbnCode);
		System.out.println("insaSex:"+insaSex);
		System.out.println("insaZip:"+insaZip);
		System.out.println("insaAddr1"+insaAddr1);
		System.out.println("insaAddr2"+insaAddr2);
		System.out.println("insaPosGbnCode:"+insaPosGbnCode);
		System.out.println("insaDeptCode:"+insaDeptCode);
		System.out.println("insaJoinType:"+insaJoinType);
		System.out.println("insaGartLevel:"+insaGartLevel);
		System.out.println("insaPutYn:"+insaPutYn);
		System.out.println("insaMilYn:"+insaMilYn);
		System.out.println("insaMilType:"+insaMilType);
		System.out.println("insaMilLevel:"+insaMilLevel);
		System.out.println("insaMilStartdate:"+insaMilStartdate);
		System.out.println("insaMilEnddate:"+insaMilEnddate);
		System.out.println("insaKosaRegYn:"+insaKosaRegYn);
		System.out.println("insaKosaClassCode:"+insaKosaClassCode);
		System.out.println("insaJoinDay:"+insaJoinDay);
		System.out.println("insaRetireDay:"+insaRetireDay);
		System.out.println("insaCmpRegNo:"+insaCmpRegNo);
		System.out.println("insaCrmName:"+insaCrmName);
		System.out.println("insaSelfIntro:"+insaSelfIntro);		
		System.out.println("insaSalary:"+insaSalary);
		System.out.println("insaEmail:"+insaEmail);
		System.out.println("insaSalary:"+insaSalary);
		System.out.println("insaJoinDay:"+insaJoinDay);		
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/images/imagefile");
		
		for(MultipartFile f : profileImg1) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				System.out.println("원본파일이름1:"+oriFileName);
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHMMssSSS");
				int rdv = (int)(Math.random() * 1000);
				String profileImg = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;
				System.out.println("바뀐파일이름1:"+profileImg);
				try {
					f.transferTo(new File(saveDir + "/" + profileImg));
					//this.inputStreamToFile((FileInputStream) f.getInputStream(), new File(saveDir + "/" + profileImg));
					System.out.println("profileImg1 제대로 실행");
				}catch(Exception e) {
					e.printStackTrace();
				}
				insa.setInsa_profile(profileImg);
				System.out.println("profileImg1 제대로 완료");
			}
		}//for문
		
		
		for(MultipartFile f : cmpRegImg1) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				System.out.println("원본파일이름2:"+oriFileName);
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHMMssSSS");
				int rdv = (int)(Math.random() * 1000);
				String cmpRegImg = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;
				System.out.println("바뀐파일이름2:"+cmpRegImg);
				try {
					f.transferTo(new File(saveDir + "/" + cmpRegImg));
					//this.inputStreamToFile((FileInputStream) f.getInputStream(), new File(saveDir + "/" + cmpRegImg));
					System.out.println("cmpRegImg1 제대로 실행");
				}catch(Exception e) {
					e.printStackTrace();
				}
				insa.setInsa_cmp_reg_image(cmpRegImg);
				System.out.println("cmpRegImg1 제대로 완료");
			}
		}//for문
		
		for(MultipartFile f : carrierImg1) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				System.out.println("원본파일이름3:"+oriFileName);
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHMMssSSS");
				int rdv = (int)(Math.random() * 1000);
				String carrierImg = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;
				System.out.println("바뀐파일이름3:"+carrierImg);
				try {
					f.transferTo(new File(saveDir + "/" + carrierImg));
					System.out.println("carrierImg1 제대로 실행");
				}catch(Exception e) {
					e.printStackTrace();
				}
				insa.setInsa_carrier(carrierImg);
				System.out.println("carrierImg1 제대로 완료");
			}
		}//for문
		
		//사원 객체 직접 완성
		insa.setInsa_id(insaId);
		insa.setInsa_pwd(insaPwd);
		insa.setInsa_name(insaName);
		insa.setInsa_eng_name(insaEngName);
		insa.setInsa_phone(insaPhone);
		insa.setInsa_hp(insaHp);
		insa.setInsa_reg_no(insaRegNo);
		insa.setInsa_years(insaYears);		
		insa.setInsa_email(insaEmail);
		insa.setInsa_join_gbn_code(insaJoinGbnCode);
		insa.setInsa_sex(insaSex);
		insa.setInsa_zip(insaZip);
		insa.setInsa_addr1(insaAddr1);
		insa.setInsa_addr2(insaAddr2);
		insa.setInsa_pos_gbn_code(insaPosGbnCode);
		insa.setInsa_dept_code(insaDeptCode);
		insa.setInsa_salary(insaSalary);
		insa.setInsa_join_type(insaJoinType);
		insa.setInsa_gart_level(insaGartLevel);
		insa.setInsa_put_yn(insaPutYn);
		insa.setInsa_mil_yn(insaMilYn);
		insa.setInsa_mil_type(insaMilType);
		insa.setInsa_mil_level(insaMilLevel);
		insa.setInsa_mil_startdate(insaMilStartdate);
		insa.setInsa_mil_enddate(insaMilEnddate);
		insa.setInsa_kosa_reg_yn(insaKosaRegYn);
		insa.setInsa_kosa_class_code(insaKosaClassCode);
		insa.setInsa_join_day(insaJoinDay);
		insa.setInsa_retire_day(insaRetireDay);
		insa.setInsa_cmp_reg_no(insaCmpRegNo);
		insa.setInsa_crm_name(insaCrmName);
		insa.setInsa_self_intro(insaSelfIntro);
		//나머지 필요요소는 쿼리문에서 직접 작성함
		//이제 서비스 타고 실제 사원등록 진행
		
		int result = 0;
		
		try {
			result = sawonService.memberInsert(insa);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String msg = "";
		String loc = "";
		String insaSabun = sawonService.maxSabunSelect();
		
		System.out.println("maxinsaSabun:"+insaSabun);
		
		if(result>0) {
			msg = "등록되었습니다";
			/* loc="memberupdateForm.do?insa_sabun="+insaSabun; */
			loc="memberinsertForm.do";
		}else {
			msg = "등록이 실패하였습니다";
			loc="";
		}
		
		System.out.println("result:"+result);
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/alert");
		return mv;
		
		/*
		try {
			//회원 가입이 완료되었을 경우//이 부분만 해결합니다.
			if(enrollment==1) {
				String mess="회원가입이 완료 되었습니다.";
				mv= new ModelAndView("home");
				mv.addObject("signInConfirmed", mess);
				response.sendRedirect("home.go?signInConfirmed="+mess);
				
			//회원가입이 안됬을 경우	
				}else{
				String mess="회원 가입이 실패하였습니다.";
				mv= new ModelAndView("home");
				mv.addObject("signInConfirmed", mess);
				mv.setViewName("home");
				response.sendRedirect("home.go?signInConfirmed="+mess);
				}
		}catch(Exception e) {
			}
		*/	
		
	}
	
	@RequestMapping(value="search.do")
	public ModelAndView select_insa(Model model, HttpServletRequest request,
			HttpServletResponse response, Insa insa,
			@RequestParam(value="page", defaultValue="1") int page)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		String insaSabun = request.getParameter("insa_sabun");
		String insaName = request.getParameter("insa_name");
		String insaJoinType = request.getParameter("insa_join_type");
		String insaPutYn = request.getParameter("insa_put_yn");
		String insaPosGbnCode = request.getParameter("insa_pos_gbn_code");
		String insaJoinDay = request.getParameter("insa_join_day");
		String insaRetireDay = request.getParameter("insa_retire_day");
		String insaJoinGbnCode = request.getParameter("insa_join_gbn_code");
		
		insa.setInsa_sabun(insaSabun);
		insa.setInsa_name(insaName);
		insa.setInsa_join_type(insaJoinType);
		insa.setInsa_put_yn(insaPutYn);
		insa.setInsa_pos_gbn_code(insaPosGbnCode);		
		insa.setInsa_join_day(insaJoinDay);
		insa.setInsa_retire_day(insaRetireDay);
		insa.setInsa_join_gbn_code(insaJoinGbnCode);
		
		System.out.println("insaSabun:" + insaSabun);
		System.out.println("insaName:" + insaName);
		System.out.println("insaJoinType:" + insaJoinType);
		System.out.println("insaPutYn:" + insaPutYn);
		System.out.println("insaPosGbnCode:" + insaPosGbnCode);
		System.out.println("insaJoinDay:" + insaJoinDay);
		System.out.println("insaRetireDay:" + insaRetireDay);
		System.out.println("insaJoinGbnCode:" + insaJoinGbnCode);
		
		int currentPage=page;
	    int listSize = 5;
	    int pageSize = 5;
	    
	    insa.setStartPage((currentPage-1)*listSize+1);
        insa.setEndPage(insa.getStartPage()+listSize-1);
		
		
		//검색 리스트 출력
		ArrayList<Insa> searchList = sawonService.memberSearch(insa);
		
		System.out.println("searchList:"+searchList);
		
		//검색 리스트 갯수
		int totalcnt = sawonService.totalList(insa);
		
		System.out.println("totalcnt:"+totalcnt);
		
		int maxPage = (int)((double)totalcnt / listSize + 0.9);
	      
	    int curPage = (currentPage-1) / pageSize + 1;
		int totalPage = (int)Math.ceil(maxPage*1.0) / pageSize+1;
		  
		int beginPage = (curPage-1) * pageSize + 1;
		int finalPage = beginPage + pageSize - 1;
		  
		int prevPage = (curPage==1)?1:(curPage-1)*pageSize;
		int nextPage = curPage>totalPage?(curPage*pageSize):(curPage*pageSize)+1;
			
		if(nextPage>=totalPage) {
			nextPage = totalPage;
		}		
		  
		if(maxPage < finalPage) {
			finalPage = maxPage;
		}
		
		String qs = request.getQueryString() == null ? "" : request.getQueryString();
		mv.addObject("url", "?"+qs);
		
		mv.addObject("select_insa", searchList);
		mv.addObject("totalcnt", totalcnt);
		mv.addObject("currentPage", currentPage);
		mv.addObject("listSize", listSize);
		mv.addObject("pageSize", pageSize);
		mv.addObject("maxPage", maxPage);
		mv.addObject("curPage", curPage);
		mv.addObject("totalPage", totalPage);
		mv.addObject("beginPage", beginPage);
		mv.addObject("finalPage", finalPage);
		mv.addObject("prevPage", prevPage);
		mv.addObject("nextPage", nextPage);
	
		System.out.println("totalcnt : " + totalcnt);
		System.out.println("currentPage : " + currentPage);
		System.out.println("listSize : " + listSize);
		System.out.println("pageSize : " + pageSize);
		System.out.println("maxPage : " + maxPage);
		System.out.println("curPage : " + curPage);
		System.out.println("totalPage : " + totalPage);
		System.out.println("beginPage : " + beginPage);
		System.out.println("finalPage : " + finalPage);
		System.out.println("prevPage : " + prevPage);
		System.out.println("nextPage : " + nextPage);
		
		List<Insacom> list = sawonService.insacomList();		
		System.out.println("insacomList:"+list);
		mv.addObject("list", list);
		
		mv.setViewName("select");
	
		return mv;
	}
	
	@RequestMapping(value = "memberupdateForm.do")
	public ModelAndView memberupdateForm(Insa insa, @RequestParam(value="insa_sabun") String insa_sabun,
			@RequestParam(value="currentPage") String currentPage) {
		
		System.out.println("currentPage:"+currentPage);    
		
		ModelAndView mv = new ModelAndView();
		
		Insa detailInsa = sawonService.selectInsaSabun(insa_sabun);
		
		String allEmail = detailInsa.getInsa_email();
		
		System.out.println("email:"+allEmail);
		
		String[] email = allEmail.split("@");
		String email1 = email[0];
		String email2 = "@"+email[1];
		
		System.out.println("detailInsa:" + detailInsa);
		
		List<Insacom> list = sawonService.insacomList();		
		System.out.println("insacomList:"+list);
		mv.addObject("list", list);		
		mv.addObject("insa", detailInsa);
		mv.addObject("email1", email1);
		mv.addObject("email2", email2);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("update");
		
		return mv;
		
	}
	
	@RequestMapping(value="memberupdate.do", method = RequestMethod.POST)
	public ModelAndView memberupdate(@RequestParam(value = "insa_profile2", required = false) MultipartFile[] profileImg1,
			@RequestParam(value="currentPage") String currentPage,
			HttpServletResponse response, HttpServletRequest request,
			Insa insa) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		//사원을 등록하기 위해서 결론적으로 Insa 객체를 완성한 이후에 쿼리문에서 전송하여 올릴 것이므로
		//최종적으로 Insa 객체를 완성시키는 형식으로 진행		
		
		//사원번호 가져오기
		String insaSabun = request.getParameter("insa_sabun");
		//아이디 가져오기
		String insaId = request.getParameter("insa_id");
		//패스워드 가져오기
		String insaPwd = request.getParameter("insa_pwd");
		//한글성명 가져오기
		String insaName = request.getParameter("insa_name");
		//영문성명 가져오기
		String insaEngName = request.getParameter("insa_eng_name");
		//전화번호 가져오기
		String insaPhone = request.getParameter("insa_phone");
		//핸드폰번호 가져오기
		String insaHp = request.getParameter("insa_hp");
		//주민등록번호 가져오기
		String insaRegNo = request.getParameter("insa_reg_no2");
		//연령 가져오기
		String insaYears = request.getParameter("insa_years");
		//이메일 가져오기
		String insaEmail = request.getParameter("insa_email")+request.getParameter("insa_email2");
		//직종체크 가져오기
		String insaJoinGbnCode = request.getParameter("insa_join_gbn_code");
		//성별 가져오기
		String insaSex = request.getParameter("insa_sex");
		//우편번호 가져오기
		String insaZip = request.getParameter("insa_zip");
		//주소 가져오기
		String insaAddr1 = request.getParameter("insa_addr1");
		//세부주소 가져오기
		String insaAddr2 = request.getParameter("insa_addr2");
		//직위 가져오기
		String insaPosGbnCode = request.getParameter("insa_pos_gbn_code");
		//부서 가져오기
		String insaDeptCode = request.getParameter("insa_dept_code");
		//연봉 가져오기
		String insaSalary = request.getParameter("insa_salary");
		//입사구분 가져오기
		String insaJoinType = request.getParameter("insa_join_type");
		//등급 가져오기
		String insaGartLevel = request.getParameter("insa_gart_level");
		//투입여부 가져오기
		String insaPutYn = request.getParameter("insa_put_yn");
		//군필여부 가져오기
		String insaMilYn = request.getParameter("insa_mil_yn");
		//군별 가져오기
		String insaMilType = request.getParameter("insa_mil_type");
		//계급 가져오기
		String insaMilLevel = request.getParameter("insa_mil_level");
		//입영일자 가져오기
		String insaMilStartdate = request.getParameter("insa_mil_startdate");
		//전역일자 가져오기
		String insaMilEnddate = request.getParameter("insa_mil_enddate");
		//KOSA등록 가져오기
		String insaKosaRegYn = request.getParameter("insa_kosa_reg_yn");
		//KOSA등급 가져오기
		String insaKosaClassCode = request.getParameter("insa_kosa_class_code");
		//입사일
		String insaJoinDay = request.getParameter("insa_join_day");
		//퇴사일
		String insaRetireDay = request.getParameter("insa_retire_day");
		//사업자번호
		String insaCmpRegNo = request.getParameter("insa_cmp_reg_no");
		//업체명
		String insaCrmName = request.getParameter("insa_crm_name");
		//자기소개
		String insaSelfIntro = request.getParameter("insa_self_intro");
		
		System.out.println("insaSabun:"+insaSabun);
		System.out.println("insaId:"+insaId);
		System.out.println("insd_pwd:"+insaPwd);
		System.out.println("insaEmail:"+insaEmail);
		System.out.println("insaSalary:"+insaSalary);
		System.out.println("insaJoinDay:"+insaJoinDay);
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/images/imagefile");
		
		for(MultipartFile f : profileImg1) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				System.out.println("원본파일이름1:"+oriFileName);
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHMMssSSS");
				int rdv = (int)(Math.random() * 1000);
				String profileImg = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;
				System.out.println("바뀐파일이름1:"+profileImg);
				try {
					f.transferTo(new File(saveDir + "/" + profileImg));
					//this.inputStreamToFile((FileInputStream) f.getInputStream(), new File(saveDir + "/" + profileImg));
					System.out.println("profileImg1 제대로 실행");
				}catch(Exception e) {
					e.printStackTrace();
				}
				insa.setInsa_profile(profileImg);
				System.out.println("profileImg1 제대로 완료");
			}
		}//for문
				
		//사원 객체 직접 완성
		insa.setInsa_sabun(insaSabun);
		insa.setInsa_id(insaId);
		insa.setInsa_pwd(insaPwd);
		insa.setInsa_name(insaName);
		insa.setInsa_eng_name(insaEngName);
		insa.setInsa_phone(insaPhone);
		insa.setInsa_hp(insaHp);
		insa.setInsa_reg_no(insaRegNo);
		insa.setInsa_years(insaYears);		
		insa.setInsa_email(insaEmail);
		insa.setInsa_join_gbn_code(insaJoinGbnCode);
		insa.setInsa_sex(insaSex);
		insa.setInsa_zip(insaZip);
		insa.setInsa_addr1(insaAddr1);
		insa.setInsa_addr2(insaAddr2);
		insa.setInsa_pos_gbn_code(insaPosGbnCode);
		insa.setInsa_dept_code(insaDeptCode);
		insa.setInsa_salary(insaSalary);
		insa.setInsa_join_type(insaJoinType);
		insa.setInsa_gart_level(insaGartLevel);
		insa.setInsa_put_yn(insaPutYn);
		insa.setInsa_mil_yn(insaMilYn);
		insa.setInsa_mil_type(insaMilType);
		insa.setInsa_mil_level(insaMilLevel);
		insa.setInsa_mil_startdate(insaMilStartdate);
		insa.setInsa_mil_enddate(insaMilEnddate);
		insa.setInsa_kosa_reg_yn(insaKosaRegYn);
		insa.setInsa_kosa_class_code(insaKosaClassCode);
		insa.setInsa_join_day(insaJoinDay);
		insa.setInsa_retire_day(insaRetireDay);
		insa.setInsa_cmp_reg_no(insaCmpRegNo);
		insa.setInsa_crm_name(insaCrmName);
		insa.setInsa_self_intro(insaSelfIntro);
		//나머지 필요요소는 쿼리문에서 직접 작성함
		//이제 서비스 타고 실제 사원등록 진행
		
		int result = 0;
		
		try {
			result = sawonService.memberUpdate(insa);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "수정되었습니다";
			loc="memberupdateForm.do?insa_sabun="+insaSabun+"&currentPage="+currentPage;
		}else {
			msg = "수정이 실패하였습니다";
			loc="";
		}
		
		System.out.println("result:"+result);
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/alert");
		
		return mv;

		
		/*
		try {
			//회원 가입이 완료되었을 경우//이 부분만 해결합니다.
			if(enrollment==1) {
				String mess="회원가입이 완료 되었습니다.";
				mv= new ModelAndView("home");
				mv.addObject("signInConfirmed", mess);
				response.sendRedirect("home.go?signInConfirmed="+mess);
				
			//회원가입이 안됬을 경우	
				}else{
				String mess="회원 가입이 실패하였습니다.";
				mv= new ModelAndView("home");
				mv.addObject("signInConfirmed", mess);
				mv.setViewName("home");
				response.sendRedirect("home.go?signInConfirmed="+mess);
				}
		}catch(Exception e) {
			}
		*/	
	
	}
	
	@RequestMapping("cmpregimagedw.do")
	public ModelAndView fileDownload(
			@RequestParam(value="insa_cmp_reg_image")String insa_cmp_reg_image) {
		
		System.out.println("insa_cmp_reg_image:"+insa_cmp_reg_image);
		
		File file=new File("C:\\Users\\lis32\\Documents\\workspace-sts-3.9.7.RELEASE\\sawon\\src\\main\\webapp\\resources\\images\\imagefile\\"+insa_cmp_reg_image);
		
		ModelAndView mv=new ModelAndView("download","downloadFile",file);
		return mv;
	}
	
	@RequestMapping("carrierdw.do")
	public ModelAndView fileDownload2(
			@RequestParam(value="insa_carrier")String insa_carrier) {
		
		System.out.println("insa_carrier:"+insa_carrier);
		
		File file=new File("C:\\Users\\lis32\\Documents\\workspace-sts-3.9.7.RELEASE\\sawon\\src\\main\\webapp\\resources\\images\\imagefile\\"+insa_carrier);
		
		ModelAndView mv=new ModelAndView("download","downloadFile",file);
		return mv;
	}
	
	@RequestMapping(value="memberdelete.do")
	public ModelAndView memberdelete(@RequestParam(value="insa_sabun") String insa_sabun,
			@RequestParam(value="currentPage") String currentPage) {
		System.out.println("memberdelete 실행");
		
		int result = sawonService.memberDelete(insa_sabun);
		
		System.out.println("delete result:"+result);
		System.out.println("currentPage:"+currentPage);
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "삭제되었습니다";
			loc="search.do?page="+currentPage;
		}else {
			msg = "삭제에 실패하였습니다";
			loc="";
		}
		
		System.out.println("result:"+result);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/alert");
		
		return mv;
	}
	
	@RequestMapping(value="deleteChecked.do")
	public String deleteChecked(HttpServletRequest request, Integer[] cksabun, String qs) throws Exception{
		System.out.println("checked:" + Arrays.toString(cksabun));
		sawonService.deleteChecked(cksabun);
				
		System.out.println("url:" + qs);
		
		return "redirect:search.do" + qs;
	}

}
