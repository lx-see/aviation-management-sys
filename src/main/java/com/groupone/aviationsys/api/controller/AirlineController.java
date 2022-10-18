package com.groupone.aviationsys.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.groupone.aviationsys.api.entity.Airline;
import com.groupone.aviationsys.api.service.IAirlineService;
import com.groupone.aviationsys.api.util.ResultMapUtil;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author WZlock
 * @since 2021-11-17
 */
/*
 * 航空公司相关 controller
 */

@Controller
public class AirlineController{

	/*
	 * Change to Airline Page
	 */

	@Autowired
	private IAirlineService airlineService;

	@RequestMapping(value = "/airline_view")
	public String airline(){
		return "airline_view";
	}


	//分页查询航空公司表
	@RequestMapping(value = "/airlineQueryPage")
	@ResponseBody
	public Object airlineQueryPage(String param, @RequestParam(value="page",defaultValue="1")int pageNum,
			@RequestParam(value="limit",defaultValue="10")int pageSize) {
		try {
			
		IPage<Airline> iPage = airlineService.selectAirlinePage(pageNum, pageSize, param);
		return ResultMapUtil.getHashMapMysql(iPage);
		}catch (Exception e) {
			return ResultMapUtil.getHashMapException(e);
		}
	}


	@RequestMapping(value = "/airline_update")
	public String airlineAdd(){
		return "/airline_update";
	}


	@RequestMapping(value = "/airlineAdd1")
	@ResponseBody
	public Object airlineAdd1(Airline airline) {
		try {
			int i = airlineService.addAirline(airline);
			return ResultMapUtil.getHashMapSave(i);
		}catch(Exception e){
			return ResultMapUtil.getHashMapException(e);
		}

	}


	@RequestMapping(value = "/airlineQueryById")
	public String airlineQueryById(@RequestParam(name="airlineId",required=true)Integer airlineId, Model model){
	
		Airline airline = airlineService.queryAirlineById(airlineId);
		model.addAttribute("obj",airline);
		return "/airline_update";
	}


	@RequestMapping(value = "/airlineEdit")
	@ResponseBody
	public Object airlineEdit(Airline airline) {
		try {
			int i = airlineService.editAirline(airline);
			return ResultMapUtil.getHashMapSave(i);
		}catch(Exception e){
			return ResultMapUtil.getHashMapException(e);
		}

	}


	@RequestMapping(value = "/airlineDelById")
	@ResponseBody
	public Object airlineDelById(Integer airlineId) {
		try {
			int i = airlineService.delAirlineById(airlineId);
			return ResultMapUtil.getHashMapDel(i);
		}catch(Exception e){
			return ResultMapUtil.getHashMapException(e);
		}

	}
	

}