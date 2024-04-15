-- 제약조건 상관없이 테이블 날리기 ("테이블명" 만 바꾸기)
drop TABLE "DEPARTMENT" cascade constraints;

-- 테이블 이름 변경
alter table "ATTACHMENT"
      rename to "FILE";


-- 테이블 조회

select *
From member;

SELECT *
from "FILE";


-- 테이블 이름 변경

ALTER TABLE ORDER_ITEMS RENAME TO ORDERITEMS;

-- 테이블 컬럼 이름변경

ALTER TABLE FILE RENAME COLUMN FILENAME TO NAME;

-- 시퀀스 이름변경

ALTER SEQUENCE ORDER_ITEM_SEQ RENAME TO ORDERITEM_SEQ;

-----------------------------------------------------------------------------------------------------
-- 테이블 등록 시작----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------




drop TABLE MEMBER cascade constraints;


-- 회원 테이블 생성
CREATE TABLE MEMBERS (
	MEMBER_ID	VARCHAR2(20)		NOT NULL,
	PASSWD	VARCHAR2(30)		NOT NULL,
	NAME	VARCHAR2(30)		NOT NULL,
	EMAIL	VARCHAR2(50)		NOT NULL,
	PHONE	VARCHAR2(20)		NOT NULL,
	REGDATE	DATE DEFAULT SYSDATE		NOT NULL
);




drop TABLE FILES cascade constraints;

-- 첨부파일 테이블 생성 []
CREATE TABLE FILES (
	FILE_ID	NUMBER(20)		NOT NULL,
	NAME	VARCHAR2(400)		NOT NULL,
	REGDATE	DATE DEFAULT SYSDATE		NOT NULL,
	ARTICLE_ID	NUMBER(20)		NOT NULL,
	PRODUCT_ID	NUMBER(20)		NOT NULL
);



drop TABLE ORDER cascade constraints;

-- 주문 테이블 생성 []
CREATE TABLE ORDERS (
	ORDER_ID	NUMBER(20)		NOT NULL,
	PRICE	NUMBER(20)		NOT NULL,
	ORDER_COMMENT	VARCHAR2(3000)		NULL,
	REGDATE	DATE DEFAULT SYSDATE  	NOT NULL,
	RECEIVER	VARCHAR2(30)		NOT NULL,
	ADDRESS	VARCHAR2(300)		NOT NULL,
	PHONE	VARCHAR2(20)		NOT NULL
);


drop TABLE PRODUCT cascade constraints;

-- 상품 테이블 생성 []
CREATE TABLE PRODUCTS (
	PRODUCT_ID	NUMBER(20)		NOT NULL,
	INGREDIENT	varchar2(100)		NOT NULL,
	PRICE	NUMBER(20)		NOT NULL,
	NAME	VARCHAR2(100)		NOT NULL,
	INFORMATION	VARCHAR2(4000)		NULL,
	STOCK	NUMBER(38)		NOT NULL,
	REGDATE	DATE DEFAULT SYSDATE		NOT NULL,
	SELL_QUANTITY	NUMBER(38)		NOT NULL,
	CATEGORY_ID	NUMBER(20)		NOT NULL
);


drop TABLE CATEGORYS cascade constraints;

-- 카테고리 테이블 생성 []
CREATE TABLE CATEGORYS (
	CATEGORY_ID	NUMBER(20)		NOT NULL,
	CATEGORY_NAME	VARCHAR2(100)		NOT NULL
);


drop TABLE BOARDS cascade constraints;

-- 게시판 테이블 생성 []
CREATE TABLE BOARDS (
	BOARD_ID	NUMBER(20)		NOT NULL,
	TITLE	VARCHAR2(200)		NOT NULL,
	DESCRIPTION	VARCHAR2(400)		NULL
);


drop TABLE ARTICLES cascade constraints;

-- 게시글 테이블 생성 []
CREATE TABLE ARTICLES (
	ARTICLE_ID	NUMBER(20)		NOT NULL,
	TITLE	VARCHAR2(400)		NOT NULL,
	CONTENT	VARCHAR2(4000)		NOT NULL,
	REGDATE	DATE DEFAULT SYSDATE		NOT NULL,
	HITCOUNT	NUMBER(20)		NOT NULL,
	PASSWD	VARCHAR2(8)		NOT NULL,
	BOARD_ID	NUMBER(20)		NOT NULL,
	MEMBER_ID	VARCHAR2(20)		NOT NULL
);


drop TABLE ORDER_ITEMS cascade constraints;

-- 주문항목 테이블 생성 []
CREATE TABLE ORDERITEMS (
	ORDERITEM_ID	NUMBER(20)		NOT NULL,
	ORDER_QUANTITY	NUMBER(38)		NOT NULL,
	PRODUCT_ID	NUMBER(20)		NOT NULL,
	ORDER_ID	NUMBER(20)		NOT NULL
);


drop TABLE PAYMENTS cascade constraints;

-- 결제 테이블 생성 []
CREATE TABLE PAYMENTS (
	PAYMENT_ID	NUMBER(20)		NOT NULL,
	REGDATE	DATE DEFAULT SYSDATE		NOT NULL,
	MEMBER_ID	VARCHAR2(20)		NOT NULL,
	ORDER_ID	NUMBER(20)		NOT NULL
);


drop TABLE COMMENTS cascade constraints;

-- 댓글 테이블 생성 []
CREATE TABLE COMMENTS (
	COMMENT_ID	NUMBER(20)		NOT NULL,
	CONTENT	VARCHAR2(4000)		NOT NULL,
	REGDATE	DATE DEFAULT SYSDATE		NOT NULL,
	PASSWD	VARCHAR2(10)		NOT NULL,
	ARTICLE_ID	NUMBER(20)		NOT NULL
);



-----------------------------------------------------------------------------------------------------
-- 제약조건 PK 등록 시작-----------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------


-- 회원 테이블 제약조건 생성 -PK
ALTER TABLE MEMBERS ADD CONSTRAINT MEMBER_ID_PK PRIMARY KEY (MEMBER_ID);

-- 첨부파일 테이블 제약조건 생성 -PK
ALTER TABLE FILES ADD CONSTRAINT FILE_ID_PK PRIMARY KEY (FILE_ID);

-- 주문 테이블 제약조건 생성 -PK
ALTER TABLE ORDERS ADD CONSTRAINT ORDER_ID_PK PRIMARY KEY (ORDER_ID);

-- 상품 테이블 제약조건 생성 -PK
ALTER TABLE PRODUCTS ADD CONSTRAINT PRODUCT_ID_PK PRIMARY KEY (PRODUCT_ID);

-- 카테고리 테이블 제약조건 생성 -PK
ALTER TABLE CATEGORYS ADD CONSTRAINT CATEGORY_ID_PK PRIMARY KEY (CATEGORY_ID);

-- 게시판 테이블 제약조건 생성 -PK
ALTER TABLE BOARDS ADD CONSTRAINT BOARD_ID_PK PRIMARY KEY (BOARD_ID);

-- 게시글 테이블 제약조건 생성 -PK
ALTER TABLE ARTICLES ADD CONSTRAINT ARTICLE_ID_PK PRIMARY KEY (ARTICLE_ID);

-- 주문항목 테이블 제약조건 생성 -PK
ALTER TABLE ORDERITEMS ADD CONSTRAINT ORDERITEM_ID_PK PRIMARY KEY (ORDERITEM_ID);

-- 결제 테이블 제약조건 생성 -PK
ALTER TABLE PAYMENTS ADD CONSTRAINT PAYMENT_ID_PK PRIMARY KEY (PAYMENT_ID);

-- 댓글 테이블 제약조건 생성 -PK
ALTER TABLE COMMENTS ADD CONSTRAINT COMMENT_ID_PK PRIMARY KEY (COMMENT_ID);



-----------------------------------------------------------------------------------------------------
-- 제약조건 FK 등록 시작-----------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------



-- 첨부파일 테이블 제약조건 생성 -FK
ALTER TABLE FILES
ADD (
	CONSTRAINT FILE_ARTICLE_ID_FK FOREIGN KEY (ARTICLE_ID)REFERENCES ARTICLES (ARTICLE_ID) ON DELETE CASCADE,
	CONSTRAINT FILE_PRODUCT_ID_FK FOREIGN KEY (PRODUCT_ID)REFERENCES PRODUCTS (PRODUCT_ID) ON DELETE CASCADE
);



-- 상품 테이블 제약조건 생성 -FK
ALTER TABLE PRODUCTS ADD 
CONSTRAINT PRODUCTS_CATEGORY_ID_FK FOREIGN KEY (CATEGORY_ID)REFERENCES CATEGORYS (CATEGORY_ID) ON DELETE CASCADE;

-- 게시글 테이블 제약조건 생성 -FK
ALTER TABLE ARTICLES ADD (
		CONSTRAINT ARTICLES_BOARD_ID_FK FOREIGN KEY (BOARD_ID)REFERENCES BOARDS (BOARD_ID) ON DELETE CASCADE,
  	CONSTRAINT ARTICLES_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID)REFERENCES MEMBERS (MEMBER_ID) ON DELETE CASCADE
);

-- 주문항목 테이블 제약조건 생성 -FK
	ALTER TABLE ORDERITEMS ADD (
		CONSTRAINT ORDERITEMS_PRODUCT_ID_FK FOREIGN KEY (PRODUCT_ID)REFERENCES PRODUCTS (PRODUCT_ID) ON DELETE CASCADE,
		CONSTRAINT ORDERITEMS_ORDER_ID_FK FOREIGN KEY (ORDER_ID)REFERENCES ORDERS (ORDER_ID) ON DELETE CASCADE
);


-- 결제 테이블 제약조건 생성 -FK
ALTER TABLE PAYMENTS ADD (
	CONSTRAINT PAYMENTS_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID)REFERENCES MEMBERS (MEMBER_ID) ON DELETE CASCADE,
	CONSTRAINT PAYMENTS_ORDER_ID_FK FOREIGN KEY (ORDER_ID)REFERENCES ORDERS (ORDER_ID) ON DELETE CASCADE
);

-- 댓글 테이블 제약조건 생성 -FK
ALTER TABLE COMMENTS ADD 
CONSTRAINT COMMENTS_ARTICLE_ID_FK FOREIGN KEY (ARTICLE_ID)REFERENCES ARTICLES (ARTICLE_ID) ON DELETE CASCADE;





-----------------------------------------------------------------------------------------------------
-- 시퀀스 등록 시작----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------


CREATE SEQUENCE ARTICLE_ID_SEQ
INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE FILE_ID_SEQ
INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE BOARD_ID_SEQ
INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE CATEGORY_ID_SEQ
INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE COMMENT_ID_SEQ
INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE ORDER_ID_SEQ
INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE ORDERITEM_ID_SEQ
INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE PAYMENT_ID_SEQ
INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE PRODUCT_ID_SEQ
INCREMENT BY 1 START WITH 1;



-- 시퀀스 삭제 -
DROP SEQUENCE ARTICLE_ID_SEQ;
DROP SEQUENCE BOARD_ID_SEQ;
DROP SEQUENCE CATEGORY_ID_SEQ;
DROP SEQUENCE COMMENT_ID_SEQ;
DROP SEQUENCE FILE_ID_SEQ;
DROP SEQUENCE ORDER_ID_SEQ;
DROP SEQUENCE ORDERITEM_ID_SEQ;
DROP SEQUENCE PAYMENT_ID_SEQ;
DROP SEQUENCE PRODUCT_ID_SEQ;






-----------------------------------------------------------------------------------------------------
-- 더미데이터 등록 시작----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------





-- MEMBER 더미데이터 --

INSERT INTO MEMBERS (MEMBER_ID, PASSWD, NAME, EMAIL, PHONE, REGDATE)
VALUES ('ttiding', '1111', '최은영', 'ttiding@naver.com', '01026998077', TO_DATE('2024-04-06', 'YYYY-MM-DD') );
INSERT INTO MEMBERS (MEMBER_ID, PASSWD, NAME, EMAIL, PHONE, REGDATE)
VALUES ('ssa9706', '1111', '송승아', 'ssa9706@gmail.com', '01011111111', TO_DATE('2024-04-06', 'YYYY-MM-DD') );
INSERT INTO MEMBERS (MEMBER_ID, PASSWD, NAME, EMAIL, PHONE, REGDATE)
VALUES ('ledjk99', '1111', '이덕재', 'ledjk99@gmail.com', '01012345678', TO_DATE('2024-04-06', 'YYYY-MM-DD') );
INSERT INTO MEMBERS (MEMBER_ID, PASSWD, NAME, EMAIL, PHONE, REGDATE)
VALUES ('ttlsduswo123', '1111', '신연재', 'tlsduswo123@gmail.com', '01022223333', TO_DATE('2024-04-06', 'YYYY-MM-DD') );

INSERT INTO MEMBERS (MEMBER_ID, PASSWD, NAME, EMAIL, PHONE, REGDATE)
VALUES ('monday', '1111', '월요일', 'monday@naver.com', '01033334444', TO_DATE('2024-04-06', 'YYYY-MM-DD') );
INSERT INTO MEMBERS (MEMBER_ID, PASSWD, NAME, EMAIL, PHONE, REGDATE)
VALUES ('tuesday', '1111', '화요일', 'tuesday@naver.com', '01044445555', TO_DATE('2024-04-06', 'YYYY-MM-DD') );
INSERT INTO MEMBERS (MEMBER_ID, PASSWD, NAME, EMAIL, PHONE, REGDATE)
VALUES ('wednesday', '1111', '수요일', 'wednesday@naver.com', '01055556666', TO_DATE('2024-04-06', 'YYYY-MM-DD') );
INSERT INTO MEMBERS (MEMBER_ID, PASSWD, NAME, EMAIL, PHONE, REGDATE)
VALUES ('thursday', '1111', '목요일', 'hursday@naver.com', '01066667777', TO_DATE('2024-04-06', 'YYYY-MM-DD') );
INSERT INTO MEMBERS (MEMBER_ID, PASSWD, NAME, EMAIL, PHONE, REGDATE)
VALUES ('friday', '1111', '금요일', 'friday@naver.com', '01077778888', TO_DATE('2024-04-06', 'YYYY-MM-DD') );
INSERT INTO MEMBERS (MEMBER_ID, PASSWD, NAME, EMAIL, PHONE, REGDATE)
VALUES ('saturday', '1111', '토요일', 'saturday@naver.com', '01088889999', TO_DATE('2024-04-06', 'YYYY-MM-DD') );
INSERT INTO MEMBERS (MEMBER_ID, PASSWD, NAME, EMAIL, PHONE, REGDATE)
VALUES ('sunday', '1111', '일요일', 'sunday@naver.com', '01099990000', TO_DATE('2024-04-06', 'YYYY-MM-DD') );





SELECT *
from MEMBERS;




-- CATEGORY 더미데이터 --
INSERT INTO CATEGORYS (CATEGORY_ID, CATEGORY_NAME)
VALUES (CATEGORY_ID_SEQ.nextval,'인기상품');

INSERT INTO CATEGORYS (CATEGORY_ID, CATEGORY_NAME)
VALUES (CATEGORY_ID_SEQ.nextval,'비타민');

INSERT INTO CATEGORYS (CATEGORY_ID, CATEGORY_NAME)
VALUES (CATEGORY_ID_SEQ.nextval,'루테인');

INSERT INTO CATEGORYS (CATEGORY_ID, CATEGORY_NAME)
VALUES (CATEGORY_ID_SEQ.nextval,'오메가');

INSERT INTO CATEGORYS (CATEGORY_ID, CATEGORY_NAME)
VALUES (CATEGORY_ID_SEQ.nextval,'아연');

INSERT INTO CATEGORYS (CATEGORY_ID, CATEGORY_NAME)
VALUES (CATEGORY_ID_SEQ.nextval,'유산균');

SELECT *
from CATEGORYS;



select *
from pRODUCTS;

-- PRODUCT 더미데이터 --


INSERT INTO PRODUCTS (PRODUCT_ID, PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, '10000', '닥터멀티비타민', '닥터멀티비타민 정보입니다.',1, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 1 );

INSERT INTO PRODUCTS (PRODUCT_ID, PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, '20000', '비타민A', '비타민A 정보입니다.',1, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 2);
INSERT INTO PRODUCTS (PRODUCT_ID, PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, '20000', '비타민B', '비타민B 정보입니다.',1, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 2);
INSERT INTO PRODUCTS (PRODUCT_ID, PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, '20000', '비타민C', '비타민C 정보입니다.',1, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 2);


INSERT INTO PRODUCTS (PRODUCT_ID,PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, '10000', '루테인1', '루테인1 정보입니다.',3, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 3 );
INSERT INTO PRODUCTS (PRODUCT_ID,PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, '20000', '루테인2', '루테인2 정보입니다.',3, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 3 );
INSERT INTO PRODUCTS (PRODUCT_ID,PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, '30000', '루테인3', '루테인3 정보입니다.',3, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 3 );


INSERT INTO PRODUCTS (PRODUCT_ID, PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, '10000', '오메가1', '오메가1 정보입니다.',4, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 4 );
INSERT INTO PRODUCTS (PRODUCT_ID, PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, '10000', '오메가2', '오메가2 정보입니다.',4, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 4 );
INSERT INTO PRODUCTS (PRODUCT_ID, PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, '10000', '오메가2', '오메가2 정보입니다.',4, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 4 );



INSERT INTO PRODUCTS (PRODUCT_ID,  PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, '10000', '닥터멀티비타민', '닥터멀티비타민 정보입니다.',5, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 1 );


SELECT *
from PRODUCTS;



-- BOARD 더미데이터 --------------------------------------------------------------------
INSERT INTO BOARDS (BOARD_ID, TITLE, DESCRIPTION)
VALUES (BOARD_ID_SEQ.NEXTVAL, '제품문의', '문의 게시판입니다.');

INSERT INTO BOARDS (BOARD_ID, TITLE, DESCRIPTION)
VALUES (BOARD_ID_SEQ.NEXTVAL, '구매후기', '후기 게시판입니다.');

INSERT INTO BOARDS (BOARD_ID, TITLE, DESCRIPTION)
VALUES (BOARD_ID_SEQ.NEXTVAL, '공지사항', '공지사항 게시판입니다.');

SELECT *
from BOARDS;



-- ARTICLE 더미데이터 ---------------------------------------------------------------------------
INSERT INTO ARTICLES (ARTICLE_ID, TITLE, CONTENT, REGDATE, HITCOUNT, PASSWD, BOARD_ID, MEMBER_ID)
VALUES (ARTICLE_ID_SEQ.NEXTVAL, 'ttiding 신규글 제목입니다.', 'ttiding 신규글 내용입니다.', TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, '1111', 1, 'ttiding');

INSERT INTO articles (article_id, board_id, member_id, title, content, passwd, hitcount)
VALUES      (article_id_seq.NEXTVAL, 1,'monday','monday 신규글 제목입니다.', 'monday 신규글 내용입니다.', '1111', 1);
INSERT INTO articles (article_id, board_id, member_id, title, content, passwd, hitcount)
VALUES      (article_id_seq.NEXTVAL, 1,'tuesday','tuesday 신규글 제목입니다.', 'tuesday 신규글 내용입니다.', '1111', 1);
INSERT INTO articles (article_id, board_id, member_id, title, content, passwd, hitcount)
VALUES      (article_id_seq.NEXTVAL, 1,'wednesday','wednesday 신규글 제목입니다.', 'wednesday 신규글 내용입니다.', '1111', 1);
INSERT INTO articles (article_id, board_id, member_id, title, content, passwd, hitcount)
VALUES      (article_id_seq.NEXTVAL, 1,'thursday','thursday 신규글 제목입니다.', 'thursday 신규글 내용입니다.', '1111', 1);
INSERT INTO articles (article_id, board_id, member_id, title, content, passwd, hitcount)
VALUES      (article_id_seq.NEXTVAL, 1,'friday','friday 신규글 제목입니다.', 'friday 신규글 내용입니다.', '1111', 1);
INSERT INTO articles (article_id, board_id, member_id, title, content, passwd, hitcount)
VALUES      (article_id_seq.NEXTVAL, 1,'saturday','saturday 신규글 제목입니다.', 'saturday 신규글 내용입니다.', '1111', 1);
INSERT INTO articles (article_id, board_id, member_id, title, content, passwd, hitcount)
VALUES      (article_id_seq.NEXTVAL, 1,'sunday','sunday 신규글 제목입니다.', 'sunday 신규글 내용입니다.', '1111', 1);

SELECT *
from ARTICLES;


SELECT *
from products ;


-- FILE 더미데이터 ---------------------------------------------------------------------------
INSERT INTO FILES (FILE_ID, NAME, REGDATE, ARTICLE_ID, PRODUCT_ID)
VALUES (FILE_ID_SEQ.NEXTVAL, '1111.jpeg', TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 1);

INSERT INTO FILES (FILE_ID, NAME, REGDATE, PRODUCT_ID)
VALUES (FILE_ID_SEQ.NEXTVAL, '1117.jpeg', TO_DATE('2024-04-06', 'YYYY-MM-DD'), 27);

SELECT *
from FILES ;


컬럼에 할당된 제약조건 확인
SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME ='products';

소유한 모든 제약조건 확인
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='files';

-- NotNull을 NULL로 변경
ALTER TABLE FILES modify article_id null;

-- 제약조건 사용못하게함
-- ALTER TABLE 테이블명 DISABLE CONSTARINT 컬럼명

ARTER TABLE FILES DISABLE CONSTARINT ARTICLE_ID_NN;

-- 제약조건 사용하게 함
-- ALTER TABLE 테이블명 ENABLE CONSTARINT 컬럼명
ALTER TABLE T_ENABLE
ENABLE CONSTRAINT TE_NAME_NN; 






-- COMMENT 더미데이터 --------------------------------------------------------------------------
INSERT INTO COMMENTS (COMMENT_ID, CONTENT, REGDATE, PASSWD, ARTICLE_ID)
VALUES (COMMENT_ID_SEQ.NEXTVAL, '댓글 내용입니다.',  TO_DATE('2024-04-06', 'YYYY-MM-DD'), '1111', 1 );

INSERT INTO COMMENTS (COMMENT_ID, CONTENT, REGDATE, PASSWD, ARTICLE_ID)
VALUES (COMMENT_ID_SEQ.NEXTVAL, 'monday 댓글 내용입니다.',  TO_DATE('2024-04-06', 'YYYY-MM-DD'), '1111', 3 );
INSERT INTO COMMENTS (COMMENT_ID, CONTENT, REGDATE, PASSWD, ARTICLE_ID)
VALUES (COMMENT_ID_SEQ.NEXTVAL, 'thesday 댓글 내용입니다.',  TO_DATE('2024-04-06', 'YYYY-MM-DD'), '1111', 4 );
INSERT INTO COMMENTS (COMMENT_ID, CONTENT, REGDATE, PASSWD, ARTICLE_ID)
VALUES (COMMENT_ID_SEQ.NEXTVAL, 'wednesday 댓글 내용입니다.',  TO_DATE('2024-04-06', 'YYYY-MM-DD'), '1111', 5 );
INSERT INTO COMMENTS (COMMENT_ID, CONTENT, REGDATE, PASSWD, ARTICLE_ID)
VALUES (COMMENT_ID_SEQ.NEXTVAL, 'thursday 댓글 내용입니다.',  TO_DATE('2024-04-06', 'YYYY-MM-DD'), '1111', 6 );
INSERT INTO COMMENTS (COMMENT_ID, CONTENT, REGDATE, PASSWD, ARTICLE_ID)
VALUES (COMMENT_ID_SEQ.NEXTVAL, 'friday 댓글 내용입니다.',  TO_DATE('2024-04-06', 'YYYY-MM-DD'), '1111', 7 );
INSERT INTO COMMENTS (COMMENT_ID, CONTENT, REGDATE, PASSWD, ARTICLE_ID)
VALUES (COMMENT_ID_SEQ.NEXTVAL, 'saturday 댓글 내용입니다.',  TO_DATE('2024-04-06', 'YYYY-MM-DD'), '1111', 8 );
INSERT INTO COMMENTS (COMMENT_ID, CONTENT, REGDATE, PASSWD, ARTICLE_ID)
VALUES (COMMENT_ID_SEQ.NEXTVAL, 'sunday 댓글 내용입니다.',  TO_DATE('2024-04-06', 'YYYY-MM-DD'), '1111', 9 );

SELECT *
from COMMENTS;


select *
from members;

select *
from orders;



-- ORDER 더미데이터 ------------------------------------------------------------------------------------
INSERT INTO ORDERS (ORDER_ID, PRICE, ORDER_COMMENT, REGDATE, RECEIVER, ADDRESS, PHONE)
VALUES (ORDER_ID_SEQ.NEXTVAL, 10000, '1. 부재시 문앞에 놓아주세요.', TO_DATE('2024-04-06', 'YYYY-MM-DD'), '일요일', '서울시 노원구 상계동 이젠컴퓨터학원', '0101111111');

INSERT INTO ORDERS (ORDER_ID, PRICE, ORDER_COMMENT, REGDATE, RECEIVER, ADDRESS, PHONE)
VALUES (ORDER_ID_SEQ.NEXTVAL, 10000, '1. 부재시 문앞에 놓아주세요.', TO_DATE('2024-04-06', 'YYYY-MM-DD'), '일요일', '서울시 노원구 상계동 이젠컴퓨터학원', '0101111111');






INSERT INTO ORDERS (ORDER_ID, PRICE, ORDER_COMMENT, REGDATE, RECEIVER, ADDRESS, PHONE)
VALUES (ORDER_ID_SEQ.NEXTVAL, 10000, '1. 부재시 문앞에 놓아주세요.', TO_DATE(sysdate, 'YYYY-MM-DD HH24:mi:SS') as regdate, '최은영', '서울시 노원구 상계동 이젠컴퓨터학원', '01012345678');

INSERT INTO ORDERS (order_id, price, order_comment, regdate, receiver, address, phone)
VALUES (ORDER_ID_SEQ.NEXTVAL, 10000, '1. 부재시 문앞에 놓아주세요.', TO_DATE(sysdate, 'YYYY-MM-DD HH24:mi:SS') as regdate, '월요일', '서울시 노원구 상계동 이젠컴퓨터학원', '0100000000');


INSERT INTO ORDERS (order_id, price, order_comment, regdate, receiver, address, phone)
VALUES (ORDER_ID_SEQ.NEXTVAL, 10000, '1. 부재시 문앞에 놓아주세요.', TO_DATE(sysdate, 'YYYY-MM-DD HH24:mi:SS') as regdate, '화요일', '서울시 노원구 상계동 이젠컴퓨터학원', '0100000000');


SELECT *
from members;
SELECT *
from ORDERS;
SELECT *
from products;


-- ORDER_ITEM 더미데이터 --
--ttiding오더아이템스
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 1, 1, 1);
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 2, 21, 1);
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 3, 23, 1);
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 1, 24, 1);
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 1, 25, 1);

--월요일오더아이템스
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 1, 23, 41);
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 1, 21, 41);
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 3, 24, 41);
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 1, 25, 41);

SELECT *
from ORDERS
where order_id = 42;


--화요일오더아이템스
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 2, 25, 42);
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 1, 22, 42);
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 2, 24, 42);
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 1, 25, 42);
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 1, 26, 42);


SELECT *
from ORDERITEMS;


SELECT *
from ORDERS;

SELECT *
from Members;


-- PAYMENT 더미데이터 --
INSERT INTO PAYMENTS (PAYMENT_ID, REGDATE, MEMBER_ID, ORDER_ID)
VALUES (PAYMENT_ID_SEQ.NEXTVAL, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'ttiding', 1);
INSERT INTO PAYMENTS (PAYMENT_ID, REGDATE, MEMBER_ID, ORDER_ID)
VALUES (PAYMENT_ID_SEQ.NEXTVAL, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'monday', 41);
INSERT INTO PAYMENTS (PAYMENT_ID, REGDATE, MEMBER_ID, ORDER_ID)
VALUES (PAYMENT_ID_SEQ.NEXTVAL, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'tuesday', 42);
INSERT INTO PAYMENTS (PAYMENT_ID, REGDATE, MEMBER_ID, ORDER_ID)
VALUES (PAYMENT_ID_SEQ.NEXTVAL, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'wednesday', 43);
INSERT INTO PAYMENTS (PAYMENT_ID, REGDATE, MEMBER_ID, ORDER_ID)
VALUES (PAYMENT_ID_SEQ.NEXTVAL, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'thursday', 44);
INSERT INTO PAYMENTS (PAYMENT_ID, REGDATE, MEMBER_ID, ORDER_ID)
VALUES (PAYMENT_ID_SEQ.NEXTVAL, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'friday', 45);
INSERT INTO PAYMENTS (PAYMENT_ID, REGDATE, MEMBER_ID, ORDER_ID)
VALUES (PAYMENT_ID_SEQ.NEXTVAL, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'saturday', 46);
INSERT INTO PAYMENTS (PAYMENT_ID, REGDATE, MEMBER_ID, ORDER_ID)
VALUES (PAYMENT_ID_SEQ.NEXTVAL, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'sunday', 47);

INSERT INTO PAYMENTS (payment_id, regdate, member_id, order_id)
VALUES (PAYMENT_ID_SEQ.NEXTVAL, TO_DATE(sysdate, 'YYYY-MM-DD HH24:mi:SS') as regdate, 'sunday', 1);

SELECT *
from PAYMENTS;




--------------------------------------------------------------------------------------------------------
-- 인텔리 제이 등록을 위한 SQL 시작----------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------




-- 전체 회원 조회 테스트 
SELECT  *
FROM members
ORDER BY regdate DESC;

 commit;

SELECT  *
FROM PRODUCTS;

ALTER TABLE PRODUCTS DROP COLUMN INGREDIENT;
-- 아이디로 회원 조회(상세) 
SELECT  member_id ,name ,email , CASE WHEN LENGTH(phone) = 11 THEN SUBSTR (phone, 0, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8,4) END AS phone , TO_CHAR(regdate,'yyyy-MM-DD HH24:MI:SS') regdate
FROM members 
WHERE member_id = 'monday';


-- 아이디/비밀번호로 회원 조회(로그인) 
SELECT  member_id ,name ,email
FROM members
WHERE member_id = 'monday'
AND passwd = '1111';

commit;

-- 검색값에 따른 회원목록 조회 
SELECT  member_id ,name ,email , CASE WHEN LENGTH(phone) = 11 THEN SUBSTR (phone, 0, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8,4) END AS phone, TO_CHAR(regdate,'yyyy-MM-DD') regdate
FROM members
WHERE member_id = 'monday' OR name LIKE '%월%';

-- 사용자 선택페이지 및 화면에 보여지는 목록개수 설정에 따른 사용자 목록 반환(페이징 처리) 
SELECT  member_id ,name ,passwd ,email ,CASE WHEN LENGTH(phone) = 11 THEN SUBSTR (phone, 0, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8,4) END AS phone ,regdate
FROM(	SELECT  CEIL(ROWNUM / 10) page, member_id, name, passwd, email, phone, regdate	
FROM	(	SELECT  member_id ,name ,passwd ,email ,phone ,TO_CHAR(regdate,'YYYY-MM-DD DAY') regdate FROM members ORDER BY regdate DESC	))
WHERE page = 1;


-- 전화번호 에 하이픈 넣어서 검색
SELECT  member_id ,name ,passwd ,email ,regdate, CASE WHEN LENGTH(phone) = 11 THEN SUBSTR (phone, 0, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8,4) END AS phone
FROM members;



-- 사용자 선택페이지, 조회 목록개수, 검색값에 따른 사용자 목록 반환(검색값에 따른 페이징 처리) 
SELECT  member_id ,name ,passwd ,email , CASE WHEN LENGTH(phone) = 11 THEN SUBSTR (phone, 0, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8,4) END AS phone, regdate
FROM(	SELECT  CEIL(ROWNUM / 10) page ,member_id ,name ,passwd ,email	, phone, regdate
	FROM	(	SELECT  member_id ,name ,passwd ,email ,phone ,TO_CHAR(regdate,'YYYY-MM-DD DAY') regdate
		FROM members
		WHERE member_id = 'monday' OR name LIKE '%월%'
		ORDER BY regdate DESC 	)) WHERE page = 1;

-- 전체 회원수 조회
SELECT  COUNT(*) count
FROM members;

-- 검색값에 따른 회원수 조회 - 페이징 처리 시 필요 
SELECT  COUNT(*) count
FROM members
WHERE member_id = 'monday' OR name LIKE '%월%'; 


DELETE
FROM members
WHERE member_id = 'thusday';





-----------------------------------------
--다중 게시판 구축을 위한 SQL 시작-------
-----------------------------------------


-- 게시판 전체 목록 조회
SELECT board_id, title, description
FROM   boards
ORDER BY board_id;


--#4. 게시글 테이블 생성
DROP TABLE articles;

SELECT *
FROM   articles
ORDER BY article_id;




-- 자유게시판 신규글 등록  테스트
INSERT INTO articles (article_id, board_id, member_id, title, content, passwd, hitcount)
VALUES      (article_id_seq.NEXTVAL, 1,'monday','monday 신규글 제목입니다.', 'monday 신규글 내용입니다.', '1111', 1);
INSERT INTO articles (article_id, board_id, member_id, title, content, passwd, hitcount)


commit;


-- 자유게시판 댓글 등록  테스트

INSERT INTO COMMENTS (COMMENT_ID, CONTENT, REGDATE, PASSWD, ARTICLE_ID)
VALUES (COMMENT_ID_SEQ.NEXTVAL, 'monday 댓글 내용입니다.',  TO_DATE('2024-04-06', 'YYYY-MM-DD'), '1111', 3 );

SELECT *
FROM   comments
ORDER BY comment_id;

-- 댓글 조회 테스트
-- 타이틀 아이디 패스워드 

SELECT 
FROM   comments
ORDER BY comment_id;








COMMIT;


------------------------------
-- 결제페이지 구현위한 SQL문
--------------------------------
SELECT name
FROM members;

SELECT *
FROM orders;

SELECT order_id,price,order_comment,receiver,address,phone
FROM orders;


SELECT orderitem_id, order_quantity, product_id, order_id
FROM orderitems;

SELECT payment_id, regdate, member_id, order_id
FROM payments;


SELECT payment_id, regdate, member_id, order_id
FROM payments
WHERE payment_id=1;

-- pay.jsp 필요한 정보조회
-- 수령인,연락처,배송지,배송메세지,상품금액
SELECT receiver, phone, address, order_comment, price
FROM orders;


-- orderlist.jsp 필요한 정보 조회
-- 주문일 주문번호 수령인 연락처 결제금액 구매한상품 배송메세지

SELECT regdate, order_id, receiver, phone, price, order_comment
FROM orders;

SELECT order_id, price, order_comment, regdate, receiver, address, phone
FROM orders;


SELECT *
FROM members;


SELECT *
FROM orders;

SELECT *
FROM payments;


--결제정보와 주문 정보를 합쳐서 가져오기

SELECT o.order_id, o.price, o.order_comment, TO_CHAR(o.regdate,'yyyy-MM-DD HH24:MI:SS') as order_regdate, o.receiver, o.address, o.phone, p.payment_id, TO_CHAR(p.regdate,'yyyy-MM-DD HH24:MI:SS') as payment_regdate, p.member_id
  FROM orders o
       JOIN payments p ON o.order_id = p.order_id
 WHERE o.order_id = 42;

 SELECT o.order_id order_id, o.price order_price , o.order_comment order_comment, TO_CHAR(o.regdate,'yyyy-MM-DD HH24:MI:SS') order_regdate, o.receiver order_receiver, o.address order_address, o.phone order_phone, p.payment_id payment_id, TO_CHAR(p.regdate,'yyyy-MM-DD HH24:MI:SS') payment_regdate, p.member_id member_id
 FROM orders o
 JOIN payments p ON o.order_id = p.order_id;


 commit;







-- ORDER_ITEM 더미데이터 --
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 1, 1, 1);

SELECT *
from ORDERITEMS;



-- orders+paments 합친 테이블 목록에서 오더아이디로 조회하기
 SELECT TO_CHAR(o.regdate,'yyyy-MM-DD HH24:MI:SS'), o.order_id, o.receiver, o.phone, o.price, o.order_comment,  as order_regdate, , o.address, o.phone, p.payment_id, TO_CHAR(p.regdate,'yyyy-MM-DD HH24:MI:SS') as payment_regdate, p.member_id
  FROM orders o
       JOIN payments p ON o.order_id = p.order_id
 WHERE o.order_id = 1;


 commit;




--결제정보와 주문 정보를 합쳐서 가져오기

SELECT o.order_id, o.price, o.order_comment, TO_CHAR(o.regdate,'yyyy-MM-DD HH24:MI:SS') as order_regdate, o.receiver, o.address, o.phone, p.payment_id, TO_CHAR(p.regdate,'yyyy-MM-DD HH24:MI:SS') as payment_regdate, p.member_id
  FROM orders o
       JOIN payments p ON o.order_id = p.order_id


-- 주문일, 주문번호 , 수령인, 연락처, 결제금액, 구매한상품, 배송메세지





-- 주문리스트 불러오기 orderlist.jsp
--orders(수취인,전화번호,주소,배송메세지,결제금액) + paments(결제날짜,결제금액) + orderitems(상품이미지,상품번호,상품명,수량,상품가) 합친것




SELECT o.order_id, o.price, o.order_comment, o.receiver, o.address, o.phone, p.payment_id, TO_CHAR(p.regdate,'yyyy-MM-DD HH24:MI:SS') as payment_regdate, p.member_id
  FROM orders o
       JOIN payments p ON o.order_id = p.order_id






select *
from orders;

select *
from orderitems;

select *
from products;

INSERT INTO FILES (FILE_ID, NAME, REGDATE, ARTICLE_ID, PRODUCT_ID)






SELECT y.payment_id payment_id, TO_CHAR(y.regdate,'yyyy-MM-DD HH24:MI:SS') payment_regdate, 
			 o.order_id order_id, o.price order_price, o.order_comment order_comment, o.receiver receiver, o.address order_address, o.phone order_phone,
			 l.orderitem_id orderitem_id, l.order_quantity order_quantity,
			 p.product_id product_id, p.price product_price, p.name product_name,
			 f.file_id file_id, f.name file_name
	FROM payments y 
	JOIN orders o	ON y.order_id = o.order_id
	JOIN orderitems l	ON o.order_id = l.order_id
	JOIN products p	ON l.product_id = p.product_id
	JOIN files f ON p.product_id = f.product_id
	where order_id = 1;




-- 결제정보 불러오기 orderlist.jsp
--orders(수취인,전화번호,주소,배송메세지,결제금액) + paments(결제날짜,결제금액) 

-- 1건조회
SELECT y.payment_id payment_id, 
    TO_CHAR(y.regdate, 'yyyy-MM-DD HH24:MI:SS') payment_regdate, 
    o.order_id order_id, 
    o.price order_price, 
    o.order_comment order_comment, 
    o.receiver order_receiverreceiver, 
    o.address order_address, 
    o.phone order_phone
FROM payments y 
JOIN orders o ON y.order_id = o.order_id
WHERE o.order_id = 2;

-- 총조회
SELECT y.payment_id payment_id, 
    TO_CHAR(y.regdate, 'yyyy-MM-DD HH24:MI:SS') payment_regdate, 
    o.order_id order_id, 
    o.price order_price, 
    o.order_comment order_comment, 
    o.receiver receiver, 
    o.address order_address, 
    o.phone order_phone
FROM payments y 
JOIN orders o ON y.order_id = o.order_id;





-- 주문 상품 목록list.jsp
--orders(결제금액) + paments(결제날짜,결제금액) + orderitems(상품이미지,상품번호,상품명,수량,상품가) + files의 (파일번호,파일이름) 합친것


SELECT o.price order_price, 
    l.orderitem_id orderitem_id, 
    l.order_quantity order_quantity,
    p.product_id product_id, 
    p.price product_price, 
    p.name product_name,
    f.file_id file_id, 
    f.name file_name
FROM orders o  
JOIN orderitems l ON o.order_id = l.order_id
JOIN products p ON l.product_id = p.product_id
JOIN files f ON p.product_id = f.product_id
WHERE o.order_id = 42;

select *
from members;

commit;



select *
from orders
where order_id = 2;

select *
from orderitems
where order_id = 1;


select *
from files;

select *
from orders;

select *
from orderitems;

sELECT price FROM orders 
WHERE order_id = 1;