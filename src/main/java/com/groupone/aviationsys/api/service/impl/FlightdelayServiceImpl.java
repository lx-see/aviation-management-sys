package com.groupone.aviationsys.api.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.groupone.aviationsys.api.entity.Flightdelay;
import com.groupone.aviationsys.api.mapper.FlightdelayMapper;
import com.groupone.aviationsys.api.service.IFlightdelayService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author LXSee
 * @since 2021-10-26
 */
@Service
public class FlightdelayServiceImpl extends ServiceImpl<FlightdelayMapper, Flightdelay> implements IFlightdelayService {

    @Autowired
    FlightdelayMapper flightdelayMapper;

    @Override
    public List<Flightdelay> getFlightDelayList(int currentPage, int pageSize, String sortCol, int ascDesc) {

        Page<Flightdelay> page = new Page<>(currentPage,pageSize);
        QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
        if(ascDesc==0){
            wrapper.orderByAsc(sortCol);
        }
        else if(ascDesc==1){
            wrapper.orderByDesc(sortCol);
        }

        // Call method from mapper layer to select records
        IPage<Flightdelay> iPage = this.flightdelayMapper.selectPage(page,wrapper);
        List<Flightdelay> flightdelayList = iPage.getRecords();

        // Calculate & Set derived attributes of object
        for (Flightdelay flightdelay : flightdelayList
        ) {
            if (flightdelay.getCancelled()) {
                flightdelay.setDepartureTime(null);
                flightdelay.setElapsedTime(null);
                flightdelay.setArrivalTime(null);
                flightdelay.setArrivalDelay(null);
            } else {
                LocalTime departureTime = flightdelay.getWheelsOff().minusMinutes(flightdelay.getTaxiOut());
                int elapsedTime = flightdelay.getAirTime() + flightdelay.getTaxiIn() + flightdelay.getTaxiOut();
                LocalTime arrivalTime = flightdelay.getWheelsOn().plusMinutes(flightdelay.getTaxiIn());
                Duration duration = Duration.between(arrivalTime, flightdelay.getScheduledArrival());
                int arrivalDelay = -duration.toMinutesPart();

                flightdelay.setDepartureTime(departureTime);
                flightdelay.setElapsedTime(elapsedTime);
                flightdelay.setArrivalTime(arrivalTime);
                flightdelay.setArrivalDelay(arrivalDelay);
            }
        }
        return flightdelayList;
    }

    @Override
    public void deleteFlightDelay(Integer id) {
        // Call method from mapper layer to delete record
        int result = flightdelayMapper.deleteById(id);

        // Result = number of affected rows in MySQL database
        if(result <= 0){
            System.out.println("Fail to delete data!");
        }
    }

    @Override
    public void insertFlightDelay(Flightdelay flightdelay) {

        // Handle flight delay logic
        if(flightdelay.getWheelsOff()==null || flightdelay.getWheelsOn()==null || flightdelay.getAirTime()==null || flightdelay.getTaxiOut()==null || flightdelay.getTaxiIn()==null){
            flightdelay.setCancelled(true);
        }

        // Call method from mapper layer to insert record
        int result = flightdelayMapper.insert(flightdelay);
        if(result == 0){
            System.out.println("Fail to insert data!");
        }
    }

    @Override
    public void updateFlightDelay(Flightdelay flightdelay) {

        // Handle flight delay logic
        if(flightdelay.getWheelsOff()==null || flightdelay.getWheelsOn()==null || flightdelay.getAirTime()==null || flightdelay.getTaxiOut()==null || flightdelay.getTaxiIn()==null){
            flightdelay.setCancelled(true);
        }

        // Call method from mapper layer to update record
        int result = flightdelayMapper.updateById(flightdelay);
        if(result == 0){
            System.out.println("Fail to update data!");
        }
    }

    @Override
    public Flightdelay getFlightDelay(Integer id) {
        return flightdelayMapper.selectById(id);
    }

    @Override
    public List<Integer> getCancellationReasonCount() {
        List<Character> list = new ArrayList<>();
        list.add('A');
        list.add('B');
        list.add('C');
        list.add('D');
        List<Integer> lst = new ArrayList<>();
        for(int i=0; i<4; i++){
            QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
            wrapper.eq("cancellationReason",list.get(i));
            Integer count = flightdelayMapper.selectCount(wrapper);
            lst.add(count);
        }
        return lst;
    }

    @Override
    public List<Integer> getCancellationReasonCount(int month) {
        List<Character> list = new ArrayList<>();
        list.add('A');
        list.add('B');
        list.add('C');
        list.add('D');
        List<Integer> lst = new ArrayList<>();
        for(int i=0; i<4; i++){
            QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
            wrapper.eq("month",month).eq("cancellationReason",list.get(i));
            Integer count = flightdelayMapper.selectCount(wrapper);
            lst.add(count);
        }
        return lst;
    }

    @Override
    public List<Integer> getFlightDelayCount() {
        List<Integer> dayList = new ArrayList<>();
        for(int i=1; i<=7; i++){
            dayList.add(i);
        }
        List<Integer> lst = new ArrayList<>();
        for(int j=0; j<7; j++){
            QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
            wrapper.eq("dayOfWeek",dayList.get(j));
            Integer count = flightdelayMapper.selectCount(wrapper);
            lst.add(count);
        }
        return lst;    }

    @Override
    public List<Integer> getFlightDelayCount(int month) {
        List<Integer> dayList = new ArrayList<>();
        for(int i=1; i<=7; i++){
            dayList.add(i);
        }
        List<Integer> lst = new ArrayList<>();
        for(int j=0; j<7; j++){
            QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
            wrapper.eq("month",month).eq("day",dayList.get(j));
            Integer count = flightdelayMapper.selectCount(wrapper);
            lst.add(count);
        }
        return lst;
    }

    @Override
    public List<Flightdelay> getFilteredFlightDelayList(List<String> searchCondition) {
        // Get records for advanced search option
        if(searchCondition.size()==5) {
            Page<Flightdelay> page = new Page<>(1, 30);
            QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();

            String fromDate = searchCondition.get(0);
            String toDate = searchCondition.get(1);
            String srcAirport = searchCondition.get(2);
            String destAirport = searchCondition.get(3);
            String tailNum = searchCondition.get(4);

            if (fromDate != "") {
                String[] v = fromDate.split("-");
                wrapper.ge("year", v[0]).ge("month", v[1]).ge("day", v[2]);
            }
            if (toDate != "") {
                String[] v = toDate.split("-");
                wrapper.le("year", v[0]).le("month", v[1]).le("day", v[2]);
            }
            if (srcAirport != "") {
                wrapper.eq("sourceAirportIATA", srcAirport);
            }
            if (destAirport != "") {
                wrapper.eq("destAirportIATA", destAirport);
            }
            if (tailNum != "") {
                wrapper.eq("tailNumber", tailNum);
            }
            IPage<Flightdelay> iPage = flightdelayMapper.selectPage(page, wrapper);
            List<Flightdelay> list = iPage.getRecords();
            for (Flightdelay flightdelay : list
            ) {
                if (flightdelay.getCancelled()) {
                    flightdelay.setDepartureTime(null);
                    flightdelay.setElapsedTime(null);
                    flightdelay.setArrivalTime(null);
                    flightdelay.setArrivalDelay(null);
                } else {
                    LocalTime departureTime = flightdelay.getWheelsOff().minusMinutes(flightdelay.getTaxiOut());
                    int elapsedTime = flightdelay.getAirTime() + flightdelay.getTaxiIn() + flightdelay.getTaxiOut();
                    LocalTime arrivalTime = flightdelay.getWheelsOn().plusMinutes(flightdelay.getTaxiIn());
                    Duration duration = Duration.between(arrivalTime, flightdelay.getScheduledArrival());
                    int arrivalDelay = -duration.toMinutesPart();

                    flightdelay.setDepartureTime(departureTime);
                    flightdelay.setElapsedTime(elapsedTime);
                    flightdelay.setArrivalTime(arrivalTime);
                    flightdelay.setArrivalDelay(arrivalDelay);
                }
            }
            return list;
        }

        // Get records for report generating function
        else{
            Page<Flightdelay> page = new Page<>(1, 30);
            QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();

            String fromDate = searchCondition.get(2);
            String toDate = searchCondition.get(3);

            if (fromDate != "") {
                String[] v = fromDate.split("-");
                wrapper.ge("year", v[0]).ge("month", v[1]).ge("day", v[2]);
            }
            if (toDate != "") {
                String[] v = toDate.split("-");
                wrapper.le("year", v[0]).le("month", v[1]).le("day", v[2]);
            }
            IPage<Flightdelay> iPage = flightdelayMapper.selectPage(page, wrapper);
            List<Flightdelay> list = iPage.getRecords();
            for (Flightdelay flightdelay : list
            ) {
                if (flightdelay.getCancelled()) {
                    flightdelay.setDepartureTime(null);
                    flightdelay.setElapsedTime(null);
                    flightdelay.setArrivalTime(null);
                    flightdelay.setArrivalDelay(null);
                } else {
                    LocalTime departureTime = flightdelay.getWheelsOff().minusMinutes(flightdelay.getTaxiOut());
                    int elapsedTime = flightdelay.getAirTime() + flightdelay.getTaxiIn() + flightdelay.getTaxiOut();
                    LocalTime arrivalTime = flightdelay.getWheelsOn().plusMinutes(flightdelay.getTaxiIn());
                    Duration duration = Duration.between(arrivalTime, flightdelay.getScheduledArrival());
                    int arrivalDelay = -duration.toMinutesPart();

                    flightdelay.setDepartureTime(departureTime);
                    flightdelay.setElapsedTime(elapsedTime);
                    flightdelay.setArrivalTime(arrivalTime);
                    flightdelay.setArrivalDelay(arrivalDelay);
                }
            }
            return list;
        }
    }

    @Override
    public Boolean checkDuplicateRecord(Flightdelay flightdelay) {
        QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
        wrapper.eq("year",flightdelay.getYear()).eq("month",flightdelay.getMonth()).eq("day",flightdelay.getDay());
        wrapper.eq("dayOfWeek",flightdelay.getDayOfWeek()).eq("sourceAirportIATA",flightdelay.getSourceAirportIATA()).eq("destAirportIATA",flightdelay.getDestAirportIATA());
        //wrapper.eq("scheduledDeparture",flightdelay.getScheduledDeparture()).eq("departureDelay",flightdelay.getDepartureDelay());
        wrapper.eq("airlineIATA",flightdelay.getAirlineIATA()).eq("tailNumber",flightdelay.getTailNumber());
        List<Flightdelay> list = flightdelayMapper.selectList(wrapper);
        // Found duplicate record
        if(list.size()>0){
            return true;
        }
        else return false;
    }

    @Override
    public Integer getCount() {
        QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
        return flightdelayMapper.selectCount(wrapper);
    }

}
