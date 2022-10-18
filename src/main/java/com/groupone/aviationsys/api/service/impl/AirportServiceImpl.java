package com.groupone.aviationsys.api.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.groupone.aviationsys.api.entity.Airport;
import com.groupone.aviationsys.api.entity.Flightdelay;
import com.groupone.aviationsys.api.entity.Route;
import com.groupone.aviationsys.api.mapper.AirportMapper;
import com.groupone.aviationsys.api.mapper.FlightdelayMapper;
import com.groupone.aviationsys.api.mapper.RouteMapper;
import com.groupone.aviationsys.api.service.IAirportService;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author LXSee
 * @since 2021-10-26
 */
@Service
public class AirportServiceImpl extends ServiceImpl<AirportMapper, Airport> implements IAirportService {

	@Autowired
	AirportMapper airportMapper;

	@Autowired
	RouteMapper routeMapper;

	@Autowired
	FlightdelayMapper flightDelayMapper;

	@Override
	public List<Airport> getAirportList(int currentPage, int pageSize) {

		Page<Airport> page = new Page<>(currentPage, pageSize);
		QueryWrapper<Airport> wrapper = new QueryWrapper<>();

		IPage<Airport> iPage = this.airportMapper.selectPage(page, wrapper);

		List<Airport> airportList = iPage.getRecords();

		return airportList;
	}

	@Override
	public Airport addAirport(Airport airport) {

		airportMapper.insert(airport);

		return airport;
	}

	@Override
	public Airport deleteAirport(Airport airport) {

		airportMapper.deleteById(airport);

		return airport;
	}

	@Override
	public Airport updateAirport(Airport airport) {

		airportMapper.updateById(airport);

		return airport;
	}

	@Override
	public Airport searchAirport(int airportId) {

		Airport selectedAirport = new Airport();

		selectedAirport = airportMapper.selectById(airportId);

		return selectedAirport;
	}

	@Override
	public int getTotalAirportRecords() {

		QueryWrapper<Airport> wrapper = new QueryWrapper<>();

		return airportMapper.selectCount(wrapper);
	}

	@Override
	public boolean checkDuplicateAirport(Airport airport) {

//		check when adding airport

		QueryWrapper<Airport> wrapper = new QueryWrapper<>();

		wrapper.eq("name", airport.getName());

		if (airport.getIata() != null) {
			wrapper.or().eq("iata", airport.getIata());
		}
		if (airport.getIcao() != null) {
			wrapper.or().eq("icao", airport.getIcao());
		}

		List<Airport> airportList = airportMapper.selectList(wrapper);

		if (airportList.size() != 0) {
			
			System.out.println(airportList);
			
			return true;
		}
			return false;
	}

	@Override
	public boolean checkDuplicateAirport2(Airport airport) {

//		check when updating airport

		QueryWrapper<Airport> wrapper = new QueryWrapper<>();
		QueryWrapper<Airport> wrapper2 = new QueryWrapper<>();

		if (airport.getIata() != null) {
			wrapper.eq("iata", airport.getIata());
		}
		if (airport.getIcao() != null) {
			wrapper.or().eq("icao", airport.getIcao());
		}
		wrapper.or().eq("name", airport.getName());
		
		wrapper2.eq("city", airport.getCity());
		wrapper2.or().eq("country", airport.getCountry());
		wrapper2.or().eq("latitude", airport.getLatitude());
		wrapper2.or().eq("longitude", airport.getLongitude());
		wrapper2.or().eq("altitude", airport.getAltitude());
		wrapper2.or().eq("timezone", airport.getTimezone());
		wrapper2.or().eq("dst", airport.getDst());
		wrapper2.or().eq("timezone_Tz", airport.getTimezoneTz());

		List<Airport> airportList = airportMapper.selectList(wrapper);
		List<Airport> airportList2 = airportMapper.selectList(wrapper2);

		if (airportList.size() > 0) {
			if(airportList2.size() > 0) {
				return false;
			}
			return true;
		}
		return false;
	}

	@Override
	public boolean checkRelatedRecords(int airportId) {

		Airport airport = new Airport();
		airport = airportMapper.selectById(airportId);

		QueryWrapper<Route> wrapper1 = new QueryWrapper<>();
		QueryWrapper<Flightdelay> wrapper2 = new QueryWrapper<>();

		wrapper1.eq("sourceAirportId", airport.getAirportId()).or().eq("destAirportId", airport.getAirportId()).or()
				.eq("sourceAirportIATA_ICAO", airport.getIata()).or().eq("destAirportIATA_ICAO", airport.getIata());

		List<Route> routeList = routeMapper.selectList(wrapper1);

		System.out.println(routeList);

		if (routeList.size() > 0) {
			return true;
		}

		wrapper2.eq("sourceAirportIATA", airport.getIata()).or().eq("destAirportIATA", airport.getIata());

		List<Flightdelay> flightDelayList = flightDelayMapper.selectList(wrapper2);

		System.out.println(flightDelayList);

		if (flightDelayList.size() > 0) {
			return true;
		}

		return false;
	}

}
