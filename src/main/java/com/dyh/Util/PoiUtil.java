package com.dyh.Util;

import com.dyh.entity.Employee;
import com.dyh.entity.User;
import org.apache.poi.hpsf.DocumentSummaryInformation;
import org.apache.poi.hpsf.SummaryInformation;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * @author daiyuhua
 * @date 2022-01-04
 */
public class PoiUtil {
    /**
     * 导出功能
     */
    public static ResponseEntity<byte[]> exportEmpToExcel(List<User> users){
        HttpHeaders headers = null;
        ByteArrayOutputStream baos = null;
        try {
            HSSFWorkbook workbook = new HSSFWorkbook();
            workbook.createInformationProperties();
            DocumentSummaryInformation dsi = workbook.getDocumentSummaryInformation();
            dsi.setCategory("员工信息");
            SummaryInformation summaryInformation= workbook.getSummaryInformation();
            summaryInformation.setSubject("员工信息表");
            summaryInformation.setTitle("员工信息");
            HSSFSheet sheet = workbook.createSheet("庆珍日用品公司员工信息表");
            sheet.setColumnWidth(0,10*256);
            sheet.setColumnWidth(1,10*256);
            sheet.setColumnWidth(2,10*256);
            sheet.setColumnWidth(3,10*256);
            sheet.setColumnWidth(4,10*256);
            sheet.setColumnWidth(5,10*256);
            sheet.setColumnWidth(6,10*256);
            sheet.setColumnWidth(7,10*256);
            sheet.setColumnWidth(8,10*256);
            sheet.setColumnWidth(9,10*256);
            HSSFRow headerRow = sheet.createRow(0);
            HSSFCell cellId = headerRow.createCell(0);
            cellId.setCellValue("序号");
            HSSFCell cellWorkId = headerRow.createCell(1);
            cellWorkId.setCellValue("工号");
            HSSFCell cellFullname = headerRow.createCell(2);
            cellFullname.setCellValue("姓名");
            HSSFCell cellSex = headerRow.createCell(3);
            cellSex.setCellValue("性别");
            HSSFCell cellNation = headerRow.createCell(4);
            cellNation.setCellValue("民族");
            HSSFCell cellTelephone = headerRow.createCell(5);
            cellTelephone.setCellValue("联系电话");
            HSSFCell cellIdNo = headerRow.createCell(6);
            cellIdNo.setCellValue("身份证号");
            HSSFCell cellAddress = headerRow.createCell(7);
            cellAddress.setCellValue("居住地址");
            HSSFCell cellStatus = headerRow.createCell(8);
            cellStatus.setCellValue("在职状态");
            HSSFCell cellMoney = headerRow.createCell(9);
            cellMoney.setCellValue("薪资");
            for (int i=0;i<users.size();i++) {
                HSSFRow row = sheet.createRow(i+1);
                User user =users.get(i);
                System.out.println(user.toString());
                row.createCell(0).setCellValue(i+1);
                row.createCell(1).setCellValue(user.getEmployee().getWorkId());
                if (user.getEmployee().getFullname() != null){
                    row.createCell(2).setCellValue(user.getEmployee().getFullname());
                }
                if (user.getEmployee().getSex() != null){
                    row.createCell(3).setCellValue(user.getEmployee().getSex());
                }
                if (user.getEmployee().getNation() != null){
                    row.createCell(4).setCellValue(user.getEmployee().getNation());
                }
                if (user.getEmployee().getTelephone() != null){
                    row.createCell(5).setCellValue(user.getEmployee().getTelephone());
                }
                if (user.getEmployee().getNoId() != null){
                    row.createCell(6).setCellValue(user.getEmployee().getNoId());
                }
                if (user.getEmployee().getAddress() != null){
                    row.createCell(7).setCellValue(user.getEmployee().getAddress());
                }
                if (user.getEmployee().getStatus() != null){
                    row.createCell(8).setCellValue(user.getEmployee().getStatus());
                }
                if (user.getEmployee().getMoney() != null){
                    row.createCell(9).setCellValue(user.getEmployee().getMoney());
                }
            }
            headers = new HttpHeaders();
            headers.setContentDispositionFormData("test",new String("员工信息表.xls".getBytes(StandardCharsets.UTF_8),"iso-8859-1"));
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            baos = new ByteArrayOutputStream();
            workbook.write(baos);
        }catch (IOException e){
            e.printStackTrace();
        }
        return new ResponseEntity<byte[]>(baos.toByteArray(),headers, HttpStatus.CREATED);
    }
}
