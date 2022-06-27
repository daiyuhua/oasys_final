package com.dyh.controller;

import com.dyh.Bean.RespPageBean;
import com.dyh.entity.IncreasingMoney;
import com.dyh.service.IncreasingMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

/**
 * @author daiyuhua
 */
@RestController
@RequestMapping("/oasys-back-end")
public class IncreasingMoneyController {
    @Autowired
    private IncreasingMoneyService increasingMoneyService;

    @GetMapping("getAllIncreasingMoney")
    public RespPageBean findIncreasingMoneyByWorkId(String workId, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        return increasingMoneyService.findIncreasingMoneyByWorkId(workId, page, size);
    }
    @PostMapping("addIncreasingMoney")
    public Boolean addIncreasingMoney(@RequestBody IncreasingMoney increasingMoney){

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");
        String applyDate = simpleDateFormat.format(increasingMoney.getApplyDate());

        //查询是否有在审核阶段的涨薪申请
        IncreasingMoney increasingMoneyTmp = increasingMoneyService.checkSame(increasingMoney.getWorkId(),applyDate);

        if (increasingMoneyTmp == null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
            String increasingMoneyId = sdf.format(increasingMoney.getApplyDate()) + increasingMoney.getWorkId();
            Random random = new Random();
            for (int j=0;j<3;j++){
                increasingMoneyId +=String.valueOf(random.nextInt(10));
            }
            increasingMoney.setIncreasingId(increasingMoneyId);
            return increasingMoneyService.addIncreasingMoney(increasingMoney);
        }else {
            return false;
        }
    }
    @GetMapping("getIncreasingApply")
    public RespPageBean findAllIncreasingApply(String office, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        return increasingMoneyService.findAllIncreasingApply(office, page, size);
    }
    
    @PostMapping("editApplyStatus")
    public Boolean editApplyStatus(@RequestBody IncreasingMoney increasingMoney){
        return increasingMoneyService.editApplyStatus(increasingMoney);
    }

    @GetMapping("getAllPassApply")
    public RespPageBean findAllPassApply(@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer size){
        return increasingMoneyService.findAllPassApply(page, size);
    }

    @PostMapping("editMoneyOfficeStatus")
    public Boolean editMoneyOfficeStatus(@RequestBody IncreasingMoney increasingMoney){
        return increasingMoneyService.editMoneyOfficeStatus(increasingMoney);
    }
}
