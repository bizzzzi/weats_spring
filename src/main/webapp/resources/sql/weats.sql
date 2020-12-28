DROP TABLE RESERVATION_ITEM;
DROP TABLE RESERVATION_REVIEW;
DROP TABLE RESERVATION;
DROP TABLE LEPORTS_ITEM;
DROP TABLE LEPORTS;
drop table customer_support;
drop table customer_question;
drop table trade_comments;
drop table trade;
DROP TABLE PARTNER;
DROP TABLE MEMBER;
DROP SEQUENCE MEMBER_SEQ;
drop sequence support_seq;
drop sequence customer_question_seq;
drop sequence trade_comment_seq;
drop sequence trade_seq;
drop sequence leports_seq;
drop sequence partner_seq;
drop sequence leports_item_seq;
DROP SEQUENCE RS_REVIEW_SEQ;
DROP SEQUENCE RS_ITEM_SEQ;
DROP SEQUENCE RESERVATION_SEQ;
CREATE TABLE MEMBER
(
    USER_ID VARCHAR2(255 BYTE) primary key,
    USER_NAME VARCHAR2(255 BYTE) not null,
    USER_EMAIL VARCHAR2(255 BYTE) not null,
    USER_PW VARCHAR2(255 BYTE) not null,
    SALT VARCHAR2(255 BYTE) not null,
    USER_VERIFY NUMBER(1,0) DEFAULT 0,
    PARTNER_VERIFY NUMBER(1,0) DEFAULT 0,
    ADMIN_VERIFY NUMBER(1,0) DEFAULT 0
);
CREATE TABLE PARTNER (
                         PARTNER_ID VARCHAR2(255) PRIMARY KEY,
                         USER_ID VARCHAR2(255) NOT NULL,
                         C_NAME VARCHAR2(255) NOT NULL,
                         C_POSTNUM VARCHAR2(255) NOT NULL,
                         C_ADDRESS VARCHAR2(255) NOT NULL,
                         C_DETAIL_ADDRESS VARCHAR2(255) NOT NULL,
                         C_PHONE VARCHAR2(255) NOT NULL,
                         PARTNER_LICENSE_NUM VARCHAR2(255) NOT NULL,
                         PARTNER_LICENSE_DOCS VARCHAR2(4000) NOT NULL,
                         constraint FK_PARTNER_USER_ID FOREIGN KEY(USER_ID)
                             REFERENCES MEMBER(USER_ID) ON DELETE CASCADE
);
CREATE TABLE LEPORTS (
                         LEPORTS_ID VARCHAR2(255) PRIMARY KEY,
                         PARTNER_ID VARCHAR2(255) NOT NULL,
                         LEPORTS_TITLE VARCHAR2(255) NOT NULL,
                         LEPORTS_TYPE VARCHAR2(255) NOT NULL,
                         LEPORTS_LOC VARCHAR2(255) NOT NULL,
                         LEPORTS_REGIDATE DATE DEFAULT sysdate NOT NULL,
                         LEPORTS_MAIN_IMG VARCHAR2(4000) NOT NULL,
                         LEPORTS_SUB_IMG1 VARCHAR2(4000) ,
                         LEPORTS_SUB_IMG2 VARCHAR2(4000),
                         LEPORTS_SUB_IMG3 VARCHAR2(4000),
                         LEPORTS_SUB_IMG4 VARCHAR2(4000),
                         LEPORTS_CONTENT VARCHAR2(255) NOT NULL,
                         REVIEW_STAR NUMBER(2,1) default 0,
                         RESERVE_CNT NUMBER(8,0) default 0,
                         REVIEW_CNT NUMBER(5,0) DEFAULT 0,
                         CONSTRAINT FK_LEPORTS_PARTNER_ID FOREIGN KEY(PARTNER_ID)
                             REFERENCES PARTNER(PARTNER_ID) ON DELETE CASCADE
);
CREATE TABLE LEPORTS_ITEM (
                              LEPORTS_ITEM_ID VARCHAR2(255) primary key,
                              LEPORTS_ID VARCHAR2(255) NOT NULL,
                              LEPORTS_ITEM_TITLE VARCHAR2(255) NOT NULL,
                              LEPORTS_SUMMARY VARCHAR2(255) NOT NULL,
                              LEPORTS_PRICE NUMBER(8,0) NOT NULL,
                              LEPORTS_MAX_CAPACITY NUMBER(3,0) NOT NULL,
                              CONSTRAINT FK_LEPORTS_ITEM_LEPORTS_ID FOREIGN KEY(LEPORTS_ID)
                                  REFERENCES LEPORTS(LEPORTS_ID) ON DELETE CASCADE
);
CREATE TABLE RESERVATION
(
    RESERVATION_ID VARCHAR2(255 BYTE) primary key,
    USER_ID VARCHAR2(255 BYTE) NOT NULL ,
    LEPORTS_ID VARCHAR2(255 BYTE) NOT NULL ,
    RS_NAME VARCHAR2(255 BYTE) NOT NULL ,
    RS_PHONE VARCHAR2(255 BYTE) NOT NULL ,
    RS_PERSONS VARCHAR2(255 BYTE) NOT NULL ,
    RS_PAYMETHOD VARCHAR2(255 BYTE) NOT NULL ,
    RS_DATE VARCHAR2(255 BYTE) NOT NULL ,
    RS_PAYMENT_DATE DATE DEFAULT sysdate NOT NULL ,
    RS_PRICE NUMBER(8, 0) NOT NULL ,
    RS_ITEM_NAME VARCHAR2(255 BYTE) NOT NULL ,
    TID VARCHAR2(255 BYTE) ,
    REVIEW_VERIFY NUMBER(1, 0) DEFAULT 0,
    CONSTRAINT FK_RS_LEPORTS_ID FOREIGN KEY(LEPORTS_ID)
        REFERENCES LEPORTS(LEPORTS_ID) ON DELETE CASCADE,
    CONSTRAINT FK_RS_USER_ID FOREIGN KEY(USER_ID)
        REFERENCES MEMBER(USER_ID) ON DELETE CASCADE
);
CREATE TABLE RESERVATION_ITEM
(
    RS_ITEM_ID VARCHAR2(255 BYTE) primary key,
    RESERVATION_ID VARCHAR2(255 BYTE) NOT NULL,
    LEPORTS_ITEM_ID VARCHAR2(255 BYTE) NOT NULL,
    RS_ITEM_TITLE VARCHAR2(255 BYTE) ,
    RS_ITEM_PERSON NUMBER(8, 0) ,
    RS_ITEM_PRICE NUMBER(8, 0) ,
    CONSTRAINT FK_RESERVATION_ID FOREIGN KEY(RESERVATION_ID)
        REFERENCES RESERVATION(RESERVATION_ID) ON DELETE CASCADE,
    CONSTRAINT FK_LEPORTS_ITEM_ID FOREIGN KEY(LEPORTS_ITEM_ID)
        REFERENCES LEPORTS_ITEM(LEPORTS_ITEM_ID) ON DELETE CASCADE
);
CREATE TABLE RESERVATION_REVIEW
(
    REVIEW_ID VARCHAR2(255 BYTE) primary key ,
    LEPORTS_ID VARCHAR2(255 BYTE) NOT NULL ,
    RESERVATION_ID VARCHAR2(255 BYTE) NOT NULL ,
    USER_ID VARCHAR2(255 BYTE) NOT NULL ,
    REVIEW_COMMENTS VARCHAR2(4000 BYTE) NOT NULL ,
    REVIEW_REGIDATE DATE DEFAULT sysdate NOT NULL ,
    REVIEW_STAR NUMBER(1, 0) NOT NULL,
    CONSTRAINT FK_REVIEW_LEPORTS_ID FOREIGN KEY(LEPORTS_ID)
        REFERENCES LEPORTS(LEPORTS_ID) ON DELETE CASCADE,
    CONSTRAINT FK_REVIEW_RESERVATION_ID FOREIGN KEY(RESERVATION_ID)
        REFERENCES RESERVATION(RESERVATION_ID) ON DELETE CASCADE,
    CONSTRAINT FK_REVIEW_USER_ID FOREIGN KEY(USER_ID)
        REFERENCES MEMBER(USER_ID) ON DELETE CASCADE
);
CREATE TABLE TRADE(
                      trade_id varchar2(255 byte) primary key,
                      user_id varchar2(255 byte) not null,
                      trade_main_img varchar2(4000 byte) not null,
                      trade_sub_img1 varchar2(4000 byte),
                      trade_sub_img2 varchar2(4000 byte),
                      trade_sub_img3 varchar2(4000 byte),
                      trade_sub_img4 varchar2(4000 byte),
                      trade_title varchar2(255 byte) not null,
                      trade_contents varchar2(255 byte) not null,
                      trade_type varchar2(255 byte) not null,
                      trade_loc varchar2(255 byte) not null,
                      trade_phone varchar2(255 byte) not null,
                      trade_user_name varchar2(255 byte) not null,
                      trade_price number(8,0) not null,
                      trade_regidate date default sysdate not null,
                      constraint fk_trade_user_id foreign key(user_id)
                          references member(user_id) on delete cascade
);
CREATE TABLE TRADE_COMMENTS(
                               trade_comment_id varchar2(255 byte) primary key,
                               trade_id varchar2(255 byte) not null,
                               user_id varchar2(255 byte) not null,
                               trade_comment varchar2(255 byte) not null,
                               comment_regidate date default sysdate not null,
                               trade_comment_level varchar2(255 byte) not null,
                               trade_depth number default 0 not null,
                               constraint fk_trade_comments_trade_id foreign key(trade_id)
                                   references trade(trade_id) on delete cascade,
                               constraint fk_trade_comments_user_id foreign key(user_id)
                                   references member(user_id) on delete cascade
);
create table customer_question(
                                  question_id varchar2(255 byte) primary key,
                                  user_id varchar2(255 byte) not null,
                                  q_title varchar2(255 byte),
                                  q_type varchar2(255 byte),
                                  q_content varchar2(255 byte),
                                  q_reservation_id varchar2(255 byte),
                                  q_phone varchar2(255 byte),
                                  q_regidate date default sysdate not null,
                                  answer_verify number(1,0) default 0,
                                  user_email varchar2(255 byte),
                                  user_name varchar2(255 byte),
                                  question_group varchar2(255 byte),
                                  constraint fk_customer_question_user_id foreign key(user_id)
                                      references member(user_id) on delete cascade,
                                  constraint fk_customer_question_id_group foreign key(question_group)
                                      references customer_question(question_id) on delete cascade
);
create table customer_support(
                                 support_id varchar2(255 byte) primary key,
                                 s_type varchar2(255 byte) not null,
                                 s_question varchar2(4000 byte) not null,
                                 s_answer varchar2(4000 byte) not null
);
CREATE SEQUENCE MEMBER_SEQ MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE ;
CREATE SEQUENCE RESERVATION_SEQ MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE ;
CREATE SEQUENCE RS_ITEM_SEQ MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE ;
CREATE SEQUENCE RS_REVIEW_SEQ MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE ;
create sequence partner_seq minvalue 1 start with 1 increment by 1;
create sequence leports_seq minvalue 1 start with 1 increment by 1;
create sequence leports_item_seq minvalue 1 start with 1 increment by 1;
create sequence trade_seq MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE ;
create sequence trade_comment_seq MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE ;
create sequence customer_question_seq MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE ;
create sequence support_seq MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE ;
create or replace function rsItemSeq
return number
is
begin
return rs_item_seq.nextval;
end;
/
