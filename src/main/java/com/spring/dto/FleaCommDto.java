package com.spring.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class FleaCommDto {
   // fleacomment 테이블에 맞춰서 Dto 작성
   private int f_postno; //게시물 번호
   private int f_cno;   //댓글 번호
   private String f_comment; //댓글 내용
   private String userid; //아이디 
   private Date f_cdate; //댓글 입력 일자
   private int f_like; //좋아요 여부
         //form에서 날짜값을 입력해서 저장하는경우는 DateTimeFormat을 붙여준다. 
         //입력받지 않으면 굳이 붙이지 않아도 된다.
   
}
