package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cust")
public class CustController {
    //views에서 가져올때는 root 쓰지않아도됨
    String dir = "cust/";
    @RequestMapping("/get")
    public String get(Model model){
        //Database에서 데이터를 가지고 온다.
        List<CustDto> list = new ArrayList<>();
        list.add(new CustDto("id01", "pw01", "james"));
        list.add(new CustDto("id02", "pw01", "james"));
        list.add(new CustDto("id03", "pw01", "james"));
        list.add(new CustDto("id04", "pw01", "james"));
        list.add(new CustDto("id05", "pw01", "james"));
        list.add(new CustDto("id06", "pw01", "james"));
        list.add(new CustDto("id07", "pw01", "james"));
        list.add(new CustDto("id08", "pw01", "james"));
        list.add(new CustDto("id09", "pw01", "james"));
        list.add(new CustDto("id10", "pw01", "james"));
        list.add(new CustDto("id11", "pw01", "james"));
        list.add(new CustDto("id12", "pw01", "james"));
        list.add(new CustDto("id13", "pw01", "james"));
        list.add(new CustDto("id14", "pw01", "james"));
        list.add(new CustDto("id15", "pw01", "james"));
        list.add(new CustDto("id16", "pw01", "james"));
        list.add(new CustDto("id17", "pw01", "james"));
        list.add(new CustDto("id18", "pw01", "james"));
        list.add(new CustDto("id19", "pw01", "james"));
        list.add(new CustDto("id20", "pw01", "james"));
        list.add(new CustDto("id21", "pw01", "james"));
        list.add(new CustDto("id22", "pw01", "james"));
        list.add(new CustDto("id23", "pw01", "james"));
        list.add(new CustDto("id24", "pw01", "james"));
        list.add(new CustDto("id25", "pw01", "james"));

        model.addAttribute("custs", list); //custs라는 이름으로 list 담아 보냄
        model.addAttribute("center", dir + "get");
        return "index";

    }
}
