-- product_sql.sql

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

drop table product;

-- 상품 시퀀스
create sequence product_seq;

drop sequence product_seq;

-- 커밋
commit;

-- product 테이블 전부 조회 
select * from product;