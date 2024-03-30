package com.hana.app.frame;

import com.hana.app.exception.DuplicatedIdException;
import com.hana.app.exception.IdNotFoundException;
import com.hana.app.exception.NotFoundException;

import java.util.List;

//모든 DTO를 insert하기 위해 object로 선언
//하지만 상위에서 하위객체 가져다 쓰기 위해서는 instanceof해야함
////=> 개발 표준을 만들기 위해 generic <K, V> Key value로 사용

public interface Dao<K,V> {
    /**
     * 2024. 3. 13
     * MAYOU
     * @param v: CustDto
     * @return int
     */
    int insert(V v) throws DuplicatedIdException; // public abstract int insert();
    int delete(K k) throws IdNotFoundException;
    int update(V v) throws IdNotFoundException;
    V select(K k) throws NotFoundException;
    List<V> select() throws NotFoundException;
}