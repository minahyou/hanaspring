package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import com.hana.app.data.dto.ShopDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@RestController
public class AjaxImplController {
    @RequestMapping("/getservertime")
    public Object getservertime(){
        Date date = new Date();
        return date;
    }

    @RequestMapping("/getdata")
    public Object getdata(){
        List<CustDto> list = new ArrayList<>();
        list.add(new CustDto("id01", "pw01", "james1"));
        list.add(new CustDto("id02", "pw02", "james2"));
        list.add(new CustDto("id03", "pw03", "james3"));
        list.add(new CustDto("id04", "pw04", "james4"));
        list.add(new CustDto("id05", "pw05", "james5"));
        return list;
    }

    @RequestMapping("/geo/getdata")
    public Object geogetdata(){
        List<ShopDto> list = new ArrayList<>();
        list.add(new ShopDto(100, "순대국", "a.jpg", 37.5547611, 127.0654625 ));
        list.add(new ShopDto(101, "파스타", "b.jpg", 37.5747611, 127.0554625));
        list.add(new ShopDto(102, "햄버거", "c.jpg",37.5147611, 127.0154625));
        return list;
    }

    @RequestMapping("/geo/getdata1")
    public Object geogetdata1(){
        List<ShopDto> list = new ArrayList<>();
        list.add(new ShopDto(100, "서울", "a.jpg", 37.5447611,127.0564625 ));
        list.add(new ShopDto(101, "제주도", "b.jpg", 35.1290483,129.0446982));
        list.add(new ShopDto(102, "부산", "c.jpg",33.3846216,126.5534925));
        return list;
    }

    //부산
    @RequestMapping("/geo/getdata2")
    public Object geogetdata2(){
        List<ShopDto> list = new ArrayList<>();
        list.add(new ShopDto(100, "곽철이네", "gk.jpg", 35.069157050022056, 129.07792023462287 ));
        list.add(new ShopDto(101, "뿡돌이네 ", "bb.jpg", 35.067267650044684, 129.08051488462118));
        list.add(new ShopDto(102, "쭈굴이네", "jg.jpg",35.07914150029961, 129.09145828462616));
        return list;
    }

    //서울
    @RequestMapping("/geo/getdata3")
    public Object geogetdata3(){
        List<ShopDto> list = new ArrayList<>();
        list.add(new ShopDto(100, "기꾸스시", "gk.jpg", 37.556814400020095, 126.93329268461949 ));
        list.add(new ShopDto(101, "미분당 ", "bb.jpg", 37.556611800074336, 126.93495913461742));
        list.add(new ShopDto(102, "텐동식당", "jg.jpg", 37.543337300039084, 127.05465608462632));
        return list;
    }

    //제주
    @RequestMapping("/geo/getdata4")
    public Object geogetdata4(){
        List<ShopDto> list = new ArrayList<>();
        list.add(new ShopDto(100, "미영이네", "gk.jpg", 33.217734950024116, 126.24964248461968 ));
        list.add(new ShopDto(101, "숙성도 노형본관 ", "bb.jpg", 33.48502855003093, 126.48476503462584));
        list.add(new ShopDto(102, "논짓물식당", "jg.jpg",33.48862205005737, 126.49191528461823));
        return list;
    }




    @RequestMapping("/checkid")
    public Object checkid(@RequestParam("id") String id){
        String result = "1";
        if(id.equals("qqq")){
            result = "0";
        }
        return result;
    }

}
