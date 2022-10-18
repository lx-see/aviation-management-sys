package com.groupone.aviationsys.api.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.groupone.aviationsys.api.entity.Airport;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author LXSee
 * @since 2021-10-26
 */
public interface IAirportService extends IService<Airport> {

	List<Airport> getAirportList(int currentPage, int pageSize);

	Airport addAirport(Airport airport);

	Airport deleteAirport(Airport airport);

	Airport updateAirport(Airport airport);

	Airport searchAirport(int airportId);

	int getTotalAirportRecords();

	boolean checkDuplicateAirport(Airport airport);
	
	boolean checkDuplicateAirport2(Airport airport);

	boolean checkRelatedRecords(int airportId);

}
