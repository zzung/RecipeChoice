-- USER_NO을 증가시키는 시퀸스
CREATE SEQUENCE SEQ_USER_NO;

-- BOARD_NO을 증가시키는 시퀸스
CREATE SEQUENCE SEQ_BOARD_NO;

-- BOARD테이블의 BOARD_COUNT에 DEFAULT 0추가
ALTER TABLE BOARD MODIFY (BOARD_COUNT DEFAULT 0);

-- BOARD테이블에 작성일 누락시 컬럼 CREATE_DATE 추가
ALTER TABLE BOARD ADD CREATE_DATE DATE DEFAULT SYSDATE NOT NULL;

-- 멤버 테스트용 샘플 데이터
INSERT
  INTO MEMBER
  (
    USER_NO
  , MEM_ID
  , MEM_PWD
  , MEM_NAME
  , EMAIL
  )
  VALUES
  (
    SEQ_USER_NO.NEXTVAL
  , 'user_01'
  , 'pass_01'
  , 'test_01'
  , 'test-01@gmial.com'
  );

INSERT
  INTO MEMBER
  (
    USER_NO
  , MEM_ID
  , MEM_PWD
  , MEM_NAME
  , EMAIL
  )
  VALUES
  (
    SEQ_USER_NO.NEXTVAL
  , 'user_02'
  , 'pass_02'
  , 'test_02'
  , 'test-02@gmial.com'
  );
  
INSERT
  INTO MEMBER
  (
    USER_NO
  , MEM_ID
  , MEM_PWD
  , MEM_NAME
  , EMAIL
  )
  VALUES
  (
    SEQ_USER_NO.NEXTVAL
  , 'user_03'
  , 'pass_03'
  , 'test_03'
  , 'test-03@gmial.com'
  );
  
COMMIT;

-- 게시판 리스트 조회 셀렉트문
CREATE OR REPLACE VIEW BOARD_VIEW AS
SELECT *
  FROM BOARD
 WHERE STATUS = 'Y';
 
SELECT *
  FROM (
        SELECT ROWNUM RNO, B.*
          FROM (
                SELECT
                       B.BOARD_NO
                     , B.USER_NO
                     , M.MEM_NAME
                     , M.MEM_PIC
                     , B.BOARD_TITLE
                     , B.BOARD_CATEGORY
                     , B.BOARD_CONTENT
                     , B.CREATE_DATE
                  FROM BOARD_VIEW B
                  JOIN MEMBER M ON (B.USER_NO = M.USER_NO)
                 ORDER
                    BY B.CREATE_DATE DESC
               ) B
       )
 WHERE RNO BETWEEN 11 AND 20;
 
-- 게시글 총 개수
SELECT COUNT(*) MAX
  FROM BOARD_VIEW;
  