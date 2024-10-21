package pict_admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;


import org.json.JSONObject;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.PasswordAuthentication;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import pict_admin.service.AdminService;
import pict_admin.service.AdminVO;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.apache.commons.codec.binary.Base64;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONArray;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;






//import io.socket.emitter.Emitter;
//import io.socket.emitter.Emitter.Listener;
//import io.socket.client.IO;
//import io.socket.client.Socket;

import java.net.URL;
import java.net.URLEncoder;
import java.net.HttpURLConnection;

@Controller
public class pictController {
	PasswordAuthentication pa;
	
	@Resource(name = "pictService")
	private PictService pictService;
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
	//사용자 
	//메인
	@RequestMapping(value = "/main.do")
	public String main(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		List<PictVO> company_list = pictService.company_list(pictVO);
		model.addAttribute("company_list", company_list);
		
		List<?> board_list = pictService.board_list(pictVO);
		model.addAttribute("board_list", board_list);
		
		return "pict/main/main";
	}
	//개요
	@RequestMapping(value = "/outline.do")
	public String outline(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/outline";
	}
	//안내도
	@RequestMapping(value = "/map.do")
	public String map(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/map";
	}
	//일정
	@RequestMapping(value = "/schedule.do")
	public String schedule(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/schedule";
	}
	//오시는길
	@RequestMapping(value = "/location.do")
	public String location(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/location";
	}

	//전시관 배치도
	@RequestMapping(value = "/exhibition.do")
	public String exhibition(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/exhibition";
	}
	//참가 기업 안내
	@RequestMapping(value = "/company.do")
	public String company(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/company";
	}
	//로컬브랜드페스타
	@RequestMapping(value = "/local.do")
	public String local(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/local";
	}
	
	//개막식
	@RequestMapping(value = "/opening.do")
	public String opening(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/opening";
	}
	//펀딩
	@RequestMapping(value = "/funding_intro.do")
	public String funding_intro(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/funding_intro";
	}
	//특별강연
	@RequestMapping(value = "/lecture.do")
	public String lecture(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/lecture";
	}
	//기업 프로그램
	@RequestMapping(value = "/company_program.do")
	public String company_program(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/company_program";
	}
	//기업 프로그램
	@RequestMapping(value = "/exp_program.do")
	public String exp_program(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/exp_program";
	}

	//공지
	@RequestMapping(value = "/notice.do")
	public String notice(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/notice";
	}
	//공지 뷰
	@RequestMapping(value = "/notice_view.do")
	public String notice_view(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/main/notice_view";
	}
    
	
	
	@RequestMapping(value = "/company_register.do", method = RequestMethod.POST)
	public String company_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
			@RequestParam("attach_file") MultipartFile attach_file) throws Exception {
		
		String file_dir = "/user1/upload_file/gwexpo/";
		//String file_dir = "D:\\user1\\upload_file\\gwexpo\\";
		
		
        if(attach_file.getSize() != 0) {
			String uploadPath = fileUpload(request, attach_file, (String)request.getSession().getAttribute("id"));
			String filepath = file_dir + "/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile_url(filepath+filename);
		}
      
        pictService.company_insert(pictVO);
		model.addAttribute("message", "정상적으로 저장되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/");
		return "pict/main/message";	
	}
	
	//관리자
	@RequestMapping(value = "/pict_main.do")
	public String pict_main(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		System.out.println(sessions);
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		else {
			String user_id = (String)request.getSession().getAttribute("id");
			if(request.getSession().getAttribute("id") != null) {
				adminVO.setAdminId((String)request.getSession().getAttribute("id"));
				adminVO = adminService.get_user_info(adminVO);
				model.addAttribute("adminVO", adminVO);
			}
		
			return "redirect:/admin/company_list.do";
		
		}
	}
	
	@RequestMapping(value = "/pict_login.do")
	public String login_main(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model, HttpServletResponse response) throws Exception {

		String sessions = (String)request.getSession().getAttribute("id");
		if(sessions == null || sessions == "null") {
			return "pict/admin/login";
		}
		else {
			//나중에 여기 계정별로 리다이렉트 분기처리
			return "redirect:/admin/company_list.do";
			
		}
			
	}
	
	@RequestMapping(value = "/login.do")
	public String login(@ModelAttribute("adminVO") AdminVO adminVO, HttpServletRequest request,  ModelMap model) throws Exception {
		//처음 드러와서 세션에 정보있으면 메인으로 보내줘야함
		String inpuId = adminVO.getAdminId();
		String inputPw = adminVO.getAdminPw();
		
		adminVO = adminService.get_user_info(adminVO);

		if (adminVO != null && adminVO.getId() != null && !adminVO.getId().equals("")) {
			String user_id = adminVO.getId();
			String enpassword = encryptPassword(inputPw, inpuId);	//입력비밀번호
			
			if(enpassword.equals(adminVO.getPassword())) {
				request.getSession().setAttribute("id", adminVO.getId());
				request.getSession().setAttribute("name", adminVO.getName());
				request.getSession().setAttribute("depart", adminVO.getDepart());

				String ip = request.getRemoteAddr();
			    DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			    String now = format2.format(Calendar.getInstance().getTime());
			    
			    adminVO.setLast_login_ip(ip);
			    adminVO.setLast_login_date(now);
			    adminService.insert_login_info(adminVO);
			    
			    adminVO.setAdminId(user_id);
			    adminVO = adminService.get_user_info(adminVO);
			    
				return "redirect:/pict_main.do";
				
			}
			else {
				model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/pict_login.do");
				return "pict/main/message";
			}
		}
		else {
			model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/pict_login.do");
			return "pict/main/message";
		}
	}
	@RequestMapping(value = "/logout.do")
	public String logout(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request,  ModelMap model) throws Exception {
		request.getSession().setAttribute("id", null);
		request.getSession().setAttribute("name", null);
		
		return "redirect:/pict_login.do";
		
	}
	
	
	//기업관리
	@RequestMapping(value = "/admin/company_list.do")
	public String company_list(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		List<PictVO> board_list = pictService.company_list(pictVO);
		model.addAttribute("resultList", board_list);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/admin/company_list";
	}
	@RequestMapping(value = "/admin/company_register.do")
	public String company_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.company_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		
		model.addAttribute("pictVO", pictVO);
		return "pict/admin/company_register";
	}
	@RequestMapping(value = "/admin/company_save.do", method = RequestMethod.POST)
	public String board_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
			@RequestParam("attach_file") MultipartFile attach_file1) throws Exception {
		
		String sessions = (String) request.getSession().getAttribute("authority");
		if (sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		String file_dir = "/user1/upload_file/gwexpo/";
		
		
        if(attach_file1.getSize() != 0) {
			String uploadPath = fileUpload(request, attach_file1, (String)request.getSession().getAttribute("id"));
			String filepath = file_dir + "/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile_url(filepath+filename);
		}

        if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.company_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/admin/company_list.do");
			return "pict/main/message";
		}
		else {
			pictService.company_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/admin/company_list.do");
			return "pict/main/message";	
		}
		
		
		
	}
	@RequestMapping(value = "/admin/company_delete.do")
	public String company_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		pictService.company_delete(pictVO);
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/admin/company_list.do");
		return "pict/main/message";
	}
	
	@RequestMapping(value = "/admin/company_excel.do")
	public void company_excel(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<PictVO> attendance_list = (List<PictVO>) pictService.company_list(pictVO);
		HSSFWorkbook objWorkBook = new HSSFWorkbook();
        HSSFSheet objSheet = null;
        HSSFRow objRow = null;
        HSSFCell objCell = null;       //셀 생성

        //제목 폰트
        HSSFFont font = objWorkBook.createFont();
        font.setFontHeightInPoints((short)9);
        font.setFontName("맑은고딕");
		int rowIndex = 0;
		
		HSSFCellStyle styleHd = objWorkBook.createCellStyle();    //제목 스타일
        styleHd.setFont(font);
        objSheet = objWorkBook.createSheet("첫번째 시트");     //워크시트 생성
		
		
		//헤더
        objRow = objSheet.createRow(0);
        objRow.setHeight ((short) 0x150);
        
        objCell = objRow.createCell(0);
        objCell.setCellValue("순서");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(1);
        objCell.setCellValue("기업명");
        objCell.setCellStyle(styleHd);
		
        objCell = objRow.createCell(2);
        objCell.setCellValue("설립일자");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(3);
        objCell.setCellValue("사업자등록번호");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(4);
        objCell.setCellValue("대표자명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(5);
        objCell.setCellValue("사업장주소");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(6);
        objCell.setCellValue("담당자명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(7);
        objCell.setCellValue("담당자 직책");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(8);
        objCell.setCellValue("담당자 연락처");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(9);
        objCell.setCellValue("담당자 이메일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(10);
        objCell.setCellValue("업종");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(11);
        objCell.setCellValue("참가형태");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(12);
        objCell.setCellValue("필요부스 개수");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(13);
        objCell.setCellValue("기타문의");
        objCell.setCellStyle(styleHd);
        
		//바디
		for(int i=0; i<attendance_list.size(); i++) {
			//순서
			objRow = objSheet.createRow(i+1);
	        objRow.setHeight ((short) 0x150);
	        objSheet.autoSizeColumn(i);
	        

	        objCell = objRow.createCell(0);
	        objCell.setCellValue(i+1);
	        objSheet.setColumnWidth(0, (short)0x850);
	        objCell.setCellStyle(styleHd);

	        objCell = objRow.createCell(1);
	        objCell.setCellValue(attendance_list.get(i).getTitle());
	        objSheet.setColumnWidth(1, (short)0x1500);
	        objCell.setCellStyle(styleHd);
		
	        objCell = objRow.createCell(2);
	        objCell.setCellValue(attendance_list.get(i).getEstablishment_date());
	        objSheet.setColumnWidth(2, (short)0x1000);
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(3);
	        objCell.setCellValue(attendance_list.get(i).getBiz_num());
	        objSheet.setColumnWidth(3, (short)0x1000);
	        objCell.setCellStyle(styleHd);

	        objCell = objRow.createCell(4);
	        objCell.setCellValue(attendance_list.get(i).getCeo());
	        objSheet.setColumnWidth(4, (short)0x1000);
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(5);
	        objCell.setCellValue(attendance_list.get(i).getAddress());
	        objSheet.setColumnWidth(5, (short)0x2500);
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(6);
	        objCell.setCellValue(attendance_list.get(i).getName());
	        objSheet.setColumnWidth(6, (short)0x1000);
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(7);
	        objCell.setCellValue(attendance_list.get(i).getDepart());
	        objSheet.setColumnWidth(7, (short)0x1000);
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(8);
	        objCell.setCellValue(attendance_list.get(i).getMobile());
	        objSheet.setColumnWidth(8, (short)0x1000);
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(9);
	        objCell.setCellValue(attendance_list.get(i).getEmail());
	        objSheet.setColumnWidth(9, (short)0x1200);
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(10);
	        String industry ="";
	        if(attendance_list.get(i).getIndustry().contains("1")) industry += " 바이오의약";
	        if(attendance_list.get(i).getIndustry().contains("2")) industry += " 체외진단";
	        if(attendance_list.get(i).getIndustry().contains("3")) industry += " 건강기능식품 및 소재";
	        if(attendance_list.get(i).getIndustry().contains("4")) industry += " 화장품 및 화장품 소재";
	        if(attendance_list.get(i).getIndustry().contains("5")) industry += " 바이오소재(환경,농업)";
	        if(attendance_list.get(i).getIndustry().contains("6")) industry += " 식품·로컬";
	        if(attendance_list.get(i).getIndustry().contains("7")) industry += " 창작·공예";
	        if(attendance_list.get(i).getIndustry().contains("8")) industry += " IT·AI·기술·관광·콘텐츠";
	        objCell.setCellValue(industry);
	        objSheet.setColumnWidth(10, (short)0x2500);
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(11);
	        String joins ="";
	        if(attendance_list.get(i).getIndustry().contains("1")) joins += " 기업전시 · 홍보(현장 판매 제품 없음)";
	        if(attendance_list.get(i).getIndustry().contains("2")) joins += " 기업전시 · 제품 판매(현장 판매 제품 있음)";
	        if(attendance_list.get(i).getIndustry().contains("3")) joins += " IR 피칭";
	        if(attendance_list.get(i).getIndustry().contains("4")) joins += " 취업박람회(신청기업 대상 상세조사 예정)";
	        if(attendance_list.get(i).getIndustry().contains("5")) joins += " 라이브커머스";
	        objCell.setCellValue(joins);
	        objSheet.setColumnWidth(11, (short)0x2500);
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(12);
	        objCell.setCellValue(attendance_list.get(i).getBooth());
	        objSheet.setColumnWidth(12, (short)0x850);
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(13);
	        objCell.setCellValue(attendance_list.get(i).getEtc());
	        objSheet.setColumnWidth(13, (short)0x2500);
	        objCell.setCellStyle(styleHd);
	        
		}
		
		String filename = "강원바이오엑스포&제2회창업엑스포 기업리스트";
		String header = request.getHeader("User-Agent");
		if(header.contains("Edge") || header.contains("MSIE")) {
			filename = URLEncoder.encode(filename, "UTF-8").replaceAll("//+", "%20");
		}
		else if(header.contains("Chrome") || header.contains("Opera") || header.contains("Firefox")) {
			filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
		}
        
        response.setHeader("Content-Disposition", "ATTachment; Filename=" +filename +".xls");

        OutputStream fileOut  = response.getOutputStream();
        objWorkBook.write(fileOut);
        fileOut.close();

        response.getOutputStream().flush();
        response.getOutputStream().close();
	}
	
	//펀딩관리
	@RequestMapping(value = "/admin/funding_list_user_star.do")
	public String funding_list_user_star(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);

		List<?> board_list = pictService.funding_list_user_star(pictVO);
		model.addAttribute("resultList", board_list);
	
		model.addAttribute("pictVO", pictVO);
		
		return "pict/admin/funding_list_user_star";
	}
	@RequestMapping(value = "/admin/funding_list_user.do")
	public String funding_list_user(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		pictVO.setInvest("1");
		List<?> company_list = pictService.company_list(pictVO);
		List<?> board_list = pictService.funding_list_user(pictVO);
		model.addAttribute("resultList", board_list);
		model.addAttribute("resultList2", company_list);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/admin/funding_list_user";
	}
	@RequestMapping(value = "/admin/funding_list_company.do")
	public String funding_list_company(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> board_list = pictService.funding_list_company(pictVO);
		model.addAttribute("resultList", board_list);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/admin/funding_list_company";
	}
	
	
	//공지사항
    @RequestMapping(value = "/board/board_list.do")
	public String reference_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> reference_list = pictService.board_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/board/board_list";
	}
	@RequestMapping(value = "/board/board_register.do")
	public String reference_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.board_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		
		model.addAttribute("pictVO", pictVO);
		return "pict/board/board_register";
	}
	@RequestMapping(value = "/board/board_save.do", method = RequestMethod.POST)
	public String reference_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
			@RequestParam("attach_file1") MultipartFile attach_file1,
			@RequestParam("attach_file2") MultipartFile attach_file2,
			@RequestParam("attach_file3") MultipartFile attach_file3,
			@RequestParam("attach_file4") MultipartFile attach_file4) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		if(attach_file1.getSize() != 0) {	//애드벌룬
			String uploadPath = fileUpload(request, attach_file1, (String)request.getSession().getAttribute("id"));
			String filepath = "/user1/upload_file/gwexpo/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setImg_url(filepath+filename);
		}
		if(attach_file2.getSize() != 0) {	//애드벌룬
			String uploadPath = fileUpload(request, attach_file2, (String)request.getSession().getAttribute("id"));
			String filepath = "/user1/upload_file/gwexpo/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile_url1(filepath+filename);
		}
		if(attach_file3.getSize() != 0) {	//애드벌룬
			String uploadPath = fileUpload(request, attach_file3, (String)request.getSession().getAttribute("id"));
			String filepath = "/user1/upload_file/gwexpo/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile_url2(filepath+filename);
		}
		if(attach_file4.getSize() != 0) {	//애드벌룬
			String uploadPath = fileUpload(request, attach_file4, (String)request.getSession().getAttribute("id"));
			String filepath = "/user1/upload_file/gwexpo/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile_url3(filepath+filename);
		}

		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.board_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/board/board_list.do");
			return "pict/main/message";
		}
		else {
			pictService.board_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/board/board_list.do");
			return "pict/main/message";	
		}
		
	}	
	@RequestMapping(value = "/board/board_delete.do")
	public String board_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.board_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/board/board_list.do");
		return "pict/main/message";
		
	}
	
	
	//참가자관리
	@RequestMapping(value = "/user/user_list.do")
	public String user_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> board_list = pictService.user_list(pictVO);
		model.addAttribute("resultList", board_list);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/user/user_list";
	}
	@RequestMapping(value = "/user/user_register.do")
	public String user_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		
		
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.user_list_one(pictVO);
			pictVO.setSaveType("update");
		}
		else {
			pictVO.setSaveType("insert");
			//인설트
		}
		model.addAttribute("pictVO", pictVO);
			
		return "pict/user/user_register";
	}
	@RequestMapping(value = "/user/user_save.do", method = RequestMethod.POST)
	public String user_save(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			
			try {
				URL url = new URL("https://api.fairpass.co.kr/fsApi/VisitorUpdate");
				HttpURLConnection conn = (HttpURLConnection)url.openConnection();
				
				conn.setRequestMethod("POST"); // http 메서드
				conn.setRequestProperty("Content-Type", "application/json"); // header Content-Type 정보
				conn.setRequestProperty("ApiKey", " rioE2lpgWGInf2Gd7XF9cOCDvqXGUzKXYPrqBCW"); // header의 auth 정보
				
				conn.setDoInput(true); // 서버에 전달할 값이 있다면 true
				conn.setDoOutput(true);// 서버에서 받을 값이 있다면 true
				
				JSONObject obj_param = new JSONObject();
				obj_param.put("EVENT_IDX", "2495");	//행사코드 고정
				obj_param.put("VISITOR_IDX", pictVO.getFairpath_id());
				
				String option = "5261";
				if(pictVO.getClassify().equals("1")) option = "5261";	
				else if(pictVO.getClassify().equals("2")) option = "5268";
				else if(pictVO.getClassify().equals("3")) option = "5269";
				else if(pictVO.getClassify().equals("4")) option = "5270";
				else if(pictVO.getClassify().equals("5")) option = "5271";
				else if(pictVO.getClassify().equals("6")) option = "5272";
				else if(pictVO.getClassify().equals("7")) option = "5273";
				else if(pictVO.getClassify().equals("8")) option = "5274";
				
				System.out.println(option);
				obj_param.put("OPTION_IDX", option);
				obj_param.put("NAME", pictVO.getName());
				obj_param.put("TEL", pictVO.getMobile());
				obj_param.put("EMAIL", pictVO.getEmail());
				obj_param.put("GENDER", pictVO.getGender());
				
				//회사부서직급
				obj_param.put("INFO3", pictVO.getCompany());
				obj_param.put("INFO5", pictVO.getCompany_depart());
				obj_param.put("INFO7", pictVO.getCompany_rank());
				
				//서버에 데이터 전달
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				bw.write(obj_param.toString()); // 버퍼에 담기
				bw.flush(); // 버퍼에 담긴 데이터 전달
				bw.close();
				
				// 서버로부터 데이터 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = null;
				
				while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
					sb.append(line);
				}
				JSONObject obj = new JSONObject(sb.toString()); // json으로 변경 (역직렬화)
				int state_code = obj.getInt("resultCode");
				if(state_code != 0) {
					model.addAttribute("message", "저장 중 오류가 발생하였습니다.");
					model.addAttribute("retType", ":location");
					model.addAttribute("retUrl", "/user/user_list.do");
					return "pict/main/message";
				}
				else {
					
					pictService.user_update(pictVO);
					model.addAttribute("message", "정상적으로 수정되었습니다.");
					model.addAttribute("retType", ":location");
					model.addAttribute("retUrl", "/user/user_list.do");
					return "pict/main/message";
				}
			}
			catch(Exception e) {
				System.out.println(e);
				model.addAttribute("message", "저장 중 오류가 발생하였습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/user/user_list.do");
				return "pict/main/message";
			}
			
			
			
		}
		else {
			try {
				URL url = new URL("https://api.fairpass.co.kr/fsApi/VisitorInsert");
				HttpURLConnection conn = (HttpURLConnection)url.openConnection();
				
				conn.setRequestMethod("POST"); // http 메서드
				conn.setRequestProperty("Content-Type", "application/json"); // header Content-Type 정보
				conn.setRequestProperty("ApiKey", " rioE2lpgWGInf2Gd7XF9cOCDvqXGUzKXYPrqBCW"); // header의 auth 정보
				
				conn.setDoInput(true); // 서버에 전달할 값이 있다면 true
				conn.setDoOutput(true);// 서버에서 받을 값이 있다면 true
				
				JSONObject obj_param = new JSONObject();
				obj_param.put("EVENT_IDX", "2495");	//행사코드 고정
				
				String option = "5261";
				if(pictVO.getClassify().equals("1")) option = "5261";	
				else if(pictVO.getClassify().equals("2")) option = "5268";
				else if(pictVO.getClassify().equals("3")) option = "5269";
				else if(pictVO.getClassify().equals("4")) option = "5270";
				else if(pictVO.getClassify().equals("5")) option = "5271";
				else if(pictVO.getClassify().equals("6")) option = "5272";
				else if(pictVO.getClassify().equals("7")) option = "5273";
				else if(pictVO.getClassify().equals("8")) option = "5274";
				
				System.out.println(option);
				obj_param.put("OPTION_IDX", option);
				obj_param.put("NAME", pictVO.getName());
				obj_param.put("TEL", pictVO.getMobile());
				obj_param.put("EMAIL", pictVO.getEmail());
				obj_param.put("GENDER", pictVO.getGender());
				
				//회사부서직급
				obj_param.put("INFO3", pictVO.getCompany());
				obj_param.put("INFO5", pictVO.getCompany_depart());
				obj_param.put("INFO7", pictVO.getCompany_rank());
				
				//서버에 데이터 전달
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				bw.write(obj_param.toString()); // 버퍼에 담기
				bw.flush(); // 버퍼에 담긴 데이터 전달
				bw.close();
				
				// 서버로부터 데이터 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = null;
				
				while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
					sb.append(line);
				}
				JSONObject obj = new JSONObject(sb.toString()); // json으로 변경 (역직렬화)
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				System.out.println(obj);
				int state_code = obj.getInt("resultCode");
				if(state_code != 0) {
					model.addAttribute("message", "저장 중 오류가 발생하였습니다.");
					model.addAttribute("retType", ":location");
					model.addAttribute("retUrl", "/user/user_list.do");
					return "pict/main/message";
				}
				else {
					pictVO.setFairpath_id(obj.getInt("VISITOR_IDX")+"");
					pictVO.setPoint("30000");
					pictService.user_insert(pictVO);
					model.addAttribute("message", "정상적으로 저장되었습니다.");
					model.addAttribute("retType", ":location");
					model.addAttribute("retUrl", "/user/user_list.do");
					return "pict/main/message";
				}
			}
			catch(Exception e) {
				System.out.println(e);
				model.addAttribute("message", "저장 중 오류가 발생하였습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/user/user_list.do");
				return "pict/main/message";
			}
		}
		
	}	
	@RequestMapping(value = "/user/user_delete.do", method = RequestMethod.POST)
	public String user_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		try {
			URL url = new URL("https://api.fairpass.co.kr/fsApi/VisitorDelete");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST"); // http 메서드
			conn.setRequestProperty("Content-Type", "application/json"); // header Content-Type 정보
			conn.setRequestProperty("ApiKey", " rioE2lpgWGInf2Gd7XF9cOCDvqXGUzKXYPrqBCW"); // header의 auth 정보
			
			conn.setDoInput(true); // 서버에 전달할 값이 있다면 true
			conn.setDoOutput(true);// 서버에서 받을 값이 있다면 true
			
			JSONObject obj_param = new JSONObject();
			obj_param.put("EVENT_IDX", "2495");	//행사코드 고정
			obj_param.put("VISITOR_IDX", pictVO.getFairpath_id());

			//서버에 데이터 전달
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(obj_param.toString()); // 버퍼에 담기
			bw.flush(); // 버퍼에 담긴 데이터 전달
			bw.close();
			
			// 서버로부터 데이터 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
				sb.append(line);
			}
			
			JSONObject obj = new JSONObject(sb.toString()); // json으로 변경 (역직렬화)
			int state_code = obj.getInt("resultCode");
			if(state_code != 0) {
				model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/user/user_list.do");
				return "pict/main/message";
			}
			else {
				pictService.user_delete(pictVO);
				model.addAttribute("message", "정상적으로 삭제되었습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/user/user_list.do");
				return "pict/main/message";
			}
		}
		catch(Exception e) {
			System.out.println(e);
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/user/user_list.do");
			return "pict/main/message";
		}
		
	}	
	
	//사용자 사전등록 및 현장등록
	//투자 로그인 처리
	@RequestMapping(value = "/user_register.do", method= RequestMethod.POST)
	@ResponseBody
	public String user_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {	
		String classify = param.get("classify").toString();
		String name = param.get("name").toString();
		String gender = param.get("gender").toString();
		String mobile = param.get("mobile").toString();
		String email = param.get("email").toString();
		String company = param.get("company").toString();
		String company_depart = param.get("company_depart").toString();
		String company_rank = param.get("company_rank").toString();
		try {
			URL url = new URL("https://api.fairpass.co.kr/fsApi/VisitorInsert");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST"); // http 메서드
			conn.setRequestProperty("Content-Type", "application/json"); // header Content-Type 정보
			conn.setRequestProperty("ApiKey", " rioE2lpgWGInf2Gd7XF9cOCDvqXGUzKXYPrqBCW"); // header의 auth 정보
			
			conn.setDoInput(true); // 서버에 전달할 값이 있다면 true
			conn.setDoOutput(true);// 서버에서 받을 값이 있다면 true
			
			JSONObject obj_param = new JSONObject();
			obj_param.put("EVENT_IDX", "2495");	//행사코드 고정
			
			String option = "5261";
			if(classify.equals("1")) option = "5261";	
			else if(classify.equals("2")) option = "5268";
			else if(classify.equals("3")) option = "5269";
			else if(classify.equals("4")) option = "5270";
			else if(classify.equals("5")) option = "5271";
			else if(classify.equals("6")) option = "5272";
			else if(classify.equals("7")) option = "5273";
			else if(classify.equals("8")) option = "5274";
			
			System.out.println(option);
			obj_param.put("OPTION_IDX", option);
			obj_param.put("NAME", name);
			obj_param.put("TEL", mobile);
			obj_param.put("EMAIL", email);
			obj_param.put("GENDER", gender);
			
			//회사부서직급
			obj_param.put("INFO3", company);
			obj_param.put("INFO5", company_depart);
			obj_param.put("INFO7", company_rank);
			
			//서버에 데이터 전달
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(obj_param.toString()); // 버퍼에 담기
			bw.flush(); // 버퍼에 담긴 데이터 전달
			bw.close();
			
			// 서버로부터 데이터 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
				sb.append(line);
			}
			JSONObject obj = new JSONObject(sb.toString()); // json으로 변경 (역직렬화)
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			System.out.println(obj);
			int state_code = obj.getInt("resultCode");
			if(state_code != 0) {
				return "N";
			}
			else {
				pictVO.setFairpath_id(obj.getInt("VISITOR_IDX")+"");
				pictVO.setPoint("30000");
				pictVO.setName(name);
				pictVO.setGender(gender);
				pictVO.setMobile(mobile);
				pictVO.setEmail(email);
				pictVO.setClassify(classify);
				pictVO.setCompany(company);
				pictVO.setCompany_rank(company_rank);
				pictVO.setCompany_depart(company_depart);
				
				pictService.user_insert(pictVO);
				return "Y";
			}
		}
		catch(Exception e) {
			System.out.println(e);
			return "N";
		}
	}
	
	
	//투자 랭크
	@RequestMapping(value = "/invest_rank.do")
	public String invest_rank(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {

		List<?> company_list = pictService.funding_list_company_api(pictVO);
		
		model.addAttribute("company_list", company_list);
		return "pict/main/invest_rank";
	}
	//투자 로그인
	@RequestMapping(value = "/invest_login.do")
	public String invest_login(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("idx");
		if(session != null && session != "null") {
			return "redirect:/user_invest.do";
		}
		

		return "pict/main/invest_login";
	}
	//투자 로그인 처리
	@RequestMapping(value = "/invest_login_action.do", method= RequestMethod.POST)
	@ResponseBody
	public String invest_login_action(@ModelAttribute("searchVO") AdminVO adminVO, ModelMap model, HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {	
		String name = param.get("name").toString();
		String mobile = param.get("mobile").toString();
		adminVO.setName(name);
		adminVO.setMobile(mobile);
		
		adminVO = adminService.get_user_info_funding(adminVO);
		if (adminVO != null && !adminVO.getName().equals("") && !adminVO.getMobile().equals("")) {
			
			if(name.equals(adminVO.getName()) && mobile.equals(adminVO.getMobile())) {
				request.getSession().setAttribute("idx", adminVO.getIdx());
				request.getSession().setAttribute("mobile", adminVO.getMobile());
				request.getSession().setAttribute("name", adminVO.getName());

				return "Y";
				//return "redirect:/user_invest.do";
				
			}
			else {
				return "N";
				//model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
				//model.addAttribute("retType", ":location");
				//model.addAttribute("retUrl", "/invest_login.do");
				//return "pict/main/message";
			}
		}
		else {
			return "N";
			//model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
			//model.addAttribute("retType", ":location");
			//model.addAttribute("retUrl", "/invest_login.do");
			//return "pict/main/message";
		}
	}
	@RequestMapping(value = "/user_invest.do")
	public String user_invest(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("idx");
		if(session == null || session == "null") {
			return "redirect:/invest_login.do";
		}
		
		pictVO.setInvest("1");
		List<?> company_list = pictService.company_list(pictVO);
		
		PictVO vo = pictService.total_invest(pictVO);
		
		String name = (String)request.getSession().getAttribute("name");
		String mobile = (String)request.getSession().getAttribute("mobile");
		
		pictVO.setName(name);
		pictVO.setMobile(mobile);
		pictVO = pictService.invest_user_info(pictVO);
		//여기서 로그인 여부 체크 / 로그인 되어있으면 해당 사람의 잔액 표기
		
		PictVO vo2 = pictService.maximum_price(pictVO);
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("vo", vo);
		model.addAttribute("vo2", vo2);
		model.addAttribute("company_list", company_list);
		return "pict/main/user_invest";
	}

	@RequestMapping(value = "/user_invest_save.do", method= RequestMethod.POST)
	@ResponseBody
	public String user_invest_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		String session = (String)request.getSession().getAttribute("idx");
		if(session == null || session == "null") {
			return "redirect:/invest_login.do";
		}

		String company_id = param.get("company_id").toString();
		String point = param.get("point").toString();
		String idx = param.get("idx").toString();
	
		pictVO.setCompany_id(company_id);
		pictVO.setPoint(point);
		pictVO.setIdx(Integer.parseInt(idx));
		
		pictService.invest_insert(pictVO);
		pictService.user_invest_minus(pictVO);
		return "Y";
	
		
	}
	//투자 마이페이지
	@RequestMapping(value = "/invest_mypage.do")
	public String invest_mypage(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("idx");
		if(session == null || session == "null") {
			return "redirect:/invest_login.do";
		}
		
		pictVO.setIdx(Integer.parseInt(session));
		List<?> company_list = pictService.funding_mypage_list(pictVO);
		model.addAttribute("listSize", company_list.size());
		model.addAttribute("resultList", company_list);
		return "pict/main/invest_mypage";
	}
	//투자 인증서
	@RequestMapping(value = "/invest_certi.do")
	public String invest_certi(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("idx");
		if(session == null || session == "null") {
			return "redirect:/invest_login.do";
		}

		
		pictVO.setIdx(Integer.parseInt((String) request.getSession().getAttribute("idx")));
		pictVO.setGroup_by("Y");
		List<?> company_list = pictService.funding_list_user_star(pictVO);
		model.addAttribute("resultList", company_list);
		pictVO = pictService.user_list_one(pictVO);
		model.addAttribute("pictVO", pictVO);
		return "pict/main/invest_certi";
	}

	public String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }
        
        String ret = data;
        
        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");
        
        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");
        
        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");
        
        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        
        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }
	public static String getStringToTag(String str) {
		str = str.replaceAll("&lt;", "<");
		str = str.replaceAll("&gt;", ">");
		str = str.replaceAll("&quot;", "\"");
		str = str.replaceAll("&#39;", "'");
		str = str.replaceAll("&apos;", "'");
		 
		return str;
	}
	
	// 공통메소드
	public String fileUpload(MultipartHttpServletRequest request, MultipartFile uploadFile, String target) {
		String path = "";
		String fileName = "";
		OutputStream out = null;
		PrintWriter printWriter = null;
		long fileSize = uploadFile.getSize();
		try {
			fileName = uploadFile.getOriginalFilename();
			byte[] bytes = uploadFile.getBytes();

			path = getSaveLocation(request, uploadFile);

			File file = new File(path);
			if (fileName != null && !fileName.equals("")) {
				if (file.exists()) {
					file = new File(path + fileName);
				}
			}
			out = new FileOutputStream(file);
			out.write(bytes);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return path + "#####" + fileName;
	}

	private String getSaveLocation(MultipartHttpServletRequest request, MultipartFile uploadFile) {
		String uploadPath = "/user1/upload_file/gwexpo/";
		//String uploadPath = "D:\\user1\\upload_file\\gwexpo\\";
		return uploadPath;
	}

	private String genSaveFileName(String extName) {
	        String fileName = "";
	        
	        Calendar calendar = Calendar.getInstance();
	        fileName += calendar.get(Calendar.YEAR);
	        fileName += calendar.get(Calendar.MONTH);
	        fileName += calendar.get(Calendar.DATE);
	        fileName += calendar.get(Calendar.HOUR);
	        fileName += calendar.get(Calendar.MINUTE);
	        fileName += calendar.get(Calendar.SECOND);
	        fileName += calendar.get(Calendar.MILLISECOND);
	        fileName += extName;
	        
	        return fileName;
	    }

	public static String encryptPassword(String password, String id) throws Exception {
		if (password == null) return "";
		if (id == null) return ""; // KISA 보안약점 조치 (2018-12-11, 신용호)
		byte[] hashValue = null; // 해쉬값
	
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.reset();
		md.update(id.getBytes());
		hashValue = md.digest(password.getBytes());
	
		return new String(Base64.encodeBase64(hashValue));
    }
    
	
}
