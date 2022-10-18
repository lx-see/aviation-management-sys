package com.groupone.aviationsys.api.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.groupone.aviationsys.api.entity.Airline;
import com.groupone.aviationsys.api.mapper.AirlineMapper;
import com.groupone.aviationsys.api.service.IAirlineService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  航空公司服务实现类
 * </p>
 *
 * @author WZlock
 * @since 2021-11-26
 */
@Service
public class AirlineServiceImpl extends ServiceImpl<AirlineMapper, Airline> implements IAirlineService {
	  
	@Autowired
	private AirlineMapper airlineMapper;

	@Override
	public IPage<Airline> selectAirlinePage(int pageNum, int pageSize, String param) {
		QueryWrapper<Airline> queryWrapper = new QueryWrapper<>();
		//if not empty put the name, it put inside
		if(StringUtils.isNotEmpty(param)) {
			queryWrapper.like("name",param);
	
		}
		//Set the next page setup with the two important argument
		Page<Airline> page = new Page<>(pageNum, pageSize);
		//Do search
		return airlineMapper.selectPage(page,queryWrapper);
	}

	@Override
	public int addAirline(Airline airline) {
		return airlineMapper.insert(airline);
	}

	@Override
	public int editAirline(Airline airline) {
		//update current object
		return airlineMapper.updateById(airline);
	}

	@Override
	public Airline queryAirlineById(Integer airlineId) {
		return airlineMapper.selectById(airlineId);
	}

	@Override
	public int delAirlineById(Integer airlineId) {
		return airlineMapper.deleteById(airlineId);
	}

	@Override
	public List<Airline> queryAirlineList() {
		return airlineMapper.selectList(null);
	}
}
