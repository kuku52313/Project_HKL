package com.hklmart.domain;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class RegistImageVO {

    private MultipartFile uploadImg;
    private MultipartFile contentImg;

}
