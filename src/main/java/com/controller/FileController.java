package com.controller;

import com.dto.AttachFileDTO;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class FileController {

    @PostMapping(value = "/fileUploadAjax", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<AttachFileDTO>> fileUploadAjax(MultipartFile[] uploadFile) throws IOException {
//        String path = "/Users/hhhhbbbb/upload";
       // String path = "/C:/WeatsProjectsSpring/weats_spring/src/main/webapp/resources/images";
        String path = "/Users/gimhyeongjin/Desktop/TeamProject_spring/weats/src/main/webapp/resources/images";
        String fileName="";
        List<AttachFileDTO> list = new ArrayList<>();
        for (MultipartFile multipartFile: uploadFile){
            AttachFileDTO attachFileDTO = new AttachFileDTO();
            fileName = multipartFile.getOriginalFilename();
            String fileType = fileName.substring(fileName.lastIndexOf("."),fileName.length());
            fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
            attachFileDTO.setFileName(fileName);
            UUID uuid = UUID.randomUUID();
            attachFileDTO.setUuid(uuid.toString());
            attachFileDTO.setUploadPath(path);
            attachFileDTO.setImage(true);
            fileName = uuid.toString()+"_"+fileName;
            FileUpload.fileUpload(multipartFile,path,fileName);
            list.add(attachFileDTO);
        }
        System.out.println(list);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName){
        System.out.println("fileName: "+fileName);
        File file=new File(fileName);
        System.out.println("file: "+file);
        ResponseEntity<byte[]> result = null;
        try{
            HttpHeaders header = new HttpHeaders();
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
            System.out.println("result: "+result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }
    @PostMapping("/deleteFile")
    @ResponseBody
    public ResponseEntity<String> deleteFile(String fileName, String type){
        File file;
        try{
            file = new File(URLDecoder.decode(fileName, "UTF-8"));
            System.out.println("fileName: "+fileName);
            System.out.println("file: "+file);
            file.delete();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }

}
