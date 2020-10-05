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
    SEQ_UNO.NEXTVAL
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
    SEQ_UNO.NEXTVAL
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
                     , DECODE(B.BOARD_TYPE, 1, '일상', '후기') BOARD_CATEGORY
                     , B.BOARD_CONTENT
                     , B.BOARD_COUNT
                     , TO_CHAR(B.CREATE_DATE, 'yyyy-MM-dd') CREATE_DATE
                  FROM BOARD_VIEW B
                  JOIN MEMBER M ON (B.USER_NO = M.USER_NO)
                 ORDER
                    BY B.BOARD_COUNT DESC
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
  , BOARD_TYPE
  , BOARD_CONTENT
  )
  VALUES
  (
    SEQ_BNO.NEXTVAL
  , 2
  , 'writeTest'
  , 1
  , '<p>두기 안고, 끝까지 앞이 같이 없으면 대중을 있다. 곳이 내는 얼음과 바로 우는 오직 청춘의 있다. 것은 피가 인생에 붙잡아 뿐이다. 창공에 얼음에 것은 반짝이는 찾아 듣기만 역사를 있으랴? 피가 대중을 방지하는 것이다. 투명하되 광야에서 맺어, 설레는 않는 우리의 피다. 할지라도 살았으며, 이상의 목숨이 철환하였는가? 사는가 거친 물방아 발휘하기 사막이다. 청춘 전인 살 원대하고, 있으며, 천하를 곧 힘있다. 대한 못할 피고 소리다.이것은 있는 몸이 그것은 약동하다. 창공에 무엇을 피가 것이다.</p><p><br></p><p>할지라도 이것을 커다란 것이다. 찾아다녀도, 바이며, 청춘의 되는 우리 관현악이며, 꽃 끓는 이것이다. 예수는 풍부하게 인생을 있는 약동하다. 발휘하기 우리 사라지지 천하를 얼마나 따뜻한 불어 든 부패뿐이다. 이상의 얼마나 시들어 인생에 길지 청춘의 용기가 힘있다. 역사를 무엇을 못할 피부가 트고, 인생의 듣는다. 가진 보배를 봄날의 든 웅대한 그들은 것이다. 구하지 사랑의 하는 것이다. 청춘 대중을 불어 위하여 그들의 우리의 심장의 밥을 목숨이 피다.</p><p><br></p><p>피고 그들은 소담스러운 따뜻한 것이다. 어디 품에 보배를 오직 구하기 있는가? 별과 거친 사랑의 예가 황금시대다. 새 가치를 설산에서 찾아 구하기 있는가? 얼마나 얼음과 더운지라 품었기 봄날의 그들은 않는 싶이 것이다. 하였으며, 품고 그들의 창공에 우리는 이것이다. 능히 밥을 피부가 아름다우냐? 대고, 모래뿐일 싸인 안고, 되는 있으며, 철환하였는가? 생명을 전인 힘차게 것이 그와 갑 황금시대의 사막이다. 미인을 가슴이 부패를 청춘을 장식하는 그것을 맺어, 힘있다. 몸이 투명하되 하였으며, 실현에 그들의 관현악이며, 이것을 교향악이다.</p>'
  );
  
-- 게시글 수정
UPDATE
       BOARD_VIEW
   SET BOARD_TITLE = 'UPDATETEST5'
     , BOARD_TYPE = 2
     , BOARD_CONTENT = '<p>두기 안고, 끝까지 앞이 같이 없으면 대중을 있다. 곳이 내는 얼음과 바로 우는 오직 청춘의 있다. 것은 피가 인생에 붙잡아 뿐이다. 창공에 얼음에 것은 반짝이는 찾아 듣기만 역사를 있으랴? 피가 대중을 방지하는 것이다. 투명하되 광야에서 맺어, 설레는 않는 우리의 피다. 할지라도 살았으며, 이상의 목숨이 철환하였는가? 사는가 거친 물방아 발휘하기 사막이다. 청춘 전인 살 원대하고, 있으며, 천하를 곧 힘있다. 대한 못할 피고 소리다.이것은 있는 몸이 그것은 약동하다. 창공에 무엇을 피가 것이다.</p><p><br></p><p>할지라도 이것을 커다란 것이다. 찾아다녀도, 바이며, 청춘의 되는 우리 관현악이며, 꽃 끓는 이것이다. 예수는 풍부하게 인생을 있는 약동하다. 발휘하기 우리 사라지지 천하를 얼마나 따뜻한 불어 든 부패뿐이다. 이상의 얼마나 시들어 인생에 길지 청춘의 용기가 힘있다. 역사를 무엇을 못할 피부가 트고, 인생의 듣는다. 가진 보배를 봄날의 든 웅대한 그들은 것이다. 구하지 사랑의 하는 것이다. 청춘 대중을 불어 위하여 그들의 우리의 심장의 밥을 목숨이 피다.</p><p><br></p><p>피고 그들은 소담스러운 따뜻한 것이다. 어디 품에 보배를 오직 구하기 있는가? 별과 거친 사랑의 예가 황금시대다. 새 가치를 설산에서 찾아 구하기 있는가? 얼마나 얼음과 더운지라 품었기 봄날의 그들은 않는 싶이 것이다. 하였으며, 품고 그들의 창공에 우리는 이것이다. 능히 밥을 피부가 아름다우냐? 대고, 모래뿐일 싸인 안고, 되는 있으며, 철환하였는가? 생명을 전인 힘차게 것이 그와 갑 황금시대의 사막이다. 미인을 가슴이 부패를 청춘을 장식하는 그것을 맺어, 힘있다. 몸이 투명하되 하였으며, 실현에 그들의 관현악이며, 이것을 교향악이다.</p>'
 WHERE BOARD_NO = 90;

-- 댓글 뷰
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
   AND BOARD_TYPE = 1;

-- 해당 게시글 최상단 댓글 번호
SELECT BRE_NO
  FROM (
        SELECT ROWNUM RNO, BRE_NO
          FROM BOARD_REPLY_VIEW
         WHERE BOARD_NO = 396
           AND BOARD_TYPE = 1
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
         WHERE BOARD_NO = 135
           AND BOARD_TYPE = 1
        )
 WHERE RNO BETWEEN 1 AND 10;
 
-- 댓글 변경
UPDATE
       BOARD_REPLY_VIEW
   SET BRE_CONTENT = '수정함'
 WHERE BRE_NO = 131;
 
 -- 댓글삭제
UPDATE
       BOARD_REPLY_VIEW
   SET STATUS = 'N'
 WHERE BRE_NO = 131;
 
-- 댓글 등록
INSERT
  INTO REPLY
  (
    BRE_NO
  , USER_NO
  , MEM_NAME
  , BOARD_NO
  , BRE_CONTENT
  , BOARD_TYPE
  )
  VALUES
  (
    SEQ_BRENO.NEXTVAL
  , 3
  , 'test_2'
  , 135
  , 'ddddddddd'
  , 1
  );

-- 신고 insert
INSERT
  INTO REPORT
  (
    REP_NO
  , REP_WRITER_NO
  , REP_TARGET_NO
  , REP_REASON
  , BOARD_TYPE
  , REP_CONTENT_NO
  , REP_REPLY
  )
  VALUES
  (
    SEQ_REPNO.NEXTVAL
  , 3
  , 2
  , 'ddddddddddd'
  , 1
  , 134
  , null
  );

ROLLBACK;

-- 레시피 랜덤으로 2개 조회
SELECT * 
  FROM
     (SELECT * 
        FROM RECIPE 
       ORDER BY DBMS_RANDOM.RANDOM()) 
 WHERE ROWNUM <= 2;
 
-- 테스트용 스크랩수 수정
UPDATE
       RECIPE
   SET SCRAP_COUNT = 10
 WHERE RCP_NO = 42;
 
-- 스크랩수로 상위 4개 조회
SELECT * 
  FROM
     (SELECT * 
        FROM RECIPE 
       ORDER BY SCRAP_COUNT DESC) 
 WHERE ROWNUM <= 4;
