/**
 *  FAVORITE 스키마
 */

   --- 9월 26일 FAVORITEID 추가
CREATE TABLE FAVORITE(
			 FAVORITEID NUMBER PRIMARY KEY
            ,ACCOUNTID VARCHAR2(50)
            ,BID NUMBER
            ,CONSTRAINT FAVORITE_ACCOUNTID_FK FOREIGN KEY(ACCOUNTID) REFERENCES ACCOUNT(ACCOUNTID) ON DELETE CASCADE
            ,CONSTRAINT FAVORITE_BID_FK FOREIGN KEY(BID) REFERENCES BOARD(BID) ON DELETE CASCADE
);

CREATE SEQUENCE FAVORITE_SEQ NOCACHE; -- 9월 26일 추가

SELECT * FROM FAVORITE;
DROP TABLE FAVORITE;


-- 테이블을 다시 만들지 않고 해당 제약조건만 수정하는 쿼리

-- 1. 아래 쿼리로 해당 제약조건을 삭제한 후
ALTER TABLE FAVORITE DROP CONSTRAINT FAVORITE_ACCOUNTID_FK;
ALTER TABLE FAVORITE DROP CONSTRAINT FAVORITE_BID_FK;

-- 2. ON DELETE CASCADE를 적용시킨 제약조건을 다시 설정
ALTER TABLE FAVORITE 
ADD CONSTRAINT FAVORITE_ACCOUNTID_FK
FOREIGN KEY (ACCOUNTID) 
REFERENCES ACCOUNT (ACCOUNTID) 
ON DELETE CASCADE;

ALTER TABLE FAVORITE 
ADD CONSTRAINT FAVORITE_BID_FK
FOREIGN KEY (BID) 
REFERENCES BOARD (BID) 
ON DELETE CASCADE;


-- 3. 잘 설정되었는지 확인
SELECT *
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = 'FAVORITE';
