package com.hana.app.data.dto;


import lombok.*;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor //default constructor 먼저 실행하므로 꼭 필요
public class CustDto {
    private String id;
    private String pwd;
    private String name;

}
