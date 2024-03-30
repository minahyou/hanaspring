package com.hana.app.repository;


import com.hana.app.data.CustDto;
import com.hana.app.exception.DuplicatedIdException;
import com.hana.app.exception.IdNotFoundException;
import com.hana.app.exception.NotFoundException;
import com.hana.app.frame.Dao;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CustDao implements Dao<String, CustDto> {


    @Override
    public int insert(CustDto custDto) throws DuplicatedIdException { //예외가 발생할 수 있음을 표시
       // System.out.println("Duplicated ID Exception");
        if(custDto.getId().equals("id01")){
            throw new DuplicatedIdException("EX0001"); //error코드
        }
        System.out.println("Oracle DB: Inserted ..." + custDto);
        return 0;
    }

    @Override
    public int delete(String s) throws IdNotFoundException{ //인터페이스에서 선언했으므로 자동 선언
        if(s.equals("id01")){
            throw new IdNotFoundException("Ex0002");
        }
        System.out.println("Oracle DB: Deleted ..." + s);
        return 0;
    }

    @Override
    public int update(CustDto custDto) throws IdNotFoundException{
        if(custDto.getId().equals("id03")){
            throw new IdNotFoundException("Ex0002");
        }
        System.out.println("Oracle DB: Updated ..." + custDto);
        return 0;
    }

    @Override
    public CustDto select(String s) throws NotFoundException {
        if(s.equals("id01")){
            throw new NotFoundException("Ex0003");
        }
        return CustDto.builder().id(s).pwd("pwd01").name("james").build();
    }

    @Override
    public List<CustDto> select() throws NotFoundException{
        List list = new ArrayList<CustDto>();
        boolean contains = list.equals("id01");
        if(contains){
            throw new NotFoundException("Ex0003");
        }
        list.add(CustDto.builder().id("id01").pwd("pwd01").name("james").build());
        list.add(CustDto.builder().id("id02").pwd("pwd02").name("james").build());
        list.add(CustDto.builder().id("id03").pwd("pwd03").name("james").build());

        return list;
    }
}
