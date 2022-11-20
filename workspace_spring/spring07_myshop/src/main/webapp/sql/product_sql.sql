-- product_sql.sql

show databases;

create database practice;

use practice;

-- 상품 테이블
create table product
(
    product_code int primary key,
    product_name varchar(100) not null,
    description  varchar(2000),
    price        int default 0,
    filename     varchar(500),
    filesize     number DEFAULT 0 NOT NULL,
    regdate date DEFAULT sysdate
);

-- mariaDB
create table product
(
    product_code int AUTO_INCREMENT primary key,
    product_name varchar(100) not null,
    description  varchar(2000),
    price        int default 0,
    filename     varchar(500),
    filesize    bigint DEFAULT 0 NOT NULL,
    regdate datetime DEFAULT now()
);

set names utf8mb4;


drop table product;

-- 상품 시퀀스
create sequence product_seq;

drop sequence product_seq;

-- 커밋
commit;

-- product 테이블 전부 조회 
select * from product;