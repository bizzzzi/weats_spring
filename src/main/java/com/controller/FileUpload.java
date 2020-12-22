package com.controller;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.URLDecoder;
import java.util.List;

public class FileUpload {
    public static void fileUpload(MultipartFile fileData, String path, String fileName) throws IOException {
        String originalFileName = fileData.getOriginalFilename();
        String contentType = fileData.getContentType();
        long fileSize = fileData.getSize();
        InputStream is = null;
        OutputStream out = null;
        try {
            if (fileSize > 0) {
                is = fileData.getInputStream();
                File realUploadDir = new File(path);
                if (!realUploadDir.exists()) {
                    realUploadDir.mkdirs();
                }
                out = new FileOutputStream(path +"/"+ fileName);
                FileCopyUtils.copy(is, out);
            }else{
                new IOException("잘못된 파일을 업로드 하셨습니다.");
            }
        } catch (IOException e) {
            e.printStackTrace();
            new IOException("파일 업로드에 실패하였습니다.");
        }finally{
            if(out != null){out.close();}
            if(is != null){is.close();}
        }
    }

    public static void fileDelete(List<String> list){
        File file;
        try{
            for(String fileName: list){
                file = new File(URLDecoder.decode(fileName, "UTF-8"));
                System.out.println("Del fileName: "+fileName);
                System.out.println("Del file: "+file);
                file.delete();
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
