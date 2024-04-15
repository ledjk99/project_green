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





-- PRODUCT 더미데이터 --


INSERT INTO PRODUCTS (PRODUCT_ID, INGREDIENT, PRICE, NAME, INFORMATION, STOCK, REGDATE, SELL_QUANTITY, CATEGORY_ID)
VALUES (PRODUCT_ID_SEQ.nextval, 'VITAMIN', '10000', '닥터멀티비타민', '닥터멀티비타민 정보입니다.',1, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 1 );


SELECT *
from PRODUCTS;



-- BOARD 더미데이터 --
INSERT INTO BOARDS (BOARD_ID, TITLE, DESCRIPTION)
VALUES (BOARD_ID_SEQ.NEXTVAL, '제품문의', '문의 게시판입니다.');

INSERT INTO BOARDS (BOARD_ID, TITLE, DESCRIPTION)
VALUES (BOARD_ID_SEQ.NEXTVAL, '구매후기', '후기 게시판입니다.');

INSERT INTO BOARDS (BOARD_ID, TITLE, DESCRIPTION)
VALUES (BOARD_ID_SEQ.NEXTVAL, '공지사항', '공지사항 게시판입니다.');

SELECT *
from BOARDS;



-- ARTICLE 더미데이터 --
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




-- FILE 더미데이터 --
INSERT INTO FILES (FILE_ID, NAME, REGDATE, ARTICLE_ID, PRODUCT_ID)
VALUES (FILE_ID_SEQ.NEXTVAL, '1111.jpeg', TO_DATE('2024-04-06', 'YYYY-MM-DD'), 1, 1);

SELECT *
from FILES ;



-- COMMENT 더미데이터 --
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




-- ORDER 더미데이터 --
INSERT INTO ORDERS (ORDER_ID, PRICE, ORDER_COMMENT, REGDATE, RECEIVER, ADDRESS, PHONE)
VALUES (ORDER_ID_SEQ.NEXTVAL, 10000, '부재시 문앞요망', TO_DATE('2024-04-06', 'YYYY-MM-DD'), '최은영', '서울시 노원구 상계동 이젠컴퓨터학원', '01012345678');

SELECT *
from ORDERS;


-- ORDER_ITEM 더미데이터 --
INSERT INTO ORDERITEMS (ORDERITEM_ID, ORDER_QUANTITY, PRODUCT_ID, ORDER_ID)
VALUES (ORDERITEM_ID_SEQ.NEXTVAL, 1, 1, 1);

SELECT *
from ORDERITEMS;



-- PAYMENT 더미데이터 --
INSERT INTO PAYMENTS (PAYMENT_ID, REGDATE, MEMBER_ID, ORDER_ID)
VALUES (PAYMENT_ID_SEQ.NEXTVAL, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'ttiding', 1);

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



-- #8. 신규글에 대한 첫번째  댓글 등록 테스트
INSERT INTO comments
            (article_id,
             board_id,
             member_id,
             titile,
             content,
             passwd)
VALUES      (
             article_id_seq.NEXTVAL,
             10,
             'tuesday',
             'tuesday 댓글 제목입니다.',
             'tuesday 댓글 내용입니다.',
             '1111',
             1,
             0 + 1,
             (SELECT MAX(order_no) + 1
              FROM   article
              WHERE  board_id = 10
                     AND group_no = 1));

 
-- #9. 신규글에 대한 두번째 댓글 등록 테스트
INSERT INTO article
            (article_id,
             board_id,
             writer,
             subject,
             content,
             passwd,
             group_no,
             level_no,
             order_no)
VALUES      (
article_id_seq.NEXTVAL,
             10,
             'wednesday',
             'wednesday 댓글 제목입니다.',
             'wednesday 댓글 내용입니다.',
             '1111',
             1,
             0 + 1,
             (SELECT MAX(order_no) + 1
              FROM   article
              WHERE  board_id = 10
                     AND group_no = 1));
             
COMMIT;

-- 게시글 중간점검
SELECT article_id,
               subject,
               writer,
              regdate,
              hitcount
              group_no,
             level_no,
             order_no
FROM   article
WHERE  board_id = 10
ORDER  BY group_no DESC,  order_no ASC; 


-- #10. 댓글에 대한 댓글 등록 테스트
-- 부모글의 article_id를 전달받아야 한다.(ex, article_id = 2) 
-- 등록전에 부모글보다 order_no이 큰  order_no을 1씩 증가시킨다
UPDATE article 
SET    order_no = order_no + 1 
WHERE  board_id = 10 
       AND group_no = 1 
       AND order_no > (SELECT order_no 
                       FROM   article 
                       WHERE  article_id = 2);
                       
-- 대댓글 등록           
INSERT INTO article
            (article_id,
             board_id,
             writer,
             subject,
             content,
             passwd,
             group_no,
             level_no,
             order_no)
VALUES      (
             article_id_seq.NEXTVAL,
             10,
             'thursday',
             'thursday 대댓글 제목입니다',
             'thursday 대댓글 내용입니다',
             '1111',
             1,
             2,
             (SELECT order_no + 1
              FROM   article
              WHERE  article_id = 2));               
            
              
COMMIT;

-- 글목록 중간점검
SELECT article_id,
            subject,
            writer,
            regdate,
            hitcount,
            group_no,
           level_no,
           order_no
FROM   article
WHERE  board_id = 10
ORDER  BY group_no DESC,
          order_no ASC; 

--#11. 게시글 전체목록 조회 테스트를 위한 테스트 신규글 등록(서브쿼리 활용)
INSERT INTO article
            (article_id,
             board_id,
             writer,
             subject,
             content,
             passwd,
             group_no,
             level_no,
             order_no)
SELECT article_id_seq.NEXTVAL,
       10,
       writer,
       subject,
       content,
       passwd,
       article_id_seq.CURRVAL,
       level_no,
       order_no
FROM   article
WHERE  writer = 'thursday'; 

COMMIT;

--#12. 계층형 게시판 및 페이징 처리를 위한 게시글목록 조회(가상컬럼(rownum)과 서브쿼리 활용)
SELECT subject, 
       writer, 
       regdate, 
       hitcount 
FROM   (SELECT CEIL(rownum / 10) request_page, 
               subject, 
               writer, 
               TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI') regdate, 
               hitcount 
        FROM   (SELECT subject, 
                       writer, 
                       regdate, 
                       hitcount 
                FROM   article 
                WHERE  board_id = 10 --자유게시판 
                ORDER  BY group_no DESC, order_no ASC)) 
WHERE  request_page = 1;

-- 페이징 처리를 위한 검색개수
SELECT COUNT(article_id) cnt
FROM   article
WHERE  board_id = 10
       AND writer = '%제목%'
        OR subject LIKE '%제목%'
        OR content LIKE '%제목%' ;

-- 페이징 처리를 위한 검색 게시글 검색
SELECT subject, 
       writer, 
       regdate, 
       hitcount 
FROM   (SELECT CEIL(rownum / 10) request_page, 
               subject, 
               writer, 
               TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI') regdate, 
               hitcount 
        FROM   (SELECT subject, 
                       writer, 
                       regdate, 
                       hitcount 
                FROM   article 
                WHERE  board_id = 10
                       AND writer  LIKE '%monday%'
                       OR subject LIKE '%monday%'
                       OR content LIKE '%monday%'
                    ORDER  BY group_no DESC, 
                              order_no ASC)) 
WHERE  request_page = 1;


