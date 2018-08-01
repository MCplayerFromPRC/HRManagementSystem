package com.cc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

    @RequestMapping("/pages/{directory}/{path}")
    protected String redirect(@PathVariable("directory") String directory,@PathVariable("path") String path) {//@PathVariable 将路径传入参数
        return directory+"/"+path;
    }

}

