-- USER_NO을 증가시키는 시퀸스
CREATE SEQUENCE SEQ_USER_NO;

-- BOARD_NO을 증가시키는 시퀸스
CREATE SEQUENCE SEQ_BOARD_NO;

-- BRE_NO을 증가시키는 시퀸스(REPLY테이블)
CREATE SEQUENCE SEQ_BRE_NO;

-- BOARD테이블의 BOARD_COUNT에 DEFAULT 0추가
ALTER TABLE BOARD MODIFY (BOARD_COUNT DEFAULT 0);

-- BOARD테이블에 작성일 누락시 컬럼 CREATE_DATE 추가
ALTER TABLE BOARD ADD CREATE_DATE DATE DEFAULT SYSDATE NOT NULL;

-- REPLY테이블의 USER_NO2를 USER_NO으로 변경
ALTER TABLE REPLY RENAME COLUMN USER_NO2 TO USER_NO;

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
                     , TO_CHAR(B.CREATE_DATE, 'yyyy-MM-dd') CREATE_DATE
                  FROM BOARD_VIEW B
                  JOIN MEMBER M ON (B.USER_NO = M.USER_NO)
                 ORDER
                    BY B.CREATE_DATE DESC
               ) B
       )
 WHERE RNO BETWEEN 1 AND 10;
 
-- 게시글 총 개수
SELECT COUNT(*) MAX
  FROM BOARD_VIEW;


-- 게시글 등록
INSERT
  INTO BOARD
  (
    BOARD_NO
  , USER_NO
  , BOARD_TITLE
  , BOARD_CATEGORY
  , BOARD_CONTENT
  )
  VALUES
  (
    SEQ_BOARD_NO.NEXTVAL
  , 1
  , 'writeTest'
  , '일상'
  , '있는 일월과 사랑의 굳세게 부패뿐이다. 눈에 인도하겠다는 바이며, 예가 듣는다. 물방아 구하지 크고 귀는 열매를 끓는다. 모래뿐일 인간은 설레는 찬미를 튼튼하며, 그들에게 이상은 싶이 곧 힘있다. 전인 석가는 평화스러운 우리의 날카로우나 뼈 사랑의 끓는 희망의 것이다. 있는 쓸쓸한 용기가 듣는다. 그림자는 청춘에서만 하여도 속에 풍부하게 청춘의 위하여서. 그것을 유소년에게서 우리 새가 천고에 하는 들어 황금시대의 힘있다. 설산에서 공자는 내려온 칼이다. 황금시대를 눈이 구하지 황금시대의 끓는 위하여, 싶이 새가 아름다우냐? 가는 피가 그들에게 보는 우리의 이는 사막이다.

위하여 든 트고, 방황하여도, 하는 원대하고, 이상의 길지 황금시대다. 눈이 오직 있는 희망의 이것이다. 생생하며, 우는 그들에게 봄바람이다. 몸이 속잎나고, 쓸쓸한 역사를 고동을 가슴이 이상은 사람은 철환하였는가? 청춘을 무엇을 품에 심장의 불러 그들은 이상을 그것을 아름다우냐? 낙원을 것은 듣기만 얼음에 위하여 있는가? 자신과 방황하였으며, 끓는 보이는 유소년에게서 가는 그들의 사랑의 아니다. 두손을 광야에서 풍부하게 풀이 아니다. 이는 이상을 인간의 무엇을 살 따뜻한 그와 지혜는 피다. 꽃이 있음으로써 영원히 피어나기 것이다.

위하여, 싸인 너의 가치를 만천하의 사랑의 노년에게서 교향악이다. 실로 노년에게서 너의 불어 원질이 심장은 평화스러운 봄바람이다. 인도하겠다는 그들은 것이 이상은 위하여 봄바람을 찬미를 아니다. 이상, 아니더면, 우리의 과실이 따뜻한 불러 가는 힘차게 칼이다. 품으며, 보이는 바이며, 그러므로 기쁘며, 이것이다. 꽃 사라지지 같으며, 천자만홍이 봄날의 생생하며, 이것이다. 물방아 장식하는 피고 못할 인생을 이 평화스러운 이것이다. 길지 수 쓸쓸한 교향악이다. 무엇을 든 곧 그들에게 사랑의 뿐이다.'
  );
  
-- 게시글 수정
UPDATE
       BOARD_VIEW
   SET BOARD_TITLE = 'UPDATETEST5'
     , BOARD_CATEGORY = '일상'
     , BOARD_CONTENT = 'UPDATETEST5'
 WHERE BOARD_NO = 389;

-- 일반게시판 댓글 뷰
CREATE OR REPLACE VIEW BOARD_REPLY_VIEW AS
SELECT *
  FROM REPLY
 WHERE STATUS = 'Y'
 ORDER
    BY BRE_DATE DESC;
  
-- 해당 게시글의 댓글 개수를 가져옴
SELECT COUNT(*)
  FROM BOARD_REPLY_VIEW
 WHERE BOARD_NO = 396
   AND BOARD_TYPE = '자유';

-- 해당 게시글 최상단 댓글 번호
SELECT BRE_NO
  FROM (
        SELECT ROWNUM RNO, BRE_NO
          FROM BOARD_REPLY_VIEW
         WHERE BOARD_NO = 396
           AND BOARD_TYPE = '자유'
       )
 WHERE RNO = 1;

-- 댓글 리스트 조회
SELECT *
  FROM (
        SELECT
               ROWNUM RNO
             , B.BRE_NO
             , B.USER_NO
             , B.MEM_NAME
             , M.MEM_PIC
             , B.BOARD_NO
             , B.BRE_CONTENT
             , TO_CHAR(B.BRE_DATE, 'yyyyMMdd HH:mm') BRE_DATE
          FROM BOARD_REPLY_VIEW B
          JOIN MEMBER M ON (B.USER_NO = M.USER_NO)
         WHERE BOARD_NO = 396
           AND BOARD_TYPE = '자유'
        )
 WHERE RNO BETWEEN 1 AND 10;
 
-- 댓글 변경
UPDATE
       BOARD_REPLY_VIEW
   SET BRE_CONTENT = '수정함'
 WHERE BRE_NO = 131;
 
ROLLBACK;
