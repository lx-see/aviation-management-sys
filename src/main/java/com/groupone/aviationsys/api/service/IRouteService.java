package com.groupone.aviationsys.api.service;

import com.groupone.aviationsys.api.entity.Route;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  
 * </p>
 *
 * @author LXSee
 * @since 2021-10-26
 */
public interface IRouteService extends IService<Route> {

	public List<Route> getRouteList(int currentPage, int pageSize);

	public List<Route> getRouteListbyRouteId(Route r);
	
	public List<Route> getRouteListbySourceAirport(Route r);

	public List<Route> getRouteListbyDestAirport(Route r);
	
	public List<Route> getRouteListbyAirline(Route r);

	public Route addRoute(Route r);
	
	public Route updateRoute(Route r);
	
	public Boolean checkSourceAirp(Route r);
	
	public Boolean checkDestAirp(Route r);

	public Boolean checkAirline(Route r);
	
	public Boolean checkDuplicateRoute(Route r);
	
	public Integer countRouteRecords();
}
