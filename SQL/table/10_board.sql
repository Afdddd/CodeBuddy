-- 효중씨
DROP TABLE FBOARD;
DROP SEQUENCE SEQ_FBOARD;

CREATE SEQUENCE SEQ_FBOARD NOCYCLE;

CREATE TABLE FBOARD (
	FBOARD_NO	NUMBER PRIMARY KEY,
	FBOARD_TITLE	VARCHAR2(400)		NOT NULL,
	FBOARD_CONTENT	VARCHAR2(4000)		NOT NULL,
	FBOARD_WRITER	NUMBER		NULL,
	FBOARD_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	FBOARD_UPDATE	DATE		NULL,
	FBOARD_DELETE	DATE		NULL,
	FBOARD_VIEWS	NUMBER	DEFAULT 0	NOT NULL,
    FOREIGN KEY (FBOARD_WRITER) REFERENCES MEMBER(MEMBER_NO)
);

COMMENT ON COLUMN FBOARD.FBOARD_INSERT IS '작성된 날짜';

DROP TABLE FREPLY;
DROP SEQUENCE SEQ_FREPLY;

CREATE SEQUENCE SEQ_FREPLY NOCYCLE;

CREATE TABLE FREPLY (
	FREPLY_NO	NUMBER	PRIMARY KEY,
	MEMBER_NO	NUMBER		NOT NULL,
	FBOARD_NO	NUMBER		NOT NULL,
	FREPLY_PARENT	NUMBER		NULL,
	FREPLY_CONTENT	VARCHAR2(2000)		NOT NULL,
	FREPLY_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	FREPLY_UPDATE	DATE		NULL,
	FREPLY_DELETE	DATE		NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (FBOARD_NO) REFERENCES FBOARD(FBOARD_NO),
    FOREIGN KEY (FREPLY_PARENT) REFERENCES FREPLY(FREPLY_NO)
);

DROP TABLE FATTACHMENT;
DROP SEQUENCE SEQ_FATTACHMENT;

CREATE SEQUENCE SEQ_FATTACHMENT NOCYCLE;

CREATE TABLE FATTACHMENT (
	FATTACHMENT_NO	NUMBER PRIMARY KEY,
	FBOARD_NO	NUMBER		NOT NULL,
	FATTACHMENT_ORIGIN	VARCHAR2(200)		NOT NULL,
	FATTACHMENT_CHANGE	VARCHAR2(200)		NOT NULL,
	FATTACHMENT_PATH	VARCHAR2(200)		NOT NULL,
	FATTACHMENT_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	FATTACHMENT_LEVEL	NUMBER	DEFAULT 0	NOT NULL,
    FOREIGN KEY (FBOARD_NO) REFERENCES FBOARD(FBOARD_NO)
);

DROP TABLE NBOARD;
DROP SEQUENCE SEQ_NBOARD;

CREATE SEQUENCE SEQ_NBOARD NOCYCLE;

CREATE TABLE NBOARD (
	NBOARD_NO	NUMBER PRIMARY KEY,
	NBOARD_TITLE	VARCHAR2(400)		NOT NULL,
	NBOARD_CONTENT	VARCHAR2(4000)		NOT NULL,
	NBOARD_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	NBOARD_UPDATE	DATE		NULL,
	NBOARD_DELETE	DATE		NULL,
	NBOARD_VIEWS	NUMBER	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN NBOARD.NBOARD_INSERT IS '작성된 날짜';

DROP TABLE NATTACHMENT;
DROP SEQUENCE SEQ_NATTACHMENT;

CREATE SEQUENCE SEQ_NATTACHMENT NOCYCLE;

CREATE TABLE NATTACHMENT (
	NATTACHMENT_NO	NUMBER PRIMARY KEY,
	NBOARD_NO	NUMBER		NOT NULL,
	NATTACHMENT_ORIGIN	VARCHAR2(200)		NOT NULL,
	NATTACHMENT_CHANGE	VARCHAR2(200)		NOT NULL,
	NATTACHMENT_PATH	VARCHAR2(200)		NOT NULL,
	NATTACHMENT_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	NATTACHMENT_LEVEL	NUMBER	DEFAULT 0	NOT NULL,
    FOREIGN KEY (NBOARD_NO) REFERENCES NBOARD(NBOARD_NO)
);

-- 영욱씨
DROP TABLE IBOARD;
DROP SEQUENCE SEQ_IBOARD;

CREATE SEQUENCE SEQ_IBOARD NOCYCLE;

CREATE TABLE IBOARD (
	IBOARD_NO	NUMBER PRIMARY KEY,
	IBOARD_TITLE	VARCHAR2(400)		NOT NULL,
	IBOARD_CONTENT	VARCHAR2(4000)		NOT NULL,
	IBOARD_WRITER	NUMBER		NULL,
	IBOARD_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	IBOARD_UPDATE DATE		NULL,
	IBOARD_DELETE	DATE		NULL,
	PROJECT_NO	NUMBER		NOT NULL,
	IBOARD_VIEWS	NUMBER	DEFAULT 0	NOT NULL,
	IBOARD_START	DATE		NULL,
	IBOARD_END	DATE		NULL,
    FOREIGN KEY (IBOARD_WRITER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT(PROJECT_NO)
);

COMMENT ON COLUMN IBOARD.IBOARD_INSERT IS '작성된 날짜';

DROP TABLE LIKES;

CREATE TABLE LIKES (
	LIKES_MEMBER	NUMBER		NOT NULL,
	IBOARD_NO	NUMBER		NOT NULL,
    FOREIGN KEY (LIKES_MEMBER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (IBOARD_NO) REFERENCES IBOARD(IBOARD_NO)
);

DROP TABLE IREPLY;
DROP SEQUENCE SEQ_IREPLY;

CREATE SEQUENCE SEQ_IREPLY NOCYCLE;

CREATE TABLE IREPLY (
	IREPLY_NO	NUMBER PRIMARY KEY,
	MEMBER_NO	NUMBER		NOT NULL,
	IBOARD_NO	NUMBER		NOT NULL,
	IREPLY_PARENT	NUMBER		NULL,
	IREPLY_CONTENT	VARCHAR2(2000)		NOT NULL,
	IREPLY_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	IREPLY_UPDATE	DATE		NULL,
	IREPLY_DELETE	DATE		NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (IBOARD_NO) REFERENCES IBOARD(IBOARD_NO),
    FOREIGN KEY (IREPLY_PARENT) REFERENCES IREPLY(IREPLY_NO)
);

DROP TABLE IATTACHMENT;
DROP SEQUENCE SEQ_IATTACHMENT;

CREATE SEQUENCE SEQ_IATTACHMENT NOCYCLE;

CREATE TABLE IATTACHMENT (
	IATTACHMENT_NO	NUMBER PRIMARY KEY,
	IBOARD_NO	NUMBER		NOT NULL,
	IATTACHMENT_ORIGIN	VARCHAR2(200)		NOT NULL,
	IATTACHMENT_CHANGE	VARCHAR2(200)		NOT NULL,
	IATTACHMENT_PATH	VARCHAR2(200)		NOT NULL,
	IATTACHMENT_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	IATTACHMENT_LEVEL	NUMBER	DEFAULT 0	NOT NULL,
    FOREIGN KEY (IBOARD_NO) REFERENCES IBOARD(IBOARD_NO)
);

-- 은지씨
DROP TABLE CBOARD;
DROP SEQUENCE SEQ_CBOARD;

CREATE SEQUENCE SEQ_CBOARD NOCYCLE;

CREATE TABLE CBOARD (
	CBOARD_NO	NUMBER PRIMARY KEY,
	CBOARD_TITLE	VARCHAR2(400)		NOT NULL,
	CBOARD_CONTENT	VARCHAR2(4000)		NOT NULL,
	CBOARD_WRITER	NUMBER		NULL,
	CBOARD_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	CBOARD_UPDATE	DATE		NULL,
	CBOARD_DELETE	DATE		NULL,
	CBOARD_VIEWS	NUMBER	DEFAULT 0	NOT NULL,
    FOREIGN KEY (CBOARD_WRITER) REFERENCES MEMBER(MEMBER_NO)
);

COMMENT ON COLUMN CBOARD.CBOARD_TITLE IS '글제목';
COMMENT ON COLUMN CBOARD.CBOARD_CONTENT IS '글내용';
COMMENT ON COLUMN CBOARD.CBOARD_WRITER IS '저자';
COMMENT ON COLUMN CBOARD.CBOARD_INSERT IS '작성된 날짜';
COMMENT ON COLUMN CBOARD.CBOARD_UPDATE IS '글작성';
COMMENT ON COLUMN CBOARD.CBOARD_DELETE IS '글삭제';
COMMENT ON COLUMN CBOARD.CBOARD_VIEWS IS '조회수';

DROP TABLE CATTACHMENT;
DROP SEQUENCE SEQ_CATTACHMENT;

CREATE SEQUENCE SEQ_CATTACHMENT NOCYCLE;

CREATE TABLE CATTACHMENT (
	CATTACHMENT_NO	NUMBER PRIMARY KEY,
	CBOARD_NO	NUMBER		NOT NULL,
	CATTACHMENT_ORIGIN	VARCHAR2(200)		NOT NULL,
	CATTACHMENT_CHANGE	VARCHAR2(200)		NOT NULL,
	CATTACHMENT_PATH	VARCHAR2(200)		NOT NULL,
	CATTACHMENT_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	CATTACHMENT_LEVEL	NUMBER	DEFAULT 0	NOT NULL,
    FOREIGN KEY (CBOARD_NO) REFERENCES CBOARD(CBOARD_NO)
);

DROP TABLE CREPLY;
DROP SEQUENCE SEQ_CREPLY;

CREATE SEQUENCE SEQ_CREPLY NOCYCLE;

CREATE TABLE CREPLY (
	CREPLY_NO	NUMBER PRIMARY KEY,
	MEMBER_NO	NUMBER		NOT NULL,
	CBOARD_NO	NUMBER		NOT NULL,
	CREPLY_PARENT	NUMBER		NULL,
	CREPLY_CONTENT	VARCHAR2(2000)		NOT NULL,
	CREPLY_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	CREPLY_UPDATE	DATE		NULL,
	CREPLY_DELETE	DATE		NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (CBOARD_NO) REFERENCES CBOARD(CBOARD_NO),
    FOREIGN KEY (CREPLY_PARENT) REFERENCES CREPLY(CREPLY_NO)
);

DROP TABLE RCATTACHMENT;
DROP SEQUENCE SEQ_RCATTACHMENT;

CREATE SEQUENCE SEQ_RCATTACHMENT NOCYCLE;

CREATE TABLE RCATTACHMENT (
	RCATTACHMENT_NO	NUMBER PRIMARY KEY,
	RCREPLY_NO	NUMBER		NOT NULL,
	RCATTACHMENT_ORIGIN	VARCHAR2(200)		NOT NULL,
	RCATTACHMENT_CHANGE	VARCHAR2(200)		NOT NULL,
	RCATTACHMENT_PATH	VARCHAR2(200)		NOT NULL,
	RCATTACHMENT_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	RCATTACHMENT_LEVEL	NUMBER	DEFAULT 0	NOT NULL,
    FOREIGN KEY (RCREPLY_NO) REFERENCES CREPLY(CREPLY_NO)
);

DROP TABLE RECOMMEND;

CREATE TABLE RECOMMEND (
	RECOMMEND_MEMBER	NUMBER		NOT NULL,
	CREPLY_NO	NUMBER		NOT NULL,
    FOREIGN KEY (RECOMMEND_MEMBER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (CREPLY_NO) REFERENCES CREPLY(CREPLY_NO)
);

DROP TABLE CRELATION;

CREATE TABLE CRELATION (
	CBOARD_NO	NUMBER		NOT NULL,
	TAGS_NO	NUMBER		NOT NULL,
    FOREIGN KEY (CBOARD_NO) REFERENCES CBOARD(CBOARD_NO),
    FOREIGN KEY (TAGS_NO) REFERENCES TAGS(TAGS_NO)
);

-- 인엽씨
DROP TABLE RECRUITMENT;
DROP SEQUENCE SEQ_RECRUITMENT;

CREATE SEQUENCE SEQ_RECRUITMENT NOCYCLE;

CREATE TABLE RECRUITMENT (
	RECRUITMENT_NO	NUMBER PRIMARY KEY,
	RECRUITMENT_TITLE	VARCHAR2(400)		NOT NULL,
	RECRUITMENT_CONTENT	VARCHAR2(4000)		NOT NULL,
	RECRUITMENT_WRITER	NUMBER		NULL,
	RECRUITMENT_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	RECRUITMENT_UPDATE	DATE		NULL,
	RECRUITMENT_DELETE	DATE		NULL,
	PROJECT_NO	NUMBER		NOT NULL,
	RECRUITMENT_VIEWS	NUMBER	DEFAULT 0	NOT NULL,
	RECRUITMENT_START	DATE		NULL,
	RECRUITMENT_END	DATE		NULL,
	RECRUITMENT_LOCATION	VARCHAR2(200)		NULL,
    FOREIGN KEY (RECRUITMENT_WRITER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT(PROJECT_NO)
);

COMMENT ON COLUMN RECRUITMENT.RECRUITMENT_INSERT IS '작성된 날짜';

DROP TABLE RECRUITMENT_WISHLIST;

CREATE TABLE RECRUITMENT_WISHLIST (
	RECRUITMENT_WISHLIST_MEMBER	NUMBER		NOT NULL,
	RECRUITMENT_NO	NUMBER		NOT NULL,
    FOREIGN KEY (RECRUITMENT_WISHLIST_MEMBER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (RECRUITMENT_NO) REFERENCES RECRUITMENT(RECRUITMENT_NO)
);

DROP TABLE RECRUITMENT_REPLY;
DROP SEQUENCE SEQ_RECRUITMENT_REPLY;

CREATE SEQUENCE SEQ_RECRUITMENT_REPLY NOCYCLE;

CREATE TABLE RECRUITMENT_REPLY (
	RECRUITMENT_REPLY_NO	NUMBER PRIMARY KEY,
	MEMBER_NO	NUMBER		NOT NULL,
	RECRUITMENT_NO	NUMBER		NOT NULL,
	RECRUITMENT_REPLY_PARENT	NUMBER		NOT NULL,
	RECRUITMENT_REPLY_CONTENT	VARCHAR2(2000)		NOT NULL,
	RECRUITMENT_REPLY_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	RECRUITMENT_REPLY_UPDATE	DATE		NULL,
	RECRUITMENT_REPLY_DELETE	DATE		NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (RECRUITMENT_NO) REFERENCES RECRUITMENT(RECRUITMENT_NO),
    FOREIGN KEY (RECRUITMENT_REPLY_PARENT) REFERENCES RECRUITMENT_REPLY(RECRUITMENT_REPLY_NO)
);

DROP TABLE RECRUITMENT_ATTACHMENT;
DROP SEQUENCE SEQ_RECRUITMENT_ATTACHMENT;

CREATE SEQUENCE SEQ_RECRUITMENT_ATTACHMENT NOCYCLE;

CREATE TABLE RECRUITMENT_ATTACHMENT (
	RECRUITMENT_ATTACHMENT_NO	NUMBER PRIMARY KEY,
	RECRUITMENT_NO	NUMBER		NOT NULL,
	RECRUITMENT_ATTACHMENT_ORIGIN	VARCHAR2(200)		NOT NULL,
	RECRUITMENT_ATTACHMENT_CHANGE	VARCHAR2(200)		NOT NULL,
	RECRUITMENT_ATTACHMENT_PATH	VARCHAR2(200)		NOT NULL,
	RECRUITMENT_ATTACHMENT_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	RECRUITMENT_ATTACHMENT_LEVEL	NUMBER	DEFAULT 0	NOT NULL,
    FOREIGN KEY (RECRUITMENT_NO) REFERENCES RECRUITMENT(RECRUITMENT_NO)
);

-- 영훈씨
DROP TABLE HBOARD;
DROP SEQUENCE SEQ_HBOARD;

CREATE SEQUENCE SEQ_HBOARD NOCYCLE;

CREATE TABLE HBOARD (
	HBOARD_NO	NUMBER PRIMARY KEY,
	HBOARD_TITLE	VARCHAR2(400)		NOT NULL,
	HBOARD_CONTENT	VARCHAR2(4000)		NOT NULL,
	HBOARD_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	HBOARD_UPDATE	DATE		NULL,
	HBOARD_DELETE	DATE		NULL,
	HBOARD_VIEWS	NUMBER	DEFAULT 0	NOT NULL,
	COMPANY_NO	NUMBER		NOT NULL,
	HBOARD_START	DATE		NOT NULL,
	HBOARD_END	DATE		NULL,
	HBOARD_SALARY	NUMBER	DEFAULT 0	NOT NULL,
	HBOARD_EDUCATION	VARCHAR2(40)		NULL,
	HBOARD_CAREER	VARCHAR2(40)		NULL,
    HBOARD_LOCATION VARCHAR2(400) NOT NULL,
    FOREIGN KEY (COMPANY_NO) REFERENCES COMPANY(COMPANY_NO)
);

COMMENT ON COLUMN HBOARD.HBOARD_INSERT IS '작성된 날짜';

DROP TABLE HWISHLIST;

CREATE TABLE HWISHLIST (
	HWISHLIST_MEMBER	NUMBER		NOT NULL,
	HBOARD_NO	NUMBER		NOT NULL,
    FOREIGN KEY (HWISHLIST_MEMBER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (HBOARD_NO) REFERENCES HBOARD(HBOARD_NO)
);

DROP TABLE HATTACHMENT;
DROP SEQUENCE SEQ_HATTACHMENT;

CREATE SEQUENCE SEQ_HATTACHMENT NOCYCLE;

CREATE TABLE HATTACHMENT (
	HATTACHMENT_NO	NUMBER PRIMARY KEY,
	HBOARD_NO	NUMBER		NOT NULL,
	HATTACHMENT_ORIGIN	VARCHAR2(200)		NOT NULL,
	HATTACHMENT_CHANGE	VARCHAR2(200)		NOT NULL,
	HATTACHMENT_PATH	VARCHAR2(200)		NOT NULL,
	HATTACHMENT_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	HATTACHMENT_LEVEL	NUMBER	DEFAULT 0	NOT NULL,
    FOREIGN KEY (HBOARD_NO) REFERENCES HBOARD(HBOARD_NO)
);

DROP TABLE HRELATION;

CREATE TABLE HRELATION (
	HBOARD_NO	NUMBER		NOT NULL,
	TAGS_NO	NUMBER		NOT NULL,
    FOREIGN KEY (HBOARD_NO) REFERENCES HBOARD(HBOARD_NO),
    FOREIGN KEY (TAGS_NO) REFERENCES TAGS(TAGS_NO)
);

COMMIT;