package com.dyh.controller;


import com.dyh.Bean.RespPageBean;
import com.dyh.entity.CheckOn;
import com.dyh.entity.IncreasingMoney;
import com.dyh.service.CheckOnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author daiyuhua
 */
@RestController
@RequestMapping("/oasys-back-end")
public class CheckOnController {
    @Autowired
    private CheckOnService checkOnService;


    @PostMapping("/normalCheckOn")
    public Boolean normalCheckOn(@RequestBody CheckOn checkOn){
        String dateBegin = "8:00:00";
        String dateEnd = "10:00:00";
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyyMMddHHmmss");
        String strDate = simpleDateFormat.format(date);
        String checkOnId = checkOn.getWorkId()+simpleDateFormat1.format(date);
        //截取当前时间
        int strDateH = Integer.parseInt(strDate.substring(11,13));
        int strDateM = Integer.parseInt(strDate.substring(14,16));
        int strDateS = Integer.parseInt(strDate.substring(17,19));

        //截取开始签到时间
        int dateBeginH = Integer.parseInt(dateBegin.substring(0,2));
        int dateBeginM = Integer.parseInt(dateBegin.substring(3,5));
        int dateBeginS = Integer.parseInt(dateBegin.substring(6,8));

        //截取结束签到时间
        int dateEndH = Integer.parseInt(dateEnd.substring(0,2));
        int dateEndM = Integer.parseInt(dateEnd.substring(3,5));
        int dateEndS = Integer.parseInt(dateEnd.substring(6,8));


        if ((strDateH >= dateBeginH && strDateH <= dateEndH)) {
            // 当前时间小时数在开始时间和结束时间小时数之间
            if (strDateH > dateBeginH && strDateH < dateEndH) {
                checkOn.setCheckOnId(checkOnId);
                checkOn.setCheckOnTime(date);
                checkOn.setIsLate("准时");
                return checkOnService.normalCheckOn(checkOn);
                // 当前时间小时数等于开始时间小时数，分钟数在开始和结束之间
            } else if (strDateH == dateBeginH && strDateM >= dateBeginM && strDateM <= dateEndM) {
                checkOn.setCheckOnId(checkOnId);
                checkOn.setCheckOnTime(date);
                checkOn.setIsLate("准时");
                return checkOnService.normalCheckOn(checkOn);
                // 当前时间小时数等于开始时间小时数，分钟数等于开始时间分钟数，秒数在开始和结束之间
            } else if (strDateH == dateBeginH && strDateM == dateBeginM && strDateS >= dateBeginS && strDateS <= dateEndS) {
                checkOn.setCheckOnId(checkOnId);
                checkOn.setCheckOnTime(date);
                checkOn.setIsLate("准时");
                return checkOnService.normalCheckOn(checkOn);
            }
            // 当前时间小时数大等于开始时间小时数，等于结束时间小时数，分钟数小等于结束时间分钟数
            else if (strDateH >= dateBeginH && strDateH == dateEndH && strDateM <= dateEndM) {
                checkOn.setCheckOnId(checkOnId);
                checkOn.setCheckOnTime(date);
                checkOn.setIsLate("准时");
                return checkOnService.normalCheckOn(checkOn);
                // 当前时间小时数大等于开始时间小时数，等于结束时间小时数，分钟数等于结束时间分钟数，秒数小等于结束时间秒数
            } else if (strDateH >= dateBeginH && strDateH == dateEndH && strDateM == dateEndM && strDateS <= dateEndS) {
                checkOn.setCheckOnId(checkOnId);
                checkOn.setCheckOnTime(date);
                checkOn.setIsLate("准时");
                return checkOnService.normalCheckOn(checkOn);
            } else {
                checkOn.setCheckOnId(checkOnId);
                checkOn.setCheckOnTime(date);
                checkOn.setIsLate("迟到");
                return checkOnService.normalCheckOn(checkOn);
            }
        } else {
            checkOn.setCheckOnId(checkOnId);
            checkOn.setCheckOnTime(date);
            checkOn.setIsLate("迟到");
            return checkOnService.normalCheckOn(checkOn);
        }
    }

    @GetMapping("getAllCheckOnByWorkId")
    public RespPageBean getAllCheckOnByWorkId(@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer size ,String workId){
        return checkOnService.findAllCheckOnByWorkId(page, size, workId);
    }
}
