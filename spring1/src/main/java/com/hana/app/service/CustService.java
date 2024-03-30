package com.hana.app.service;

import com.hana.app.data.CustDto;
import com.hana.app.exception.DuplicatedIdException;
import com.hana.app.exception.IdNotFoundException;
import com.hana.app.exception.NotFoundException;
import com.hana.app.frame.Dao;
import com.hana.app.frame.Service;
import com.hana.app.repository.CustDao;

import java.util.List;

public class CustService implements Service<String, CustDto> {
    Dao<String, CustDto> dao;

    public CustService(Dao dao){
        this.dao = dao;
    }

    //new로 하면 class가 의존적임 -> spring container 이용해서 객체 주입해야함(독립적으로)
   // public CustService() {
   //     dao = new CustDao();
   // }
    @Override
    public int add(CustDto custDto) throws DuplicatedIdException {
        System.out.println("Start TR ... ");
        // Insert ...
        try {
            dao.insert(custDto);
            dao.insert(custDto);
            System.out.println("COMMIT ... ");
        }catch (DuplicatedIdException e){
            System.out.println("ROLLBACK ... ");
            throw e;
        }finally {
            System.out.println("End TR ... ");
        }
        // SMS ..
        System.out.println("Send SMS ...");
        return 0;
}
@Override
    public int del(String s) throws IdNotFoundException {
    System.out.println("Start DELETE TR...");
    try {
        dao.delete(s);
        System.out.println("COMMIT ...");
    }catch (IdNotFoundException e){
        System.out.println("ROULLBACK ... ");
    }finally {
        System.out.println("End DELETE TR ...");
    }
    System.out.println("Send SMS ...");
    return 0;
    }

    @Override
    public int modify(CustDto custDto) throws IdNotFoundException {
        System.out.println("Start MODIFY TR... ");
        try{
            dao.update(custDto);
            System.out.println("COMMIT ...");
        } catch (IdNotFoundException e){
            System.out.println("ROULLBACK ...");
        }finally {
            System.out.println("END MODIFY TR ...");
        }
        System.out.println("Send SMS ...");
        return 0;
    }

    @Override
    //데이터를 모아서 뿌려줌
    public CustDto get(String s) throws NotFoundException {
        System.out.println("Start GET TR ...");
        try {
            dao.select(s);
        } catch (NotFoundException e) {
            System.out.println("ROLLBACK ...");
        } finally {
            System.out.println("END GET TR ...");
        }
        System.out.println("Send SMS ...");
        return dao.select(s);
    }

    @Override
    public List<CustDto> get() throws NotFoundException {
        System.out.println("Start GET LIST TR ...");
        try{
            return dao.select();
        } catch (NotFoundException e){
            System.out.println("ROLLBACK ...");
        } finally {
            System.out.println("END GET TR ...");
        }
        System.out.println("Send SMS ...");
        return dao.select();
    }
}
