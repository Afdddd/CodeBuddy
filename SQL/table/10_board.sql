-- ȿ�߾�
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

COMMENT ON COLUMN FBOARD.FBOARD_INSERT IS '�ۼ��� ��¥';

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

COMMENT ON COLUMN NBOARD.NBOARD_INSERT IS '�ۼ��� ��¥';

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

-- ����
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

COMMENT ON COLUMN IBOARD.IBOARD_INSERT IS '�ۼ��� ��¥';

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

-- ������
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

COMMENT ON COLUMN CBOARD.CBOARD_TITLE IS '������';
COMMENT ON COLUMN CBOARD.CBOARD_CONTENT IS '�۳���';
COMMENT ON COLUMN CBOARD.CBOARD_WRITER IS '����';
COMMENT ON COLUMN CBOARD.CBOARD_INSERT IS '�ۼ��� ��¥';
COMMENT ON COLUMN CBOARD.CBOARD_UPDATE IS '���ۼ�';
COMMENT ON COLUMN CBOARD.CBOARD_DELETE IS '�ۻ���';
COMMENT ON COLUMN CBOARD.CBOARD_VIEWS IS '��ȸ��';

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

-- �ο���
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

COMMENT ON COLUMN RECRUITMENT.RECRUITMENT_INSERT IS '�ۼ��� ��¥';

INSERT INTO RECRUITMENT (RECRUITMENT_NO, RECRUITMENT_TITLE, RECRUITMENT_CONTENT, RECRUITMENT_WRITER, RECRUITMENT_START, RECRUITMENT_END, RECRUITMENT_LOCATION, RECRUITMENT_INTRO)
VALUES(SEQ_RECRUITMENT.NEXTVAL, 'Code Buddy','[�Ұ�] ������ ���� ���� ���� ����Ʈ�� �����Ϸ��� �մϴ�. 1. ������Ʈ�� ���� ���� �������� ������ν� �ֺ��� �����ڰ� ���� ��������Ʈ�� �����ϱ� ��ƴٴ� ���� �����ϰԵǾ����ϴ�.  ������ ���ϴ� ������Ʈ�� ���ϴ� ���������� ������ �����Ҽ��ֽ��ϴ�.  �̻���Ʈ�� �������ڳ� ������ ���ϱ� ����� ������� ������� �մϴ�. 2.ȸ�� ����/���� ��� ȸ�Ǵ� ä���� ���� ����Ǹ� ���������� �������� ��ҵ� ä���� ���� �������ϴ�. * ���� �ϰ������ �е��� ���� ���ϰ� �������ּ���!* ',2,'2023-12-01','2024-1-20','����Ư����','������ ���� ���� ���� ����Ʈ �Դϴ�.');
INSERT INTO RECRUITMENT (RECRUITMENT_NO, RECRUITMENT_TITLE, RECRUITMENT_CONTENT, RECRUITMENT_WRITER, RECRUITMENT_START, RECRUITMENT_END, RECRUITMENT_LOCATION, RECRUITMENT_INTRO)
VALUES(SEQ_RECRUITMENT.NEXTVAL,'�ϴ��� ������ ����' ,'���� ��õǾ� �ִ� ���� �����þ۵��� ���� ȸ���� Ÿ������ ����������ϴ�
��� �̼��� �ܸ�� ����� �߽����� �����ְ� ������ ��Ī��Ű�µ����� �����ϴٺ���
������ ���� ȸ������ ��Ż���� �þ�� ������ �ұ����� ���������ϴ�
���� ������Ʈ�� �� �κ��� �ذ��غ��ڿ��� ���۵Ǿ����ϴ�
������ȹ�ڰ� ���� ����� ������ ���� �������� ���������� ����ȸ���� ���� ���Խ���
����ȸ���� ����ȸ������ ����ȯ�� �����ϰ��� �մϴ�
�⺻���� ��Ī��ɰ� Ǫ�� �˸�, ���� �� �ʼ� ����� �����մϴ�(ä�� ����� �����ϴ�)
ȸ������, ������ ��������, ���������� �� 30������ ������ ȭ������ �����Ǿ� �ֽ��ϴ�
20-30�� �ַγ����� Ÿ������ �� 1:1 ��Ī �����Դϴ�.',3,'23-11-09', '24-05-09','����Ư����','20-30�� �ַγ����� Ÿ������ �� 1:1 ��Ī �����Դϴ�');

INSERT INTO RECRUITMENT (RECRUITMENT_NO, RECRUITMENT_TITLE, RECRUITMENT_CONTENT, RECRUITMENT_WRITER, RECRUITMENT_START, RECRUITMENT_END, RECRUITMENT_LOCATION, RECRUITMENT_INTRO)
VALUES(SEQ_RECRUITMENT.NEXTVAL, '���� ť������ ����','�ȳ��ϼ���

��� ���� ���� ����ϴ� ���� ť������ ���� ������Ʈ����Ʈ�� ��ȹ���Դϴ�.

������ �������� ���� ����Ͻó���?

����غ��� �е��� ������ �� �����ٵ���

������ �����̱⿡ ���� ����� UI�� ������, �������� �巯���� ���� �о��Դϴ�.

�� �� MAU�� 200�� ���� �Ѵ� ���� ������ ���� �÷���Ʈ�� ���� ���Ḧ �߽��ϴ�.

10�� �̻� ��Ǿ���, ���� ���������� ������ٵ� �� ���������?

���� ���� �Ǵ��� ���� ������, ����Ͻ� �� ������ ������� �����̶� �����մϴ�.

���������� �� BM�� �ַ� ���� ����Ե��� ������ ������� B2B �𵨿� �ش��մϴ�.

���� ����Ե��� ���忡�� ���� ���̶� �ϳ��� �÷����� ���ѵ� ���� ���񽺸� ���� ���������� �����Ͻ��� ���������� �����մϴ�.

�̿� ���� ������ ��������

1. ��� �ϸ� ���������� �������� �� �� ������?

2. ����Ͻ� ���� �ٰ�ȭ�ϰų� ������ B2B ���� ���� ���ټ��� ��� ������ �� ������?

�� ���� ���� ����ϴ� �ð��� ������, ������ ���߱��� ���� �Ǿ����ϴ�.

����� ���̾�������, ��ɸ�, �����α��� �Ϸ�� �����̸� ����Ʈ ����Ƽ�긦 ���� ����Ʈ �۾��� ���� ���̸�, �鿣�� DB ���迡 �� �ʱ� �����Դϴ�.

�ִ��� ����� ��� ���� �ð��� �ٿ�, ���� 2������ ��Ÿ ���� ��ø� �����ϰ� �ֽ��ϴ�.

������ ���� ť������ ���񽺿� �ٸ� ������� 1���� �������� ������ �� �ִ� ����� ���񽺸� ����� �ֽ��ϴ�.

���� ���ϸ� ���� �Ұ��� �����̶�� �����Ͻø� �����ϴ�.',3,'23.12.07', '24.06.07','��⵵', '���� �Ұ��� ����');
INSERT INTO RECRUITMENT (RECRUITMENT_NO, RECRUITMENT_TITLE, RECRUITMENT_CONTENT, RECRUITMENT_WRITER, RECRUITMENT_START, RECRUITMENT_END, RECRUITMENT_LOCATION, RECRUITMENT_INTRO)
VALUES(SEQ_RECRUITMENT.NEXTVAL, 'Ŀ��/ģ���� ���� �߾� ������ϼ���','�ȳ��ϼ���, �������� Ŀ�� �Ǵ� ģ������ ���ο� ���� ���� �� �˾ư� �� �ִ� ������� ���񽺸� �����ϰ� ������ ��ϰ��� �մϴ�.
���ָ� �ϴٺ��� ���� ������ ���ϱ� ���� ���� �ְ�, �ٻ� �ϻ� ġ�� ����� �Բ� �ߴ� ��� �߾��� �����ϰ� ����ϱ� ���� ���� �ֽ��ϴ�.
�̷��� �κ��� �ذ��ϱ� ���� ����� �߾��� ������ �� �ִ� ������ ��ȹ�ϰ� �Ǿ����ϴ�.
�̹ۿ���, ���� �Ӹ� �ƴ϶� ģ������� �߾� ���� �������� �� ���̶�� �����մϴ�.
�׷��⿡ �� ���ư� ģ������� �߾��� �����ϰ� ����� �� �ִ� ȯ���� ����� ���� ���� ��ǥ�� ������Ʈ�� �����ϰ� �Ǿ����ϴ�!',4,'23-12-11','24-06-11','��⵵','Ŀ�� �Ǵ� ģ������ ���ο� ���� ���� �� �˾ư� �� �ִ� ������� ����');
INSERT INTO RECRUITMENT (RECRUITMENT_NO, RECRUITMENT_TITLE, RECRUITMENT_CONTENT, RECRUITMENT_WRITER, RECRUITMENT_START, RECRUITMENT_END, RECRUITMENT_LOCATION, RECRUITMENT_INTRO)
VALUES(SEQ_RECRUITMENT.NEXTVAL, '�������� �丮�Ǵ� ai �����ϱ� ��','�ȳ��ϼ���.

�� ����ī���Դϴ�.

�������� �������� �丮�Ǵ� �׳��� ai ���� �ϱ⡱ ���� ��Ī�� ��ǥ�� �ϰ� �ֽ��ϴ�.

���� �� ���﹮ȭ��� �ְ��� �����÷���â�� 1��, 2���� ����Ͽ�

�ݹ� 11�� �佺Ÿ���� ���� ����Ͽ����ϴ�. (*��� -> �ʱ� �ں� Ȯ��)

���� ���� ��ȹ��, �۰, ������(����Ʈ), ������(����)�� �����Ǿ� �ֽ��ϴ�.

�������� �� ������ �յΰ� �־�, �����̳� / �Ϸ���Ʈ������ ���� �����ϰ��� �մϴ�.

�������� ���񽺸� ��Ī�� ��, ��ŸƮ���� ���·� ��������� �Բ� �����س��� ���� ��ð��� �մϴ�.',5,'23.11.28', '24.05.28','����Ư����', '������ �������� �丮�Ǵ� �׳��� ai ���� �ϱ�');

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

-- ���ƾ�
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

COMMENT ON COLUMN HBOARD.HBOARD_INSERT IS '�ۼ��� ��¥';

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'NHN KCP JAVA �鿣�� �������� ����', 'NHN KCP, � ���ΰ���?
NHN KCP�� ���ڰ������� ����, �¡��������� ī�� VAN ����, ����� ���� ���� �� ���� ������ ���հ��� ���� ������ ���Ͽ�
���ڰ��� ����� ���� ���۴϶�� �ںν� �ӿ� �����ϰ� ���� ������ �����ϱ� ���� ����ϰ� �ֽ��ϴ�.

�̿� �� ���ư� NHN KCP�� ���� �¡����������� ������ O2O ���� �ý��� ���� �� �۷ι� ���ڻ�ŷ� ����� ���� �޺��ϴ� ���ڰ��� ���忡 ���������� �����԰� ���ÿ� ���ο� �ؿܽ��� ��ô���� �ּ��� ���ϰ� �ֽ��ϴ�.

�ֱ� ���� ���ڰ��� ���忡�� ȭ�η� ������ ������� �о߿�����, NHN KCP�� ö���� ���� �غ�� �������� �ؿ� ������ PG�� ��� ����� ������ �� �� �ִ� �۷ι� ���ڰ��� ��ü�� ������ ���� Ȯ���մϴ�.

"���� ����� �������۴� ������ġ���ѱ����̹������� �Բ� ���� ����� ��ȭ�� ������ ������ �����ִ� ���縦 ��ٸ��ϴ�."

NHN KCP JAVA �鿣�� �������� ����, � ���� �ϳ���?
NHN KCP ���񽺰����� JAVA �鿣�� �������� ���� ä������Դϴ�.', 3, TO_DATE('12-20-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('05-30-2024 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), 50000000, 'none', 'middle', '08393');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'Java���� ����', '�ζ�����, � ���ΰ���?
�츮�� IT �÷��� ������μ� �������� ���� �÷����� ����� ���� ����մϴ�. ���� ������ ��Ÿ���� ���� �÷��� �����¡�, ������ �������� ���� ���� ����� �����ս� ���� �÷��� ���ֵ��Ƽ����, �̷��� ���ٺ��� ������ ������ AI ����� ��ȯ���� Ŀ���͸���¡�� ������ �ΰ����� ê�� �����̺���, ä���� ���� SNS�� Ŀ�´�Ƽ ����� ��� ���� ������ ���� �޽��� ��ķ����. ������ ��� �̸� ������ ������ ���� ���񽺸� �����ϰ� �ֽ��ϴ�.

2012�� ��Ÿ���� ���� �÷��� ����� �����Ͽ� �������� �������(�ΰ�����, ������)�� �������� ���� 1���� �����Ͽ����ϴ�. �ΰ����� ���� ���߿� 3�Ⱓ �����Ͽ� �ڿ��� ó���� Ưȭ�� AI���� ��LUCY���� 2019�� 1���� ���� KorQuAD ��ȸ���� ���̹�, LG ���� ������ ��ġ��1���� ������ �츮 ����� ���ɼ��� ��������ϴ�. ��ü �η��� ���� ���� �η��� ������ ��� ��ȭ�� �����ϰ� �ְ�, �۷ι� ������ ������� Ȯ���ϱ� ���� ����� ����� R and D�� ��� �ֽ��ϴ�.

�ְ� ȿ���� AD Tech, ������ ���� �� �м�, Block chain�� �̿��� ������ ���� �� ������ ���� ���� ����� B2C ����� ��ϰ� ������, ��ü AI ���� ���߷� �� ������ ������ Ȯ���Ͽ�, ���� AI ���°� ������ ��ǥ�� �ϰ� �ֽ��ϴ�.

�� ȸ�� Ȩ������ : http://www.enliple.com/
�� �ζ����� �Ұ� : https://sheer-aura-848.notion.site/Will-U-Join-ENLIPLE-9fc703171a4b4e54819463a4cb38113b
�� �ζ����� ��α� : https://blog.naver.com/enliple_blog
�� �������� ȸ���� ���� : https://blog.naver.com/enliple_blog/222203763903

Java���� ����, � ���� �ϳ���?
Java ���� ����', 2, TO_DATE('12-02-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('02-14-2024 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), 72000000, 'none', 'senior', '08389');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, '[����] Business Development Lead', '�극�̺����� (����), � ���ΰ���?
1,000���� ������ ������ ��Ȱ �ַ��, ����

������ ���� �츮�� �ϻ� ���ǹ��� ��ȭ�� �Բ� ���� ����� ã���ϴ�.

����� ������ �����Ͽ� ������ ��ġ�� ��ȯ�ϴ� �����÷��̽��Դϴ�. 2022���� �������� ����� �� 1,000�� �̻��� ī�װ����� 900�� ���� ���� 100�� ���� ����� ��, ���� �ŷ��� �� 6,000����� ���ϴ� ��ġ ��ȯ�� ������ ���°谡 �Ǿ����ϴ�.

������ ���� ���� �� �ִ� �� 126�� �� �Ը��� ������ ���忡 ���Ѵٸ� ������ ������ ���� ���� �ܰ迡 �Ұ��մϴ�. �츮�� ���� �ȿ��� ���ݺ��� �ξ� ���� ������ ������� �� �ֵ��� ���°踦 Ű�������� �ֽ��ϴ�. �ѹ��� ������ ���� ������ ������ ��ô�ϰ� �츮 �տ� �ٰ��� �Ŵ��� ��ȸ�� �Բ� ������ �밨�� ����� ��ٸ��ϴ�.

? �츮�� [ ]�մϴ�
? ���� ���°��� ��ġ�� ������ �����մϴ�
? ������ ������ �����ϰ� �ذ��ϴ� ������ ������ �����մϴ�
? �ڽ��� ���� �Ͽ� ���� ���ζ�� ���������� �����ϴ�
? ���̿� ���, ������ ������� ��ΰ� �����Ӱ� �����ϰ� �ǻ�����մϴ�
? �ܼ��� ���̵����� �߿��� �������� ��� �������� �����͸� ������� �����մϴ�
? ������ ��ǰ�� ���� ū ����Ʈ�� �� �� �ִ� ����� ����մϴ�

? �츮�� ���� ����
2023. 03: ���� ������ �� 1,000�� ����
2022. 06: ���� ������ 6,000�� �� ����
2022. 01: ù TVC ��Ī
2021. 11: ����Ʈ���ѹα���� ����
2021. 07: 320��� �Ը� �ø��� C ��ġ
2021. 02: ���ٷ� ������ ��Ī ���� ���
2020. 12: �޸���ũ���������� ����', 4, TO_DATE('11-08-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('12-08-2023 00:00:00','MM-DD-YYYY HH24:MI:SS'), 64000000, 'none', 'none', '06160');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, '[����Ʈ�ù�] ����Ʈ��ĿCIC_������ ��� ä��', '[����Ʈ�ù�] ����Ʈ��ĿCIC_������ ��� ä��, � ���� �ϳ���?
[����Ʈ�ù�] ����Ʈ��ĿCIC_������ ��� ä��

�ֿ����
? Public Cloud(AWS, KT) ���� �����
? On-Premise ���� �����
? �������(��ȭ��/IPS/VPN) �����

�ڰݿ��
? �з� : �з¹���
? ��� : 2��~ 8��
? ������� � ������
? Cloud ���� � ������
? ������ � ������

������
? H/W, S/W ���Ȱ��� ������ ���
? ����������ȣ ���Ȱ��� ������ ���
? ������� Ŀ�´����̼� ������ ��ſ�ź�

���� �� ����
4�뺸��/��������/�ǰ���������/�����ް�/���������ɽð�1�ð�30��/��1ȸ3�ð� �������/����ŰƮ/�系��ȣȸ/ī���׸���/����̳����缱��/����������/����Ʈ���/���ټ��ް�����/������ǰ������/����������/���ֱݿ��Ͻ�����������/��������������/�������ٷκ�������/', 5, TO_DATE('12-13-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('03-15-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 90000000, 'university', 'middle', '08502');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'React Native ������ (��� 1�� �̻�)', '�ֿ����
- TypeScript, React Native �� ������� Android / iOS ���ø����̼��� �����ϰ� �����մϴ�.
- ����� ���� �÷��̾�, OAuth �� ����� �� ���񽺿� �ʿ��� ��ɵ��� ����, ���� �մϴ�.
- ��Ȳ�� �°� ������ ���·� ����Ƽ�� ������ ���� ������ ���� �����մϴ�.
- �ý��� ������ ���� ����ȭ�� ���� API ȣ�� �ּ�ȭ / ������ ����ȭ / ���鸵 ����ȭ ���� ��÷� �����մϴ�.
- DataDog, Sentry ���� APM�� ���� ����� ����̽����� �߻��ϴ� ������ ���ؼ� �����ϰ� �ذ��մϴ�.
- Figma�� ���� �����̳ʿ� �Բ� ����ڸ� ���� UI/UX ������ ����ϰ� �����մϴ�.
- Swagger, Codegen ������� �鿣�� �������� �Բ� �����Ϳ� ���� �����մϴ�.
- �� ����Ʈ���� ������Ʈ�� �Բ� ����� ������ ���̺귯�� ���� ����/�����մϴ�.

�ڰݿ��
�Ʒ� �������� �̼ǰ� ��ġ�� �����Ͻô� ���̾�� �մϴ�.
https://tech.inflab.com/20231117-devteam-value/

- JavaScript, TypeScript �� ���� ���ذ� ������ ��
- React Native ��� ������ �ִ� ��
- Android/iOS �پ��� ȯ��� ����̽��� ������ UI/UX�� �������� ���ظ� ���� ��
- CodePush ���� �̿��� ȿ������ ���� ���� ������ �ִ� ��
- HTTP ��ſ� ���� �⺻���� ���ذ� ������ ��
- Git�� Github�� ���� �⺻���� ������ �˰� �ְ�, Rebase, Merge, Squash �� ���� �����ϰ� ��� ��', 6, TO_DATE('12-11-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('01-25-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 120000000, 'none', 'junior', '13494');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'AI, ML Engineer �ڻ��', '<h2 class="css-17h254d" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, '|| CHR(038)||'quot;Helvetica Neue'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Segoe UI'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Apple SD Gothic Neo'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Noto Sans KR'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Malgun Gothic'|| CHR(038)||'quot;, sans-serif; font-size: 20px; font-weight: bold; font-stretch: normal; line-height: 1.4; letter-spacing: -0.3px; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(33, 37, 42); text-align: start;">�ֽ�ȸ�� �ø���, � ���ΰ���?</h2><p style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, '|| CHR(038)||'quot;Helvetica Neue'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Segoe UI'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Apple SD Gothic Neo'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Noto Sans KR'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Malgun Gothic'|| CHR(038)||'quot;, sans-serif; font-size: 20px; font-weight: bold; font-stretch: normal; line-height: 1.4; letter-spacing: -0.3px; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(33, 37, 42); text-align: start;"><img src="resources\file_upload\hboard\content\65cf0be1-163c-43bb-89c9-a6e662bbbdb3_6l29t_z_gjiRjF6HdsuJm.png" style="width: 384px;"><br></p><p class="css-19hzmb1" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, '|| CHR(038)||'quot;Helvetica Neue'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Segoe UI'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Apple SD Gothic Neo'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Noto Sans KR'|| CHR(038)||'quot;, '|| CHR(038)||'quot;Malgun Gothic'|| CHR(038)||'quot;, sans-serif; font-stretch: normal; line-height: 1.63; white-space-collapse: preserve-breaks; text-align: start; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 37, 42);">�ø���� ������ �۷ι� IT ������ �Բ� ��� �庮 ���� ���踦 ����� ���� �ִ� ��� �÷��� ����Դϴ�.

��ü ������ ������ �ø��� AI������ 1,000�� �� �̻��� �۷ι� ������ ���� �����ϴ� �ø��� �������� ����,
�׸��� ��� �ɷ��� Ȱ���� ���� �����带 ���� �� �ִ� �ø��� �����̵�(Arcade) ���񽺸� �����ϰ� ������,
�� �ܿ��� ��� �庮�� ���� ���� ���� ��ġ�ִ� �ű� ���񽺵��� ���Ӿ��� �����ϰ� �ֽ��ϴ�.

��ó�� �پ��� ���񽺸� ���� Ȯ���� ���� �ڿ������� ��Ȯ�� ��� �����͸� �۷ι� IT ����� AI �н� �����ͷ� �����ϰ� ������,
���� ������ �Ը�� ������ ��� ������ ���忡�� �ѱ� ��ǥ ������μ��� ������ �������� �ֽ��ϴ�.

����� �庮�� �پ�Ѵ� ������ ��� ������ ���� ��� �ø��信��
�Բ� �����ϱ� ���� ��ſ� ������ �շ��Ͻ� ���� �е��� ������ ��ٸ��ϴ�.</p>', 7, TO_DATE('12-15-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('02-03-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 120000000, 'none', 'junior', '06173');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'DevOps �����Ͼ�', '<div class="css-1dcto04" style="width: 722px; display: flex; flex-direction: row; -webkit-box-pack: start; justify-content: start; -webkit-box-align: center; align-items: center; gap: 0rem; margin: 0px 0px 8px; color: rgb(33, 37, 42); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" color="" emoji",="" ui="" symbol",="" sans-serif;="" font-size:="" 15px;="" text-align:="" start;"=""><h3 class="css-l8sxp3" style="box-sizing: border-box; font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" sans-serif;="" font-size:="" 16px;="" font-stretch:="" normal;="" font-style:="" line-height:="" 1.38;="" letter-spacing:="" font-weight:="" bold;="" white-space:="" pre-line;="" word-break:="" break-all;="" margin:="" 0px;"=""><br></h3><h3 class="css-l8sxp3" style="box-sizing: border-box; font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" sans-serif;="" font-size:="" 16px;="" font-stretch:="" normal;="" font-style:="" line-height:="" 1.38;="" letter-spacing:="" font-weight:="" bold;="" white-space:="" pre-line;="" word-break:="" break-all;="" margin:="" 0px;"=""><div class="css-1dcto04" style="width: 722px; display: flex; flex-direction: row; -webkit-box-pack: start; justify-content: start; -webkit-box-align: center; align-items: center; gap: 0rem; margin: 0px 0px 8px; font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" color="" emoji",="" ui="" symbol",="" sans-serif;="" font-size:="" 15px;="" font-weight:="" 400;="" white-space-collapse:="" collapse;"=""></div><p class="css-19hzmb1" style="font-stretch: normal; line-height: 1.63; font-weight: 400; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">�ڰݿ��</p><p class="css-19hzmb1" style="font-stretch: normal; line-height: 1.63; font-weight: 400; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">? ��ǻ�� ���� �Ǵ� ���� �о��� �л� ����
? DevOps �о߿��� 2�� �̻��� ����
? ��Ʈ��ũ�� ���� ���� ����
? AWS, Container, Kubernetes �� Ŭ���� ������ ���ݿ� ���� �߰��� ����
? Terraform IaC(Infrastructure as Code) ���� �� ���� ����
? Jenkins, Ansible �� Chef�� ���� �ڵ�ȭ ������ ���� ����
? �پ ���� �ذ� �� ���� �ذ� ���
? �پ �ǻ� ���� �� ����ũ ���</p><p class="css-19hzmb1" style="font-stretch: normal; line-height: 1.63; font-weight: 400; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;"><br></p><p class="css-19hzmb1" style="font-stretch: normal; line-height: 1.63; font-weight: 400; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;"><a href="https://www.rallit.com/positions/1642/devops-%EC%97%94%EC%A7%80%EB%8B%88%EC%96%B4" target="_blank">�����ϱ�</a><br></p></h3></div>', 8, TO_DATE('12-14-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('02-14-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 62000000, 'none', 'none', '05551');

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