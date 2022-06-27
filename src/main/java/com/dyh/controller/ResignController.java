package com.dyh.controller;

import com.dyh.Bean.RespPageBean;
import com.dyh.entity.Resign;
import com.dyh.service.EmployeeService;
import com.dyh.service.ResignService;
import com.dyh.service.UserService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import static com.sun.org.apache.bcel.internal.util.ClassPath.getClassPath;

/**
 * @author daiyuhua
 */
@RestController
@Slf4j
@RequestMapping("/oasys-back-end")
public class ResignController {
    @Autowired
    private ResignService resignService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private UserService userService;

    @PostMapping("/resignApply")
    public Boolean resignApply(/*@RequestBody Resign resign,*/@RequestParam(name = "file") MultipartFile[] multipartFiles, @RequestParam(name = "form") String resign) throws Exception, IOException {
        SimpleDateFormat simpleDateFormatBuffer = new SimpleDateFormat("yyyyMMddHHmmss");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String temp = simpleDateFormat.format(date);
        System.out.println(temp);

        ObjectMapper mapper = new ObjectMapper();
        JsonNode jsonNode = mapper.readTree(resign);

        Resign resignObj = new Resign();

        resignObj.setWorkId(jsonNode.path("workId").asText());
        resignObj.setApplyDoc(jsonNode.path("applyDoc").asText());
        resignObj.setOffice(jsonNode.path("office").asText());
        resignObj.setReason(jsonNode.path("reason").asText());
        resignObj.setApplyDate(simpleDateFormat.parse(jsonNode.path("applyDate").asText()));
        String resignId = resignObj.getWorkId() + simpleDateFormatBuffer.format(date);
        System.out.println(resignId);
        resignObj.setResignId(resignId);

        Boolean flag = false;

        flag = resignService.addResignApply(resignObj);
        if (flag == true){
            for (MultipartFile file : multipartFiles) {
                String filename = file.getOriginalFilename();
                String dirPath = "D:/ideaproject/oasys-back-end/src/main/resources/static/documents/resignApply/";
                dirPath += resignId + "/";
                File filePath = new File(dirPath);
                if (!filePath.exists()) {
                    filePath.mkdirs();
                }
                file.transferTo(new File(dirPath + filename));
            }
            return flag;
        }else{
            return flag;
        }
    }

    @GetMapping("/getApply")
    public RespPageBean findAllApply(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, String roleId,String keyword) {
        return resignService.findAllApply(page, size, roleId,keyword);
    }

    @PostMapping("/applyResign")
    public Boolean editStatus(@RequestBody Resign resign) {
        Boolean flag = false;
        if ("通过".equals(resign.getStatus())) {
            flag = resignService.editResignApplyStatus(resign);
            if (flag == true) {
                flag = employeeService.editEmployeeStatus(resign.getWorkId());
                if (flag == true) {
                    flag = userService.editUserStatus(resign.getWorkId());
                }
            }
        }
        return flag;
    }
}
