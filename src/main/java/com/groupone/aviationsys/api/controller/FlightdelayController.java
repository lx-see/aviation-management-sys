package com.groupone.aviationsys.api.controller;

import com.groupone.aviationsys.api.entity.Flightdelay;
import com.groupone.aviationsys.api.entity.FlightdelayReport;
import com.groupone.aviationsys.api.service.IFlightdelayService;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author LXSee
 * @since 2021-10-26
 */
@Controller
public class FlightdelayController {

    @Autowired
    private IFlightdelayService flightdelayService;

    /**
        Show flight delay view page
     */
    @RequestMapping(value = "/flightdelay_show/page/{pageNo}/{pageSize}/sort/{sortCol}/{ascDesc}")
    public String flightdelay_show(@PathVariable("pageNo")Integer pageNo, @PathVariable("pageSize")Integer pageSize, @PathVariable("sortCol")String sortCol, @PathVariable("ascDesc")Integer ascDesc, Model model){

        List<Integer> count = flightdelayService.getCancellationReasonCount();
        List<Integer> countFlightDelayNum = flightdelayService.getFlightDelayCount();

        int lastPageNum;
        int rowCount = flightdelayService.getCount();
        lastPageNum = (rowCount/pageSize) +1;
        List<Integer> pageNumList = new ArrayList<>();
        if(pageNo%10==0){
            for (int i = (pageNo-9); i <= pageNo; i++) {
                pageNumList.add(i);
            }
        }
        else {
            for (int i = (pageNo / 10) * 10 + 1; i <= ((pageNo / 10) * 10 + 10) && i <= lastPageNum; i++) {
                pageNumList.add(i);
            }
        }
        List<Flightdelay> flightdelayList = flightdelayService.getFlightDelayList(pageNo,pageSize,sortCol,ascDesc);

        model.addAttribute("cancellationReasonCount",count);
        model.addAttribute("flightNumberCount",countFlightDelayNum);
        model.addAttribute("pageNum",pageNo);
        model.addAttribute("pageSize",pageSize);
        model.addAttribute("pageNumList",pageNumList);
        model.addAttribute("lastPageNum",lastPageNum);
        model.addAttribute("lastPageRange",lastPageNum/10*10);
        model.addAttribute("sortCol",sortCol);
        model.addAttribute("ascDesc",ascDesc);
        model.addAttribute("flightDelayList",flightdelayList);

        return "flightdelay_show";
    }


    /**
        Jasper Report
        Preview, Save & Print report
     */
    @PostMapping(value = "/printReport", consumes = "application/json")
    public void generateReport(@RequestBody Object reportParameter) throws SQLException, ClassNotFoundException, JRException, IOException {

        List<String> paras = (List<String>) reportParameter;
        Map<String,Object> parameters = new HashMap<>();
        parameters.put("reportTitle",paras.get(0));
        parameters.put("departmentName",paras.get(1));
        parameters.put("fromDate",paras.get(2));
        parameters.put("toDate",paras.get(3));

        List<Flightdelay> flightdelayList = flightdelayService.getFilteredFlightDelayList(paras);
        List<FlightdelayReport> reportList = new ArrayList<>();
        for (Flightdelay flightdelay : flightdelayList) {
            FlightdelayReport r = new FlightdelayReport();
            r.setFlightId(flightdelay.getFlightId());
            r.setDate(flightdelay.getYear() + "-" + flightdelay.getMonth() + "-" + flightdelay.getDay());
            r.setSourceAirport(flightdelay.getSourceAirportIATA());
            r.setDestAirport(flightdelay.getDestAirportIATA());
            r.setScheduledDeparture("" + flightdelay.getScheduledDeparture());
            r.setDepartureDelay("" + flightdelay.getDepartureDelay());
            r.setScheduledTime("" + flightdelay.getScheduledTime());
            r.setScheduledArrival("" + flightdelay.getScheduledArrival());
            r.setAirline(flightdelay.getAirlineIATA());
            r.setTailNumber(flightdelay.getTailNumber());
            r.setDepartureTime("" + flightdelay.getDepartureTime());
            r.setElapsedTime("" + flightdelay.getElapsedTime());
            r.setArrivalTime("" + flightdelay.getArrivalTime());
            r.setArrivalDelay("" + flightdelay.getArrivalDelay());
            r.setDistance(flightdelay.getDistance());
            r.setDiverted(flightdelay.getDiverted() ? "Yes" : "No");
            r.setCancelled(flightdelay.getCancelled() ? "Yes" : "No");
            reportList.add(r);
        }

        JRBeanCollectionDataSource jrBeanCollectionDataSource = new JRBeanCollectionDataSource(reportList);

        //获取文件流
        ClassPathResource resource = new ClassPathResource("report.jasper");
        InputStream in = resource.getInputStream();
        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(in);
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, jrBeanCollectionDataSource);
        JasperViewer.viewReport(jasperPrint, false);

        //打印
        //JasperPrintManager.printReport(jasperPrint, true);
    }


    /**
        Show flight delay manage page
     */
    @RequestMapping(value = "/flightdelay_manage/page/{pageNo}/{pageSize}/sort/{sortCol}/{ascDesc}")
    public String flightdelay_manage(@PathVariable("pageNo")Integer pageNo, @PathVariable("pageSize")Integer pageSize, @PathVariable("sortCol")String sortCol, @PathVariable("ascDesc")Integer ascDesc, Model model){
        List<Integer> countFlightDelayNum = flightdelayService.getFlightDelayCount();

        int lastPageNum;
        int rowCount = flightdelayService.getCount();
        lastPageNum = (rowCount/pageSize)+1;
        List<Integer> pageNumList = new ArrayList<>();
        if(pageNo%10==0){
            for (int i = (pageNo-9); i <= pageNo; i++) {
                pageNumList.add(i);
            }
        }
        else {
            for (int i = (pageNo / 10) * 10 + 1; i <= ((pageNo / 10) * 10 + 10) && i <= lastPageNum; i++) {
                pageNumList.add(i);
            }
        }
        List<Flightdelay> flightdelayList = flightdelayService.getFlightDelayList(pageNo,pageSize,sortCol,ascDesc);
        model.addAttribute("pageNum",pageNo);
        model.addAttribute("pageSize",pageSize);
        model.addAttribute("pageNumList",pageNumList);
        model.addAttribute("lastPageNum",lastPageNum);
        model.addAttribute("lastPageRange",lastPageNum/10*10);
        model.addAttribute("flightNumberCount",countFlightDelayNum);
        model.addAttribute("sortCol",sortCol);
        model.addAttribute("ascDesc",ascDesc);
        model.addAttribute("flightDelayList",flightdelayList);

        return "flightdelay_manage";
    }


    /**
        Delete flight delay record
     */
    @GetMapping(value = "/flightdelay_manage/delete/{id}")
    public String deleteFlightDelay(@PathVariable("id")Integer id){
        if(id == null || id < 1){
            String errorMsg = "Failed to delete! Id not exist!";
            System.out.println(errorMsg);
            return "flightdelay_manage";
        }
        flightdelayService.deleteFlightDelay(id);
        return "flightdelay_manage";
    }


    /**
        Insert flight delay record
     */
    @PostMapping(value = "/flightdelay_manage/insert", consumes = "application/json")
    public String insertFlightDelay(@RequestBody Flightdelay flightdelay) throws IOException {
        String errorMsg;

        if(flightdelay.getCancellationReason()!=null){
            flightdelay.setCancelled(true);
        }

        // Check empty input
        if(flightdelay.getDay()==null || flightdelay.getTailNumber()=="" ||
                flightdelay.getSourceAirportIATA()==null || flightdelay.getDestAirportIATA()==null ||
                flightdelay.getScheduledDeparture()==null || flightdelay.getScheduledArrival()==null ||
                flightdelay.getScheduledTime()==null || flightdelay.getDistance()==null ||
                flightdelay.getAirlineIATA()==null){
            errorMsg = "Failed to insert! Your input date, source airport, destination airport, scheduled departure, schedule arrival" +
                    ", scheduled time, distance and airline IATA should not be null!";
            System.out.println(errorMsg);
            return "flightdelay_manage";
        }

        // Same record already exist in the database
        if(flightdelayService.checkDuplicateRecord(flightdelay)){
            errorMsg = "Failed to insert! Record already exist!";
            System.out.println(errorMsg);
            return "flightdelay_manage";
        }

        flightdelayService.insertFlightDelay(flightdelay);
        return "flightdelay_manage";
    }


    /**
        Update flight delay record
     */
    @PostMapping(value = "/flightdelay_manage/update/{id}", consumes = "application/json")
    public String updateFlightDelay(@PathVariable("id")Integer id, @RequestBody Flightdelay flightdelay){
        String errorMsg;

        flightdelay.setFlightId(id);

        if(id == null || id < 1){
            errorMsg = "Failed to update! Id not exist!";
            System.out.println(errorMsg);
            return "flightdelay_manage";
        }

        if(flightdelay.getCancellationReason()!=null){
            flightdelay.setCancelled(true);
        }

        // Check empty input
        if(flightdelay.getDay()==null || flightdelay.getTailNumber()=="" ||
                flightdelay.getSourceAirportIATA()==null || flightdelay.getDestAirportIATA()==null ||
                flightdelay.getScheduledDeparture()==null || flightdelay.getScheduledArrival()==null ||
                flightdelay.getScheduledTime()==null || flightdelay.getDistance()==null ||
                flightdelay.getAirlineIATA()==null){
            errorMsg = "Failed to update! Your input date, source airport, destination airport, scheduled departure, schedule arrival" +
                    ", scheduled time, distance and airline IATA should not be null!";
            System.out.println(errorMsg);
            return "flightdelay_manage";
        }

        // Same record already exist in the database
        if(flightdelayService.checkDuplicateRecord(flightdelay)){
            errorMsg = "Failed to update! Record already exist!";
            System.out.println(errorMsg);
            return "flightdelay_manage";
        }
        flightdelayService.updateFlightDelay(flightdelay);

        return "flightdelay_manage";
    }

    @RequestMapping(value="/flightdelay_manage/searchById/{id}")
    @ResponseBody
    public Flightdelay searchFlightDelayById(@PathVariable("id")Integer id){
        return flightdelayService.getFlightDelay(id);
    }


    /**
        Show flight delay search page
     */
    @RequestMapping(value = "/flightdelay_search", method = RequestMethod.GET)
    public String flightdelay_search(Model model){
        List<Integer> count = flightdelayService.getCancellationReasonCount();
        List<Integer> countFlightDelayNum = flightdelayService.getFlightDelayCount();

        model.addAttribute("cancellationReasonCount",count);
        model.addAttribute("flightNumberCount",countFlightDelayNum);
        model.addAttribute("barName","");
        model.addAttribute("pieName","");

        return "flightdelay_search";
    }


    /**
        Search flight delay & view searched result
     */
    @PostMapping(value = "/flightdelay_search/view_search", consumes = "application/json")
    @ResponseBody
    public List<Flightdelay> searchFlightDelay(@RequestBody Object flightDelay){
        List<String> searchCondition = (List<String>) flightDelay;
        return flightdelayService.getFilteredFlightDelayList(searchCondition);
    }

    @GetMapping(value = "/flightdelay_search/view_search/graph/month/{barMonth}&{pieMonth}")
    public String searchFlightDelayGraph(@PathVariable("barMonth")Integer barMonth, @PathVariable("pieMonth")Integer pieMonth, Model model){
        List<Integer> countFlightDelayNum;
        List<Integer> countCancellationReason;

        String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
        String bar = "";
        String pie = "";

        if(barMonth==0){
            countFlightDelayNum = flightdelayService.getFlightDelayCount();
        }
        else{
            countFlightDelayNum = flightdelayService.getFlightDelayCount(barMonth);
            bar = months[barMonth-1];
        }
        if(pieMonth==0){
            countCancellationReason = flightdelayService.getCancellationReasonCount();
        }
        else{
            countCancellationReason = flightdelayService.getCancellationReasonCount(pieMonth);
            pie = months[pieMonth-1];
        }
        model.addAttribute("flightNumberCount",countFlightDelayNum);
        model.addAttribute("cancellationReasonCount",countCancellationReason);
        model.addAttribute("barName",bar);
        model.addAttribute("pieName",pie);

        return "flightdelay_search";
    }
}
