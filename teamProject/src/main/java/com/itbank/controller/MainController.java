package com.itbank.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.admin.AdminDTO;
import com.itbank.calendar.CalendarDTO;
import com.itbank.hotel.HotelDTO;
import com.itbank.reservation.ReservationDTO;
import com.itbank.review.ReviewDTO;
import com.itbank.room.RoomDTO;
import com.itbank.service.AdminService;
import com.itbank.service.CalendarService;
import com.itbank.service.FileService;
import com.itbank.service.HotelService;
import com.itbank.service.ReservationService;
import com.itbank.service.ReviewService;
import com.itbank.service.RoomService;

@Controller
public class MainController {

	@Autowired private AdminService as;
	@Autowired private HotelService hs;
	@Autowired private FileService fs;
	@Autowired private RoomService rs;
	@Autowired private ReviewService reviewService;
	@Autowired private ReservationService reservationService;
	@Autowired private CalendarService cs;
	
	// 인덱스, 판매기록
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@PostMapping("/")
	public ModelAndView index(HttpSession session, HttpServletRequest request) {
		AdminDTO dto = (AdminDTO) session.getAttribute("login");
		String ad_id = dto.getAd_id();
		String start =  request.getParameter("startDate");
		String end = request.getParameter("endDate");
		System.out.println("시작날짜 : "+ start);
		System.out.println("끝날짜 : " + end);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", start);
		map.put("endDate", end);
		map.put("ad_id", ad_id);
		
		ModelAndView mav = new ModelAndView("index");
		List<ReservationDTO> list = reservationService.getReservationList(map);
		String cancleCount = reservationService.getCancleCount(map);
		String reservationCount = reservationService.getReservationCount(map);
		
		mav.addObject("list", list);
		mav.addObject("cancleCount",cancleCount);	// 예약취소한 갯수
		mav.addObject("reservationCount", reservationCount);	// 예약완료된 갯수
		return mav;
	}
	
	// 로그인
	@GetMapping("login")
	public void login() {}

	// 로그인(쿠키)
	@PostMapping("login")
	public String login(AdminDTO dto, HttpServletRequest request, HttpServletResponse response, HttpSession session, String uri) {
		String userid = dto.getAd_id();
		String storeid = request.getParameter("storeid");
		AdminDTO login = as.getUser(dto);
		Cookie c = new Cookie("userid", userid);
		session.setAttribute("login", login);
		boolean flag = (storeid != null) && (session.getAttribute("login") != null);
		c.setMaxAge(flag ? 60 * 60 * 24 * 100 : 0);	
		response.addCookie(c);	
		uri = (uri == null) ? "/" : uri;
		return "redirect:" + uri ;
	}
	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	// 회원가입
	@GetMapping("join")
	public void join() {}

	// 아이디 찾기
	@GetMapping("findID")
	public void findID() {}

	// 비밀번호 찾기
	@GetMapping("findPW")
	public void findPW() {}
	
	// 회원 정보 변경
	@GetMapping("modify")
	public void modify() {}
	
	// 객실현황
	@GetMapping("roomStatus")
	public ModelAndView roomStatus(HttpSession session) {
		AdminDTO dto = (AdminDTO) session.getAttribute("login");
		String ad_id = dto.getAd_id();
		
		HotelDTO hotelDTO = hs.selectHotel(ad_id);
		String ho_name = hotelDTO.getHo_name();
		
		ModelAndView mav = new ModelAndView("roomStatus");

		List<CalendarDTO> calendarList = cs.getCalendar(ho_name);
		
		// 오늘 날짜 가져와서 map에 넣기
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
//		Date time = new Date();
//				
//		String nowDate = format.format(time);
//				
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("ho_name", ho_name);
//		map.put("nowDate", nowDate);
//		
//		List<CalendarDTO> calendar = cs.getList(map);
		List<RoomDTO> roomList = rs.getList(ho_name);
//		
		int roomCount = roomList.size();
//		
		mav.addObject("calendarList", calendarList);
//		mav.addObject("roomList", roomList);
		mav.addObject("roomCount", roomCount);
		
				
				
				
		return mav;
	}
	
//	@PostMapping("roomStatus")
//	public ModelAndView roomStatus(CalendarDTO dto) {
//		ModelAndView mav = new ModelAndView("roomStatus");
//		
//		System.out.println(dto.getCalendar_count());
//		System.out.println(dto.getCalendar_ro_pk());
//		System.out.println(dto.getCalendar_pk());
//		System.out.println(dto.getCalendar_price());
//		System.out.println(dto.getCalendar_date());
//		
//		String ro_pk = dto.getCalendar_ro_pk();
//		
//		dto.setCalendar_pk(dto.getCalendar_date() + "(" + ro_pk + ")");
//		System.out.println(dto.getCalendar_pk());
//		int row = cs.insertCal(dto);
//		if(row == 1 ) {
////			CalendarDTO calDTO = cs.getList(ro_pk);
////			mav.addObject("calDTO", calDTO);
//		}
//		return mav;
//	}
	
	
	
	
	// 리뷰
	@GetMapping("trueReview")
	public ModelAndView trueReview(HttpSession session) {
		ModelAndView mav = new ModelAndView("trueReview") ;
		AdminDTO adminDTO = (AdminDTO) session.getAttribute("login");
		String ad_id = adminDTO.getAd_id();
		
		// 호텔 이름불러오기
		HotelDTO dto = hs.selectHotel(ad_id);
		mav.addObject("dto", dto);
		
		// 리뷰전체목록
		List<ReviewDTO> list = reviewService.getReviewList(ad_id);
		mav.addObject("list", list);
		
		// 리뷰전체갯수
		int countAll = reviewService.getCountAll(ad_id);
		mav.addObject("countAll", countAll);
		
		// 리뷰 만족갯수
		int goodCount = reviewService.getGoodCount(ad_id);
		mav.addObject("goodCount", goodCount);
		
		return mav;
	}

	// 호텔정보 입력
	@GetMapping("enterHotelinformation/{ad_id}")
	public ModelAndView enterHotelinformation(@PathVariable String ad_id) {
		ModelAndView mav = new ModelAndView("enterHotelinformation");
		HotelDTO dto = hs.selectHotel(ad_id);
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	// 호텔정보 
	@GetMapping("hotelInformation")
	public ModelAndView hotelInformation(HttpSession session) {
		AdminDTO adminDTO = (AdminDTO) session.getAttribute("login");
		String ad_id = adminDTO.getAd_id();
		System.out.println(ad_id);
		ModelAndView mav = new ModelAndView("hotelInformation");
		HotelDTO dto = hs.selectHotel(ad_id);
		mav.addObject("dto", dto);
		return mav;
	}
	
	// 호텔정보 입력
	@PostMapping("enterHotelinformation/{ad_id}")
	public ModelAndView enterHotelinformation(@PathVariable String ad_id, MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView("index");
		MultipartFile file = request.getFile("ho_uploadfile");
		String ho_name = request.getParameter("ho_name");
		String ho_pnum = request.getParameter("ho_pnum");
		String ho_address = request.getParameter("ho_address");
		String ho_check_in = request.getParameter("ho_check_in");
		String ho_check_out = request.getParameter("ho_check_out");
		String ho_description = request.getParameter("ho_description");
		String ho_ad_id = request.getParameter("ho_ad_id");
		String ho_parking = request.getParameter("ho_parking");
		String ho_wifi = request.getParameter("ho_wifi");
		String ho_pc = request.getParameter("ho_pc");
		String ho_breakfast = request.getParameter("ho_breakfast");
		String ho_smoke = request.getParameter("ho_smoke");
		String ho_pool = request.getParameter("ho_pool");
		
		HotelDTO dto = new HotelDTO();
		
		dto.setHo_ad_id(ho_ad_id);
		dto.setHo_address(ho_address);
		dto.setHo_breakfast(ho_breakfast);
		dto.setHo_check_in(ho_check_in);
		dto.setHo_check_out(ho_check_out);
		dto.setHo_description(ho_description);
		dto.setHo_name(ho_name);
		dto.setHo_parking(ho_parking);
		dto.setHo_pc(ho_pc);
		dto.setHo_pnum(ho_pnum);
		dto.setHo_pool(ho_pool);
		dto.setHo_smoke(ho_smoke);
		dto.setHo_uploadfile(file.getOriginalFilename());
		dto.setHo_wifi(ho_wifi);

		if(dto.getHo_parking() == null) {dto.setHo_parking("");	}
		if(dto.getHo_wifi() == null) {dto.setHo_wifi("");	}
		if(dto.getHo_pc() == null) {dto.setHo_pc("");	}
		if(dto.getHo_breakfast() == null) {dto.setHo_breakfast("");	}
		if(dto.getHo_smoke() == null) {dto.setHo_smoke("");	}
		if(dto.getHo_pool() == null) {dto.setHo_pool("");	}
		
		
		boolean flag = fs.uploadFile(file);						// 서비스에게 전달하고 결과를 저장
		if(flag == false) {											// 업로드 실패라면
			mav.setViewName("msg");									// viewName을 msg로 변경하고
			mav.addObject("msg", "업로드 실패 !!");						// 업로드 실패 메시지를 전달
			System.out.println("업로드 실패");
		}
		
		int row = hs.insertHotel(dto);
		System.out.println("row : " + row);
		
		return mav;
	}
	
	// 정산페이지
	@GetMapping("calculate")
	public ModelAndView calculate(HttpSession session) {
		ModelAndView mav = new ModelAndView("calculate");
		AdminDTO dto = (AdminDTO) session.getAttribute("login");
		mav.addObject("dto", dto);
		return mav;
	}
	
	// 호텔정보 수정
	@GetMapping("hotelInformationModification")
	public ModelAndView hotelInformationModification(HttpSession session) {
		AdminDTO adminDTO = (AdminDTO) session.getAttribute("login");
		String ad_id = adminDTO.getAd_id();
		System.out.println(ad_id);
		ModelAndView mav = new ModelAndView("hotelInformationModification");
		HotelDTO dto = hs.selectHotel(ad_id);
		mav.addObject("dto", dto);
		return mav;
	}
	
	// 호텔정보 수정
	@PostMapping("hotelInformationModification")
	public ModelAndView hotelModifi(MultipartHttpServletRequest request) throws  IllegalStateException,IOException {
		ModelAndView mav = new ModelAndView("index");
		MultipartFile file = request.getFile("ho_uploadfile");
		String ho_name = request.getParameter("ho_name");
		String ho_pnum = request.getParameter("ho_pnum");
		String ho_address = request.getParameter("ho_address");
		String ho_check_in = request.getParameter("ho_check_in");
		String ho_check_out = request.getParameter("ho_check_out");
		String ho_description = request.getParameter("ho_description");
		String ho_ad_id = request.getParameter("ho_ad_id");
		String ho_parking = request.getParameter("ho_parking");
		String ho_wifi = request.getParameter("ho_wifi");
		String ho_pc = request.getParameter("ho_pc");
		String ho_breakfast = request.getParameter("ho_breakfast");
		String ho_smoke = request.getParameter("ho_smoke");
		String ho_pool = request.getParameter("ho_pool");

		HotelDTO dto = new HotelDTO();
		
		dto.setHo_ad_id(ho_ad_id);
		dto.setHo_address(ho_address);
		dto.setHo_breakfast(ho_breakfast);
		dto.setHo_check_in(ho_check_in);
		dto.setHo_check_out(ho_check_out);
		dto.setHo_description(ho_description);
		dto.setHo_name(ho_name);
		dto.setHo_parking(ho_parking);
		dto.setHo_pc(ho_pc);
		dto.setHo_pnum(ho_pnum);
		dto.setHo_pool(ho_pool);
		dto.setHo_smoke(ho_smoke);
		dto.setHo_uploadfile(file.getOriginalFilename());
		dto.setHo_wifi(ho_wifi);
		
		if(dto.getHo_parking() == null) {dto.setHo_parking("");	}
		if(dto.getHo_wifi() == null) {dto.setHo_wifi("");	}
		if(dto.getHo_pc() == null) {dto.setHo_pc("");	}
		if(dto.getHo_breakfast() == null) {dto.setHo_breakfast("");	}
		if(dto.getHo_smoke() == null) {dto.setHo_smoke("");	}
		if(dto.getHo_pool() == null) {dto.setHo_pool("");	}

		
		
		boolean flag = fs.uploadFile(file);						// 서비스에게 전달하고 결과를 저장
		if(flag == false) {											// 업로드 실패라면
			mav.setViewName("msg");									// viewName을 msg로 변경하고
			mav.addObject("msg", "업로드 실패 !!");						// 업로드 실패 메시지를 전달
			System.out.println("업로드 실패");
		}
		
		int row = hs.modifiHotel(dto);
		System.out.println("row : " + row);
		return mav;
		
	}	

	//  정보 입력
	@GetMapping("insertRoom/{ho_name}")
	public ModelAndView insertRoom(@PathVariable String ho_name) {
		ModelAndView mav = new ModelAndView("insertRoom");
		mav.addObject("ho_name", ho_name);
		return mav;
	}
	
	// 객실 정보 입력
	@PostMapping("insertRoom/{ho_name}")
	public ModelAndView insertRoom(@PathVariable String ho_name, MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView("index");
		MultipartFile file = request.getFile("ro_uploadfile");
		String ro_pk = request.getParameter("ro_pk");
		String ro_limitperson = request.getParameter("ro_limitperson");
		String ro_badtype = request.getParameter("ro_badtype");
		String ro_description = request.getParameter("ro_description");
		String ro_ho_name = ho_name;
		String ro_roomtype = request.getParameter("ro_roomtype");
		
		RoomDTO dto = new RoomDTO();
		
		int ro_limitperson2 = Integer.parseInt(ro_limitperson);
		
		dto.setRo_pk(ro_pk);
		dto.setRo_badtype(ro_badtype);
		dto.setRo_description(ro_description);
		dto.setRo_ho_name(ro_ho_name);
		dto.setRo_limitperson(ro_limitperson2);
		dto.setRo_roomtype(ro_roomtype);
		dto.setRo_uploadfile(file.getOriginalFilename());
		
		boolean flag = fs.uploadFile(file);							// 서비스에게 전달하고 결과를 저장
		if(flag == false) {											// 업로드 실패라면
			System.out.println("업로드 실패");
		}
		
		int row = rs.insertRoom(dto);
		System.out.println("row : " + row);
		
		return mav;
	}
	

}
