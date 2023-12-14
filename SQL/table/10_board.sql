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
	RECRUITMENT_INTRO	VARCHAR2(500)		NOT NULL,
    FOREIGN KEY (RECRUITMENT_WRITER) REFERENCES MEMBER(MEMBER_NO),
);

COMMENT ON COLUMN RECRUITMENT.RECRUITMENT_INSERT IS '작성된 날짜';

INSERT INTO RECRUITMENT (RECRUITMENT_NO, RECRUITMENT_TITLE, RECRUITMENT_CONTENT, RECRUITMENT_WRITER, RECRUITMENT_START, RECRUITMENT_END, RECRUITMENT_LOCATION, RECRUITMENT_INTRO)
VALUES(SEQ_RECRUITMENT.NEXTVAL, 'Code Buddy','[소개] 개발을 위한 팀원 모집 사이트를 개발하려고 합니다. 1. 프로젝트의 시작 동기 비전공자 출신으로써 주변에 개발자가 없어 팀프로젝트의 참여하기 어렵다는 계기로 시작하게되었습니다.  본인이 원하는 프로젝트의 원하는 포지션으로 팀원을 모집할수있습니다.  이사이트는 비전공자나 팀원을 구하기 어려운 사람들을 대상으로 합니다. 2.회의 진행/모임 방식 회의는 채팅을 통해 진행되며 마찬가지로 오프라인 장소도 채팅을 통해 정해집니다. * 개발 하고싶으신 분들은 마음 편하게 지원해주세요!* ',2,'2023-12-01','2024-1-20','서울특별시','개발을 위한 팀원 모집 사이트 입니다.');
INSERT INTO RECRUITMENT (RECRUITMENT_NO, RECRUITMENT_TITLE, RECRUITMENT_CONTENT, RECRUITMENT_WRITER, RECRUITMENT_START, RECRUITMENT_END, RECRUITMENT_LOCATION, RECRUITMENT_INTRO)
VALUES(SEQ_RECRUITMENT.NEXTVAL,'일대일 데이팅 서비스' ,'현재 출시되어 있는 많은 데이팅앱들이 남성 회원을 타겟으로 만들어졌습니다
상대 이성의 외모와 배경을 중심으로 보여주고 빠르게 매칭시키는데에만 집중하다보니
오히려 여성 회원들의 이탈율이 늘어나고 성비의 불균형이 심해졌습니다
저희 프로젝트는 이 부분을 해결해보자에서 시작되었습니다
여성기획자가 직접 만들고 여성을 위한 컨텐츠와 디자인으로 여성회원을 많이 유입시켜
남성회원과 여성회원간의 선순환을 유도하고자 합니다
기본적인 매칭기능과 푸쉬 알림, 결제 등 필수 기능이 존재합니다(채팅 기능은 없습니다)
회원가입, 유저의 상세페이지, 마이페이지 등 30페이지 내외의 화면으로 구성되어 있습니다
20-30대 솔로남여를 타겟으로 한 1:1 매칭 서비스입니다.',3,'23-11-09', '24-05-09','서울특별시','20-30대 솔로남여를 타겟으로 한 1:1 매칭 서비스입니다');

INSERT INTO RECRUITMENT (RECRUITMENT_NO, RECRUITMENT_TITLE, RECRUITMENT_CONTENT, RECRUITMENT_WRITER, RECRUITMENT_START, RECRUITMENT_END, RECRUITMENT_LOCATION, RECRUITMENT_INTRO)
VALUES(SEQ_RECRUITMENT.NEXTVAL, '맛집 큐레이팅 서비스','안녕하세요

모든 곳에 빛이 들게하는 맛집 큐레이팅 서비스 ‘스포트라이트’ 기획자입니다.

여러분 맛집어플 많이 사용하시나요?

사용해보신 분들은 느끼실 수 있을텐데요

정보성 어플이기에 전부 비슷한 UI를 가지고, 차별성을 드러내기 힘든 분야입니다.

얼마 전 MAU가 200만 명이 넘던 맛집 어플인 망고 플레이트가 서비스 종료를 했습니다.

10년 이상 운영되었고, 많은 전문가들이 운영했을텐데 왜 망했을까요?

제가 감히 판단할 수는 없지만, 비즈니스 모델 구축이 힘들었기 때문이라 생각합니다.

맛집어플의 주 BM은 주로 매장 사장님들의 마케팅 비용으로 B2B 모델에 해당합니다.

매장 사장님들의 입장에서 적은 돈이라도 하나의 플랫폼에 국한된 구독 서비스를 과연 지속적으로 유지하시지 못했으리라 생각합니다.

이에 대한 문제를 기점으로

1. 어떻게 하면 맛집어플이 차별점을 낼 수 있을까?

2. 비즈니스 모델을 다각화하거나 기존의 B2B 모델의 유저 리텐션을 어떻게 가져갈 수 있을까?

에 대한 답을 고민하는 시간을 가졌고, 현재의 개발까지 오게 되었습니다.

현재는 와이어프레임, 기능명세, 디자인까지 완료된 상태이며 리엑트 네이티브를 통해 프론트 작업을 진행 중이며, 백엔드 DB 설계에 들어간 초기 상태입니다.

최대한 기능을 덜어내 개발 시간을 줄여, 내년 2월까지 베타 서비스 출시를 예정하고 있습니다.

기존의 맛집 큐레이팅 서비스와 다른 방식으로 1개의 음식점에 집중할 수 있는 방식의 서비스를 만들고 있습니다.

쉽게 말하면 맛집 소개팅 어플이라고 생각하시면 쉽습니다.',3,'23.12.07', '24.06.07','경기도', '맛집 소개팅 어플');
INSERT INTO RECRUITMENT (RECRUITMENT_NO, RECRUITMENT_TITLE, RECRUITMENT_CONTENT, RECRUITMENT_WRITER, RECRUITMENT_START, RECRUITMENT_END, RECRUITMENT_LOCATION, RECRUITMENT_INTRO)
VALUES(SEQ_RECRUITMENT.NEXTVAL, '커플/친구들 간의 추억 공유기록서비스','안녕하세요, 저희팀은 커플 또는 친구들이 서로에 대해 조금 더 알아갈 수 있는 공유기록 서비스를 구현하고 실제로 운영하고자 합니다.
연애를 하다보면 서로 진심을 전하기 힘들 때도 있고, 바쁜 일상에 치여 상대방과 함께 했던 모든 추억을 세세하게 기억하기 힘들 때도 있습니다.
이러한 부분을 해결하기 위해 상대방과 추억을 공유할 수 있는 공간을 기획하게 되었습니다.
이밖에도, 연애 뿐만 아니라 친구들과의 추억 역시 마찬가지 일 것이라고 생각합니다.
그렇기에 더 나아가 친구들과도 추억을 공유하고 기록할 수 있는 환경을 만들어 가는 것을 목표로 프로젝트를 시작하게 되었습니다!',4,'23-12-11','24-06-11','경기도','커플 또는 친구들이 서로에 대해 조금 더 알아갈 수 있는 공유기록 서비스');
INSERT INTO RECRUITMENT (RECRUITMENT_NO, RECRUITMENT_TITLE, RECRUITMENT_CONTENT, RECRUITMENT_WRITER, RECRUITMENT_START, RECRUITMENT_END, RECRUITMENT_LOCATION, RECRUITMENT_INTRO)
VALUES(SEQ_RECRUITMENT.NEXTVAL, '감정으로 요리되는 ai 음악일기 앱','안녕하세요.

팀 음악카세입니다.

“날것의 감정으로 요리되는 그날의 ai 음악 일기” 서비스 론칭을 목표로 하고 있습니다.

올해 초 서울문화재단 주관의 예술플러스창업 1차, 2차를 통과하여

금번 11월 페스타에서 최종 우승하였습니다. (*상금 -> 초기 자본 확보)

저희 팀은 기획자, 작곡가, 개발자(프론트), 개발자(서버)로 구성되어 있습니다.

본격적인 앱 개발을 앞두고 있어, 디자이너 / 일러스트레이터 분을 구인하고자 합니다.

정식으로 서비스를 론칭한 뒤, 스타트업의 형태로 장기적으로 함께 발전해나갈 분을 모시고자 합니다.',5,'23.11.28', '24.05.28','서울특별시', '날것의 감정으로 요리되는 그날의 ai 음악 일기');

COMMIT;

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

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'AI, ML Engineer 박사급', '<h2 class="css-17h254d" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, '|| CHR(038)||'quot;Helvetica Neue'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Segoe UI'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Apple SD Gothic Neo'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Noto Sans KR'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Malgun Gothic'|| CHR(038)||'quot;, sans-serif; font-size: 20px; font-weight: bold; font-stretch: normal; line-height: 1.4; letter-spacing: -0.3px; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(33, 37, 42); text-align: start;">주식회사 플리토, 어떤 곳인가요?</h2><p style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, '|| CHR(038)||'quot;Helvetica Neue'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Segoe UI'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Apple SD Gothic Neo'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Noto Sans KR'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Malgun Gothic'|| CHR(038)||'quot;, sans-serif; font-size: 20px; font-weight: bold; font-stretch: normal; line-height: 1.4; letter-spacing: -0.3px; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(33, 37, 42); text-align: start;"><img src="resources\file_upload\hboard\content\65cf0be1-163c-43bb-89c9-a6e662bbbdb3_6l29t_z_gjiRjF6HdsuJm.png" style="width: 384px;"><br></p><p class="css-19hzmb1" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, '|| CHR(038)||'quot;Helvetica Neue'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Segoe UI'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Apple SD Gothic Neo'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Noto Sans KR'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Malgun Gothic'|| CHR(038)||'quot;, sans-serif; font-stretch: normal; line-height: 1.63; white-space-collapse: preserve-breaks; text-align: start; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 37, 42);">플리토는 유수의 글로벌 IT 기업들과 함께 언어 장벽 없는 세계를 만들어 가고 있는 언어 플랫폼 기업입니다.

자체 엔진을 적용한 플리토 AI번역과 1,000만 명 이상의 글로벌 유저가 직접 참여하는 플리토 집단지성 번역,
그리고 언어 능력을 활용해 즐기며 리워드를 모을 수 있는 플리토 아케이드(Arcade) 서비스를 제공하고 있으며,
이 외에도 언어 장벽이 없는 세상를 위한 가치있는 신규 서비스들을 끊임없이 개발하고 있습니다.

이처럼 다양한 서비스를 통해 확보한 가장 자연스럽고 정확한 언어 데이터를 글로벌 IT 기업에 AI 학습 데이터로 제공하고 있으며,
향후 수십조 규모로 성장할 언어 데이터 시장에서 한국 대표 기업으로서의 입지를 굳혀가고 있습니다.

언어의 장벽을 뛰어넘는 독보적 언어 데이터 전문 기업 플리토에서
함께 성장하기 위한 즐거운 도전에 합류하실 많은 분들의 지원을 기다립니다.</p>', 7, TO_DATE('12-15-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('02-03-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 120000000, 'none', 'junior', '06173');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'DevOps 엔지니어', '<div class="css-1dcto04" style="width: 722px; display: flex; flex-direction: row; -webkit-box-pack: start; justify-content: start; -webkit-box-align: center; align-items: center; gap: 0rem; margin: 0px 0px 8px; color: rgb(33, 37, 42); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" color="" emoji",="" ui="" symbol",="" sans-serif;="" font-size:="" 15px;="" text-align:="" start;"=""><h3 class="css-l8sxp3" style="box-sizing: border-box; font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" sans-serif;="" font-size:="" 16px;="" font-stretch:="" normal;="" font-style:="" line-height:="" 1.38;="" letter-spacing:="" font-weight:="" bold;="" white-space:="" pre-line;="" word-break:="" break-all;="" margin:="" 0px;"=""><br></h3><h3 class="css-l8sxp3" style="box-sizing: border-box; font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" sans-serif;="" font-size:="" 16px;="" font-stretch:="" normal;="" font-style:="" line-height:="" 1.38;="" letter-spacing:="" font-weight:="" bold;="" white-space:="" pre-line;="" word-break:="" break-all;="" margin:="" 0px;"=""><div class="css-1dcto04" style="width: 722px; display: flex; flex-direction: row; -webkit-box-pack: start; justify-content: start; -webkit-box-align: center; align-items: center; gap: 0rem; margin: 0px 0px 8px; font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" color="" emoji",="" ui="" symbol",="" sans-serif;="" font-size:="" 15px;="" font-weight:="" 400;="" white-space-collapse:="" collapse;"=""></div><p class="css-19hzmb1" style="font-stretch: normal; line-height: 1.63; font-weight: 400; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">자격요건</p><p class="css-19hzmb1" style="font-stretch: normal; line-height: 1.63; font-weight: 400; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">? 컴퓨터 과학 또는 관련 분야의 학사 학위
? DevOps 분야에서 2년 이상의 경험
? 네트워크에 대한 깊은 이해
? AWS, Container, Kubernetes 및 클라우드 인프라 전반에 대한 견고한 이해
? Terraform IaC(Infrastructure as Code) 구축 및 유지 관리
? Jenkins, Ansible 및 Chef와 같은 자동화 도구에 대한 경험
? 뛰어난 문제 해결 및 문제 해결 기술
? 뛰어난 의사 소통 및 팀워크 기술</p><p class="css-19hzmb1" style="font-stretch: normal; line-height: 1.63; font-weight: 400; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;"><br></p><p class="css-19hzmb1" style="font-stretch: normal; line-height: 1.63; font-weight: 400; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;"><a href="https://www.rallit.com/positions/1642/devops-%EC%97%94%EC%A7%80%EB%8B%88%EC%96%B4" target="_blank">지원하기</a><br></p></h3></div>', 8, TO_DATE('12-14-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('02-14-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 62000000, 'none', 'none', '05551');

DROP TABLE HWISHLIST;

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

INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 3, 'pcpXcPaKAYas7AMLgewVc.jpg', 'f02c6a8b-1084-4e0b-bdea-8fc0afc95205_pcpXcPaKAYas7AMLgewVc.jpg', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 1, 'LAoD-XZaVF1c2wrySrLrt.JPG', '086eb887-515e-44cf-a64b-2972bb44ddd8_LAoD-XZaVF1c2wrySrLrt.JPG', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 2, 'TbAr4BVz11JIPt_jb_yDc.png', 'f67ef705-8562-4a0b-aeec-ff8de2a5bd7e_TbAr4BVz11JIPt_jb_yDc.png', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 4, 'ISJr977sDyqHcQBrKI5BQ.jpg', 'c18a5898-e0c6-4241-8df6-591b0f9a486d_ISJr977sDyqHcQBrKI5BQ.jpg', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 5, 'zWVCtXZfCDVujmzobblNq.png', '9cb81c12-ac1d-477f-8025-f30c0c5829bc_zWVCtXZfCDVujmzobblNq.png', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 6, '6l29t_z_gjiRjF6HdsuJm.png', '07dda43c-05da-46e1-9a73-2289aa995fab_6l29t_z_gjiRjF6HdsuJm.png', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 7, 'rk02vp1en9--LOR39kpEw.JPG', '941e639b-7349-4266-be04-8859a4292933_rk02vp1en9--LOR39kpEw.JPG', 'resources\file_upload\hboard\', SYSDATE, 1);

DROP TABLE HRELATION;

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
INSERT INTO HRELATION VALUES(7, 40);
INSERT INTO HRELATION VALUES(7, 42);
INSERT INTO HRELATION VALUES(7, 93);

COMMIT;