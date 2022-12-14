/**
 *  NOTICE 스키마
 */

CREATE  TABLE NOTICE(
              NOTICEID   NUMBER PRIMARY KEY
             ,ACCOUNTID  VARCHAR2(50)
             ,TITLE      VARCHAR2(300) NOT NULL
             ,CONTENT    VARCHAR2(1000) NOT NULL
             ,CREATEDATE DATE DEFAULT(SYSDATE)
             ,VIEWCNT    NUMBER
             ,CONSTRAINT NOTICE_ACCOUNTID_FK FOREIGN KEY(ACCOUNTID) REFERENCES ACCOUNT(ACCOUNTID) ON DELETE CASCADE
);
CREATE SEQUENCE NOTICE_SEQ NOCACHE;

SELECT * FROM NOTICE;
DROP TABLE NOTICE;


-- 테이블을 다시 만들지 않고 해당 제약조건만 수정하는 쿼리

-- 1. 아래 쿼리로 해당 제약조건을 삭제한 후
ALTER TABLE NOTICE DROP CONSTRAINT NOTICE_ACCOUNTID_FK;
-- 2. ON DELETE CASCADE를 적용시킨 제약조건을 다시 설정
ALTER TABLE NOTICE 
ADD CONSTRAINT NOTICE_ACCOUNTID_FK
FOREIGN KEY (ACCOUNTID) 
REFERENCES ACCOUNT (ACCOUNTID) 
ON DELETE CASCADE;
-- 3. 잘 설정되었는지 확인
SELECT *
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = 'NOTICE';
