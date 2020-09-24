DROP SEQUENCE SEQ_UNO;      -- 회원 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_RCPNO;    -- 레시피 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_INGNO;    -- 재료리스트 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_CNO;      -- 조리 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_TIPNO;    -- 꿀팁 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_SCRNO;    -- 스크랩 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_BNO;      -- 게시판 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_BRENO;    -- 댓글 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_REPNO;    -- 신고 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_FAQNO;    -- FAQ 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_NOTNO;    -- 공지사항 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_CONNO;    -- 문의 번호 발생시킬 시퀀스


DROP TABLE "MEMBER" CASCADE CONSTRAINTS;
DROP TABLE "REPORT" CASCADE CONSTRAINTS;
DROP TABLE "REPLY" CASCADE CONSTRAINTS;
DROP TABLE "FAQ" CASCADE CONSTRAINTS;
DROP TABLE "INGREDIENT_TIP" CASCADE CONSTRAINTS;
DROP TABLE "NOTICE" CASCADE CONSTRAINTS;
DROP TABLE "BOARD" CASCADE CONSTRAINTS;
DROP TABLE "CONTACT" CASCADE CONSTRAINTS;
DROP TABLE "RECIPE" CASCADE CONSTRAINTS;
DROP TABLE "INGREDIENT_LIST" CASCADE CONSTRAINTS;
DROP TABLE "SCRAP" CASCADE CONSTRAINTS;
DROP TABLE "COOK" CASCADE CONSTRAINTS;

--------------------------------------------------
--------------     MEMBER 관련	------------------
--------------------------------------------------
CREATE TABLE "MEMBER" (
	"USER_NO"	NUMBER PRIMARY KEY,
	"MEM_ID"	VARCHAR2(20)		NOT NULL UNIQUE,
	"MEM_PWD"	VARCHAR2(30)		NOT NULL UNIQUE,
	"MEM_NAME"	VARCHAR2(200)		NOT NULL,
	"EMAIL"	    VARCHAR2(50)		NOT NULL UNIQUE,
	"MEM_PIC"	VARCHAR2(500)		NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE,
	"MEM_REP_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN "MEMBER"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "MEMBER"."MEM_ID" IS '회원아이디';
COMMENT ON COLUMN "MEMBER"."MEM_PWD" IS '비밀번호';
COMMENT ON COLUMN "MEMBER"."MEM_NAME" IS '닉네임';
COMMENT ON COLUMN "MEMBER"."EMAIL" IS '이메일';
COMMENT ON COLUMN "MEMBER"."MEM_PIC" IS '프로필이미지';
COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '회원가입일';
COMMENT ON COLUMN "MEMBER"."MEM_REP_COUNT" IS '신고당한횟수';
COMMENT ON COLUMN "MEMBER"."STATUS" IS '상태값(탈퇴여부/블랙리스트-Y/N/B)';

CREATE SEQUENCE SEQ_UNO
NOCACHE;

INSERT INTO MEMBER
VALUES(SEQ_UNO.NEXTVAL, 'admin', '1234', '관리자', 'admin@gmail.com', NULL, SYSDATE, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES(SEQ_UNO.NEXTVAL, 'user01', '12', '유저1', 'user01@naver.com',NULL, SYSDATE, DEFAULT, DEFAULT);


--------------------------------------------------
--------------    RECIPE 관련	 -----------------
--------------------------------------------------

CREATE TABLE "RECIPE" (
	"RCP_NO"	NUMBER	PRIMARY KEY,
	"USER_NO"	NUMBER		NOT NULL,
	"MEM_NAME"	VARCHAR2(200)		NOT NULL,
	"RCP_TITLE"	VARCHAR2(50)		NOT NULL,
	"RCP_DISH_TYPE"	VARCHAR2(100)		NOT NULL,
	"RCP_TAG"	VARCHAR2(100)		NOT NULL,
	"RCP_TIME"	NUMBER		NOT NULL,
	"RCP_CONTENT"	CLOB		NOT NULL,
	"RCP_PIC"	VARCHAR2(500)		NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"COUNT"	NUMBER	DEFAULT '0'	NULL,
	"SCRAP_COUNT"	NUMBER	DEFAULT '0'	NOT NULL,
	"RCP_TYPE"	VARCHAR2(20)	DEFAULT 'N'	NULL,
    "STATUS"	CHAR(1)	DEFAULT 'Y'	CHECK (STATUS IN('Y', 'N')),
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN "RECIPE"."RCP_NO" IS '레시피번호';
COMMENT ON COLUMN "RECIPE"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "RECIPE"."MEM_NAME" IS '닉네임';
COMMENT ON COLUMN "RECIPE"."RCP_TITLE" IS '레시피제목';
COMMENT ON COLUMN "RECIPE"."RCP_DISH_TYPE" IS '종류별';
COMMENT ON COLUMN "RECIPE"."RCP_TAG" IS '재료별(태그)';
COMMENT ON COLUMN "RECIPE"."RCP_TIME" IS '소요시간별';
COMMENT ON COLUMN "RECIPE"."RCP_CONTENT" IS '레시피설명';
COMMENT ON COLUMN "RECIPE"."RCP_PIC" IS '레시피썸네일';
COMMENT ON COLUMN "RECIPE"."CREATE_DATE" IS '작성일';
COMMENT ON COLUMN "RECIPE"."COUNT" IS '조회수';
COMMENT ON COLUMN "RECIPE"."SCRAP_COUNT" IS '스크랩수';
COMMENT ON COLUMN "RECIPE"."STATUS" IS '상태';
COMMENT ON COLUMN "RECIPE"."RCP_TYPE" IS '시즌레시피 여부(Y/N)';

CREATE SEQUENCE SEQ_RCPNO
NOCACHE;

--------------------------------------------------
--------------   INGREDIENT_LIST 관련   -----------
--------------------------------------------------

CREATE TABLE "INGREDIENT_LIST" (
    "ING_NO"    NUMBER  PRIMARY KEY,
	"RCP_NO"	NUMBER		NOT NULL,
	"ING_DISH"	VARCHAR2(50)		NOT NULL,
	"ING_METERING"	VARCHAR2(50)		NULL,
    FOREIGN KEY (RCP_NO) REFERENCES RECIPE(RCP_NO)
);

COMMENT ON COLUMN "INGREDIENT_LIST"."ING_NO" IS '재료리스트번호';
COMMENT ON COLUMN "INGREDIENT_LIST"."RCP_NO" IS '레시피번호';
COMMENT ON COLUMN "INGREDIENT_LIST"."ING_DISH" IS '재료명';
COMMENT ON COLUMN "INGREDIENT_LIST"."ING_METERING" IS '계량';

CREATE SEQUENCE SEQ_INGNO
NOCACHE;


--------------------------------------------------
--------------   COOK 관련   --------------------
--------------------------------------------------

CREATE TABLE "COOK" (
	"COOK_NO"	NUMBER	PRIMARY KEY,
	"RCP_NO"	NUMBER		NOT NULL,
	"COOK_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"COOK_ORDER"	NUMBER		NOT NULL,
	"COOK_PIC"	VARCHAR2(500)		NOT NULL,
    FOREIGN KEY (RCP_NO) REFERENCES RECIPE(RCP_NO)
);

COMMENT ON COLUMN "COOK"."COOK_NO" IS '조리번호';
COMMENT ON COLUMN "COOK"."RCP_NO" IS '레시피번호';
COMMENT ON COLUMN "COOK"."COOK_CONTENT" IS '조리내용설명';
COMMENT ON COLUMN "COOK"."COOK_ORDER" IS '조리순번';
COMMENT ON COLUMN "COOK"."COOK_PIC" IS '조리이미지';

CREATE SEQUENCE SEQ_CNO
NOCACHE;

--------------------------------------------------
--------------   INGREDIENT_TIP 관련	--------------
--------------------------------------------------

CREATE TABLE "INGREDIENT_TIP" (
	"TIP_NO"	NUMBER  PRIMARY KEY,
	"TIP_TITLE"	VARCHAR2(100)		NOT NULL,
	"TIP_INFO"	CLOB		NOT NULL,
	"TIP_ING"	CLOB		NOT NULL,
	"TIP_CONTENT"	CLOB		NOT NULL,
	"TIP_COUNT"	NUMBER	DEFAULT '0'	NOT NULL,
	"TIP_TYPE"	NUMBER	CHECK(TIP_TYPE IN(1,2))	NOT NULL, -- 재료손질법(1)/재료상식(2)
	"TIP_PIC"	CLOB		NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN "INGREDIENT_TIP"."TIP_NO" IS '재료손질번호';
COMMENT ON COLUMN "INGREDIENT_TIP"."TIP_TITLE" IS '제목';
COMMENT ON COLUMN "INGREDIENT_TIP"."TIP_INFO" IS '간단설명';
COMMENT ON COLUMN "INGREDIENT_TIP"."TIP_ING" IS '태그';
COMMENT ON COLUMN "INGREDIENT_TIP"."TIP_CONTENT" IS '게시글내용';
COMMENT ON COLUMN "INGREDIENT_TIP"."TIP_COUNT" IS '조회수';
COMMENT ON COLUMN "INGREDIENT_TIP"."TIP_TYPE" IS '손질1/상식2';
COMMENT ON COLUMN "INGREDIENT_TIP"."TIP_PIC" IS '꿀팁썸네일';
COMMENT ON COLUMN "INGREDIENT_TIP"."STATUS" IS 'Y/N';

CREATE SEQUENCE SEQ_TIPNO
NOCACHE;

--------------------------------------------------
--------------   SCRAP 관련   --------------------
--------------------------------------------------

CREATE TABLE "SCRAP" (
    "SCRAP_NO"  NUMBER  PRIMARY KEY, 
	"USER_NO"	NUMBER		NOT NULL,
	"RCP_NO"	NUMBER		NOT NULL,
	"SCRAP_DATE"	DATE	DEFAULT SYSDATE	NULL,
    "STATUS"	CHAR(1)	DEFAULT 'Y'	CHECK (STATUS IN('Y', 'N')),
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO),
    FOREIGN KEY (RCP_NO) REFERENCES RECIPE(RCP_NO)
);

COMMENT ON COLUMN "SCRAP"."SCRAP_NO" IS '스크랩번호';
COMMENT ON COLUMN "SCRAP"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "SCRAP"."RCP_NO" IS '레시피번호';
COMMENT ON COLUMN "SCRAP"."SCRAP_DATE" IS '스크랩날짜';
COMMENT ON COLUMN "SCRAP"."STATUS" IS '상태(Y/N)';

CREATE SEQUENCE SEQ_SCRNO
NOCACHE;

--------------------------------------------------
--------------    BOARD 관련	 -----------------
--------------------------------------------------

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER	PRIMARY KEY,
	"USER_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(100)		NOT NULL,
	"BOARD_TYPE"	NUMBER	CHECK (BOARD_TYPE IN(1,2)) NOT NULL, -- 일상(1) OR 후기(2)
	"BOARD_CONTENT"	CLOB		NOT NULL,
	"BOARD_COUNT"	NUMBER DEFAULT 0 NOT NULL,
    "CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	CHECK (STATUS IN('Y', 'N')),
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글번호';
COMMENT ON COLUMN "BOARD"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글제목';
COMMENT ON COLUMN "BOARD"."BOARD_TYPE" IS '게시글유형(일상1/후기2)';
COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글내용';
COMMENT ON COLUMN "BOARD"."BOARD_COUNT" IS '조회수';
COMMENT ON COLUMN "BOARD"."CREATE_DATE" IS '작성일';
COMMENT ON COLUMN "BOARD"."STATUS" IS '보여줄지여부';

CREATE SEQUENCE SEQ_BNO
NOCACHE;

--------------------------------------------------
--------------      REPLY 관련	------------------
--------------------------------------------------

CREATE TABLE "REPLY" (
	"BRE_NO"	NUMBER	PRIMARY KEY,
	"USER_NO"	NUMBER		NOT NULL,
	"MEM_NAME"	VARCHAR2(200)		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"BRE_CONTENT"	VARCHAR2(900)		NOT NULL,
	"BRE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
    "BOARD_TYPE" NUMBER  CHECK(BOARD_TYPE IN(1,2)) NOT NULL, --자유(1)/레시피(2)
	"STATUS"	CHAR(1)	DEFAULT 'Y'	CHECK (STATUS IN('Y', 'N')),
    FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN "REPLY"."BRE_NO" IS '댓글번호';
COMMENT ON COLUMN "REPLY"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "REPLY"."MEM_NAME" IS '회원닉네임';
COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '자유, 레시피게시글 번호';
COMMENT ON COLUMN "REPLY"."BRE_CONTENT" IS '댓글내용';
COMMENT ON COLUMN "REPLY"."BRE_DATE" IS '댓글작성일자';
COMMENT ON COLUMN "REPLY"."STATUS" IS '보여줄지여부';
COMMENT ON COLUMN "REPLY"."BOARD_TYPE" IS '게시판유형(자유1/레시피2)';

CREATE SEQUENCE SEQ_BRENO
NOCACHE;


--------------------------------------------------
--------------     REPORT 관련	------------------
--------------------------------------------------

CREATE TABLE "REPORT" (
	"REP_NO"	NUMBER  PRIMARY KEY,
	"REP_WRITER_NO"	NUMBER		NOT NULL,
    "REP_TARGET_NO"	NUMBER		NOT NULL,
	"REP_REASON"	VARCHAR2(2000)		NOT NULL,
	"REP_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"BOARD_TYPE"	NUMBER	CHECK(BOARD_TYPE IN(1,2)),  --자유(1)/레시피(2)
	"REP_CONTENT_NO"	NUMBER		NOT NULL,
	"REP_REPLY"	NUMBER		NULL,
    "STATUS"	CHAR(1)	DEFAULT 'Y'	CHECK (STATUS IN('Y', 'N')),
    FOREIGN KEY (REP_WRITER_NO) REFERENCES MEMBER(USER_NO),
    FOREIGN KEY (REP_TARGET_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN "REPORT"."REP_NO" IS '신고번호';
COMMENT ON COLUMN "REPORT"."REP_WRITER_NO" IS '신고자';
COMMENT ON COLUMN "REPORT"."REP_TARGET_NO" IS '신고대상자';
COMMENT ON COLUMN "REPORT"."REP_REASON" IS '신고사유';
COMMENT ON COLUMN "REPORT"."REP_DATE" IS '신고일';
COMMENT ON COLUMN "REPORT"."STATUS" IS '상태값(Y/N)';
COMMENT ON COLUMN "REPORT"."BOARD_TYPE" IS '게시판유형(자유1/레시피2)';
COMMENT ON COLUMN "REPORT"."REP_CONTENT_NO" IS '신고게시물';
COMMENT ON COLUMN "REPORT"."REP_REPLY" IS '댓글번호';

CREATE SEQUENCE SEQ_REPNO
NOCACHE;

--------------------------------------------------
--------------     FAQ  관련	----------------------
--------------------------------------------------

CREATE TABLE "FAQ" (
	"FAQ_NO"	NUMBER	PRIMARY KEY,
	"FAQ_TITLE"	VARCHAR2(100)		NOT NULL,
	"FAQ_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN "FAQ"."FAQ_NO" IS 'FAQ번호';
COMMENT ON COLUMN "FAQ"."FAQ_TITLE" IS '제목';
COMMENT ON COLUMN "FAQ"."FAQ_CONTENT" IS '내용';
COMMENT ON COLUMN "FAQ"."STATUS" IS '수정/삭제';

CREATE SEQUENCE SEQ_FAQNO
NOCACHE;

--------------------------------------------------
--------------    NOTICE 관련	 -----------------
--------------------------------------------------

CREATE TABLE "NOTICE" (
	"NOT_NO"	NUMBER	PRIMARY KEY,
	"NOT_TITLE"	VARCHAR2(50)		NOT NULL,
	"NOT_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"NOT_IMPORTANT"	CHAR(1)	DEFAULT 'N' CHECK (NOT_IMPORTANT IN('Y', 'N')),
	"NOT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN "NOTICE"."NOT_NO" IS '공지번호';
COMMENT ON COLUMN "NOTICE"."NOT_TITLE" IS '공지제목';
COMMENT ON COLUMN "NOTICE"."NOT_CONTENT" IS '공지내용';
COMMENT ON COLUMN "NOTICE"."NOT_IMPORTANT" IS '중요공지사항 여부(Y/N)';
COMMENT ON COLUMN "NOTICE"."NOT_DATE" IS '작성일자';
COMMENT ON COLUMN "NOTICE"."STATUS" IS '보여줄지여부(Y/N)';

CREATE SEQUENCE SEQ_NOTNO
NOCACHE;

--------------------------------------------------
--------------    CONTACT 관련	 -----------------
--------------------------------------------------

CREATE TABLE "CONTACT" (
	"CON_NO"	NUMBER      PRIMARY KEY,
	"USER_NO"	NUMBER		NOT NULL,
	"CON_TITLE"	VARCHAR2(50)		NOT NULL,
	"CON_TYPE"	VARCHAR2(30)		NOT NULL,
	"CON_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CON_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CON_PROCESSDATE"	DATE	DEFAULT SYSDATE	NULL,
	"CON_REPLY"	NUMBER		NULL,
	"ANSWER"	CHAR(1)	DEFAULT 'N'	CHECK (ANSWER IN('Y', 'N')),
	"STATUS"	CHAR(1)	DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN "CONTACT"."CON_NO" IS '문의번호';
COMMENT ON COLUMN "CONTACT"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "CONTACT"."CON_TITLE" IS '문의제목';
COMMENT ON COLUMN "CONTACT"."CON_TYPE" IS '문의분류유형';
COMMENT ON COLUMN "CONTACT"."CON_CONTENT" IS '내용';
COMMENT ON COLUMN "CONTACT"."CON_DATE" IS '등록일자';
COMMENT ON COLUMN "CONTACT"."CON_PROCESSDATE" IS '처리일자';
COMMENT ON COLUMN "CONTACT"."CON_REPLY" IS '답변번호';
COMMENT ON COLUMN "CONTACT"."ANSWER" IS '답변여부(Y/N)';
COMMENT ON COLUMN "CONTACT"."STATUS" IS '삭제여부(Y/N)';

CREATE SEQUENCE SEQ_CONNO
NOCACHE;
