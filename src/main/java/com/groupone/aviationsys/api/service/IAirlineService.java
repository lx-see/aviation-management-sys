package com.groupone.aviationsys.api.service;

import com.groupone.aviationsys.api.entity.Airline;
import java.util.List;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  航空公司服务类
 * </p>
 *
 * @author WZlock
 * @since 2021-10-26
 */

//Using 
public interface IAirlineService extends IService<Airline> {
	
	/*
	 * @param pageNum 第某页
	 * @param pageSize 每页多少数据
	 * @param param 查询参数-name
	 * @return
	 */
	public IPage<Airline> selectAirlinePage(int pageNum, int pageSize, String param);
	
	/*
	 * 新增一条航空公司信息
	 * @param airline
	 */
	public int addAirline(Airline airline);
	
	/*
	 * 修改一条航空公司信息
	 * @param airline
	 */
	public int editAirline(Airline airline);
	
	
	/*
	 * 根据id 查一条航空公司对象
	 * @param airline
	 */
	public Airline queryAirlineById(Integer airlineId);
	
	
	/*
	 * 根据id 删一条航空公司对象
	 * @param airline
	 */
	public int delAirlineById(Integer airlineId);
	
	
	/*
	 * 查询所有的航空公司
	 * @param airline
	 */
	public List<Airline> queryAirlineList();
	
}
