package com.groupone.aviationsys.api.service.impl;

import com.groupone.aviationsys.api.entity.Route;
import com.groupone.aviationsys.api.mapper.RouteMapper;
import com.groupone.aviationsys.api.service.IRouteService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *
 * </p>
 *
 * @author LXSee
 * @since 2021-10-26
 */
@Service
public class RouteServiceImpl extends ServiceImpl<RouteMapper, Route> implements IRouteService {

	@Override
	public Boolean checkSourceAirp(Route r) {
		QueryWrapper<Route> wrapper = new QueryWrapper<>();
		wrapper.eq("sourceAirportId", r.getSourceAirportId());
		wrapper.eq("sourceAirportIATA_ICAO", r.getSourceairportiataIcao());
		List<Route> routeList = routemapper.selectList(wrapper);
		if (routeList.size() < 1) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public Boolean checkDestAirp(Route r) {
		QueryWrapper<Route> wrapper = new QueryWrapper<>();
		wrapper.eq("destAirportId", r.getDestAirportId());
		wrapper.eq("destAirportIATA_ICAO", r.getDestairportiataIcao());
		List<Route> routeList = routemapper.selectList(wrapper);
		if (routeList.size() < 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Boolean checkAirline(Route r) {
		QueryWrapper<Route> wrapper = new QueryWrapper<>();
		wrapper.eq("airlineId", r.getAirlineId());
		wrapper.eq("airlineIATA_ICAO", r.getAirlineiataIcao());
		List<Route> routeList = routemapper.selectList(wrapper);
		if (routeList.size() < 1) {
			return true;
		} else {
			return false;
		}
	}

	@Autowired
	RouteMapper routemapper;

	@Override
	public List<Route> getRouteList(int currentPage, int pageSize) {

		Page<Route> page = new Page<>(currentPage, pageSize);
		QueryWrapper<Route> wrapper = new QueryWrapper<>();

		IPage<Route> iPage = this.routemapper.selectPage(page, wrapper);
		List<Route> routeList = iPage.getRecords();

		return routeList;
	}

	@Override
	public List<Route> getRouteListbyRouteId(Route r) {
		if (r.getRouteId() != null) {
			QueryWrapper<Route> wrapper = new QueryWrapper<>();
			wrapper.eq("routeId", r.getRouteId());
			List<Route> routeList = routemapper.selectList(wrapper);
			return routeList;
		} else {
			return null;
		}
	}

	@Override
	public List<Route> getRouteListbySourceAirport(Route r) {
		if (r.getSourceAirportId() != null) {
			QueryWrapper<Route> wrapper = new QueryWrapper<>();
			wrapper.eq("sourceAirportId", r.getSourceAirportId());
			List<Route> routeList = routemapper.selectList(wrapper);
			return routeList;
		} else {
			return null;
		}
	}

	@Override
	public List<Route> getRouteListbyDestAirport(Route r) {
		if (r.getDestAirportId() != null) {
			QueryWrapper<Route> wrapper = new QueryWrapper<>();
			wrapper.eq("destAirportId", r.getDestAirportId());
			List<Route> routeList = routemapper.selectList(wrapper);
			return routeList;
		} else {
			return null;
		}
	}

	@Override
	public List<Route> getRouteListbyAirline(Route r) {
		if (r.getAirlineId() != null) {
			QueryWrapper<Route> wrapper = new QueryWrapper<>();
			wrapper.eq("airlineId", r.getAirlineId());
			List<Route> routeList = routemapper.selectList(wrapper);
			return routeList;
		} else {
			return null;
		}
	}

	@Override
	public Integer countRouteRecords() {
		QueryWrapper<Route> wrapper = new QueryWrapper<>();
		return routemapper.selectCount(wrapper);
	}

	@Override
	public Route addRoute(Route r) {
		Route route = new Route();
		route.setSourceAirportId(r.getSourceAirportId());
		route.setDestAirportId(r.getDestAirportId());
		route.setSourceairportiataIcao(r.getSourceairportiataIcao());
		route.setDestairportiataIcao(r.getDestairportiataIcao());
		route.setCodeshare(r.getCodeshare());
		route.setStops(r.getStops());
		route.setEquipment(r.getEquipment());
		route.setAirlineId(r.getAirlineId());
		route.setAirlineiataIcao(r.getAirlineiataIcao());
		routemapper.insert(route);

		return route;
	}

	@Override
	public Route updateRoute(Route r) {
		Route route = new Route();
		route.setRouteId(r.getRouteId());
		route.setSourceAirportId(r.getSourceAirportId());
		route.setDestAirportId(r.getDestAirportId());
		route.setSourceairportiataIcao(r.getSourceairportiataIcao());
		route.setDestairportiataIcao(r.getDestairportiataIcao());
		route.setCodeshare(r.getCodeshare());
		route.setStops(r.getStops());
		route.setEquipment(r.getEquipment());
		route.setAirlineId(r.getAirlineId());
		route.setAirlineiataIcao(r.getAirlineiataIcao());

		routemapper.updateById(route);

		return route;

	}

	@Override
	public Boolean checkDuplicateRoute(Route r) {
		QueryWrapper<Route> wrapper = new QueryWrapper<>();
		wrapper.eq("sourceAirportId", r.getSourceAirportId());
		wrapper.eq("destAirportId", r.getDestAirportId());
		wrapper.eq("sourceAirportIATA_ICAO", r.getSourceairportiataIcao());
		wrapper.eq("destAirportIATA_ICAO", r.getDestairportiataIcao());
		wrapper.eq("codeshare", r.getCodeshare());
		wrapper.eq("stops", r.getStops());
		wrapper.eq("equipment", r.getEquipment());
		wrapper.eq("airlineId", r.getAirlineId());
		wrapper.eq("airlineIATA_ICAO", r.getAirlineiataIcao());
		List<Route> routeList = routemapper.selectList(wrapper);
		// Found duplicate record
		if (routeList.size() > 0) {
			return true;
		} else {
			return false;
		}
	}
}
