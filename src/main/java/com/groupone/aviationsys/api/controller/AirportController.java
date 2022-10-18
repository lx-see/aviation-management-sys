package com.groupone.aviationsys.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.groupone.aviationsys.api.entity.Airport;
import com.groupone.aviationsys.api.service.IAirportService;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author LXSee
 * @since 2021-10-26
 */
@Controller
public class AirportController {

	@Autowired
	private IAirportService airportService;

	private final int pageSize = 10;

	@RequestMapping(value = "/airport_show/page/{pageNo}")
	public String airport_show(@PathVariable("pageNo") int pageNo, Model model) {

		int totalRecords = airportService.getTotalAirportRecords();

		int lastPage = (totalRecords / pageSize) + 1;

		List<Airport> airportList = airportService.getAirportList(pageNo, pageSize);

		model.addAttribute("airportList", airportList);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPage", lastPage);

		return "airport_show";
	}

	@RequestMapping(value = "/airport_manage/page/{pageNo}")
	public String airport_manage(@PathVariable("pageNo") int pageNo, Model model) {

		int totalRecords = airportService.getTotalAirportRecords();

		int lastPage = (totalRecords / pageSize) + 1;

		List<Airport> airportList = airportService.getAirportList(pageNo, pageSize);

		model.addAttribute("airportList", airportList);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPage", lastPage);

		return "airport_manage";
	}

	@RequestMapping(value = "/airport_verifyEntry")
	public String airport_verifyEntry(Model model) {

		return "airport_verifyEntry";
	}

	@RequestMapping(value = "/airport_addAirportForm")
	public String airport_addAirportForm(Model model) {

		return "airport_addAirportForm";
	}

	@RequestMapping(value = "/airport_login")
	public String airport_login(Model model) {

		return "airport_login";
	}

	@RequestMapping(value = "/airport_duplicateRecordFound")
	public String airport_duplicateRecordFound(Model model) {

		return "airport_duplicateRecordFound";
	}

	@RequestMapping(value = "/airport_relatedRecordFound")
	public String airport_relatedRecordFound(Model model) {

		return "airport_relatedRecordFound";
	}

	@RequestMapping(value = "/airport_search")
	public String airport_search(Model model) {

		return "airport_search";
	}

	@RequestMapping("/airport_addAirport")
	public String airport_addAirport(Airport airport) {

		if (airportService.checkDuplicateAirport(airport)) {

			System.out.println("Duplicate Airport found");

			return "redirect:/airport_duplicateRecordFound";
		} else {
			
			airportService.addAirport(airport);
			System.out.println("Airport added");

			return "redirect:/airport_manage/page/1";
		}
	}

	@RequestMapping(value = "/airport_deleteAirport")
	public String airport_deleteAirport(@RequestParam("airportId") int airportId, Airport airport) {

		if (airportService.checkRelatedRecords(airportId)) {

			System.out.println("Related records found");

			return "redirect:/airport_relatedRecordFound";

		} else {

			airportService.deleteAirport(airport);
			System.out.println("Airport deleted");

			return "redirect:/airport_manage/page/1";
		}
	}

	@RequestMapping("/airport_updateAirport")
	public String airport_updateAirport(@RequestParam("airportId") int airportId, Airport airport) {

		if (airportService.checkRelatedRecords(airportId)) {

			System.out.println("Related records found");

			return "redirect:/airport_relatedRecordFound";
		}
		if (airportService.checkDuplicateAirport2(airport)) {

			System.out.println("Duplicate Airport found");

			return "redirect:/airport_duplicateRecordFound";
		}
		
		airportService.updateAirport(airport);
		System.out.println("Airport updated");

		return "redirect:/airport_manage/page/1";
	}

	@RequestMapping(value = "/airport_searchAirport")
	public String airport_searchAirport(@RequestParam("airportId") int airportId, Model model) {

		Airport selectedAirport = airportService.searchAirport(airportId);

		model.addAttribute("selectedAirport", selectedAirport);

		return "airport_search";
	}

	@GetMapping("/airport_managerLogin")
	public String airport_managerLogin(int managerId, String managerPassword) {

		if (managerId == 1912345 && managerPassword.equals("MiniProject")) {

			System.out.println("Welcome manager");
			
			return "redirect:/airport_verifyEntry";

		} else {

			System.out.println("Not manager");
			
			return "redirect:/airport_login";
		}
	}
	
	@RequestMapping("/airport_verifyAirportEntry")
	public String airport_verifyAirportEntry(@RequestParam("airportId") int airportId, String response) {
		if(response.equals("approve")) {
			
//			airportService.addAirport(airportService.getById(airportId));
			
			System.out.println("Airport entry approved");
			return "redirect:/airport_verifyEntry";
		}
		else {
			
//			airportService.deleteAirport(airportService.getById(airportId));
			
			System.out.println("Airport entry rejected");
			return "redirect:/airport_verifyEntry";
		}
	}

}
