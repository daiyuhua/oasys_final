package com.dyh.controller;


import com.dyh.Bean.RespPageBean;
import com.dyh.entity.Check;
import com.dyh.entity.Report;
import com.dyh.entity.Vacation;
import com.dyh.service.VacationService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * @author daiyuhua
 */
@RestController
@RequestMapping("/oasys-back-end")
public class VacationController {
    @Autowired
    private VacationService vacationService;

    @PostMapping("vacationAdd")
    public Boolean addVacation(@RequestParam(value = "file") MultipartFile[] multipartFiles, @RequestParam(value = "vacation") String vacation)throws IOException, ParseException {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(vacation);
        String workId = rootNode.path("workId").asText();
        String startTime = rootNode.path("startTime").asText();
        String endTime = rootNode.path("endTime").asText();
        String office = rootNode.path("office").asText();
        String vacationType = rootNode.path("vacationType").asText();
        String reason = rootNode.path("reason").asText();
        Vacation vacationNew = new Vacation();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String vacationId = workId+simpleDateFormat.format(date);
        Random random = new Random();
        for (int j=0;j<3;j++){
            vacationId+=String.valueOf(random.nextInt(10));
        }
        vacationNew.setVacationId(vacationId);
        vacationNew.setWorkId(workId);
        vacationNew.setOffice(office);
        vacationNew.setVacationType(vacationType);
        vacationNew.setStartTime(startTime);
        vacationNew.setEndTime(endTime);
        vacationNew.setReason(reason);
        Vacation vacationTmp = new Vacation();
        vacationTmp = vacationService.findVacationByWorkIdAndStatus(workId);
        if (vacationTmp == null){
            for (MultipartFile file : multipartFiles) {
                String filename = file.getOriginalFilename();
                System.out.println(filename);
                String dirPath = "D:/ideaproject/oasys-back-end/src/main/resources/static/documents/vacationApply/";
                dirPath += vacationId + "/";
                File filePath = new File(dirPath);
                if (!filePath.exists()) {
                    filePath.mkdirs();
                }
                file.transferTo(new File(dirPath + filename));
            }
            return vacationService.addVacation(vacationNew);
        }else {
            return false;
        }
    }

    @GetMapping("/getVacation")
    public RespPageBean findAllApply(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, String roleId){
        return vacationService.findAllVacation(page, size, roleId);
    }

    @PostMapping("applyVacation")
    public Boolean editVacationStatus(@RequestBody Vacation vacation){
        Boolean flag = false;
        Report report = new Report();
        report.setVacationId(vacation.getVacationId());
        flag = vacationService.addReport(report);
        if (flag==true){
            return vacationService.editVacationStatus(vacation);
        }else{
            return false;
        }
    }

    @GetMapping("getAllVacation")
    public RespPageBean findAllReport(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, String workId,String keyword){
        System.out.println(keyword);
        return vacationService.findVacationByWorkId(page, size, workId,keyword);
    }

    @GetMapping("getReport")
    public Report getReportByVacationId(String vacationId){
        return vacationService.findReportByVacationId(vacationId);
    }

    @PostMapping("editReport")
    public Boolean editReport(@RequestBody Report report){
        Date date = new Date();
        report.setReportTime(date);
        return vacationService.editReport(report);
    }

    @PostMapping("/editVacation")
    public Boolean editVacation(@RequestBody Vacation vacation){
        return vacationService.editVacation(vacation);
    }
}
