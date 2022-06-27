package com.dyh.controller;

import com.dyh.Bean.RespPageBean;
import com.dyh.entity.Performance;
import com.dyh.service.PerformanceService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * @author daiyuhua
 * @date 2021-11-25
 */

@RestController
@ResponseBody
@RequestMapping("/oasys-back-end")
public class PerformanceController {
    final PerformanceService performanceService;

    public PerformanceController(PerformanceService performanceService) {
        this.performanceService = performanceService;
    }

    @GetMapping("getAllPerformanceByWorkId")
    public RespPageBean getAllPerformanceByWorkId(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, String workId) {
        System.out.println(page);
        return performanceService.findAllPerformanceByWorkId(workId, page, size);
    }

    @PostMapping(value = "upload")
    public Boolean uploadFiles(@RequestParam(value = "file") MultipartFile[] multipartFiles, @RequestParam(value = "performance") String performance) throws IOException, JsonParseException {
        //String workId = request.getParameter("workId");

        System.out.println(performance);
        ObjectMapper mapper = new ObjectMapper();

        JsonNode rootNode = mapper.readTree(performance);
        String workId = rootNode.path("workId").asText();
        String applyDate = rootNode.path("applyDate").asText();
        String applyDateFormat = applyDate.substring(0,10);
        String office = rootNode.path("office").asText();
        System.out.println(applyDateFormat);
        System.out.println(workId);
        Performance performanceTmp = new Performance();
        performanceTmp.setWorkId(workId);
        performanceTmp.setApplyDate(applyDateFormat);
        performanceTmp.setOffice(office);
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String performanceId = simpleDateFormat.format(date).trim() + workId;
        performanceTmp.setPerformanceId(performanceId);
        for (MultipartFile file : multipartFiles) {
            String filename = file.getOriginalFilename();
            String dirPath = "D:/ideaproject/oasys-back-end/src/main/resources/static/documents/performanceApply/";
            dirPath += performanceId + "/";
            File filePath = new File(dirPath);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            file.transferTo(new File(dirPath + filename));
        }
        return performanceService.addPerformance(performanceTmp);
    }

    @PostMapping("editIsReCheck")
    public Boolean editIsReCheck(@RequestBody Map<String, String> isReCheck) throws Exception {
        return performanceService.editIsReCheck(isReCheck.get("isReCheck"), isReCheck.get("workId"), isReCheck.get("applyDate"));
    }

    @GetMapping("getAllReCheck")
    public RespPageBean getAllReCheck(String office,@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer size){
        return performanceService.findAllReCheckByOffice(office, page, size);
    }

    @PostMapping("editReCheckStatus")
    public Boolean editReCheckStatus(@RequestBody Performance performance){
        Boolean flag = performanceService.editReCheckStatus(performance);
        System.out.println(performance);
        return performanceService.editReCheckStatus(performance);
    }
}
