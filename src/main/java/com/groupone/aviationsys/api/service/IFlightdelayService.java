package com.groupone.aviationsys.api.service;

import com.groupone.aviationsys.api.entity.Flightdelay;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author LXSee
 * @since 2021-10-26
 */
public interface IFlightdelayService extends IService<Flightdelay> {

    List<Flightdelay> getFlightDelayList(int currentPage, int pageSize, String sortCol, int ascDesc);

    void deleteFlightDelay(Integer id);

    void insertFlightDelay(Flightdelay flightdelay);

    void updateFlightDelay(Flightdelay flightdelay);

    Flightdelay getFlightDelay(Integer id);

    List<Integer> getCancellationReasonCount();

    List<Integer> getCancellationReasonCount(int month);

    List<Integer> getFlightDelayCount();

    List<Integer> getFlightDelayCount(int month);

    List<Flightdelay> getFilteredFlightDelayList(List<String> searchCondition);

    Boolean checkDuplicateRecord(Flightdelay flightdelay);

    Integer getCount();
}
