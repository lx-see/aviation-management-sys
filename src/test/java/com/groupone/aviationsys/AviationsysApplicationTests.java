package com.groupone.aviationsys;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.groupone.aviationsys.api.entity.*;
import com.groupone.aviationsys.api.mapper.AirlineMapper;
import com.groupone.aviationsys.api.mapper.AirportMapper;
import com.groupone.aviationsys.api.mapper.FlightdelayMapper;
import com.groupone.aviationsys.api.mapper.RouteMapper;
import com.groupone.aviationsys.api.service.IFlightdelayService;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalTime;
import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
class AviationsysApplicationTests {
    @Autowired
    private FlightdelayMapper flightdelayMapper;
    @Autowired
    private AirlineMapper airlineMapper;
    @Autowired
    private RouteMapper routeMapper;
    @Autowired
    private AirportMapper airportMapper;

    @Test
    public void testSelectFlightDelayById() {
        Flightdelay flightdelay = this.flightdelayMapper.selectById(43);
        System.out.println(flightdelay);
    }
    @Test
    public void testSelectFlightDelayCount() {
        QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
        int count = flightdelayMapper.selectCount(wrapper);
        System.out.println(count);
    }
    @Test
    public void testDeleteFlightDelay() {
        // Call method from mapper layer to delete record
        int result = flightdelayMapper.deleteById(1);

        // Result = number of affected rows in MySQL database
        if(result <= 0){
            System.out.println("Fail to delete data!");
        }
    }
    @Test
    public void testInsertFlightDelay() {
        Flightdelay flightdelay = new Flightdelay();
        flightdelay.setAirlineIATA("AS");
        flightdelay.setSourceAirportIATA("IAA");
        flightdelay.setDestAirportIATA("JPA");
        int result = flightdelayMapper.insert(flightdelay);
        if(result == 0){
            System.out.println("Fail to insert data!");
        }
    }
    @Test
    public void testUpdateFlightDelay() {
        Flightdelay flightdelay = new Flightdelay();
        flightdelay.setAirlineIATA("AS");
        flightdelay.setSourceAirportIATA("IAA");
        flightdelay.setDestAirportIATA("JPA");
        int result = flightdelayMapper.updateById(flightdelay);
        if(result == 0){
            System.out.println("Fail to update data!");
        }
    }
    @Test
    public void testCheckDuplicateRecords() {
        Flightdelay flightdelay = new Flightdelay();
        flightdelay.setAirlineIATA("AS");
        flightdelay.setSourceAirportIATA("IAA");
        flightdelay.setDestAirportIATA("JPA");

        QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
        wrapper.eq("year",flightdelay.getYear()).eq("month",flightdelay.getMonth()).eq("day",flightdelay.getDay());
        wrapper.eq("dayOfWeek",flightdelay.getDayOfWeek()).eq("sourceAirportIATA",flightdelay.getSourceAirportIATA()).eq("destAirportIATA",flightdelay.getDestAirportIATA());
        //wrapper.eq("scheduledDeparture",flightdelay.getScheduledDeparture()).eq("departureDelay",flightdelay.getDepartureDelay());
        wrapper.eq("airlineIATA",flightdelay.getAirlineIATA()).eq("tailNumber",flightdelay.getTailNumber());
        List<Flightdelay> list = flightdelayMapper.selectList(wrapper);
        // Found duplicate record
        if(list.size()>0){
            System.out.println("Duplicate record found");;
        }
    }
    @Test
    public void testGetCancellationReasonCount() {
        List<Character> list = new ArrayList<>();
        list.add('A');
        list.add('B');
        list.add('C');
        list.add('D');
        List<Integer> lst = new ArrayList<>();
        for(int i=0; i<4; i++){
            QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
            wrapper.eq("month",1).eq("cancellationReason",list.get(i));
            Integer count = flightdelayMapper.selectCount(wrapper);
            lst.add(count);
        }
        for (int i: lst
             ) {
            System.out.println(i);
        }
    }
    @Test
    public void testFlightDelayCount() {
        List<Integer> dayList = new ArrayList<>();
        for(int i=1; i<=7; i++){
            dayList.add(i);
        }
        List<Integer> lst = new ArrayList<>();
        for(int j=0; j<7; j++){
            QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
            wrapper.eq("month",1).eq("day",dayList.get(j));
            Integer count = flightdelayMapper.selectCount(wrapper);
            lst.add(count);
        }
        for (int i: lst
        ) {
            System.out.println(i);
        }
    }
    @Test
    public void testSelectRecordsByPage() {
        Page<Flightdelay> page = new Page<>(1,10);
        QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();

        IPage<Flightdelay> iPage = this.flightdelayMapper.selectPage(page,wrapper);
        System.out.println("Total rows: "+iPage.getTotal());
        System.out.println("Total pages: "+iPage.getPages());
        System.out.println("Current page: "+iPage.getCurrent());

        List<Flightdelay> flightdelayList = iPage.getRecords();
        for (Flightdelay flightdelay: flightdelayList) {
            System.out.println(flightdelay);
        }
    }
    @Test
    public void testSelectRecordsByPage2() {
        Page<Flightdelay> page = new Page<>(1, 10);
        QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
        IPage<Flightdelay> iPage = this.flightdelayMapper.selectPage(page, wrapper);

        List<Flightdelay> flightdelayList = iPage.getRecords();

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
    }
    @Test
    public void testAdvancedSearch() {
        Flightdelay flightdelay = new Flightdelay();
        String fromDate = "2015-1-1";
        String toDate = "2015-1-2";
        String srcAirport = "ANC";
        String destAirport = "SEA";
        String tailNum = "N407AS";
        Page<Flightdelay> page = new Page<>(1, 30);
        QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();
        if (fromDate != "") {
            String[] v = fromDate.split("-");
            wrapper.ge("year",v[0]).ge("month",v[1]).ge("day",v[2]);
        }
        if (toDate != "") {
            String[] v = toDate.split("-");
            wrapper.le("year",v[0]).le("month",v[1]).le("day",v[2]);
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
        for(Flightdelay v: list){
            System.out.println(v);
        }
    }
    @Test
    public void testExportReport() throws JRException, IOException {
        Page<Flightdelay> page = new Page<>(1,10);
        QueryWrapper<Flightdelay> wrapper = new QueryWrapper<>();

        IPage<Flightdelay> iPage = this.flightdelayMapper.selectPage(page,wrapper);
        List<Flightdelay> flightdelayList = iPage.getRecords();

        List<FlightdelayReport> reportList = new ArrayList<>();
        for(int i=0; i<flightdelayList.size(); i++){
            FlightdelayReport r = new FlightdelayReport();
            r.setFlightId(flightdelayList.get(i).getFlightId());
            r.setDate(flightdelayList.get(i).getYear()+"-"+flightdelayList.get(i).getMonth()+"-"+flightdelayList.get(i).getDay());
            r.setSourceAirport(flightdelayList.get(i).getSourceAirportIATA());
            r.setDestAirport(flightdelayList.get(i).getDestAirportIATA());
            r.setScheduledDeparture(""+flightdelayList.get(i).getScheduledDeparture());
            r.setDepartureDelay(""+flightdelayList.get(i).getDepartureDelay());
            r.setScheduledTime(""+flightdelayList.get(i).getScheduledTime());
            r.setScheduledArrival(""+flightdelayList.get(i).getScheduledArrival());
            r.setAirline(flightdelayList.get(i).getAirlineIATA());
            r.setTailNumber(flightdelayList.get(i).getTailNumber());
            r.setDepartureTime(""+flightdelayList.get(i).getDepartureTime());
            r.setElapsedTime(""+flightdelayList.get(i).getElapsedTime());
            r.setArrivalTime(""+flightdelayList.get(i).getArrivalTime());
            r.setArrivalDelay(""+flightdelayList.get(i).getArrivalDelay());
            r.setDistance(flightdelayList.get(i).getDistance());
            r.setDiverted(flightdelayList.get(i).getDiverted()==true?"Yes":"No");
            r.setCancelled(flightdelayList.get(i).getCancelled()==true?"Yes":"No");
            reportList.add(r);
        }

        String filePath = "src/main/resources";

        Map<String,Object> parameters = new HashMap<>();
        parameters.put("reportTitle","Flight Delay Report");
        parameters.put("toDate","2015-1-1");
        parameters.put("fromDate","2015-1-2");

        JRBeanCollectionDataSource jrBeanCollectionDataSource = new JRBeanCollectionDataSource(reportList);
        JasperCompileManager.compileReport(filePath+"/report.jrxml");
        //File jasperFile = ResourceUtils.getFile(filePath+"/report.jasper");
        //JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperFile);
        //JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,parameters,jrBeanCollectionDataSource);
        //JasperExportManager.exportReportToHtmlFile(jasperPrint,"src/main/resources/report/Flight-delay.html");


        //JasperReport jasperReport = JasperCompileManager.compileReport(filePath);
        //JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,parameters,jrBeanCollectionDataSource);
        //JasperExportManager.exportReportToPdfFile(jasperPrint,"src/main/resources/report/Flight-delay.pdf");
    }
//    @Test
//    public void printReport(
//            @PathVariable("reportName") final String reportName,
//            @RequestParam(required = false) Map<String, Object> parameters, HttpServletRequest request,
//            HttpServletResponse response) throws SQLException, ClassNotFoundException, JRException, IOException {
//        parameters = parameters == null ? new HashMap<>() : parameters;
//        if (reportName.equals("query2")) {
//            parameters.put("wave_code", parameters.get("waveCode"));
//        } else if (reportName.equals("queryByWaveCode")) {
//            parameters.put("wave_code", parameters.get("waveCode"));
//        }
//        //获取文件流
//        ClassPathResource resource = new ClassPathResource(reportName + ".jasper");
//        InputStream in = resource.getInputStream();
//        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(in);
//        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource.getConnection());
//        //打印
//        JasperPrintManager.printReport(jasperPrint, true);
//    }
}
