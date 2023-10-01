CREATE TABLE member (
    memberid         VARCHAR2(50)  PRIMARY KEY,
    passwd           VARCHAR2(50)         NOT NULL,
    name             VARCHAR2(50)         NOT NULL,
    nickname         VARCHAR2(50)  UNIQUE NOT NULL,
    address          VARCHAR2(100)        NOT NULL,
    email            VARCHAR2(100) UNIQUE NOT NULL,
    sex              VARCHAR2(10)         NOT NULL,
    address_postcode VARCHAR2(100),
    address_primary  VARCHAR2(100),
    address_detail   VARCHAR2(100),
    email_id         VARCHAR2(100),
    email_domain     VARCHAR2(100),
    regdate   DATE          DEFAULT SYSDATE
);

CREATE TABLE admin (
    adminid     VARCHAR2(50)    PRIMARY KEY,
    passwd      VARCHAR2(50)    NOT NULL,
    nickname    VARCHAR2(50)    NOT NULL,
    email       VARCHAR2(100)   UNIQUE NOT NULL
);


INSERT INTO admin (adminid, passwd, nickname, email)
VALUES ('admin12', '1234', 'root', 'root@naver.com');

SELECT * FROM member;
SELECT * FROM admin;

---------------------------------------------------------------
// 상품 테이블 생성
CREATE TABLE products (
	pdNum		NUMBER			PRIMARY KEY,
	pdName		VARCHAR2(50)	NOT NULL,
	cateCode	VARCHAR2(30)	NOT NULL,
	pdPrice		NUMBER			NOT NULL,
	pdStock		NUMBER			NULL,
	pdDes		VARCHAR2(500)	NULL,
	pdImg		VARCHAR2(200)	NULL,
	pdDate		DATE			DEFAULT 	SYSDATE
);

// 상품 카테고리 테이블 생성
CREATE TABLE products_category (
	cateName	VARCHAR2(20)	NOT NULL,
	cateCode	VARCHAR2(30)	NOT NULL,
	PRIMARY KEY(cateCode),
);

// 상품 카테고리 CATENAME 크기 변경
ALTER TABLE PRODUCTS_CATEGORY
MODIFY (CATENAME VARCHAR2(50));

// 상품 테이블에 외래키 추가
ALTER TABLE products ADD
	CONSTRAINT fk_products_category
	FOREIGN KEY (cateCode)
		REFERENCES products_category(cateCode);

// 상품 번호 시퀀스
CREATE SEQUENCE products_seq
START 	  WITH 1
INCREMENT BY 1 NOCACHE;


---------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE) VALUES('스프레이건', '100');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE) VALUES('스프레이', '200');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE) VALUES('전기충격기', '300');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE) VALUES('삼단봉', '400');

COMMIT;
------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE products ADD (pdThumbImg VARCHAR2(200));

SELECT * FROM products;


---------------------------------------------------------------------------------------------------------------------------
// 장바구니 테이블
CREATE TABLE cart (
	cartNum		NUMBER			NOT NULL,
	memberid	VARCHAR2(50)	NOT NULL,
	pdNum		NUMBER			NOT NULL,
	cartStock	NUMBER			NOT NULL,
	addDate		DATE			DEFAULT		SYSDATE,
	PRIMARY KEY (cartNum, memberid)
);

// 카트 번호 생성 시퀀스
CREATE SEQUENCE cart_seq
	   INCREMENT BY 1
	   START WITH	1
	   NOCYCLE
	   NOCACHE;

// 외래키 생성1
alter table cart
    add constraint cart_memberid foreign key(memberid)
    references member(memberid);

// 외래키 생성2
alter table cart
    add constraint cart_pdNum foreign key(pdNum)
    references products(pdNum);
    
-- 시퀀스 생성
CREATE SEQUENCE orderid_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- 주문 정보 테이블
CREATE TABLE orderInfo (
    orderid             NUMBER DEFAULT orderid_seq.NEXTVAL PRIMARY KEY,
    memberid            VARCHAR2(50)    NOT NULL,
    name                VARCHAR2(50)    NOT NULL,
    email               VARCHAR2(100)   NOT NULL,
    address             VARCHAR2(300)   NOT NULL,
    address_postcode    VARCHAR2(100),
    address_primary     VARCHAR2(100),
    address_detail      VARCHAR2(100),
    order_status        VARCHAR2(50) 	DEFAULT 'COMPLETEPAYMENT',
    orderDate           DATE            DEFAULT SYSDATE,
    totalPrice          NUMBER(10),
    FOREIGN KEY (memberid) REFERENCES member(memberid)
);

-- 시퀀스 생성
CREATE SEQUENCE detailid_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- 주문 상세 테이블
CREATE TABLE orderdetail (
    detailid    NUMBER  DEFAULT detailid_seq.NEXTVAL PRIMARY KEY,
    orderid     NUMBER  NOT NULL,
    pdNum       NUMBER  NOT NULL,
    quantity    NUMBER,
    totalPrice  NUMBER,
    FOREIGN KEY (orderid) REFERENCES orderinfo(orderid),
    FOREIGN KEY (pdNum) REFERENCES products(pdNum)
);

-- 시퀀스 생성
CREATE SEQUENCE reviewid_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
-- 후기 테이블
CREATE TABLE Reviews (
    reviewid    NUMBER DEFAULT reviewid_seq.NEXTVAL PRIMARY KEY,
    memberid    VARCHAR2(50)    NOT NULL,
    pdNum       NUMBER          NOT NULL,
    reviewText  VARCHAR2(500)   NOT NULL,
    reviewImg   VARCHAR2(200),
    RATING NUMBER(2, 1),
    reviewDate  DATE DEFAULT SYSDATE,
    FOREIGN KEY (memberid) REFERENCES member(memberid),
    FOREIGN KEY (pdNum)    REFERENCES products(pdNum)
);