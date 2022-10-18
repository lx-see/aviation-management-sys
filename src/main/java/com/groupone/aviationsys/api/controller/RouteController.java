package com.groupone.aviationsys.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.groupone.aviationsys.api.entity.Route;
import com.groupone.aviationsys.api.service.IRouteService;
import org.springframework.ui.Model;

/**
 * <p>
 * 
 * </p>
 *
 * @author LXSee
 * @since 2021-10-26
 */
@Controller
public class RouteController {
	@Autowired
	private IRouteService routeService;

	@RequestMapping(value = "/route_search/{pageNo}")
	public String route_search(@PathVariable("pageNo") Integer pageNo, Model model) {
		int count = routeService.countRouteRecords();
		int pageSize = 10;
		int totalPage = 0;
		for (int i = 0; i < count / 10; i++) {
			totalPage++;
		}
		if (count % 10 != 0) {
			totalPage++;
		}
		List<Route> routeList = routeService.getRouteList(pageNo, pageSize);
		model.addAttribute("RouteList", routeList);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("totalPage", totalPage);

		return "route_search";
	}

	@RequestMapping(value = "/route_search_by_id/")
	public String route_search_by_id(Route r, Model model) {
		List<Route> routeList = routeService.getRouteListbyRouteId(r);
		if (routeList == null) {
			routeList = routeService.getRouteListbyAirline(r);
			if (routeList == null) {
				routeList = routeService.getRouteListbySourceAirport(r);
				if (routeList == null) {
					routeList = routeService.getRouteListbyDestAirport(r);
					if(routeList==null) {
						routeList=null;
					}else {
						model.addAttribute("RouteList", routeList);
					}
				} else {
					model.addAttribute("RouteList", routeList);
				}
			} else {
				model.addAttribute("RouteList", routeList);
			}
		} else {
			model.addAttribute("RouteList", routeList);
		}
		model.addAttribute("pageNo", 1);
		model.addAttribute("totalPage", 1);

		return "route_search_by_id";
	}

	@RequestMapping(value = "/route_manage/{pageNo}")
	public String route_manage(@PathVariable("pageNo") Integer pageNo, Model model) {
		int count = routeService.countRouteRecords();
		int pageSize = 10;
		int totalPage = 0;
		for (int i = 0; i < count / 10; i++) {
			totalPage++;
		}
		if (count % 10 != 0) {
			totalPage++;
		}
		List<Route> routeList = routeService.getRouteList(pageNo, pageSize);
		model.addAttribute("RouteList", routeList);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("totalPage", totalPage);

		return "route_manage";
	}

	@RequestMapping(value = "/route_update")
	public String route_update(Route r) {
		if (routeService.getById(r) != null) {
			if (routeService.checkDuplicateRoute(r)) {
				return "duplicate_route";
			}
			if (routeService.checkSourceAirp(r)) {
				return "route_invalid_input";
			}
			if (routeService.checkDestAirp(r)) {
				return "route_invalid_input";
			}
			if (routeService.checkAirline(r)) {
				return "route_invalid_input";
			}
			routeService.updateRoute(r);
			return "route_update_success";

		} else {
			return "route_no_data_found";
		}
	}

	@RequestMapping(value = "/route_delete")
	public String route_delete(int routeId) {
		if (routeService.getById(routeId) != null) {
			routeService.removeById(routeId);
			return "route_delete_success";
		} else {
			return "route_no_data_found";
		}
	}

	@RequestMapping(value = "/route_add_form")
	public String route_add_form(Model model) {
		return "route_add_form";
	}

	@RequestMapping(value = "/route_add", method = RequestMethod.POST)
	public String route_add(Route r) {
		if (routeService.checkDuplicateRoute(r)) {
			return "duplicate_route";
		}
		if (routeService.checkSourceAirp(r)) {
			return "route_invalid_input";
		}
		if (routeService.checkDestAirp(r)) {
			return "route_invalid_input";
		}
		if (routeService.checkAirline(r)) {
			return "route_invalid_input";
		}
		routeService.addRoute(r);
		return "route_add_success";

	}
}
