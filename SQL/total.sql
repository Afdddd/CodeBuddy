// only drop
DROP TABLE APPLY_PERSONNEL;
DROP TABLE CALENDAR;
DROP TABLE HRELATION;
DROP TABLE HATTACHMENT;
DROP TABLE HWISHLIST;
DROP TABLE HBOARD;
DROP TABLE CRELATION;
DROP TABLE RECOMMEND;
DROP TABLE RCATTACHMENT;
DROP TABLE CREPLY;
DROP TABLE CATTACHMENT;
DROP TABLE CBOARD;
DROP TABLE IATTACHMENT;
DROP TABLE IREPLY;
DROP TABLE LIKES;
DROP TABLE IBOARD;
DROP TABLE NATTACHMENT;
DROP TABLE NBOARD;
DROP TABLE FATTACHMENT;
DROP TABLE FREPLY;
DROP TABLE FBOARD;
DROP TABLE PRELATION;
DROP TABLE MRELATION;
DROP TABLE TAGS;
DROP TABLE COMPANY;
DROP TABLE CHAT_RECORD;
DROP TABLE CHAT;
DROP TABLE REVIEW;
DROP TABLE JOINS;
DROP TABLE PROJECT;
DROP TABLE RECRUITMENT_STATE;
DROP TABLE RECRUITMENT_ATTACHMENT;
DROP TABLE RECRUITMENT_REPLY;
DROP TABLE RECRUITMENT_WISHLIST;
DROP TABLE AUTH;
DROP TABLE RECRUITMENT_STATE;
DROP TABLE RECRUITMENT;
DROP TABLE MEMBER;
DROP TABLE CHAT_MEMBER;


DROP SEQUENCE SEQ_MEMBER;

CREATE SEQUENCE SEQ_MEMBER NOCYCLE;

CREATE TABLE MEMBER (
	MEMBER_NO NUMBER PRIMARY KEY,
	MEMBER_ID VARCHAR2(100) UNIQUE NOT NULL,
	MEMBER_PWD VARCHAR2(100) NOT NULL,
	MEMBER_EMAIL VARCHAR2(120) UNIQUE NOT NULL,
	MEMBER_NAME VARCHAR2(100) UNIQUE NOT NULL,
	MEMBER_PHOTO_EXTEND	VARCHAR2(30),
	MEMBER_INFO	VARCHAR2(800),
	MEMBER_INSERT DATE DEFAULT SYSDATE	NOT NULL,
	MEMBER_DELETE DATE
);

INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'admin', '$2a$10$x30BjSzHW9D8hEjGewA.oOgTSBo0qFx/i.W4rIaOhkvUSNXoqHxsG', 'admin@coddy.com', '운영자');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user01', '$2a$10$3tjfQjhaYjPtMf5GQC8qRez3qy2iKR0Z6AHwx3DhSdnc4uf1ZyBHC', 'user01@naver.com', '사용자01');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user02', '$2a$10$CeHfaUCsK4.YK9261b2nn.WqK/SgNN9Z0PgvWveI7c8c4LpGdCvGW', 'user02@naver.com', '사용자02');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user03', '$2a$10$h8gKprXaq6aHF4ryqz2.p.zg6LpKl2JCkO99ELOH0UsfqjDht4W6y', 'user03@naver.com', '사용자03');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user04', '$2a$10$6Sv7r/TkS80tSeo1iH/y9ehY1EvJ1/Vvyawb.m1HmrZweFoF/L64O', 'user04@naver.com', '사용자04');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user05', '$2a$10$ImZfEPLwMvb8mrUjFzqUxeePihnpZKWD5lcydH5/W0puXJ1veNxzC', 'user05@naver.com', '사용자05');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user06', '$2a$10$BRgq1.9QK.idrJmRZQtjce9aOY2.Kj8m4xA8zdVcBOtXe0wih6SG2', 'user06@naver.com', '사용자06');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user07', '$2a$10$YaeQ9UQIxZ5v971NMgtsL.bCq42doYajlajErtywGAK0hHIve9t9C', 'user07@naver.com', '사용자07');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user08', '$2a$10$Aucw5mYVqvLqkcvvamJYA.ofjBn9IauzPUix5V3e4FBRyCl4BXZaK', 'user08@naver.com', '사용자08');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user09', '$2a$10$CCFZG2eik3vIaoxWkMhK.eCctqYgC8e2vurGAdN7QFUOLe.TEdZui', 'user09@naver.com', '사용자09');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user10', '$2a$10$m3xVzCzOucbLcBk3o.INxe4QHGYTl0P.q./wy.H5GeJpjlWRiXy8.', 'user10@naver.com', '사용자10');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user11', '$2a$10$Qwjb36lA/SFAlKpc8z/.zuPGx2JFAk5CMQ4BcuO4jKGRrk1NvMZWu', 'user11@naver.com', '사용자11');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user12', '$2a$10$ZQGPfZoZY519KvFzxEIho.7zGyp3HxMVmwuR9fqqPkgR9QKgbxG2K', 'user12@naver.com', '사용자12');

COMMIT;

CREATE TABLE AUTH (
	AUTH_INSERT	DATE DEFAULT SYSDATE NOT NULL,
	AUTH_VALUE VARCHAR2(80) NOT NULL,
	AUTH_EMAIl VARCHAR2(120) NOT NULL
);

COMMIT;

-- 인엽씨
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
	RECRUITMENT_VIEWS	NUMBER	DEFAULT 0	NOT NULL,
	RECRUITMENT_START	DATE		NULL,
	RECRUITMENT_END	DATE		NULL,
	RECRUITMENT_LOCATION	VARCHAR2(200)		NULL,
    RECRUITMENT_INTRO VARCHAR2(500)   NOT NULL,
    FOREIGN KEY (RECRUITMENT_WRITER) REFERENCES MEMBER(MEMBER_NO)
);

COMMENT ON COLUMN RECRUITMENT.RECRUITMENT_INSERT IS '작성된 날짜';

CREATE TABLE RECRUITMENT_WISHLIST (
	RECRUITMENT_WISHLIST_MEMBER	NUMBER		NOT NULL,
	RECRUITMENT_NO	NUMBER		NOT NULL,
    FOREIGN KEY (RECRUITMENT_WISHLIST_MEMBER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (RECRUITMENT_NO) REFERENCES RECRUITMENT(RECRUITMENT_NO)
);

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

COMMIT;

DROP SEQUENCE SEQ_PROJECT;

CREATE SEQUENCE SEQ_PROJECT NOCYCLE;

CREATE TABLE PROJECT (
	PROJECT_NO NUMBER PRIMARY KEY,
	PROJECT_OWNER NUMBER NOT NULL,
    RECRUITMENT_NO NUMBER NOT NULL,
	PROJECT_NAME VARCHAR2(400) NOT NULL,
	PROJECT_INFO VARCHAR2(4000) NULL,
	PROJECT_INSERT DATE	DEFAULT SYSDATE	NOT NULL,
	PROJECT_START DATE NOT NULL,
	PROJECT_END	DATE NOT NULL,
	PROJECT_LOCATION VARCHAR2(200) NULL,
	PROJECT_READY NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY (RECRUITMENT_NO) REFERENCES RECRUITMENT(RECRUITMENT_NO),
    FOREIGN KEY (PROJECT_OWNER) REFERENCES MEMBER(MEMBER_NO)
);

COMMIT;

DROP SEQUENCE SEQ_JOINS;

CREATE SEQUENCE SEQ_JOINS NOCYCLE;

CREATE TABLE JOINS (
	JOINS_NO NUMBER PRIMARY KEY,
	MEMBER_NO NUMBER NOT NULL,
	PROJECT_NO NUMBER NOT NULL,
	JOINS_ROLE VARCHAR2(60) NULL,
	JOINS_IS_PUBLIC	NUMBER DEFAULT 0 NOT NULL,
	JOINS_ACTIVATE NUMBER DEFAULT 1	NOT NULL,
	JOINS_REVIEW VARCHAR2(2000) NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT(PROJECT_NO)
);

COMMENT ON COLUMN JOINS.JOINS_IS_PUBLIC IS '0=PRIVATE, 1=PUBLIC';
COMMENT ON COLUMN JOINS.JOINS_ACTIVATE IS '0: 강제퇴장 / 1: 정상 / 2: 본인퇴장 / 3: 대기실폭발';

COMMIT;

CREATE TABLE REVIEW (
	REVIEW_PROJECT	NUMBER		NOT NULL,
	REVIEW_SUBJECT	NUMBER		NOT NULL,
	REVIEW_OBJECT	NUMBER		NOT NULL,
	REVIEW_SCORE	NUMBER	DEFAULT 1.0 CHECK(REVIEW_SCORE <= 5.0 AND REVIEW_SCORE >= 1.0) NOT NULL,
	REVIEW_REASON	VARCHAR2(800)		NULL,
    FOREIGN KEY (REVIEW_PROJECT) REFERENCES PROJECT(PROJECT_NO),
    FOREIGN KEY (REVIEW_SUBJECT) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (REVIEW_OBJECT) REFERENCES MEMBER(MEMBER_NO)
);

COMMIT;

DROP SEQUENCE SEQ_CHAT;

CREATE SEQUENCE SEQ_CHAT NOCYCLE;


CREATE TABLE CHAT (
	PROJECT_NO NUMBER NOT NULL,
	CHAT_MASTER NUMBER NOT NULL,
	CHAT_INSERT DATE DEFAULT SYSDATE NOT NULL,
	FOREIGN KEY (CHAT_MASTER) REFERENCES MEMBER(MEMBER_NO),
	FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT(PROJECT_NO)
);

DROP SEQUENCE SEQ_CHAT_RECORD;

CREATE SEQUENCE SEQ_CHAT_RECORD NOCYCLE;

CREATE TABLE CHAT_RECORD (
	CHATR_NO NUMBER PRIMARY KEY,
	CHATR_SENDER	NUMBER		NOT NULL,
    PROJECT_NO NUMBER,
	CHATR_MSG	VARCHAR2(2000)		NOT NULL,
	CHATR_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	CHATR_UPDATE	DATE		NULL,
	CHATR_DELETE	DATE		NULL,
    FOREIGN KEY (CHATR_SENDER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT(PROJECT_NO)
);

COMMIT;

DROP SEQUENCE SEQ_COMPANY;

CREATE SEQUENCE SEQ_COMPANY NOCYCLE;

CREATE TABLE COMPANY (
	COMPANY_NO	NUMBER	PRIMARY KEY,
	COMPANY_NAME	VARCHAR2(100)		NOT NULL,
	COMPANY_OWNER	VARCHAR2(40)		NOT NULL,
	COMPANY_ID	VARCHAR2(100)		NOT NULL UNIQUE,
	COMPANY_PWD	VARCHAR2(100)		NOT NULL,
	COMPANY_EMAIL	VARCHAR2(120)		NOT NULL UNIQUE,
	COMPANY_PHOTO_EXTEND	VARCHAR2(30)		NULL,
	COMPANY_BNO	VARCHAR2(300)		NOT NULL UNIQUE,
	COMPANY_INFO	VARCHAR2(2000)		NULL,
	COMPANY_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	COMPANY_DELETE	DATE		NULL,
	COMPANY_WORKER	NUMBER	DEFAULT 1	NOT NULL,
	COMPANY_SALARY	NUMBER	DEFAULT 0	NOT NULL
);

INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'company', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'company@coddy.com', 'company', '김인엽', 8164700297, 'company계정', 23, 46000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'enliple', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'enliple@coddy.com', '인라이플', '한경훈', 0000000001, '★ 회사 홈페이지 : http://www.enliple.com/', 201, 50000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'nhnkcp', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'nhnkcp@coddy.com', 'NHN KCP', '박준석', 0000000002, 'NHN KCP는 전자결제대행 서비스, 온·오프라인 카드 VAN 서비스, 모바일 결제 서비스 등 국내 유일의 통합결제 서비스 구축을 통하여
전자결제 산업의 리딩 컴퍼니라는 자부심 속에 안전하고 편리한 결제를 제공하기 위해 노력하고 있습니다.

이에 더 나아가 NHN KCP는 국내 온·오프라인을 통합한 O2O 결제 시스템 구축 및 글로벌 전자상거래 사업을 통해 급변하는 전자결제 시장에 적극적으로 대응함과 동시에 새로운 해외시장 개척에도 최선을 다하고 있습니다.

최근 국내 전자결제 시장에서 화두로 떠오른 간편결제 분야에서도, NHN KCP는 철저한 사전 준비와 전략으로 해외 유수의 PG사 들과 어깨를 나란히 할 수 있는 글로벌 전자결제 업체로 성장할 것을 확신합니다.

"결제 산업의 리딩컴퍼니 엔에이치엔한국사이버결제와 함께 결제 산업의 변화와 혁신을 선도할 열정있는 인재를 기다립니다."', 201, 72000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'soomgo', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'soomgo@coddy.com', 'Soomgo', 'KIM ROBIN H', 0000000003, '(주)브레이브모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.', 51, 60000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'enuri', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'enuri@coddy.com', '(주)써머스플랫폼', '정희정', 0000000004, '㈜써머스플랫폼의 전신인 에누리닷컴은 1998년 5월 국내 최초 가격비교 사이트로 시작해 지속적으로 객관적이고 정확한 상품 및 가격 정보를 고객에게 제공하고있습니다.', 201, 90000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'inflearn', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'inflearn@coddy.com', '인프랩 (인프런)', '이형주', 4998100612, '우리는 때로 무언가를 배워야만 합니다.

꿈을 이루기 위해서, 하고 싶은걸 해나가기 위해선 그 분야에 대한 배움이 가장 기본적인 요소이기 때문입니다. 하지만, 모두에게 배우기 좋은 환경이 보장 되진 않죠.? 너무 비싸서, 거리가 멀어서, 여러 이유로 당연하다고 생각되어 지는것들이 어떤 누군가에게는 사치가 되기도 합니다. 인프런은 그런 현실에 도전하려 합니다.

인프런은 누구나, 경제적으로 시간적 제약없이 내가 원하는 것을 배우고, 지식을 나눌 수 있는 공간입니다. 현재 2,000여개가 넘는 학습 콘텐츠, 95만 명의 유저가 함께하고 있습니다.

인프런 서비스를 운영하는 (주)인프랩은 2017년 4월 법인설립 이후 매년 3배가 넘는 성장을 이뤄내고, 단단한 팀워크를 지니고 있습니다. 2021년 12월, 월 거래액 21억 원을 기록, 2021년에는 한국투자파트너스, 미래에셋캐피탈, 본엔젤스로부터 60억 원 규모의 시리즈 A 투자를 유치했습니다.

앞으로 인프런은 일하는 사람들의 성장을 돕는 온라인 강의 플랫폼 뿐만 아니라 1:1 멘토링, 채용 등 다양한 커리어 서비스를 제공하며 IT 분야의 전문화된 커리어 성장을 돕는 서비스로 거듭나려 합니다. 그리고 이 여정을 함께 걸어갈 멋진 동료들을 찾고 있습니다.

INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'flitto', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'flitto@coddy.com', '�ø���', '������', 2158772878, '�ø���� ������ �۷ι� IT ������ �Բ� ��� �庮 ���� ���踦 ����� ���� �ִ� ��� �÷��� ����Դϴ�.', 51, 120000000, 'jpg');

성장하고 싶은 모든 사람들이 더 나아지는 과정에 인프런이 보탬이 되기를 바랍니다.
당신의 성장을 늘 응원하겠습니다.', 51, 120000000, 'jpg');


COMMIT;

DROP SEQUENCE SEQ_TAGS;

CREATE SEQUENCE SEQ_TAGS NOCYCLE;

CREATE TABLE TAGS (
	TAGS_NO	NUMBER PRIMARY KEY,
	TAGS_NAME	VARCHAR2(200)		NOT NULL,
	TAGS_TYPE	NUMBER CHECK(TAGS_TYPE IN(0, 1))	NOT NULL,
	TAGS_ACTIVE	NUMBER DEFAULT 1 CHECK(TAGS_ACTIVE IN(0, 1))	NOT NULL
);

COMMENT ON COLUMN TAGS.TAGS_TYPE IS '0: 기술태그 / 1:직군태그';
COMMENT ON COLUMN TAGS.TAGS_ACTIVE IS '0:비활성';

INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'C', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'C PlusPlus', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'C Sharp', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, '.NET Framework', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'GO', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Java', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'JavaScript', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Spring Legacy', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Spring Boot', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'MyBatis', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'React', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Node.js', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Next.js', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Vue', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Swift', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Kotlin', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Python', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Django', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Php', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Flutter', 0, 1);

INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'MySql', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'MarianDB', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'MongoDB', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'OracleDB', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'SqlLite3', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'NoSql', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Redis', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'AWS DynamoDB', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Oracle Berkely', 0, 1);

INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Hadoop', 0, 1);

INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'RestApi', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'GoogleAnalytics', 0, 1);

INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'PhotoShop', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, '3D Max', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Maya', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Blended', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Unity', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'UE4', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'UE5', 0, 1);

INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'AWS', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Docker', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Kubernetes', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Git', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Figma', 0, 1);

INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Notion', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Jira', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Slack', 0, 1);

INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Window', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Unix', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Linux', 0, 1);

INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'PM', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Project Planner', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'FE', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'BE', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'DB Manager', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'CDN', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Design', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, '3D Model', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'UI/UX Planner', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'UI/UX Designer', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Web Publisher', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Web Server Developer', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Network and Server', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'IOS Developer', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'AOS Developer', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Data Scientist', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'ML/AI', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Game Designer', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Game Developer', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'System Manager', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Translation', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Embeded/IOT', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Secure Coding', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Block Chain', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'QA', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'R/D', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Marketing/Sale', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'DX Design', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Algorithm Developer', 1, 1);

COMMIT;

CREATE TABLE MRELATION (
	MEMBER_NO	NUMBER		NOT NULL,
	TAGS_NO	NUMBER		NOT NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (TAGS_NO) REFERENCES TAGS(TAGS_NO)
);

CREATE TABLE PRELATION (
	RECRUITMENT_NO	NUMBER		NOT NULL,
	TAGS_NO	NUMBER		NOT NULL,
    FOREIGN KEY (RECRUITMENT_NO) REFERENCES RECRUITMENT(RECRUITMENT_NO),
    FOREIGN KEY (TAGS_NO) REFERENCES TAGS(TAGS_NO)
);

COMMIT;

-- 효중씨
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
    FOREIGN KEY (IBOARD_WRITER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT(PROJECT_NO)
);

COMMENT ON COLUMN IBOARD.IBOARD_INSERT IS '작성된 날짜';

CREATE TABLE LIKES (
	LIKES_MEMBER	NUMBER		NOT NULL,
	IBOARD_NO	NUMBER		NOT NULL,
    FOREIGN KEY (LIKES_MEMBER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (IBOARD_NO) REFERENCES IBOARD(IBOARD_NO)
);

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

CREATE TABLE RECOMMEND (
	RECOMMEND_MEMBER	NUMBER		NOT NULL,
	CREPLY_NO	NUMBER		NOT NULL,
    FOREIGN KEY (RECOMMEND_MEMBER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (CREPLY_NO) REFERENCES CREPLY(CREPLY_NO)
);

CREATE TABLE CRELATION (
	CBOARD_NO	NUMBER		NOT NULL,
	TAGS_NO	NUMBER		NOT NULL,
    FOREIGN KEY (CBOARD_NO) REFERENCES CBOARD(CBOARD_NO),
    FOREIGN KEY (TAGS_NO) REFERENCES TAGS(TAGS_NO)
);

-- 영훈씨
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

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'NHN KCP JAVA 백엔드 웹개발자 모집', 'NHN KCP, 어떤 곳인가요?
NHN KCP는 전자결제대행 서비스, 온·오프라인 카드 VAN 서비스, 모바일 결제 서비스 등 국내 유일의 통합결제 서비스 구축을 통하여
전자결제 산업의 리딩 컴퍼니라는 자부심 속에 안전하고 편리한 결제를 제공하기 위해 노력하고 있습니다.

이에 더 나아가 NHN KCP는 국내 온·오프라인을 통합한 O2O 결제 시스템 구축 및 글로벌 전자상거래 사업을 통해 급변하는 전자결제 시장에 적극적으로 대응함과 동시에 새로운 해외시장 개척에도 최선을 다하고 있습니다.

최근 국내 전자결제 시장에서 화두로 떠오른 간편결제 분야에서도, NHN KCP는 철저한 사전 준비와 전략으로 해외 유수의 PG사 들과 어깨를 나란히 할 수 있는 글로벌 전자결제 업체로 성장할 것을 확신합니다.

"결제 산업의 리딩컴퍼니 엔에이치엔한국사이버결제와 함께 결제 산업의 변화와 혁신을 선도할 열정있는 인재를 기다립니다."

NHN KCP JAVA 백엔드 웹개발자 모집, 어떤 일을 하나요?
NHN KCP 서비스개발팀 JAVA 백엔드 웹개발자 모집 채용공고입니다.', 3, TO_DATE('12-20-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('05-30-2024 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), 50000000, 'none', 'middle', '08393');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'Java개발 팀장', '인라이플, 어떤 곳인가요?
우리는 IT 플랫폼 기업으로서 경험하지 못한 플랫폼을 만들기 위해 노력합니다. 국내 최초의 리타게팅 광고 플랫폼 ‘모비온’, 시장의 블루오션을 보고 만든 모바일 퍼포먼스 광고 플랫폼 ‘애드밴티지’, 미래를 내다보고 꾸준히 투자한 AI 사업의 일환으로 커스터마이징이 가능한 인공지능 챗봇 ’아이봇’, 채팅은 물론 SNS와 커뮤니티 기능을 모두 담은 모임을 위한 메신저 ‘캠프’. 시장의 니즈를 미리 감지해 이전에 없던 서비스를 구현하고 있습니다.

2012년 리타게팅 광고 플랫폼 사업을 시작하여 지속적인 기술투자(인공지능, 빅데이터)와 혁신으로 업계 1위로 성장하였습니다. 인공지능 연구 개발에 3년간 투자하여 자연어 처리에 특화된 AI엔진 ‘LUCY’는 2019년 1월에 열린 KorQuAD 대회에서 네이버, LG 등의 대기업을 제치고1위를 차지해 우리 기술의 가능성을 보여줬습니다. 전체 인력의 ½가 개발 인력일 정도로 기술 고도화에 집중하고 있고, 글로벌 수준의 기술력을 확보하기 위해 상당의 비용을 R and D에 쏟고 있습니다.

최고 효율의 AD Tech, 빅데이터 보유 및 분석, Block chain을 이용한 데이터 저장 및 공유를 통해 광고 사업과 B2C 사업을 운영하고 있으며, 자체 AI 엔진 개발로 그 성장의 동력을 확보하여, 통합 AI 생태계 구축을 목표로 하고 있습니다.

★ 회사 홈페이지 : http://www.enliple.com/
★ 인라이플 소개 : https://sheer-aura-848.notion.site/Will-U-Join-ENLIPLE-9fc703171a4b4e54819463a4cb38113b
★ 인라이플 블로그 : https://blog.naver.com/enliple_blog
★ 복지좋은 회사의 기준 : https://blog.naver.com/enliple_blog/222203763903

Java개발 팀장, 어떤 일을 하나요?
Java 개발 팀장', 2, TO_DATE('12-02-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('02-14-2024 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), 72000000, 'none', 'senior', '08389');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, '[숨고] Business Development Lead', '브레이브모바일 (숨고), 어떤 곳인가요?
1,000만이 선택한 전국민 생활 솔루션, 숨고

연결을 통해 우리의 일상에 유의미한 변화를 함께 만들어갈 당신을 찾습니다.

숨고는 누구나 참여하여 서로의 가치를 교환하는 마켓플레이스입니다. 2022년을 기준으로 숨고는 약 1,000개 이상의 카테고리에서 900만 명의 고객과 100만 명의 고수가 모여, 연간 거래액 약 6,000억원에 달하는 가치 교환을 만들어내는 생태계가 되었습니다.

하지만 숨고가 닿을 수 있는 약 126조 원 규모의 막대한 시장에 비한다면 지금의 성과는 아직 시작 단계에 불과합니다. 우리는 숨고 안에서 지금보다 훨씬 많은 연결이 만들어질 수 있도록 생태계를 키워나가고 있습니다. 한번도 가본적 없는 미지의 영역을 개척하고 우리 앞에 다가온 거대한 기회에 함께 도전할 용감한 당신을 기다립니다.

? 우리는 [ ]합니다
? 숨고 생태계의 가치와 비전에 공감합니다
? 스스로 문제를 정의하고 해결하는 전문가 조직을 지향합니다
? 자신이 맡은 일에 대해 프로라는 마음가짐을 가집니다
? 나이와 경력, 직무에 상관없이 모두가 자유롭고 투명하게 의사소통합니다
? 단순한 아이디어부터 중요한 결정까지 모든 과정에서 데이터를 기반으로 소통합니다
? 유저와 제품에 가장 큰 임팩트를 줄 수 있는 방법을 고민합니다

? 우리가 만들어낸 성과
2023. 03: 누적 가입자 수 1,000만 돌파
2022. 06: 누적 견적서 6,000만 건 돌파
2022. 01: 첫 TVC 런칭
2021. 11: 스마트대한민국대상 수상
2021. 07: 320억원 규모 시리즈 C 유치
2021. 02: ‘바로 견적’ 매칭 서비스 출시
2020. 12: 휴먼테크놀로지어워드 수상', 4, TO_DATE('11-08-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('12-08-2023 00:00:00','MM-DD-YYYY HH24:MI:SS'), 64000000, 'none', 'none', '06160');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, '[스마트택배] 스윗트래커CIC_인프라 담당 채용', '[스마트택배] 스윗트래커CIC_인프라 담당 채용, 어떤 일을 하나요?
[스마트택배] 스윗트래커CIC_인프라 담당 채용

주요업무
? Public Cloud(AWS, KT) 서비스 운영관리
? On-Premise 서버 운영관리
? 보안장비(방화벽/IPS/VPN) 운영관리

자격요건
? 학력 : 학력무관
? 경력 : 2년~ 8년
? 보안장비 운영 경험자
? Cloud 서비스 운영 경험자
? 리눅스 운영 경험자

우대사항
? H/W, S/W 보안관리 경험자 우대
? 개인정보보호 보안관리 경험자 우대
? 동료와의 커뮤니케이션 협업이 즐거우신분

혜택 및 복지
4대보험/퇴직연금/건강검진지원/복지휴가/월요일점심시간1시간30분/월1회3시간 조기퇴근/웰컴키트/사내동호회/카페테리아/어버이날감사선물/경조사지원/리조트사용/장기근속휴가지원/명절상품권지급/성과급지급/매주금요일시차출퇴근제운영/임직원구매지원/임직원근로복지대출/', 5, TO_DATE('12-13-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('03-15-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 90000000, 'university', 'middle', '08502');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'React Native 개발자 (경력 1년 이상)', '주요업무
- TypeScript, React Native 를 기반으로 Android / iOS 애플리케이션을 개발하고 배포합니다.
- 모바일 영상 플레이어, OAuth 를 비롯한 각 서비스에 필요한 기능들을 구현, 개선 합니다.
- 상황에 맞게 적절한 형태로 네이티브 구현과 웹앱 구현을 나눠 진행합니다.
- 시스템 전반의 성능 최적화를 위해 API 호출 최소화 / 렌더링 최적화 / 번들링 최적화 등을 상시로 진행합니다.
- DataDog, Sentry 등의 APM을 통해 사용자 디바이스에서 발생하는 에러에 대해서 추적하고 해결합니다.
- Figma를 통해 디자이너와 함께 사용자를 위한 UI/UX 개선을 고민하고 적용합니다.
- Swagger, Codegen 기반으로 백엔드 개발팀과 함께 데이터에 대해 협업합니다.
- 웹 프론트엔드 개발파트와 함께 사용할 공통의 라이브러리 등을 개발/개선합니다.

자격요건
아래 개발팀의 미션과 가치에 동의하시는 분이어야 합니다.
https://tech.inflab.com/20231117-devteam-value/

- JavaScript, TypeScript 에 대한 이해가 있으신 분
- React Native 사용 경험이 있는 분
- Android/iOS 다양한 환경과 디바이스에 적합한 UI/UX에 전반적인 이해를 갖춘 분
- CodePush 등을 이용한 효율적인 배포 관리 경험이 있는 분
- HTTP 통신에 대해 기본적인 이해가 있으신 분
- Git과 Github에 대한 기본적인 사용법을 알고 있고, Rebase, Merge, Squash 에 대해 이해하고 계신 분', 6, TO_DATE('12-11-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('01-25-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 120000000, 'none', 'junior', '13494');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'AI, ML Engineer �ڻ��', '<h2 class="css-17h254d" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, '|| CHR(038)||'quot;Helvetica Neue'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Segoe UI'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Apple SD Gothic Neo'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Noto Sans KR'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Malgun Gothic'|| CHR(038)||'quot;, sans-serif; font-size: 20px; font-weight: bold; font-stretch: normal; line-height: 1.4; letter-spacing: -0.3px; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(33, 37, 42); text-align: start;">�ֽ�ȸ�� �ø���, � ���ΰ���?</h2><p style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, '|| CHR(038)||'quot;Helvetica Neue'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Segoe UI'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Apple SD Gothic Neo'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Noto Sans KR'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Malgun Gothic'|| CHR(038)||'quot;, sans-serif; font-size: 20px; font-weight: bold; font-stretch: normal; line-height: 1.4; letter-spacing: -0.3px; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(33, 37, 42); text-align: start;"><img src="resources\file_upload\hboard\content\65cf0be1-163c-43bb-89c9-a6e662bbbdb3_6l29t_z_gjiRjF6HdsuJm.png" style="width: 384px;"><br></p><p class="css-19hzmb1" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, '|| CHR(038)||'quot;Helvetica Neue'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Segoe UI'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Apple SD Gothic Neo'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Noto Sans KR'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Malgun Gothic'|| CHR(038)||'quot;, sans-serif; font-stretch: normal; line-height: 1.63; white-space-collapse: preserve-breaks; text-align: start; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 37, 42);">�ø���� ������ �۷ι� IT ������ �Բ� ��� �庮 ���� ���踦 ����� ���� �ִ� ��� �÷��� ����Դϴ�.

��ü ������ ������ �ø��� AI������ 1,000�� �� �̻��� �۷ι� ������ ���� �����ϴ� �ø��� �������� ����,
�׸��� ��� �ɷ��� Ȱ���� ���� �����带 ���� �� �ִ� �ø��� �����̵�(Arcade) ���񽺸� �����ϰ� ������,
�� �ܿ��� ��� �庮�� ���� ���� ���� ��ġ�ִ� �ű� ���񽺵��� ���Ӿ��� �����ϰ� �ֽ��ϴ�.

��ó�� �پ��� ���񽺸� ���� Ȯ���� ���� �ڿ������� ��Ȯ�� ��� �����͸� �۷ι� IT ����� AI �н� �����ͷ� �����ϰ� ������,
���� ������ �Ը�� ������ ��� ������ ���忡�� �ѱ� ��ǥ ������μ��� ������ �������� �ֽ��ϴ�.

����� �庮�� �پ�Ѵ� ������ ��� ������ ���� ��� �ø��信��
�Բ� �����ϱ� ���� ��ſ� ������ �շ��Ͻ� ���� �е��� ������ ��ٸ��ϴ�.</p>', 7, TO_DATE('12-15-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('02-03-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 120000000, 'none', 'junior', '06173');

CREATE TABLE HWISHLIST (
	HWISHLIST_MEMBER	NUMBER		NOT NULL,
	HBOARD_NO	NUMBER		NOT NULL,
    FOREIGN KEY (HWISHLIST_MEMBER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (HBOARD_NO) REFERENCES HBOARD(HBOARD_NO)
);

INSERT INTO HWISHLIST VALUES(1, 1);
INSERT INTO HWISHLIST VALUES(2, 1);
INSERT INTO HWISHLIST VALUES(2, 2);
INSERT INTO HWISHLIST VALUES(3, 1);
INSERT INTO HWISHLIST VALUES(4, 2);
INSERT INTO HWISHLIST VALUES(6, 1);
INSERT INTO HWISHLIST VALUES(8, 1);
INSERT INTO HWISHLIST VALUES(8, 2);

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

INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 3, 'pcpXcPaKAYas7AMLgewVc.jpg', 'f02c6a8b-1084-4e0b-bdea-8fc0afc95205_pcpXcPaKAYas7AMLgewVc.jpg', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 1, 'LAoD-XZaVF1c2wrySrLrt.JPG', '086eb887-515e-44cf-a64b-2972bb44ddd8_LAoD-XZaVF1c2wrySrLrt.JPG', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 2, 'TbAr4BVz11JIPt_jb_yDc.png', 'f67ef705-8562-4a0b-aeec-ff8de2a5bd7e_TbAr4BVz11JIPt_jb_yDc.png', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 4, 'ISJr977sDyqHcQBrKI5BQ.jpg', 'c18a5898-e0c6-4241-8df6-591b0f9a486d_ISJr977sDyqHcQBrKI5BQ.jpg', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 5, 'zWVCtXZfCDVujmzobblNq.png', '9cb81c12-ac1d-477f-8025-f30c0c5829bc_zWVCtXZfCDVujmzobblNq.png', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 6, '6l29t_z_gjiRjF6HdsuJm.png', '07dda43c-05da-46e1-9a73-2289aa995fab_6l29t_z_gjiRjF6HdsuJm.png', 'resources\file_upload\hboard\', SYSDATE, 1);

CREATE TABLE HRELATION (
	HBOARD_NO	NUMBER		NOT NULL,
	TAGS_NO	NUMBER		NOT NULL,
    FOREIGN KEY (HBOARD_NO) REFERENCES HBOARD(HBOARD_NO),
    FOREIGN KEY (TAGS_NO) REFERENCES TAGS(TAGS_NO)
);

INSERT INTO HRELATION VALUES(1, 6);
INSERT INTO HRELATION VALUES(1, 8);
INSERT INTO HRELATION VALUES(1, 24);
INSERT INTO HRELATION VALUES(1, 53);
INSERT INTO HRELATION VALUES(2, 6);
INSERT INTO HRELATION VALUES(2, 8);
INSERT INTO HRELATION VALUES(2, 9);
INSERT INTO HRELATION VALUES(2, 10);
INSERT INTO HRELATION VALUES(2, 14);
INSERT INTO HRELATION VALUES(2, 21);
INSERT INTO HRELATION VALUES(2, 22);
INSERT INTO HRELATION VALUES(2, 51);
INSERT INTO HRELATION VALUES(2, 53);
INSERT INTO HRELATION VALUES(2, 54);
INSERT INTO HRELATION VALUES(2, 67);
INSERT INTO HRELATION VALUES(2, 76);
INSERT INTO HRELATION VALUES(3, 44);
INSERT INTO HRELATION VALUES(3, 45);
INSERT INTO HRELATION VALUES(3, 46);
INSERT INTO HRELATION VALUES(3, 47);
INSERT INTO HRELATION VALUES(4, 40);
INSERT INTO HRELATION VALUES(4, 50);
INSERT INTO HRELATION VALUES(5, 11);
INSERT INTO HRELATION VALUES(5, 43);
INSERT INTO HRELATION VALUES(5, 44);
INSERT INTO HRELATION VALUES(6, 17);
INSERT INTO HRELATION VALUES(6, 67);

COMMIT;

DROP SEQUENCE SEQ_CALENDAR;

CREATE SEQUENCE SEQ_CALENDAR NOCYCLE;

CREATE TABLE CALENDAR (
	CALENDAR_NO	NUMBER	PRIMARY KEY,
	PROJECT_NO	NUMBER		NOT NULL,
	CALENDAR_TITLE	VARCHAR2(200)		NOT NULL,
	CALENDAR_CONTENT	VARCHAR2(500)		NULL,
	START_POINT	DATE		NOT NULL,
	END_POINT	DATE		NOT NULL,
    FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT(PROJECT_NO)
);

COMMIT;


CREATE TABLE RECRUITMENT_STATE (
	RECRUITMENT_NO		NUMBER		NOT NULL,
	ROLE			VARCHAR2(60)	NOT NULL,
	MAX_PERSONNEL		NUMBER		DEFAULT 1 	NOT NULL,
	FOREIGN KEY (RECRUITMENT_NO) REFERENCES RECRUITMENT (RECRUITMENT_NO)
);

COMMIT;


CREATE TABLE CHAT_MEMBER(
	PROJECT_NO	NUMBER	NOT NULL,
	MEMBER_NO	NUMBER	NOT NULL,
	ROLE		VARCHAR2(60) NOT NULL,
	FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT(PROJECT_NO),
    	FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);

COMMIT;