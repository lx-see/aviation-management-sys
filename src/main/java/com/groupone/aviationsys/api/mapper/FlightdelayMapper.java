package com.groupone.aviationsys.api.mapper;

import com.groupone.aviationsys.api.entity.Flightdelay;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author LXSee
 * @since 2021-10-26
 */
@Mapper
@Repository
public interface FlightdelayMapper extends BaseMapper<Flightdelay> {
}
