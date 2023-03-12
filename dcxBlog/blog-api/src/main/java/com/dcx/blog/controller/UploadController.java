package com.dcx.blog.controller;

import com.dcx.blog.utils.QiniuUtils;
import com.dcx.blog.vo.params.Result;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/8 20:41
 * @description：
 */
@RestController
@RequestMapping("upload")
public class UploadController {

    @Autowired
    private QiniuUtils qiniuUtils;

    @PostMapping
    public Result upload(@RequestParam("image")MultipartFile multipartFile){
        String originalFilename = multipartFile.getOriginalFilename();
        String fileName = UUID.randomUUID().toString()+"."+ StringUtils.substringAfterLast(originalFilename,".");
        boolean upload = qiniuUtils.upload(multipartFile, fileName);
        if (upload){
            return Result.success(QiniuUtils.url + fileName);
        }
        return Result.fail(20001,"上传失败");
    }
}
