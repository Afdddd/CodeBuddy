SET DEFINE OFF;

// only drop
DROP TABLE RECRUITMENT_STATE;
DROP TABLE CHAT_MEMBER;
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
DROP TABLE RECRUITMENT_ATTACHMENT;
DROP TABLE RECRUITMENT_REPLY;
DROP TABLE RECRUITMENT_WISHLIST;
DROP TABLE RECRUITMENT;
DROP TABLE AUTH;
DROP TABLE MEMBER;

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

INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'admin', '$2a$10$x30BjSzHW9D8hEjGewA.oOgTSBo0qFx/i.W4rIaOhkvUSNXoqHxsG', 'admin@coddy.com', '������');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user01', '$2a$10$3tjfQjhaYjPtMf5GQC8qRez3qy2iKR0Z6AHwx3DhSdnc4uf1ZyBHC', 'user01@naver.com', '���ο�');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user02', '$2a$10$CeHfaUCsK4.YK9261b2nn.WqK/SgNN9Z0PgvWveI7c8c4LpGdCvGW', 'user02@naver.com', '��ȿ��');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user03', '$2a$10$h8gKprXaq6aHF4ryqz2.p.zg6LpKl2JCkO99ELOH0UsfqjDht4W6y', 'user03@naver.com', '������');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user04', '$2a$10$6Sv7r/TkS80tSeo1iH/y9ehY1EvJ1/Vvyawb.m1HmrZweFoF/L64O', 'user04@naver.com', '������');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user05', '$2a$10$ImZfEPLwMvb8mrUjFzqUxeePihnpZKWD5lcydH5/W0puXJ1veNxzC', 'user05@naver.com', '�ѿ���');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user06', '$2a$10$BRgq1.9QK.idrJmRZQtjce9aOY2.Kj8m4xA8zdVcBOtXe0wih6SG2', 'user06@naver.com', '������');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user07', '$2a$10$YaeQ9UQIxZ5v971NMgtsL.bCq42doYajlajErtywGAK0hHIve9t9C', 'user07@naver.com', '������');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user08', '$2a$10$Aucw5mYVqvLqkcvvamJYA.ofjBn9IauzPUix5V3e4FBRyCl4BXZaK', 'user08@naver.com', '�質��');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user09', '$2a$10$CCFZG2eik3vIaoxWkMhK.eCctqYgC8e2vurGAdN7QFUOLe.TEdZui', 'user09@naver.com', '����');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user10', '$2a$10$m3xVzCzOucbLcBk3o.INxe4QHGYTl0P.q./wy.H5GeJpjlWRiXy8.', 'user10@naver.com', '�հ���');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user11', '$2a$10$Qwjb36lA/SFAlKpc8z/.zuPGx2JFAk5CMQ4BcuO4jKGRrk1NvMZWu', 'user11@naver.com', '������');
INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, 'user12', '$2a$10$ZQGPfZoZY519KvFzxEIho.7zGyp3HxMVmwuR9fqqPkgR9QKgbxG2K', 'user12@naver.com', '���ؼ�');

COMMIT;

CREATE TABLE AUTH (
	AUTH_INSERT	DATE DEFAULT SYSDATE NOT NULL,
	AUTH_VALUE VARCHAR2(80) NOT NULL,
	AUTH_EMAIl VARCHAR2(120) NOT NULL
);

COMMIT;

-- �ο���
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

Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'���� ť������ ����','������ �������� ���� ����Ͻó���?<br>
<br>
����غ��� �е��� ������ �� �����ٵ���<br>
<br>
������ �����̱⿡ ���� ����� UI�� ������, �������� �巯���� ���� �о��Դϴ�.<br>
<br>
�� �� MAU�� 200�� ���� �Ѵ� ���� ������ ���� �÷���Ʈ�� ���� ���Ḧ �߽��ϴ�.<br>
<br>
10�� �̻� ��Ǿ���, ���� ���������� ������ٵ� �� ���������?<br>
<br>
���� ���� �Ǵ��� ���� ������, ����Ͻ� �� ������ ������� �����̶� �����մϴ�.<br>
<br>
���������� �� BM�� �ַ� ���� ����Ե��� ������ ������� B2B �𵨿� �ش��մϴ�.<br>
<br>
���� ����Ե��� ���忡�� ���� ���̶� �ϳ��� �÷����� ���ѵ� ���� ���񽺸� ���� ���������� �����Ͻ��� ���������� �����մϴ�.<br>
<br>
�̿� ���� ������ ��������<br>
<br>
1. ��� �ϸ� ���������� �������� �� �� ������?<br>
<br>
2. ����Ͻ� ���� �ٰ�ȭ�ϰų� ������ B2B ���� ���� ���ټ��� ��� ������ �� ������?<br>
<br>
�� ���� ���� ����ϴ� �ð��� ������, ������ ���߱��� ���� �Ǿ����ϴ�.<br>
<br>
����� ���̾�������, ��ɸ�, �����α��� �Ϸ�� �����̸� ����Ʈ ����Ƽ�긦 ���� ����Ʈ �۾��� ���� ���̸�, �鿣�� DB ���迡 �� �ʱ� �����Դϴ�.<br>
<br>
�ִ��� ����� ��� ���� �ð��� �ٿ�, ���� 2������ ��Ÿ ���� ��ø� �����ϰ� �ֽ��ϴ�.<br>
<br>
������ ���� ť������ ���񽺿� �ٸ� ������� 1���� �������� ������ �� �ִ� ����� ���񽺸� ����� �ֽ��ϴ�.<br>
<br>
���� ���ϸ� ���� �Ұ��� �����̶�� �����Ͻø� �����ϴ�.<br>
<br>
 
<br>
<br>
�����: ����, ����, �ν�Ÿ�� ���� 10~20�� ������<br>
<br>
��: (�ű� ������) ������, ī�並 ��ϴ� �����',11,to_date('23/12/20','RR/MM/DD'),null,null,10,to_date('23/12/20','RR/MM/DD'),to_date('24/01/26','RR/MM/DD'),'����Ư����','��� ���� ���� ����ϴ� ���� ť������ ����');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'�������³�,���̺��³�','����� �󸶳� ����� �� �˰� ��Ű���?���� ���� ��, ���� ���� ���� ������ ���� ���� ���� ���� ����� Ÿ���� ���� ���� ����� �Ʒ��� ���� ���� �� �ִ� �����Դϴ�.',2,to_date('23/12/20','RR/MM/DD'),null,null,6,to_date('23/12/13','RR/MM/DD'),to_date('23/12/22','RR/MM/DD'),'����ϵ�','����� �󸶳� ����� �� �˰� ��Ű���?');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'��Ż�� MBTI �׽�Ʈ','��̷� ��Ż���� �ٴϴ� ������ �Բ� ������ ��Ż�� MBTI �׽�Ʈ�� ���µ� �Ͽ� ����� �Ǿ���, �׽�Ʈ ���� �������縦 �����鼭 �����ڵ鿡�� NFT�� �������ϰ��� �մϴ�.',3,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/12','RR/MM/DD'),to_date('23/12/21','RR/MM/DD'),'��󳲵�','��Ż�� MBTI �׽�Ʈ�� ������� �մϴ�!');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'��ī��','�ڷγ��� ���� �츮�� �˴� ������ �������� ���� 2���� �Ѿ����ϴ�. ������ ���� �ӿ��� �츮�� �Ÿ��α⸦ �����ؾ� �߰�, �������� ��������� �����������ϴ�.',3,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/12','RR/MM/DD'),to_date('23/12/29','RR/MM/DD'),'����ϵ�','�ڷγ��� ���� �츮�� �˴� ������ �������� ���� 2���� �Ѿ����ϴ�. ');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'�ｺ�ɾ� ����ũ','1. ������Ʈ�� ���� ����<br>
 <br>

�ѽõ� ������ �ʰ� ����Ʈ���� ����ϴ� �����ε��� �������� ������, �ٷ� �źϸ��Դϴ�.<br>
<br>
�̸� �ذ��ϱ� ���� �ǽð����� ����Ʈ�� ��� �ڼ��� üũ�Ͽ� ���� �ڼ��� ����Ʈ���� ����ϸ� �������� ������ �����Ͽ� �ùٸ� �ڼ��� �����մϴ�.<br>

 

õ���Ϸ����� ������/�̼Ǽ��� ������ ����ũ ���񽺿� �ٸ� �Ű��� �ｺ�ɾ� ����ũ ����<br>
<br>
������ ����Ʈ�� ��� �ڼ� �����͸� �����Ͽ� �����ܰ� � �����Ͽ� ���� �Ƿ� ���񽺿� ������ �� �� �ִ� ��ǥ�� Ȱ���մϴ�.<br>
<br>
(���� ���������� ���� �ڼ������� ������ȭ)

����Ʈ���� ����ϴ� �������� ������� �մϴ�.<br>

 <br>

2. ȸ�� ����/���� ��� <br>
 <br>

- 1���Ͽ� 1�� �¶��� ȸ�� ���� (�� �̽��� ������ �н�) , �б⺰ 1ȸ �������� ���� ���� (����)<br>
<br>
- �¶����� ���ڵ带 �ַ� Ȱ���ϰ� , ���������� �ַ� ������ ��ó���� �����մϴ�.<br>

 <br>

 <br>

3. �׿�<br>
�ȳ��ϼ���.<br>

���� �ｺ�ɾ� ����ũ�� �������� ���̿���Ƽ�Դϴ�.<br>

���������δ� ��ȹ 1 / �۰��� 1 / ���� 1 �� 3������ �����Ǿ� �ְ�<br>

���� �������� �ȵ���̵� ���� �ּҴ� �Ʒ��� �����ϴ�.<br>',12,to_date('23/12/20','RR/MM/DD'),null,null,1,to_date('23/12/20','RR/MM/DD'),to_date('24/02/26','RR/MM/DD'),'����Ư����','�ｺ�ɾ� ����ũ UI/UX ��ȭ');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'����ţ','�׻� �ݿ��� ���������� �����ϴ� �츮���� ���� ���� �����Դϴ�. ���� �ݿ��� ���� �󸶳� ū �������� ȿ���� ������� Ȯ���ϸ� ��ǥ�� �޼��ϼ���!',3,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/27','RR/MM/DD'),to_date('24/01/17','RR/MM/DD'),'������','�׻� �ݿ��� ���������� �����ϴ� �츮���� ���� ���� �����Դϴ�.');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'Zzz','�ų� �Ҹ������� ����ϴ� ������� �����ϰ� �ְ�, Ư�� �ڷγ��� ���� ���� �� �ɸ����� ����� �Ҿ����� ���� ������� ���� ��ָ� �ް� �ֽ��ϴ�. ����� �̷� ������� �޴� ������� ���� ������ �� �� �ִ� ASMR�� �����ϰ�׳��� ���� ����� ���� �� �ִ� �����Դϴ�.',3,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/06','RR/MM/DD'),to_date('23/12/15','RR/MM/DD'),'������',' ASMR�� �����ϰ�׳��� ���� ����� ���� �� �ִ� �����Դϴ�.');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'�뵿������ [��� ���� ��� ����!]','�츮�� 500�� ������ �����̵��� ����ϴ� ���ѹα� 1�� ������ ���񽺸� ����� ���̿���!<br>
<br>
���̵� ������Ʈ�� �����ϰ� ������, 2021 12�� 2�� 1�� ��� �� ���� �������Ͽ� 2023.4�� �� Ios, 5�� �� �ȵ���̵� ���� ����߾��.<br>
<br>
�뵿�������� �Բ� ����ڸ� ������, �����̵�� ����Բ� ��ü�Ұ����� ���񽺸� ����� ����ȭ�� �̲� �����Դϴ�.<br>
<br>
1���� �&���������� 2���� ��ǰ���� ��ϰ��־��! �ٸ� ����Ʈ ������Ʈ������ ������ �� ���� �پ��� ������ ������, ���ȭ�� ��ǥ�� ����ִ� ������� �Ͻ� �� �ֽ��ϴ�.<br>
<br>
�Բ� �����ϽǺ�!! �������Դϴ�~~~!!<br>
<br>
?���� ����° ������Ʈ�� �غ����Դϴ�.<br>
�Բ� ����ڸ� �ø� ���ο� ��ɵ��� �����ϰ�, �뵿������ ���� �Բ� ���� �������� �����մϴ�!<br>
?��� ���� �ڰ� ���<br>
1. ��� 2�� �̻� (Ȥ�� �׿� ���ϴ� �Ƿ�)<br>
<br>
- ���� ���ػ� �е��̳� ����� ������ �е��� ���ø� ����, �����ںе� ��� ���� ��Ȳ�� �˴ϴ�.<br>
<br>
2. �̷��� ���ȭ�� ����â���� ���� ����ó�� PMF�� ã�ư��Ǻ�<br>
<br>
- ������ �Ƿ������ �ƴ�, ���δ�Ʈ�� ������ ���� �Բ� �پ��� ���̵� ���� ������ �� �־���ؿ�<br>
<br>
- �ʱ� ���δ�Ʈ�̱⿡ �پ��� ������ �����, ����� ����� �����ϴ� ���� ������ �䱸�Ǵ� ��Ȳ�Դϴ�.<br>
<br>
3.���̵� ������Ʈ������, ���ʽ��� ������ �Բ� �� �ɹ�<br>
<br>
- �����ڰ� �ƴ�, ���δ�Ʈ�� ���ʽ��� ���� �� �ִ� �е��� �ʿ��ؿ�.<br>
<br>
- Ŀ�´����̼�(���� ��)�� ��Ȱ���� ���� �е��� ������ ��ƽ��ϴ�. (���� ��⸦ �����ϴ�.)<br>',12,to_date('23/12/20','RR/MM/DD'),null,null,2,to_date('23/12/20','RR/MM/DD'),to_date('24/01/23','RR/MM/DD'),'����Ư����','���ѹα� 1�� ������ ���񽺸� ����� ���̿���!');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'���ķ�ŷ','���� �̿��ϴ� ����Ʈ���� �ű�, �α� ���µ��� ��Ƽ� �����ִ� ����Ʈ�Դϴ�. ��ŷ�� ��ȭ�ϴ� �� �ִϸ��̼����� �����ִ°� ��ǥ�� ��ҽ��ϴ�.',3,to_date('23/12/20','RR/MM/DD'),null,null,1,to_date('23/12/05','RR/MM/DD'),to_date('23/12/15','RR/MM/DD'),'��û�ϵ�','���� �̿��ϴ� ����Ʈ���� �ű�, �α� ���µ��� ��Ƽ� �����ִ� ����Ʈ�Դϴ�.');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'�۷ι� AI Ŀ�´�Ƽ & �����÷��̽�','? �ȳ��ϼ���, �������� ������ ������!<br>
����� ���ο� �̷��� ���� �۷ι� AI Ŀ�´�Ƽ + �����÷��̽�, Nova AI(��Ī) �÷����� �Բ� ����� �� ���Ḧ ã�� �ֽ��ϴ�.<br>
<br>
��? AI�� �̷��� �츮 � �󸶳� ���� ��ȭ�� ������ �ٱ�?�� ��? �������� ��Ը�� ��ȭ�� ��� �ɱ�?�� ��� �������� ����� ���� ������Ʈ��,
<br>
AI ����� �ٰ����� �̷��� ������� � �������̰� �������� ��ȭ�� ������ �� �� �ִٴ� �������� ��ϵǾ����ϴ�.<br>
<br>
���� �����ϴ� �÷����� �ܼ��� �÷����� �Ѿ�, �������� AI ��ǰ/����/�ַ�ǵ��� �Ұ��ϰ� �����ϴ� �۷ι� ���������� �� ���Դϴ�.<br>
<br>
��ġ, AI���� App Store �Ǵ� Steam ó����!<br>
<br>
������ �۰� ���� ���� ó�� ������ ���� ���� �̵��� ��â���̰� â������ AI ��ǰ/����/�ַ�� ���� ���� �ô밡 �� ���̶� �����ϰ�,<br>
<br>
�׵��� ������ ���� ����鿡�� �Ұ��ϰ�, ������� ������ �Ը��� �´� AI ��ǰ/����/�ַ�� ���� ���� �̿��� �� �� �ִ� �÷����� ������� �մϴ�.
<br>
���� MVP ���� ���̸�, MVP�� ��AI Ŀ�´�Ƽ���� ������� AI ���� ����/Į��/��α� ���� ������/������ �� ����ڵ��� �ۼ��Ͽ� ������ �� �ִ� ������ ������ �����Ͽ� ��Ī�ϰ��� �ϸ�, ���� �����÷��̽� ���·� ���׷��̵� �س����� �ε���� ���� ���� �߿� �ֽ��ϴ�.
<br>
������ Ÿ�� ����ڴ� AI�� ������ ���ɼ��� �ϻ󿡼� �����ϰ��� �ϴ� ��� �̵��Դϴ�.
<br>',12,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('24/01/03','RR/MM/DD'),to_date('24/03/20','RR/MM/DD'),'����Ư����','���ο� �̷��� ���� �۷ι� AI Ŀ�´�Ƽ + �����÷��̽�, Nova AI(��Ī) �÷���');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'�ñ׳�','���̹����� ���� Ȯ�� ������ �ǽð� �˻��� �� �ǽð� �޻�� �˻���, �˻��� ����, �αⴺ�� �� ��ĥ �� ���� �ǽð� Ʈ����. ���� ����� �ǽð� �˻���� �αⴺ���� Ȯ���غ�����.',3,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/12','RR/MM/DD'),to_date('23/12/28','RR/MM/DD'),'��󳲵�','���� ����� �ǽð� �˻���� �αⴺ���� Ȯ���غ�����.');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'����','����� �����ѱ���Ʈ ����Ʈ.',3,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/19','RR/MM/DD'),to_date('23/12/31','RR/MM/DD'),'�λ걤����','����� �����ѱ���Ʈ ����Ʈ.');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'�ӿ�����','�ѱ��� UI/UX ����� ������ �����մϴ�.',3,to_date('23/12/20','RR/MM/DD'),null,null,6,to_date('23/12/05','RR/MM/DD'),to_date('23/12/11','RR/MM/DD'),'��󳲵�','�ѱ��� UI/UX ����� ������ �����մϴ�.');
SELECT SEQ_RECRUITMENT.NEXTVAL FROM DUAL;
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'ũ����','�ݸ��� ������ ���ϰ� ��û�� �� �ִ� �δ���� Ŀ�̼� �÷����̿���.',2,to_date('23/12/20','RR/MM/DD'),null,null,7,to_date('23/12/26','RR/MM/DD'),to_date('24/02/20','RR/MM/DD'),'��⵵','�ݸ��� ������ ���ϰ� ��û�� �� �ִ� �δ���� Ŀ�̼� �÷����̿���.');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'����','������ �������� �������� ���� ã�ƺ�����!',2,to_date('23/12/20','RR/MM/DD'),null,null,14,to_date('24/01/22','RR/MM/DD'),to_date('24/01/30','RR/MM/DD'),'������','������ �������� �������� ���� ã�ƺ�����!');
SELECT SEQ_RECRUITMENT.NEXTVAL FROM DUAL;
SELECT SEQ_RECRUITMENT.NEXTVAL FROM DUAL;
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'�������(����) ','����� ������ ������ ����ģ ���󿡼� ������ ž�� ���ʶ߸��� ���� ������ �����ϴ�. ����� �ذ��ϰ�, ��縦 ����ϰ�, �κ��� ������ �������� ���� ������ ������ ������ �մϴ�.',5,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/12','RR/MM/DD'),to_date('23/12/21','RR/MM/DD'),'��󳲵�','������ ���������� �׼Ǽ� ���� ��Ư�� ''�δ� ����''�� �α׶���ũ�� ���յ� �����Դϴ�.');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'�ؼ���','�߿� �ܿ� �ؾ (�׾� ��, Ǯ��, ȣ�� ����)�� �԰� ���� ��

���� ���� ã�� ����ϴ�.

�������� ������ �ؾ������ �¾ �� ~!',5,to_date('23/12/20','RR/MM/DD'),null,null,1,to_date('23/12/01','RR/MM/DD'),to_date('23/12/13','RR/MM/DD'),'���󳲵�','�������� ������ �ؾ������ �¾ �� ~!');

Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'�� Ʈ���� �ٸ���','��Ÿ���̺�� 2021. 11. 21�� ����� ���̵� ������Ʈ ������, 2���� �鿣�� ������, 2���� ����Ʈ���� ������, 2���� �����̳ʰ� �Բ� ������Ʈ�� ������ �־��.',5,to_date('23/12/20','RR/MM/DD'),null,null,2,to_date('23/12/06','RR/MM/DD'),to_date('23/12/14','RR/MM/DD'),'���ϵ�','��Ÿ���̺�� 2021. 11. 21�� ����� ���̵� ������Ʈ ������');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'�Ƕ�','���͵�&��Ʈ��ŷ, ���̵� ������Ʈ ������ ���ϴ� ���� ���� ��� ȥ�� ����� �Խ��ǰ� ���θ���Ʈ�� ���ܿ�Ű���? �Բ� ���̵� ������Ʈ�� ������ ������ ���ϴ��� ��ġ�̳���?',5,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/01','RR/MM/DD'),to_date('24/01/05','RR/MM/DD'),'���󳲵�','���͵�&��Ʈ��ŷ, ���̵� ������Ʈ ������ ���ϴ� ���� ���� ��� ȥ�� ����� �Խ��ǰ� ���θ���Ʈ�� ���ܿ�Ű���? �Բ� ���̵� ������Ʈ�� ������ ������ ���ϴ��� ��ġ�̳���?');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'���Ͽ���','���Ͽ����� ����ڰ� ��ǥ�� �����ذ��� ĳ���Ϳ� �Բ� ������ ������ ''�� �� ���� ��''�Դϴ�',5,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/07','RR/MM/DD'),to_date('23/12/21','RR/MM/DD'),'���󳲵�','���Ͽ����� ����ڰ� ��ǥ�� �����س���');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'ü����','�ο��� �̾�� ���� ���� ���, ����! ���� �׿����� �޽��� ��ǳ����, �ٻڴٴ� ������ �ڲ� �̷�� ������ �ʳ���?',5,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/18','RR/MM/DD'),to_date('23/12/30','RR/MM/DD'),'����������','�ο��� �̾�� ���� ���� ���, ����!');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'�Ѹ�������','�������ο� �����ߴ� �Ѹ������� ���񽺸� �¶������� �ŰܿԽ��ϴ�.',5,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/22','RR/MM/DD'),to_date('24/01/11','RR/MM/DD'),'��󳲵�','�������ο� �����ߴ� �Ѹ������� ���񽺸� �¶������� �ŰܿԽ��ϴ�.');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'����','���ڰ� ����ũ�� ��α� �������?" ? ��? ���� �ֽ��ϴ�! ������ ������ ��α׷� ȸ���̶�� ������ ���� �����Ӱ� �ۼ��� �� �ֽ��ϴ�. �������� ���� ����� ��� �ſ� ����ũ�մϴ�! ������ �̴ϸ��� �����ΰ� �ű���� ������ ���� ������Ʈ�� �����ϸ� AD-Free, 3���� ��α׸� ������ �޲ߴϴ�.

',5,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/13','RR/MM/DD'),to_date('23/12/22','RR/MM/DD'),'���ֱ�����','���ڰ� ����ũ�� ��α� �������?" ? ��? ���� �ֽ��ϴ�!');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'���ٵ�','���ڷ� �ϴ� ���̾�Ʈ, ���� �� �̻� �ϰ� ���� �����Ű���? ���ٵ� ���� ��ü ��ȭ�� ���� ���������� �ľ��� ������!

',5,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/04','RR/MM/DD'),to_date('23/12/29','RR/MM/DD'),'����ϵ�','���ڷ� �ϴ� ���̾�Ʈ, ���� �� �̻� �ϰ� ���� �����Ű���?');
Insert into CODDY.RECRUITMENT (RECRUITMENT_NO,RECRUITMENT_TITLE,RECRUITMENT_CONTENT,RECRUITMENT_WRITER,RECRUITMENT_INSERT,RECRUITMENT_UPDATE,RECRUITMENT_DELETE,RECRUITMENT_VIEWS,RECRUITMENT_START,RECRUITMENT_END,RECRUITMENT_LOCATION,RECRUITMENT_INTRO) values (SEQ_RECRUITMENT.NEXTVAL,'������','�츮 �ΰ� ���� �������� �� ����? �츮�� �ΰ��� ���� �ְ� �� �̷��� ������ ��� ����� �ɱ�',5,to_date('23/12/20','RR/MM/DD'),null,null,0,to_date('23/12/14','RR/MM/DD'),to_date('24/01/05','RR/MM/DD'),'���ϵ�','�츮 �ΰ� ���� �������� �� ����?');

COMMENT ON COLUMN RECRUITMENT.RECRUITMENT_INSERT IS '�ۼ��� ��¥';

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

SELECT SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL FROM DUAL;
SELECT SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL FROM DUAL;
SELECT SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL FROM DUAL;
SELECT SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL FROM DUAL;
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,1,'��ũ���� 2023-12-20 114752.png','bd40f2e5-10e6-40c7-8c92-12a491daa242_��ũ���� 2023-12-20 114752.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,2,'nae2.JPG','5027cdaa-2942-422d-a196-f1e740b9d501_nae2.JPG','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,2,'nae4.JPG','184c1dc3-e483-4379-aa4c-2b2e076d07fa_nae4.JPG','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),1);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,3,'ESTP.5360b94205e272a7afc9 (1).png','25390e89-e5e3-4fa1-b0c2-d145a4c41499_ESTP.5360b94205e272a7afc9 (1).png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,4,'meta_img.png','50eeec20-a81f-44e2-ac43-08212dc6f506_meta_img.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,5,'��ũ���� 2023-12-20 123707.png','ab0358b4-5ebd-4123-b98b-cff63fdb2eb8_��ũ���� 2023-12-20 123707.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,6,'apple-icon-180x180.png','ff1d1c5a-fa10-4d11-80b1-e8f8e43267a8_apple-icon-180x180.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,7,'logo512.png','d256c349-ba4f-450f-adf2-da9259eff0cd_logo512.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,8,'��ũ���� 2023-12-20 124139.png','ebca94d0-05c3-4213-b7a1-8f9312707be6_��ũ���� 2023-12-20 124139.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
SELECT SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL FROM DUAL;
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,10,'��ũ���� 2023-12-20 124313.png','cdb3d2e2-9077-43a0-8873-d4874bca6b56_��ũ���� 2023-12-20 124313.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,11,'infmation-5.png','36a74f92-ff4e-40c8-a8c7-bcdecb42018a_infmation-5.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,12,'noonnu_og.png','7852f5da-c4e9-425b-9832-f87971c10e81_noonnu_og.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,13,'logo.png','051bff67-e19a-4d41-8f30-fb9c2f522f57_logo.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
SELECT SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL FROM DUAL;
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,15,'180x180.png','361ce084-7704-42b6-8fe7-6ff8572817a0_180x180.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,16,'home_logo3.png','275089cc-7549-4b50-953d-63d206748112_home_logo3.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
SELECT SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL FROM DUAL;
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,19,'unknownNights.jpeg','c104987f-a775-4e3d-8680-fd08fe4f8ad3_unknownNights.jpeg','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,20,'460x0w.png','be0d6246-99b5-4ce3-8d54-a02140ff208f_460x0w.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,21,'20211223503073283%29.webp','a4fefadd-1856-4400-a43b-820ee1f432c2_20211223503073283%29.webp','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,22,'129372671-f012a90f-56a1-4c6e-bf33-8eb268fbc8eb.png','913e75e5-5b9b-4e14-b50d-4f117262ba5a_129372671-f012a90f-56a1-4c6e-bf33-8eb268fbc8eb.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,23,'ic_big.png','bc6de58f-18e7-49e5-8189-63387853d111_ic_big.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,24,'104716209-f1cfa800-576a-11eb-8275-3d2e69cce546.png','0c0ffbfd-0b15-42f5-80c4-a6962fb64b58_104716209-f1cfa800-576a-11eb-8275-3d2e69cce546.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,25,'90950455-85d36700-e48c-11ea-9b79-72b5dcb6c6d6.png','9f0e506f-85b1-4c74-b85e-1b42536b4292_90950455-85d36700-e48c-11ea-9b79-72b5dcb6c6d6.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,26,'76856570-de2b8a80-6896-11ea-8827-fc2f1966fa23.png','d25bb1b3-4a36-4c17-9547-673c558d45ea_76856570-de2b8a80-6896-11ea-8827-fc2f1966fa23.png','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,27,'unnamed.webp','a245b9e6-64fa-48c8-99c3-d8d3ad8142b8_unnamed.webp','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.RECRUITMENT_ATTACHMENT (RECRUITMENT_ATTACHMENT_NO,RECRUITMENT_NO,RECRUITMENT_ATTACHMENT_ORIGIN,RECRUITMENT_ATTACHMENT_CHANGE,RECRUITMENT_ATTACHMENT_PATH,RECRUITMENT_ATTACHMENT_INSERT,RECRUITMENT_ATTACHMENT_LEVEL) values (SEQ_RECRUITMENT_ATTACHMENT.NEXTVAL,28,'unnamed (1).webp','ab3737a3-e3ab-4cec-940d-c37f1e47165e_unnamed (1).webp','resources\file_upload\recruitment\',to_date('23/12/20','RR/MM/DD'),0);

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

Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (1,11,1,'���� ť������ ����','������ �������� ���� ����Ͻó���?<br>
<br>
����غ��� �е��� ������ �� �����ٵ���<br>
<br>
������ �����̱⿡ ���� ����� UI�� ������, �������� �巯���� ���� �о��Դϴ�.<br>
<br>
�� �� MAU�� 200�� ���� �Ѵ� ���� ������ ���� �÷���Ʈ�� ���� ���Ḧ �߽��ϴ�.<br>
<br>
10�� �̻� ��Ǿ���, ���� ���������� ������ٵ� �� ���������?<br>
<br>
���� ���� �Ǵ��� ���� ������, ����Ͻ� �� ������ ������� �����̶� �����մϴ�.<br>
<br>
���������� �� BM�� �ַ� ���� ����Ե��� ������ ������� B2B �𵨿� �ش��մϴ�.<br>
<br>
���� ����Ե��� ���忡�� ���� ���̶� �ϳ��� �÷����� ���ѵ� ���� ���񽺸� ���� ���������� �����Ͻ��� ���������� �����մϴ�.<br>
<br>
�̿� ���� ������ ��������<br>
<br>
1. ��� �ϸ� ���������� �������� �� �� ������?<br>
<br>
2. ����Ͻ� ���� �ٰ�ȭ�ϰų� ������ B2B ���� ���� ���ټ��� ��� ������ �� ������?<br>
<br>
�� ���� ���� ����ϴ� �ð��� ������, ������ ���߱��� ���� �Ǿ����ϴ�.<br>
<br>
����� ���̾�������, ��ɸ�, �����α��� �Ϸ�� �����̸� ����Ʈ ����Ƽ�긦 ���� ����Ʈ �۾��� ���� ���̸�, �鿣�� DB ���迡 �� �ʱ� �����Դϴ�.<br>
<br>
�ִ��� ����� ��� ���� �ð��� �ٿ�, ���� 2������ ��Ÿ ���� ��ø� �����ϰ� �ֽ��ϴ�.<br>
<br>
������ ���� ť������ ���񽺿� �ٸ� ������� 1���� �������� ������ �� �ִ� ����� ���񽺸� ����� �ֽ��ϴ�.<br>
<br>
���� ���ϸ� ���� �Ұ��� �����̶�� �����Ͻø� �����ϴ�.<br>
<br>
 
<br>
<br>
�����: ����, ����, �ν�Ÿ�� ���� 10~20�� ������<br>
<br>
��: (�ű� ������) ������, ī�並 ��ϴ� �����',to_date('23/12/20','RR/MM/DD'),to_date('23/12/20','RR/MM/DD'),to_date('24/01/26','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (2,2,2,'�������³�,���̺��³�','����� �󸶳� ����� �� �˰� ��Ű���?���� ���� ��, ���� ���� ���� ������ ���� ���� ���� ���� ����� Ÿ���� ���� ���� ����� �Ʒ��� ���� ���� �� �ִ� �����Դϴ�.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/13','RR/MM/DD'),to_date('23/12/22','RR/MM/DD'),null,3);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (3,3,3,'��Ż�� MBTI �׽�Ʈ','��̷� ��Ż���� �ٴϴ� ������ �Բ� ������ ��Ż�� MBTI �׽�Ʈ�� ���µ� �Ͽ� ����� �Ǿ���, �׽�Ʈ ���� �������縦 �����鼭 �����ڵ鿡�� NFT�� �������ϰ��� �մϴ�.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/12','RR/MM/DD'),to_date('23/12/21','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (4,3,4,'��ī��','�ڷγ��� ���� �츮�� �˴� ������ �������� ���� 2���� �Ѿ����ϴ�. ������ ���� �ӿ��� �츮�� �Ÿ��α⸦ �����ؾ� �߰�, �������� ��������� �����������ϴ�.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/12','RR/MM/DD'),to_date('23/12/29','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (5,12,5,'�ｺ�ɾ� ����ũ','1. ������Ʈ�� ���� ����<br>
 <br>

�ѽõ� ������ �ʰ� ����Ʈ���� ����ϴ� �����ε��� �������� ������, �ٷ� �źϸ��Դϴ�.<br>
<br>
�̸� �ذ��ϱ� ���� �ǽð����� ����Ʈ�� ��� �ڼ��� üũ�Ͽ� ���� �ڼ��� ����Ʈ���� ����ϸ� �������� ������ �����Ͽ� �ùٸ� �ڼ��� �����մϴ�.<br>

 

õ���Ϸ����� ������/�̼Ǽ��� ������ ����ũ ���񽺿� �ٸ� �Ű��� �ｺ�ɾ� ����ũ ����<br>
<br>
������ ����Ʈ�� ��� �ڼ� �����͸� �����Ͽ� �����ܰ� � �����Ͽ� ���� �Ƿ� ���񽺿� ������ �� �� �ִ� ��ǥ�� Ȱ���մϴ�.<br>
<br>
(���� ���������� ���� �ڼ������� ������ȭ)

����Ʈ���� ����ϴ� �������� ������� �մϴ�.<br>

 <br>

2. ȸ�� ����/���� ��� <br>
 <br>

- 1���Ͽ� 1�� �¶��� ȸ�� ���� (�� �̽��� ������ �н�) , �б⺰ 1ȸ �������� ���� ���� (����)<br>
<br>
- �¶����� ���ڵ带 �ַ� Ȱ���ϰ� , ���������� �ַ� ������ ��ó���� �����մϴ�.<br>

 <br>

 <br>

3. �׿�<br>
�ȳ��ϼ���.<br>

���� �ｺ�ɾ� ����ũ�� �������� ���̿���Ƽ�Դϴ�.<br>

���������δ� ��ȹ 1 / �۰��� 1 / ���� 1 �� 3������ �����Ǿ� �ְ�<br>

���� �������� �ȵ���̵� ���� �ּҴ� �Ʒ��� �����ϴ�.<br>',to_date('23/12/20','RR/MM/DD'),to_date('23/12/20','RR/MM/DD'),to_date('24/02/26','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (6,3,6,'����ţ','�׻� �ݿ��� ���������� �����ϴ� �츮���� ���� ���� �����Դϴ�. ���� �ݿ��� ���� �󸶳� ū �������� ȿ���� ������� Ȯ���ϸ� ��ǥ�� �޼��ϼ���!',to_date('23/12/20','RR/MM/DD'),to_date('23/12/27','RR/MM/DD'),to_date('24/01/17','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (7,3,7,'Zzz','�ų� �Ҹ������� ����ϴ� ������� �����ϰ� �ְ�, Ư�� �ڷγ��� ���� ���� �� �ɸ����� ����� �Ҿ����� ���� ������� ���� ��ָ� �ް� �ֽ��ϴ�. ����� �̷� ������� �޴� ������� ���� ������ �� �� �ִ� ASMR�� �����ϰ�׳��� ���� ����� ���� �� �ִ� �����Դϴ�.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/06','RR/MM/DD'),to_date('23/12/15','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (8,12,8,'�뵿������ [��� ���� ��� ����!]','�츮�� 500�� ������ �����̵��� ����ϴ� ���ѹα� 1�� ������ ���񽺸� ����� ���̿���!<br>
<br>
���̵� ������Ʈ�� �����ϰ� ������, 2021 12�� 2�� 1�� ��� �� ���� �������Ͽ� 2023.4�� �� Ios, 5�� �� �ȵ���̵� ���� ����߾��.<br>
<br>
�뵿�������� �Բ� ����ڸ� ������, �����̵�� ����Բ� ��ü�Ұ����� ���񽺸� ����� ����ȭ�� �̲� �����Դϴ�.<br>
<br>
1���� �&���������� 2���� ��ǰ���� ��ϰ��־��! �ٸ� ����Ʈ ������Ʈ������ ������ �� ���� �پ��� ������ ������, ���ȭ�� ��ǥ�� ����ִ� ������� �Ͻ� �� �ֽ��ϴ�.<br>
<br>
�Բ� �����ϽǺ�!! �������Դϴ�~~~!!<br>
<br>
?���� ����° ������Ʈ�� �غ����Դϴ�.<br>
�Բ� ����ڸ� �ø� ���ο� ��ɵ��� �����ϰ�, �뵿������ ���� �Բ� ���� �������� �����մϴ�!<br>
?��� ���� �ڰ� ���<br>
1. ��� 2�� �̻� (Ȥ�� �׿� ���ϴ� �Ƿ�)<br>
<br>
- ���� ���ػ� �е��̳� ����� ������ �е��� ���ø� ����, �����ںе� ��� ���� ��Ȳ�� �˴ϴ�.<br>
<br>
2. �̷��� ���ȭ�� ����â���� ���� ����ó�� PMF�� ã�ư��Ǻ�<br>
<br>
- ������ �Ƿ������ �ƴ�, ���δ�Ʈ�� ������ ���� �Բ� �پ��� ���̵� ���� ������ �� �־���ؿ�<br>
<br>
- �ʱ� ���δ�Ʈ�̱⿡ �پ��� ������ �����, ����� ����� �����ϴ� ���� ������ �䱸�Ǵ� ��Ȳ�Դϴ�.<br>
<br>
3.���̵� ������Ʈ������, ���ʽ��� ������ �Բ� �� �ɹ�<br>
<br>
- �����ڰ� �ƴ�, ���δ�Ʈ�� ���ʽ��� ���� �� �ִ� �е��� �ʿ��ؿ�.<br>
<br>
- Ŀ�´����̼�(���� ��)�� ��Ȱ���� ���� �е��� ������ ��ƽ��ϴ�. (���� ��⸦ �����ϴ�.)<br>',to_date('23/12/20','RR/MM/DD'),to_date('23/12/20','RR/MM/DD'),to_date('24/01/23','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (9,3,9,'���ķ�ŷ','���� �̿��ϴ� ����Ʈ���� �ű�, �α� ���µ��� ��Ƽ� �����ִ� ����Ʈ�Դϴ�. ��ŷ�� ��ȭ�ϴ� �� �ִϸ��̼����� �����ִ°� ��ǥ�� ��ҽ��ϴ�.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/05','RR/MM/DD'),to_date('23/12/15','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (10,12,10,'�۷ι� AI Ŀ�´�Ƽ & �����÷��̽�','? �ȳ��ϼ���, �������� ������ ������!<br>
����� ���ο� �̷��� ���� �۷ι� AI Ŀ�´�Ƽ + �����÷��̽�, Nova AI(��Ī) �÷����� �Բ� ����� �� ���Ḧ ã�� �ֽ��ϴ�.<br>
<br>
��? AI�� �̷��� �츮 � �󸶳� ���� ��ȭ�� ������ �ٱ�?�� ��? �������� ��Ը�� ��ȭ�� ��� �ɱ�?�� ��� �������� ����� ���� ������Ʈ��,
<br>
AI ����� �ٰ����� �̷��� ������� � �������̰� �������� ��ȭ�� ������ �� �� �ִٴ� �������� ��ϵǾ����ϴ�.<br>
<br>
���� �����ϴ� �÷����� �ܼ��� �÷����� �Ѿ�, �������� AI ��ǰ/����/�ַ�ǵ��� �Ұ��ϰ� �����ϴ� �۷ι� ���������� �� ���Դϴ�.<br>
<br>
��ġ, AI���� App Store �Ǵ� Steam ó����!<br>
<br>
������ �۰� ���� ���� ó�� ������ ���� ���� �̵��� ��â���̰� â������ AI ��ǰ/����/�ַ�� ���� ���� �ô밡 �� ���̶� �����ϰ�,<br>
<br>
�׵��� ������ ���� ����鿡�� �Ұ��ϰ�, ������� ������ �Ը��� �´� AI ��ǰ/����/�ַ�� ���� ���� �̿��� �� �� �ִ� �÷����� ������� �մϴ�.
<br>
���� MVP ���� ���̸�, MVP�� ��AI Ŀ�´�Ƽ���� ������� AI ���� ����/Į��/��α� ���� ������/������ �� ����ڵ��� �ۼ��Ͽ� ������ �� �ִ� ������ ������ �����Ͽ� ��Ī�ϰ��� �ϸ�, ���� �����÷��̽� ���·� ���׷��̵� �س����� �ε���� ���� ���� �߿� �ֽ��ϴ�.
<br>
������ Ÿ�� ����ڴ� AI�� ������ ���ɼ��� �ϻ󿡼� �����ϰ��� �ϴ� ��� �̵��Դϴ�.
<br>',to_date('23/12/20','RR/MM/DD'),to_date('24/01/03','RR/MM/DD'),to_date('24/03/20','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (11,3,11,'�ñ׳�','���̹����� ���� Ȯ�� ������ �ǽð� �˻��� �� �ǽð� �޻�� �˻���, �˻��� ����, �αⴺ�� �� ��ĥ �� ���� �ǽð� Ʈ����. ���� ����� �ǽð� �˻���� �αⴺ���� Ȯ���غ�����.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/12','RR/MM/DD'),to_date('23/12/28','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (12,3,12,'����','����� �����ѱ���Ʈ ����Ʈ.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/19','RR/MM/DD'),to_date('23/12/31','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (13,3,13,'�ӿ�����','�ѱ��� UI/UX ����� ������ �����մϴ�.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/05','RR/MM/DD'),to_date('23/12/11','RR/MM/DD'),null,0);
SELECT SEQ_PROJECT.NEXTVAL FROM DUAL;
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (15,2,15,'ũ����','�ݸ��� ������ ���ϰ� ��û�� �� �ִ� �δ���� Ŀ�̼� �÷����̿���.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/26','RR/MM/DD'),to_date('24/02/20','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (16,2,16,'����','������ �������� �������� ���� ã�ƺ�����!',to_date('23/12/20','RR/MM/DD'),to_date('24/01/22','RR/MM/DD'),to_date('24/01/30','RR/MM/DD'),null,1);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (19,5,19,'�������(����) ','����� ������ ������ ����ģ ���󿡼� ������ ž�� ���ʶ߸��� ���� ������ �����ϴ�. ����� �ذ��ϰ�, ��縦 ����ϰ�, �κ��� ������ �������� ���� ������ ������ ������ �մϴ�.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/12','RR/MM/DD'),to_date('23/12/21','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (20,5,20,'�ؼ���','�߿� �ܿ� �ؾ (�׾� ��, Ǯ��, ȣ�� ����)�� �԰� ���� ��

���� ���� ã�� ����ϴ�.

�������� ������ �ؾ������ �¾ �� ~!',to_date('23/12/20','RR/MM/DD'),to_date('23/12/01','RR/MM/DD'),to_date('23/12/13','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (21,5,21,'�� Ʈ���� �ٸ���','��Ÿ���̺�� 2021. 11. 21�� ����� ���̵� ������Ʈ ������, 2���� �鿣�� ������, 2���� ����Ʈ���� ������, 2���� �����̳ʰ� �Բ� ������Ʈ�� ������ �־��.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/06','RR/MM/DD'),to_date('23/12/14','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (22,5,22,'�Ƕ�','���͵�&��Ʈ��ŷ, ���̵� ������Ʈ ������ ���ϴ� ���� ���� ��� ȥ�� ����� �Խ��ǰ� ���θ���Ʈ�� ���ܿ�Ű���? �Բ� ���̵� ������Ʈ�� ������ ������ ���ϴ��� ��ġ�̳���?',to_date('23/12/20','RR/MM/DD'),to_date('23/12/01','RR/MM/DD'),to_date('24/01/05','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (23,5,23,'���Ͽ���','���Ͽ����� ����ڰ� ��ǥ�� �����ذ��� ĳ���Ϳ� �Բ� ������ ������ ''�� �� ���� ��''�Դϴ�',to_date('23/12/20','RR/MM/DD'),to_date('23/12/07','RR/MM/DD'),to_date('23/12/21','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (24,5,24,'ü����','�ο��� �̾�� ���� ���� ���, ����! ���� �׿����� �޽��� ��ǳ����, �ٻڴٴ� ������ �ڲ� �̷�� ������ �ʳ���?',to_date('23/12/20','RR/MM/DD'),to_date('23/12/18','RR/MM/DD'),to_date('23/12/30','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (25,5,25,'�Ѹ�������','�������ο� �����ߴ� �Ѹ������� ���񽺸� �¶������� �ŰܿԽ��ϴ�.',to_date('23/12/20','RR/MM/DD'),to_date('23/12/22','RR/MM/DD'),to_date('24/01/11','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (26,5,26,'����','���ڰ� ����ũ�� ��α� �������?" ? ��? ���� �ֽ��ϴ�! ������ ������ ��α׷� ȸ���̶�� ������ ���� �����Ӱ� �ۼ��� �� �ֽ��ϴ�. �������� ���� ����� ��� �ſ� ����ũ�մϴ�! ������ �̴ϸ��� �����ΰ� �ű���� ������ ���� ������Ʈ�� �����ϸ� AD-Free, 3���� ��α׸� ������ �޲ߴϴ�.

',to_date('23/12/20','RR/MM/DD'),to_date('23/12/13','RR/MM/DD'),to_date('23/12/22','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (27,5,27,'���ٵ�','���ڷ� �ϴ� ���̾�Ʈ, ���� �� �̻� �ϰ� ���� �����Ű���? ���ٵ� ���� ��ü ��ȭ�� ���� ���������� �ľ��� ������!

',to_date('23/12/20','RR/MM/DD'),to_date('23/12/04','RR/MM/DD'),to_date('23/12/29','RR/MM/DD'),null,0);
Insert into CODDY.PROJECT (PROJECT_NO,PROJECT_OWNER,RECRUITMENT_NO,PROJECT_NAME,PROJECT_INFO,PROJECT_INSERT,PROJECT_START,PROJECT_END,PROJECT_LOCATION,PROJECT_READY) values (28,5,28,'������','�츮 �ΰ� ���� �������� �� ����? �츮�� �ΰ��� ���� �ְ� �� �̷��� ������ ��� ����� �ɱ�',to_date('23/12/20','RR/MM/DD'),to_date('23/12/14','RR/MM/DD'),to_date('24/01/05','RR/MM/DD'),null,0);

UPDATE PROJECT SET PROJECT_READY=2 WHERE PROJECT_READY=1;

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
COMMENT ON COLUMN JOINS.JOINS_ACTIVATE IS '0: �������� / 1: ���� / 2: �������� / 3: ��������';

Insert into CODDY.JOINS (JOINS_NO,MEMBER_NO,PROJECT_NO,JOINS_ROLE,JOINS_IS_PUBLIC,JOINS_ACTIVATE,JOINS_REVIEW) values (SEQ_JOINS.NEXTVAL,2,16,'Project Manager',0,1,null);

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

Insert into CODDY.CHAT (PROJECT_NO,CHAT_MASTER,CHAT_INSERT) values (1,11,to_date('23/12/20','RR/MM/DD'));
Insert into CODDY.CHAT (PROJECT_NO,CHAT_MASTER,CHAT_INSERT) values (8,12,to_date('23/12/20','RR/MM/DD'));
Insert into CODDY.CHAT (PROJECT_NO,CHAT_MASTER,CHAT_INSERT) values (16,2,to_date('23/12/20','RR/MM/DD'));
Insert into CODDY.CHAT (PROJECT_NO,CHAT_MASTER,CHAT_INSERT) values (18,2,to_date('23/12/20','RR/MM/DD'));
Insert into CODDY.CHAT (PROJECT_NO,CHAT_MASTER,CHAT_INSERT) values (13,2,to_date('23/12/20','RR/MM/DD'));
Insert into CODDY.CHAT (PROJECT_NO,CHAT_MASTER,CHAT_INSERT) values (15,2,to_date('23/12/20','RR/MM/DD'));
Insert into CODDY.CHAT (PROJECT_NO,CHAT_MASTER,CHAT_INSERT) values (19,2,to_date('23/12/20','RR/MM/DD'));

DROP SEQUENCE SEQ_CHAT_RECORD;

CREATE SEQUENCE SEQ_CHAT_RECORD NOCYCLE;

CREATE TABLE CHAT_RECORD (
	CHATR_NO	NUMBER 		PRIMARY KEY,
	PROJECT_NO 	NUMBER		NOT NULL,
	CHATR_SENDER	NUMBER		NOT NULL,
	CHATR_MSG	    VARCHAR2(2000)		NOT NULL,
    CHATR_TYPE      NUMBER      NOT NULL,
	CHATR_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	CHATR_UPDATE	DATE		NULL,
	CHATR_DELETE	DATE		NULL,
    FOREIGN KEY (CHATR_SENDER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT(PROJECT_NO)
);

Insert into CODDY.CHAT_RECORD (CHATR_NO,PROJECT_NO,CHATR_SENDER,CHATR_MSG,CHATR_TYPE,CHATR_INSERT,CHATR_UPDATE,CHATR_DELETE) values (1,1,11,'dd',1,to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CHAT_RECORD (CHATR_NO,PROJECT_NO,CHATR_SENDER,CHATR_MSG,CHATR_TYPE,CHATR_INSERT,CHATR_UPDATE,CHATR_DELETE) values (2,1,3,'�����̴�',1,to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CHAT_RECORD (CHATR_NO,PROJECT_NO,CHATR_SENDER,CHATR_MSG,CHATR_TYPE,CHATR_INSERT,CHATR_UPDATE,CHATR_DELETE) values (3,1,3,'Ű�� ���Ͷ�',1,to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CHAT_RECORD (CHATR_NO,PROJECT_NO,CHATR_SENDER,CHATR_MSG,CHATR_TYPE,CHATR_INSERT,CHATR_UPDATE,CHATR_DELETE) values (4,1,3,'��ó���ݾ�',1,to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CHAT_RECORD (CHATR_NO,PROJECT_NO,CHATR_SENDER,CHATR_MSG,CHATR_TYPE,CHATR_INSERT,CHATR_UPDATE,CHATR_DELETE) values (5,15,2,'�ȳ��ϼ���',1,to_date('23/12/20','RR/MM/DD'),null,null);

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

INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'company', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'company@coddy.com', 'company', '���ο�', 8164700297, 'company����', 23, 46000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'enliple', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'enliple@coddy.com', '�ζ�����', '�Ѱ���', 0000000001, '�� ȸ�� Ȩ������ : http://www.enliple.com/', 201, 50000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'nhnkcp', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'nhnkcp@coddy.com', 'NHN KCP', '���ؼ�', 0000000002, 'NHN KCP�� ���ڰ������� ����, �¡��������� ī�� VAN ����, ����� ���� ���� �� ���� ������ ���հ��� ���� ������ ���Ͽ�
���ڰ��� ����� ���� ���۴϶�� �ںν� �ӿ� �����ϰ� ���� ������ �����ϱ� ���� ����ϰ� �ֽ��ϴ�.

�̿� �� ���ư� NHN KCP�� ���� �¡����������� ������ O2O ���� �ý��� ���� �� �۷ι� ���ڻ�ŷ� ����� ���� �޺��ϴ� ���ڰ��� ���忡 ���������� �����԰� ���ÿ� ���ο� �ؿܽ��� ��ô���� �ּ��� ���ϰ� �ֽ��ϴ�.

�ֱ� ���� ���ڰ��� ���忡�� ȭ�η� ������ ������� �о߿�����, NHN KCP�� ö���� ���� �غ�� �������� �ؿ� ������ PG�� ��� ����� ������ �� �� �ִ� �۷ι� ���ڰ��� ��ü�� ������ ���� Ȯ���մϴ�.

"���� ����� �������۴� ������ġ���ѱ����̹������� �Բ� ���� ����� ��ȭ�� ������ ������ �����ִ� ���縦 ��ٸ��ϴ�."', 201, 72000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'soomgo', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'soomgo@coddy.com', 'Soomgo', 'KIM ROBIN H', 0000000003, '(��)�극�̺������� ����Ǹ��߰��ڷμ� ����Ǹ��� ����ڰ� �ƴϸ� ���� �Ǹ��ڰ� �����ϴ� ���񽺿� ���� ����, ������ ��� ������ �ǹ��� å���� �ŷ�����ڿ��� �ֽ��ϴ�.', 51, 60000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'enuri', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'enuri@coddy.com', '(��)��ӽ��÷���', '������', 0000000004, '�߽�ӽ��÷����� ������ ������������ 1998�� 5�� ���� ���� ���ݺ� ����Ʈ�� ������ ���������� �������̰� ��Ȯ�� ��ǰ �� ���� ������ ������ �����ϰ��ֽ��ϴ�.', 201, 90000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'inflearn', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'inflearn@coddy.com', '������ (������)', '������', 4998100612, '�츮�� ���� ���𰡸� ����߸� �մϴ�.

���� �̷�� ���ؼ�, �ϰ� ������ �س����� ���ؼ� �� �о߿� ���� ����� ���� �⺻���� ����̱� �����Դϴ�. ������, ��ο��� ���� ���� ȯ���� ���� ���� ����.? �ʹ� ��μ�, �Ÿ��� �־, ���� ������ �翬�ϴٰ� �����Ǿ� ���°͵��� � ���������Դ� ��ġ�� �Ǳ⵵ �մϴ�. �������� �׷� ���ǿ� �����Ϸ� �մϴ�.

�������� ������, ���������� �ð��� ������� ���� ���ϴ� ���� ����, ������ ���� �� �ִ� �����Դϴ�. ���� 2,000������ �Ѵ� �н� ������, 95�� ���� ������ �Բ��ϰ� �ֽ��ϴ�.

������ ���񽺸� ��ϴ� (��)�������� 2017�� 4�� ���μ��� ���� �ų� 3�谡 �Ѵ� ������ �̷ﳻ��, �ܴ��� ����ũ�� ���ϰ� �ֽ��ϴ�. 2021�� 12��, �� �ŷ��� 21�� ���� ���, 2021�⿡�� �ѱ�������Ʈ�ʽ�, �̷�����ĳ��Ż, ���������κ��� 60�� �� �Ը��� �ø��� A ���ڸ� ��ġ�߽��ϴ�.

������ �������� ���ϴ� ������� ������ ���� �¶��� ���� �÷��� �Ӹ� �ƴ϶� 1:1 ���丵, ä�� �� �پ��� Ŀ���� ���񽺸� �����ϸ� IT �о��� ����ȭ�� Ŀ���� ������ ���� ���񽺷� �ŵ쳪�� �մϴ�. �׸��� �� ������ �Բ� �ɾ ���� ������� ã�� �ֽ��ϴ�.

�����ϰ� ���� ��� ������� �� �������� ������ �������� ������ �Ǳ⸦ �ٶ��ϴ�.
����� ������ �� �����ϰڽ��ϴ�.', 51, 120000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'flitto', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'flitto@coddy.com', '�ø���', '������', 2158772878, '�ø���� ������ �۷ι� IT ������ �Բ� ��� �庮 ���� ���踦 ����� ���� �ִ� ��� �÷��� ����Դϴ�.', 51, 120000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'lottehealthcare', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'lottehealthcare@coddy.com', '�Ե��ｺ�ɾ� �ֽ�ȸ��', '�����', 0000000005, '<p><span style="color: rgb(33, 37, 41); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" sans-serif;="" text-align:="" start;="" white-space-collapse:="" preserve-breaks;"="">"Every Moment of your Healthy Life"</span></p><p><img src="resources\file_upload\company\content\778f3f02-6b5d-4633-965c-e9939711f8d9_qEMEoqnOTP3AWWoKgtP8y.jpg" style="width: 384px;"><span style="color: rgb(33, 37, 41); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" sans-serif;="" text-align:="" start;="" white-space-collapse:="" preserve-breaks;"=""><br></span></p>', 51, 62000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'skcc', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'skcc@coddy.com', 'SK(��) C&C', '��ǳ��', 0000000006, '<h2 class="css-3o07cf" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 20px; font-weight: bold; font-stretch: normal; line-height: 1.4; letter-spacing: -0.3px; margin: 24px 0px 16px; white-space-collapse: preserve-breaks; word-break: break-all; color: rgb(33, 37, 41); text-align: start;">ȸ�� ����</h2><div style="color: rgb(33, 37, 41); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif; font-size: 15px; text-align: start;"><p class="css-1dpg5zy" style="margin: 0px; font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 16px; font-stretch: normal; white-space-collapse: preserve-breaks; overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; word-break: break-all; display: -webkit-box; line-height: 26px; -webkit-line-clamp: unset;">2025�� �����ġ 50���� Global Top 10 ICT Company
Vison Slogan
Creative ICT Factory</p></div>', 1000, 80000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'solutionquant', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'solutionquant@coddy.com', '�ַ����Ʈ', '������', 0000000007, '<h2 class="css-17h254d" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 20px; font-weight: bold; font-stretch: normal; line-height: 1.4; letter-spacing: -0.3px; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(33, 37, 42); text-align: start;">�ַ����Ʈ, � ���ΰ���?</h2><p class="css-19hzmb1" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-stretch: normal; line-height: 1.63; white-space-collapse: preserve-breaks; text-align: start; word-break: break-all; margin: 0px; color: rgb(33, 37, 42);">"�����Ϳ� �ý��� ����� ����"

�ַ����Ʈ�� �� ���� ������(����/������, �ۺ�/�����̺�)�� �������� ��Ʈ �ý����� ������� �����ϴ� ȸ���Դϴ�.
�ַ����Ʈ�� ��뿣���� �ݵ�Ŵ��� ������ �����ϴ� �������� ��� ��Ŀ��� ��� �����͸� ���� ����ϴ� ������� ����Ǿ� �ֽ��ϴ�.
�����͸� �����ڻ꿡 ����(Mapping)�ϰ� Ŭ��¡, ����ȭ, �׽����� ���� �����ϴ� 100% Systematic Hedge Fund�� �����մϴ�.</p>', 5, 28000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'naveris', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'naveris@coddy.com', 'NAVER I&S��', '�ּ���', 0000000008, '<h3 class="various_title" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 38px; line-height: 50px; letter-spacing: -0.76px; color: rgb(0, 0, 0); font-family: Roboto, NanumSquare, ����������, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;Apple SD Gothic Neo&quot;, ����, dotum, arial, sans-serif; text-align: start;">�߿��� ���� �Ƿ°� �µ�</h3><p class="various_text" style="margin: 33px 0px 0px; padding: 0px; font-size: 17px; line-height: 30px; letter-spacing: -0.34px; font-family: NanumSquare, ����������, ����, dotum, arial, sans-serif; text-align: start;">����, ����, ������ �ƴ϶� �Ƿ°� �µ�, ������ �����޽��ϴ�.<br class="pc_block">���̹����̾ؿ����� ����, ����, ���� ���� ���� ü�谡 ���� �����̱⵵ �մϴ�.<br class="pc_block">�������� ������� ����ٸ� ������ ���� �ֵ��� �� �ְ� �� ũ�� ����޽��ϴ�.</p>', 150, 60000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'bigwaverobotics', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'bigwaverobotics@coddy.com', '����̺�κ�ƽ��(��)', '�����', 7068601945, '<h3 class="various_title" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 38px; line-height: 50px; letter-spacing: -0.76px; color: rgb(0, 0, 0); font-family: Roboto, NanumSquare, ����������, -apple-system, BlinkMacSystemFont, " helvetica="" neue",="" "apple="" sd="" gothic="" neo",="" ����,="" dotum,="" arial,="" sans-serif;="" text-align:="" start;"=""><span style="color: rgb(33, 37, 41); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 16px; letter-spacing: normal; text-align: start; white-space-collapse: preserve-breaks;">�� About Bigwaverobotics</span><span style="color: rgb(33, 37, 41); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 16px; letter-spacing: normal; text-align: start; white-space-collapse: preserve-breaks;">
</span><span style="color: rgb(33, 37, 41); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 16px; letter-spacing: normal; text-align: start; white-space-collapse: preserve-breaks;">�κ� ������ ū �ĵ��� ����Ű�� �ִ� ����̺�κ�ƽ���� ���ѹα� ���� �κ� �ڵ�ȭ ��õ �÷��� ���� "���μ�" ������ ��ŸƮ���Դϴ�.</span><br></h3>', 11, 48000000, 'jpg');

COMMIT;

DROP SEQUENCE SEQ_TAGS;

CREATE SEQUENCE SEQ_TAGS NOCYCLE;

CREATE TABLE TAGS (
	TAGS_NO	NUMBER PRIMARY KEY,
	TAGS_NAME	VARCHAR2(200)		NOT NULL,
	TAGS_TYPE	NUMBER CHECK(TAGS_TYPE IN(0, 1))	NOT NULL,
	TAGS_ACTIVE	NUMBER DEFAULT 1 CHECK(TAGS_ACTIVE IN(0, 1))	NOT NULL
);

COMMENT ON COLUMN TAGS.TAGS_TYPE IS '0: ����±� / 1:�����±�';
COMMENT ON COLUMN TAGS.TAGS_ACTIVE IS '0:��Ȱ��';

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

// ��������...
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Ruby', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'QT', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'FastAPI', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Tensorflow/Keras', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'PyTorch', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'NLP', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'TypeScript', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'ShellScript', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Ajax', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'RxJs', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'CS', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'MS-Office', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Elasticsearch', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Selenium', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Azure', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Pandas', 0, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Education', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Field Engineer', 1, 1);

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

Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (1,86);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (1,44);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (2,4);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (2,6);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (2,8);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (1,11);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (1,40);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (2,10);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (2,5);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (2,2);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (3,5);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (3,20);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (3,29);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (3,31);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (3,40);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (3,42);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (4,4);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (4,9);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (4,21);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (4,35);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (4,34);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (4,39);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (5,2);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (5,3);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (5,5);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (6,6);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (6,7);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (6,5);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (6,10);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (6,12);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (6,8);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (7,4);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (7,24);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (7,22);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (7,21);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (7,27);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (7,30);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (8,6);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (8,9);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (8,11);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (8,21);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (9,3);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (9,5);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (9,7);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (9,10);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (9,80);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (9,48);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (9,49);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (9,93);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (10,1);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (10,3);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (10,28);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (10,47);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (12,6);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (12,13);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (12,11);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (12,29);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (12,32);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (12,37);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (13,18);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (13,34);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (13,47);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (13,50);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (13,93);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (13,91);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (13,88);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (16,81);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (15,43);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (15,40);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (15,38);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (15,42);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (15,84);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (15,87);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (16,31);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (16,82);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (16,50);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (16,85);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (16,87);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (19,34);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (19,40);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (19,42);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (19,80);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (20,16);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (20,34);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (19,19);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (19,37);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (20,37);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (20,35);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (20,31);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (20,30);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (21,4);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (21,20);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (21,18);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (22,4);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (22,22);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (22,18);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (22,21);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (22,24);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (22,17);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (23,6);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (23,24);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (23,20);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (23,25);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (23,27);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (23,22);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (24,16);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (24,17);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (24,18);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (24,21);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (24,22);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (24,15);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (25,3);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (25,6);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (25,9);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (25,5);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (25,11);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (25,13);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (26,5);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (26,8);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (26,9);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (26,4);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (26,7);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (26,11);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (26,6);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (27,38);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (27,40);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (27,41);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (27,33);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (28,12);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (28,15);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (28,18);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (28,14);
Insert into CODDY.PRELATION (RECRUITMENT_NO,TAGS_NO) values (28,19);

COMMIT;

-- ȿ�߾�
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
    FBOARD_ORIGIN   VARCHAR2(200) NULL,
    FBOARD_CHANGE   VARCHAR2(200) NULL,
    FOREIGN KEY (FBOARD_WRITER) REFERENCES MEMBER(MEMBER_NO)
);

Insert into CODDY.FBOARD (FBOARD_NO,FBOARD_TITLE,FBOARD_CONTENT,FBOARD_WRITER,FBOARD_INSERT,FBOARD_UPDATE,FBOARD_DELETE,FBOARD_VIEWS,FBOARD_ORIGIN,FBOARD_CHANGE) values (SEQ_FBOARD.NEXTVAL,'��','���±�, �λ��±�, �����±�, �����±�, ������ ��ſ� ���±� �޵鸮~',3,to_date('23/12/20','RR/MM/DD'),null,null,3,'KakaoTalk_20230930_113028340-1.png','/resources/file_upload/fboard/upload/2023122011415479937.png');
Insert into CODDY.FBOARD (FBOARD_NO,FBOARD_TITLE,FBOARD_CONTENT,FBOARD_WRITER,FBOARD_INSERT,FBOARD_UPDATE,FBOARD_DELETE,FBOARD_VIEWS,FBOARD_ORIGIN,FBOARD_CHANGE) values (SEQ_FBOARD.NEXTVAL,'���� �ɴϴ�.','���Ǳ� �̲������� �ʰ� �����ϼ���.',2,to_date('23/12/20','RR/MM/DD'),null,null,2,null,null);
Insert into CODDY.FBOARD (FBOARD_NO,FBOARD_TITLE,FBOARD_CONTENT,FBOARD_WRITER,FBOARD_INSERT,FBOARD_UPDATE,FBOARD_DELETE,FBOARD_VIEWS,FBOARD_ORIGIN,FBOARD_CHANGE) values (SEQ_FBOARD.NEXTVAL,'������� �Ұ�','���� �Ұ��ص帱 ��������� ȭ��Ʈä�ÿ��� �� ������� �����Դϴ�.
�ʿ��ο��� 2~6�� �����ε�, ī�峪 �ֻ����� ���� ������� �ʾƼ� ������ ��Ұ� ����, ���� ���� ������ �αⰡ ���� �����̴�. �ٸ� ������ �ֿ� ��Ŀ������ �� �÷��̾� ���� �ɸ����� ���κ� ���� ���̱� ������ �źΰ��� ���ϰ� ������ �����鵵 �����̴ϴ�. �ݴ�� �����帮�ڸ� �ɸ����� �����Ͻô� �е鿡�Դ� ���ߵ帱 �� �ְڳ׿�.',4,to_date('23/12/20','RR/MM/DD'),null,null,3,null,null);
Insert into CODDY.FBOARD (FBOARD_NO,FBOARD_TITLE,FBOARD_CONTENT,FBOARD_WRITER,FBOARD_INSERT,FBOARD_UPDATE,FBOARD_DELETE,FBOARD_VIEWS,FBOARD_ORIGIN,FBOARD_CHANGE) values (SEQ_FBOARD.NEXTVAL,'�뷡��õ','�������� 12���� STAR �ٹ��� 9��Ʈ�� ����?����� ��õ�����.
�ְɷ��� �۰��ߴµ�, ���簡 ���� �׳�....
�ѹ� ���ſ�',5,to_date('23/12/20','RR/MM/DD'),to_date('23/12/20','RR/MM/DD'),null,3,null,null);
Insert into CODDY.FBOARD (FBOARD_NO,FBOARD_TITLE,FBOARD_CONTENT,FBOARD_WRITER,FBOARD_INSERT,FBOARD_UPDATE,FBOARD_DELETE,FBOARD_VIEWS,FBOARD_ORIGIN,FBOARD_CHANGE) values (SEQ_FBOARD.NEXTVAL,'���','�߿���.
�� �̷��� �䳪��.
�׷��� ���� �׷����� �����е鵵 �������� �����ϰ� �ܿ��� ���ô�.
��ٱ濡 �� �缭 �ڱ� ���� ��Դ� �͵� ���� �� ���ƿ�.',6,to_date('23/12/20','RR/MM/DD'),null,null,2,null,null);
Insert into CODDY.FBOARD (FBOARD_NO,FBOARD_TITLE,FBOARD_CONTENT,FBOARD_WRITER,FBOARD_INSERT,FBOARD_UPDATE,FBOARD_DELETE,FBOARD_VIEWS,FBOARD_ORIGIN,FBOARD_CHANGE) values (SEQ_FBOARD.NEXTVAL,'��������� ������ �ϱ�','������ �θ�Բ� �ߺ������� �丮�ص�ȴ��� ���ְ� ��̳׿�.',3,to_date('23/12/20','RR/MM/DD'),null,null,5,null,null);
Insert into CODDY.FBOARD (FBOARD_NO,FBOARD_TITLE,FBOARD_CONTENT,FBOARD_WRITER,FBOARD_INSERT,FBOARD_UPDATE,FBOARD_DELETE,FBOARD_VIEWS,FBOARD_ORIGIN,FBOARD_CHANGE) values (SEQ_FBOARD.NEXTVAL,'�ٽ� ','�ٽ� ������ �͸� ���Ƽ� ������ �� �̼ҿ���
������ ���������� �� �θ��� �� �����
������ ������ �� �ٶ��� �Ƿ��� �״�...',6,to_date('23/12/20','RR/MM/DD'),null,null,2,null,null);
Insert into CODDY.FBOARD (FBOARD_NO,FBOARD_TITLE,FBOARD_CONTENT,FBOARD_WRITER,FBOARD_INSERT,FBOARD_UPDATE,FBOARD_DELETE,FBOARD_VIEWS,FBOARD_ORIGIN,FBOARD_CHANGE) values (SEQ_FBOARD.NEXTVAL,'������ ��Ź�帳�ϴ�.','�ϴ��� ���̾�Ʈ �Ĵ����̱� ������ �̸� ����ؼ� �޴� ��Ź�帱�Կ�. ��� ���̽� �丮�� �����Դϴ�. ',2,to_date('23/12/20','RR/MM/DD'),null,null,3,null,null);
Insert into CODDY.FBOARD (FBOARD_NO,FBOARD_TITLE,FBOARD_CONTENT,FBOARD_WRITER,FBOARD_INSERT,FBOARD_UPDATE,FBOARD_DELETE,FBOARD_VIEWS,FBOARD_ORIGIN,FBOARD_CHANGE) values (SEQ_FBOARD.NEXTVAL,'����Ÿ������','������ ����Ÿ�� ���� �� �����ø�? ���� ������. ȸ������... ',4,to_date('23/12/20','RR/MM/DD'),null,null,3,null,null);
Insert into CODDY.FBOARD (FBOARD_NO,FBOARD_TITLE,FBOARD_CONTENT,FBOARD_WRITER,FBOARD_INSERT,FBOARD_UPDATE,FBOARD_DELETE,FBOARD_VIEWS,FBOARD_ORIGIN,FBOARD_CHANGE) values (SEQ_FBOARD.NEXTVAL,'�뷱�� ����','���� VS ��ǳ��',5,to_date('23/12/20','RR/MM/DD'),null,null,7,null,null);

COMMENT ON COLUMN FBOARD.FBOARD_INSERT IS '�ۼ��� ��¥';

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

Insert into CODDY.FREPLY (FREPLY_NO,MEMBER_NO,FBOARD_NO,FREPLY_PARENT,FREPLY_CONTENT,FREPLY_INSERT,FREPLY_UPDATE,FREPLY_DELETE) values (SEQ_FREPLY.NEXTVAL,3,8,null,'�Ф�',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.FREPLY (FREPLY_NO,MEMBER_NO,FBOARD_NO,FREPLY_PARENT,FREPLY_CONTENT,FREPLY_INSERT,FREPLY_UPDATE,FREPLY_DELETE) values (SEQ_FREPLY.NEXTVAL,3,10,null,'��ǳ��� �� ����?',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.FREPLY (FREPLY_NO,MEMBER_NO,FBOARD_NO,FREPLY_PARENT,FREPLY_CONTENT,FREPLY_INSERT,FREPLY_UPDATE,FREPLY_DELETE) values (SEQ_FREPLY.NEXTVAL,4,10,null,'��ǳ�� ���',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.FREPLY (FREPLY_NO,MEMBER_NO,FBOARD_NO,FREPLY_PARENT,FREPLY_CONTENT,FREPLY_INSERT,FREPLY_UPDATE,FREPLY_DELETE) values (SEQ_FREPLY.NEXTVAL,6,10,null,'����Ͻ���',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.FREPLY (FREPLY_NO,MEMBER_NO,FBOARD_NO,FREPLY_PARENT,FREPLY_CONTENT,FREPLY_INSERT,FREPLY_UPDATE,FREPLY_DELETE) values (SEQ_FREPLY.NEXTVAL,1,6,null,'????',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.FREPLY (FREPLY_NO,MEMBER_NO,FBOARD_NO,FREPLY_PARENT,FREPLY_CONTENT,FREPLY_INSERT,FREPLY_UPDATE,FREPLY_DELETE) values (SEQ_FREPLY.NEXTVAL,1,10,null,'����ؾ߰ڴ�....',to_date('23/12/20','RR/MM/DD'),null,null);

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
	NBOARD_VIEWS	NUMBER	DEFAULT 0	NOT NULL,
    NBOARD_ORIGIN   VARCHAR2(200) NULL,
    NBOARD_CHANGE   VARCHAR2(200) NULL
);

Insert into CODDY.NBOARD (NBOARD_NO,NBOARD_TITLE,NBOARD_CONTENT,NBOARD_INSERT,NBOARD_UPDATE,NBOARD_DELETE,NBOARD_VIEWS,NBOARD_ORIGIN,NBOARD_CHANGE) values (SEQ_NBOARD.NEXTVAL,'�ȳ��ϼ���','�ȳ��ϼ���. CODDY�� ���� �����е��� ȯ���մϴ�. 

CODDY�� ���� ����ǰų� �α� ������Ʈ�� �Ұ��ϰ� �̿� �Բ��� ���α׷��Ӹ�  ��ô� �о��� ���� �����Դϴ�. 

�׻� �ְ��� ���񽺿� �������� �ַ���� �����ϱ� ���� ����ϰ� ������ ���� ������ �ֿ켱�� �ΰ� �ֽ��ϴ�.

���� ����� �����ϴ� ���忡�� CODDY�� ������ �ּż� �����մϴ�. �츮�� �׻� �������� ���� �� ���� ������ �����ϱ� ���� ����� ���Դϴ�.

�Բ� �Ǹ��� ������ ����� ������!

�����մϴ�.

CODDY ������ �ϵ� �帲',to_date('23/12/20','RR/MM/DD'),null,null,1,null,null);
Insert into CODDY.NBOARD (NBOARD_NO,NBOARD_TITLE,NBOARD_CONTENT,NBOARD_INSERT,NBOARD_UPDATE,NBOARD_DELETE,NBOARD_VIEWS,NBOARD_ORIGIN,NBOARD_CHANGE) values (SEQ_NBOARD.NEXTVAL,'���� �Խ��� ÷������ ��� ����','���� ÷�������� ���� �Խ��ǿ����� ���� �����Ǿ� ���� ������ �˷��帮��, ���� ����Ʈ ������Ʈ�� ���� �����̰ڽ��ϴ�.',to_date('23/12/20','RR/MM/DD'),null,null,1,null,null);
Insert into CODDY.NBOARD (NBOARD_NO,NBOARD_TITLE,NBOARD_CONTENT,NBOARD_INSERT,NBOARD_UPDATE,NBOARD_DELETE,NBOARD_VIEWS,NBOARD_ORIGIN,NBOARD_CHANGE) values (SEQ_NBOARD.NEXTVAL,'���� �Խ��� ÷������ ��� ����','���� �����Խ��� ������ ���� ���ε常 �����ϸ� �ٿ�ε尡 �Ұ����� ��Ȳ�� Ȯ�εǾ� ���� ��ġ�߿� �ֽ��ϴ�.

������ �ذ��� �� �ֵ��� �ּ��� �� �ϰڽ��ϴ�.

����Ʈ �̿뿡 ������ ���ĵ�� �˼��մϴ�.',to_date('23/12/20','RR/MM/DD'),null,null,1,null,null);
Insert into CODDY.NBOARD (NBOARD_NO,NBOARD_TITLE,NBOARD_CONTENT,NBOARD_INSERT,NBOARD_UPDATE,NBOARD_DELETE,NBOARD_VIEWS,NBOARD_ORIGIN,NBOARD_CHANGE) values (SEQ_NBOARD.NEXTVAL,'�Ǽ����� �褱�� ��Ұ�','�ֱٱ��� �����Խ��ǿ��� �ú�� ���� �� ������ �ҹ��� �÷������� �ټ��� �����е鿡�� ������ ���ĵ�ȴ� �褱�߿� ���Ͽ� ������ �̸� �������ط� �Ǵ�, ��������� ������ �˷��帳�ϴ�. 

CODDY ������ �ϵ� �帲',to_date('23/12/20','RR/MM/DD'),null,null,2,null,null);
Insert into CODDY.NBOARD (NBOARD_NO,NBOARD_TITLE,NBOARD_CONTENT,NBOARD_INSERT,NBOARD_UPDATE,NBOARD_DELETE,NBOARD_VIEWS,NBOARD_ORIGIN,NBOARD_CHANGE) values (SEQ_NBOARD.NEXTVAL,'�űԼ��� ���� �ο� ����','2025�� ���� ���� ��Ī�� �ռ� ����� �Բ��� ����е��� �����ϰ��� �մϴ�. 
�ڼ��� ������ 2024�� 3�� �߿� ����� �帮�ڽ��ϴ�.',to_date('23/12/20','RR/MM/DD'),null,null,1,null,null);
Insert into CODDY.NBOARD (NBOARD_NO,NBOARD_TITLE,NBOARD_CONTENT,NBOARD_INSERT,NBOARD_UPDATE,NBOARD_DELETE,NBOARD_VIEWS,NBOARD_ORIGIN,NBOARD_CHANGE) values (SEQ_NBOARD.NEXTVAL,'CODDY �߱����� ����','CODDY�� �ް��� �������� ���� �߱��� ���縦 �����ϰ� �Ǿ����ϴ�. 

�ƿ﷯ �߱� ���������� ���� â�� ��� �� �Ѹ��� ������ ������ �߱� ���������� �߷��� �޾� ���� CODDY�� ������ ���弭�� �Ǿ����ϴ�.

�̿� �ڸ����� �ʰ� ������ ����Ͽ� �����ϴ� CODDY�� �ǰڽ��ϴ�.

CODDY ������ �ϵ� �帲',to_date('23/12/20','RR/MM/DD'),null,to_date('23/12/20','RR/MM/DD'),2,null,null);
Insert into CODDY.NBOARD (NBOARD_NO,NBOARD_TITLE,NBOARD_CONTENT,NBOARD_INSERT,NBOARD_UPDATE,NBOARD_DELETE,NBOARD_VIEWS,NBOARD_ORIGIN,NBOARD_CHANGE) values (SEQ_NBOARD.NEXTVAL,'CODDY �߰߱������ �°�','CODDY�� ������ �ް��� �������� ���� �ڻ� �ѱԸ� 9õ����� �̸��� �߼ұ������ �߰߱������ �°ݵǾ����ϴ�. 

�̿� ���� ���� ���ο� ������ CEO�� ���� ������ �����̸� �� â�����(������ �߱������� ������ ������ ����, �ѿ��� ����, ��ȿ�� ����(��))�� ���� ���� �� �� �λ�� ������ �����Դϴ�.

��� �����Ͽ� ������ �� ������ ��� �帳�ϴ�.

CODDY ������ �ϵ� �帲',to_date('23/12/20','RR/MM/DD'),null,to_date('23/12/20','RR/MM/DD'),1,null,null);
Insert into CODDY.NBOARD (NBOARD_NO,NBOARD_TITLE,NBOARD_CONTENT,NBOARD_INSERT,NBOARD_UPDATE,NBOARD_DELETE,NBOARD_VIEWS,NBOARD_ORIGIN,NBOARD_CHANGE) values (SEQ_NBOARD.NEXTVAL,'CODDY �߱�','CODDY�� �ް��� �������� ���� �߱��� ���縦 �����ϰ� �Ǿ����ϴ�. 
�ƿ﷯ �߱� ���������� ���� â�� ��� �� �Ѹ��� ������ ������ �߱� ���������� �߷��� �޾� ���� CODDY�� ������ ���弭�� �Ǿ� �����е��� ���ϸ� �ٶ��ϴ�.',to_date('23/12/20','RR/MM/DD'),null,null,1,null,null);
Insert into CODDY.NBOARD (NBOARD_NO,NBOARD_TITLE,NBOARD_CONTENT,NBOARD_INSERT,NBOARD_UPDATE,NBOARD_DELETE,NBOARD_VIEWS,NBOARD_ORIGIN,NBOARD_CHANGE) values (SEQ_NBOARD.NEXTVAL,'�߰߱�� ��','''CODDY�� ������ �ް��� �������� ���� �ڻ� �ѱԸ� 9õ����� �̸��� �߼ұ������ �߰߱������ �°ݵǾ����ϴ�. 
�̿� ���� ���� ���ο� ������ CEO�� ���� ������ �����̸� �� â�����(������ �߱������� ������ ������ ����, �ѿ��� ����, ��ȿ�� ����(��))�� ���� ���� �� �� �λ�� ������ �����Դϴ�.
��� �����Ͽ� ������ �� ������ ��� �帳�ϴ�.

CODDY ������ �ϵ� �帲',to_date('23/12/20','RR/MM/DD'),null,to_date('23/12/20','RR/MM/DD'),1,null,null);
Insert into CODDY.NBOARD (NBOARD_NO,NBOARD_TITLE,NBOARD_CONTENT,NBOARD_INSERT,NBOARD_UPDATE,NBOARD_DELETE,NBOARD_VIEWS,NBOARD_ORIGIN,NBOARD_CHANGE) values (SEQ_NBOARD.NEXTVAL,'�߰߱������ �°�','''CODDY�� ������ �ް��� �������� ���� �ڻ� �ѱԸ� 9õ����� �̸��� �߼ұ������ �߰߱������ �°ݵǾ����ϴ�. �̿� ���� ���� ���ο� ������ CEO�� ���� ������ �����̸� �� â�����(������ �߱������� ������ ������ ����, �ѿ��� ����, ��ȿ�� ����(��))�� ���� ���� �� �� �λ�� ������ �����Դϴ�. ��� �����Ͽ� ������ �� ������ ��� �帳�ϴ�. 

CODDY ������ �ϵ� �帲',to_date('23/12/20','RR/MM/DD'),null,null,6,null,null);

COMMENT ON COLUMN NBOARD.NBOARD_INSERT IS '�ۼ��� ��¥';

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

Insert into CODDY.IBOARD (IBOARD_NO,IBOARD_TITLE,IBOARD_CONTENT,IBOARD_WRITER,IBOARD_INSERT,IBOARD_UPDATE,IBOARD_DELETE,PROJECT_NO,IBOARD_VIEWS) values (SEQ_IBOARD.NEXTVAL,'���� ���³�, ���� ���³�','����� �󸶳� ����� �� �˰� ��Ű���?���� ���� ��, ���� ���� ���� ������ ���� ���� ���� ���� ����� Ÿ���� ���� ���� ����� �Ʒ��� ���� ���� �� �ִ� �����Դϴ�.',2,to_date('23/12/20','RR/MM/DD'),null,null,2,4);

COMMENT ON COLUMN IBOARD.IBOARD_INSERT IS '�ۼ��� ��¥';

DROP SEQUENCE SEQ_LIKES;

CREATE SEQUENCE SEQ_LIKES NOCYCLE;

CREATE TABLE LIKES (
	LIKES_MEMBER	NUMBER		NOT NULL,
	IBOARD_NO	NUMBER		NOT NULL,
    FOREIGN KEY (LIKES_MEMBER) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (IBOARD_NO) REFERENCES IBOARD(IBOARD_NO)
);

Insert into CODDY.LIKES (LIKES_MEMBER,IBOARD_NO) values (2,1);

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

Insert into CODDY.IREPLY (IREPLY_NO,MEMBER_NO,IBOARD_NO,IREPLY_PARENT,IREPLY_CONTENT,IREPLY_INSERT,IREPLY_UPDATE,IREPLY_DELETE) values (SEQ_IREPLY.NEXTVAL,2,1,null,'����������������������������������������������������������������',to_date('23/12/20','RR/MM/DD'),null,null);

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

Insert into CODDY.IATTACHMENT (IATTACHMENT_NO,IBOARD_NO,IATTACHMENT_ORIGIN,IATTACHMENT_CHANGE,IATTACHMENT_PATH,IATTACHMENT_INSERT,IATTACHMENT_LEVEL) values (SEQ_IATTACHMENT.NEXTVAL,1,'nae2.JPG','42c63f95-2601-4e8e-92aa-b51ae777597c_nae2.JPG','resources\file_upload\iboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.IATTACHMENT (IATTACHMENT_NO,IBOARD_NO,IATTACHMENT_ORIGIN,IATTACHMENT_CHANGE,IATTACHMENT_PATH,IATTACHMENT_INSERT,IATTACHMENT_LEVEL) values (SEQ_IATTACHMENT.NEXTVAL,1,'nae4.JPG','ecb7de49-8ce2-4e7c-af2c-16e994c5d3ca_nae4.JPG','resources\file_upload\iboard\',to_date('23/12/20','RR/MM/DD'),1);

-- ������
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
    ORIGIN_NAME	    VARCHAR2(100),
    CHANGE_NAME	    VARCHAR2(100),
    FOREIGN KEY (CBOARD_WRITER) REFERENCES MEMBER(MEMBER_NO)
);

COMMENT ON COLUMN CBOARD.CBOARD_TITLE IS '������';
COMMENT ON COLUMN CBOARD.CBOARD_CONTENT IS '�۳���';
COMMENT ON COLUMN CBOARD.CBOARD_WRITER IS '����';
COMMENT ON COLUMN CBOARD.CBOARD_INSERT IS '�ۼ��� ��¥';
COMMENT ON COLUMN CBOARD.CBOARD_UPDATE IS '���ۼ�';
COMMENT ON COLUMN CBOARD.CBOARD_DELETE IS '�ۻ���';
COMMENT ON COLUMN CBOARD.CBOARD_VIEWS IS '��ȸ��';

Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,'������ ��ť��Ƽ HttpSeurity.apply() derpeciated','<p>�ȳ��ϼ���! �ֱ� ������ ��ť��Ƽ�� ��ġ�Ǹ鼭, ���� �޼��� ü�̴� ����� �ƴ� ���ٽ��� ���� �Լ������� �����ϵ��� �ٲ���µ���.</p><p>�ٸ� ���� �κ��� ���Ӱ� �ٲ� ����� ã������.... �Ʒ� ������ ������ apply() �� ������ ã�� ���� ��������...�� Ȥ�� �ƽô� �а�Ǳ��?<br>(''apply(C)'' is deprecated since version 6.2 and marked for removal )</p><figure class="image"><img src="resources/file_upload/cboard/upload/2023122011395320880.png"></figure>',2,to_date('23/12/20','RR/MM/DD'),null,null,2,null,null);
Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,'<property name="hibernate.hbm2ddl.auto" value="update"/>','<pre><code class="language-plaintext">&lt;property name="hibernate.hbm2ddl.auto" value="update"/&gt;</code></pre><p>&nbsp;</p><p>create / create-drop �� �� �˴ϴ�.</p><p>������ update�� �̻������� �߰��� �߽��ϴ�.<br>������ �˰� �; �̷� ���� �帳�ϴ�.</p><p>update�� value�� �ۼ��� �ѵڿ� Member class ����</p><p>A - private int age x</p><p>B - private Integer o<br>�� �� ���� �ۼ��� �ϰ� ���� ������ �غ���</p><p><br>A�� ������ �߻�������<br>B�� ���������� �۵��� �˴ϴ�.</p><p>������ �˷��ּ���.</p>',4,to_date('23/12/20','RR/MM/DD'),null,to_date('23/12/20','RR/MM/DD'),2,null,null);
Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,'property name','<pre><code class="language-plaintext">&lt;property name="hibernate.hbm2ddl.auto" value="update"/&gt;</code></pre><p>&nbsp;</p><p>create / create-drop �� �� �˴ϴ�.</p><p>������ update�� �̻������� �߰��� �߽��ϴ�.<br>������ �˰� �; �̷� ���� �帳�ϴ�.</p><p>update�� value�� �ۼ��� �ѵڿ� Member class ����</p><p>A - private int age x</p><p>B - private Integer o<br>�� �� ���� �ۼ��� �ϰ� ���� ������ �غ���</p><p><br>A�� ������ �߻�������<br>B�� ���������� �۵��� �˴ϴ�.</p><p>������ �˷��ּ���.</p>',4,to_date('23/12/20','RR/MM/DD'),null,to_date('23/12/20','RR/MM/DD'),1,null,null);
Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,'eee','<p>������ �Է��ϼ���.</p>',4,to_date('23/12/20','RR/MM/DD'),null,to_date('23/12/20','RR/MM/DD'),1,null,null);
Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,'property name','<pre><code class="language-plaintext">&lt;property name="hibernate.hbm2ddl.auto" value="update"/&gt;</code></pre><p>&nbsp;</p><p>create / create-drop �� �� �˴ϴ�.</p><p>������ update�� �̻������� �߰��� �߽��ϴ�.<br>������ �˰� �; �̷� ���� �帳�ϴ�.</p><p>update�� value�� �ۼ��� �ѵڿ� Member class ����</p><p>A - private int age x</p><p>B - private Integer o<br>�� �� ���� �ۼ��� �ϰ� ���� ������ �غ���</p><p><br>A�� ������ �߻�������<br>B�� ���������� �۵��� �˴ϴ�.</p><p>������ �˷��ּ���.</p>',4,to_date('23/12/20','RR/MM/DD'),null,null,4,null,null);
Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,' for���̶� while�� ����','<p><span style="background-color:rgb(255,255,255);color:rgb(36,41,47);">&nbsp;for���̶� while�� ���� ������ ������ �˰ڴµ� ��Ȯ�� �������� �𸣰ھ�� ,, ��Ȯ�� ���ǳ� �񱳵� ���� ���ð� �������??</span></p>',3,to_date('23/12/20','RR/MM/DD'),null,null,3,null,null);
Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,'���ڸ����̿��� ����� �α��� ��','<p>&nbsp;</p><p><span style="background-color:rgb(255,255,255);color:rgb(36,41,47);">��Ʃ�꿡�� �� ��� ���ڸ����̿��� �ۼ��� ������Ʈ�� ����꿡 �ø����� �ϴµ�, ����� �α��� �ÿ� ���� ����â�� ��ϴ�. � ���α׷��� �� ��ġ�ϰų� �ؾ� �ұ��...?</span></p><p>&nbsp;</p><figure class="image"><img src="resources/file_upload/cboard/upload/2023122011475926659.png"></figure>',5,to_date('23/12/20','RR/MM/DD'),null,null,4,null,null);
Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,'Querydsl SQLExpressions�� listagg','<p>Querydsl SQLExpressions�� listagg �����Ͽ� ������ �ֽ��ϴ�.</p><p>&nbsp;</p><p>���� Projections.constructoer ������� ��ȸ�� ����� Dto�� �ް��ִµ���,</p><p>SQLExpressions.listagg(�÷�, ",").withinGroup().orderBy(�÷�).getValue().as("listaggs")</p><p>�� select�� Dto���� String���� ���޴µ� String���� �������� ��� �ؾ� �ɱ��?</p><p>&nbsp;</p><p>����� ���°ɱ��? �̹� ���� ������ ���� ���� �ִµ� ���ذ� ���¶� �ٽ� �ѹ� �� �÷� ���ϴ�.</p><p>&nbsp;</p><p>�̹���� ����ϴ� ������ A ���̺�, B ���̺��� �ִµ� 1:N�� ���� �Դϴ�)</p><p>A���̺� ��ȸ�� Response���� B���̺��� �÷� �ϳ��� �߰��� ��Ͽ� ������� �ϴµ�</p><p>�׷��� B���̺��� �ش� �÷��� ���� �ٸ� �����Ͱ� 2�� �̻��Ͻ� A������ 2���� ������ �Ǽ�<br>(����¡ ó���ÿ��� �� ī��Ʈ�� ����¡ ó���� ����� ���� �ʽ��ϴ�.)</p><p>�� row�� �������� �ϱ� ���� ����Ϸ� Querydsl SQLExpressions�� listagg ����Ϸ��µ�,</p><p>String���� �������� ��������...<br>Ȥ Querydsl SQLExpressions�� listagg �ƴϴ��� �ٸ� ����� �������?</p>',6,to_date('23/12/20','RR/MM/DD'),null,null,4,null,null);
Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,'������ ���ͼ��Ͱ� �������� �ʾƿ� ','<p>&nbsp;</p><p>�α��� ��� ������ �����Ͽ� ���� ���� �ڵ带 �����ϸ� �����ϴ� ��</p><p>������ �� ���� ������ �߻��Ͽ� ���� �帳�ϴ�.</p><p>&nbsp;</p><p><a href="http://logininterceptor.java/"><strong>LoginInterceptor.java</strong></a></p><pre><code class="language-plaintext">package Alchole_free.Cockpybara.interceptor;

import Alchole_free.Cockpybara.constant.SessionLoginConst;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Slf4j
//@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession();
        log.info("session = {}", session);
        if(session==null || session.getAttribute(SessionLoginConst.LOGIN_MEMBER)==null){
            log.info("�α��ε��� ���� �����");
            response.sendRedirect("/login");
            return false;
        }

        log.info("���� ��û");

        return true;
    }
}</code></pre><p>&nbsp;</p><p>&nbsp;</p><p><a href="http://webconfig.java/"><strong>WebConfig.java</strong></a></p><pre><code class="language-plaintext">package Alchole_free.Cockpybara.config;

import Alchole_free.Cockpybara.interceptor.LoginInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//@Slf4j
@Configuration
//@RequiredArgsConstructor
public class WebConfig implements WebMvcConfigurer {

//    private final LoginInterceptor loginInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor())
                .order(1)
                .addPathPatterns("/**")
                .excludePathPatterns("/", "/join", "/login",
                        "/css/**", "/*.ico", "/error");
    }
}</code></pre><p>&nbsp;</p><h3><strong>����</strong></h3><p>���� ���� �ڵ带 �����ϰ� ���ø����̼��� ���۽��״µ�, ���ͼ��Ͱ� �ƿ� �α׿� ����</p><p>�ʴ�(�������� �ʴ� ������ ���̴�) ������ �߻��Ͽ����ϴ�. �����Ͽ� ���۸��� �ϴٺ���</p><p>���ͼ��� Ŭ������ ������ ������ִ� ���°� �ƴϸ� �������� ���� �� �ִٰ� �Ͽ�,</p><p>������ ����ϰ� <code>WebConfig</code> Ŭ�������� �����ڸ� ���� ���Թ޴� ���·� ������ �غ��Ҵµ�</p><p>������ ���� ������ �߻��ϴ�����. ����ü ��� �κп��� ������ �߻��ϴ� ������</p><p>�ľ��ϱⰡ ����� ��γ��� �����帳�ϴ�.&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>',7,to_date('23/12/20','RR/MM/DD'),null,null,6,null,null);
Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,'Editor�� ���� ������ �ֽ��ϴ�!','<p>�ٸ� �������� ���� ����</p><p>Post ��ƼƼ�� Editor�� ����ؼ� �����ϴ� �Ͱ� �Ʒ� �ڵ尡 ��� ���̰� �ִ��� �� ���ذ� ���� �ʽ��ϴ�...</p><p>&nbsp;</p><pre><code class="language-plaintext">public Post toUpdate(PostUpdate req) {
     this.title = req.getTitle() != null ? req.getTitle() : this.title;
     this.content = req.getContent() != null ? req.getContent() : this.content;

     return this;
}</code></pre>',9,to_date('23/12/20','RR/MM/DD'),null,null,5,null,null);
Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,'JAVA11 - javax.xml.bind.JAXBException ����','<p>Caused by: java.lang.ClassNotFoundException: javax.xml.bind.JAXBException</p><p>JAVA11 ���� ������ �߻��ϳ׿�</p><p>&nbsp;</p><pre><code class="language-plaintext">&lt;dependency&gt;
    &lt;groupId&gt;javax.xml.bind&lt;/groupId&gt;
     &lt;artifactId&gt;jaxb-api&lt;/artifactId&gt;
    &lt;version&gt;2.3.0&lt;/version&gt;
 &lt;/dependency&gt;</code></pre>',10,to_date('23/12/20','RR/MM/DD'),null,null,4,null,null);
Insert into CODDY.CBOARD (CBOARD_NO,CBOARD_TITLE,CBOARD_CONTENT,CBOARD_WRITER,CBOARD_INSERT,CBOARD_UPDATE,CBOARD_DELETE,CBOARD_VIEWS,ORIGIN_NAME,CHANGE_NAME) values (SEQ_CBOARD.NEXTVAL,'Group By�����帳�ϴ�.','<p>querydsl�� �������̰�</p><p>A Table</p><p>year&nbsp; name&nbsp; &nbsp;value</p><p>2019&nbsp; &nbsp;a&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10</p><p>2019&nbsp; &nbsp;b&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;11</p><p>2019&nbsp; &nbsp;c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 11</p><p>2020&nbsp; &nbsp;d&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;9</p><p>2020&nbsp; &nbsp;e&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 20</p><p>�� ���� �� ,&nbsp; year�� �׷����ؼ� value�� �ƽ��ΰ��� �����ְ� �ͽ��ϴ�.</p><p>2019&nbsp; (b,11) , (c,11)</p><p>2020&nbsp; (e, 20)</p><p>�̷��� ���� �������� �ϰ� �ͽ��ϴ�.</p><p>���������δ� (b,11) (c,11)(e,20)�� ����ϰ� �ͽ��ϴ�.</p><p>List&lt;a&gt;�� �ް� �ͽ��ϴ�. �⵵��, �̸������� ���� �����ϰ� �ͽ��ϴ�.</p><p>a�� Qa�� a�� ���� ���Դϴ�.</p><p>JPAQueryFactory.from(a).transform(<i>groupBy</i>(a.year).as(<i>list</i>(a)));</p><p>���� ���������� ���̻� ������ �ȳ��׿�. �Ф�&nbsp;</p>',11,to_date('23/12/20','RR/MM/DD'),null,null,5,null,null);

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

Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,4,1,null,'�Բ��� �����Ͻ� HttpSecurity.apply() �޼ҵ�� ������ ��ť��Ƽ�� ����� ��Ŀ� ���� ���ٽ��� ���� �������� ��ü�ؾ� �� �κ��Դϴ�. �̸� ��ü�ϱ� ���ؼ��� SecurityConfigurerAdapter�� ��ӹ޴� Ŭ������ �����Ͽ� SecurityFilterChain�� ���� ����ؾ� �մϴ�.',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,3,5,null,'������ ���̺��� ��� �����Ǿ� �־������� ���� ������ �߻��� �� �ֽ��ϴ�.

age �ʵ尡 ���ʿ� Integer���� ddl-auto�� create ���� �����ͺ��̽��� age �Ӽ��� not null ���ѵǾ��ٰ� �����ϰڽ��ϴ�. ���� ddl-auto�� update�� ����, age �ʵ带 ����Ÿ��(int)���� �ٲٰ� �ٽ� ���� �����ϸ�, ���̺� ������ ������ �߻��մϴ�.

int ���� ����Ÿ���� null�� ������� �ʱ⿡ �����ͺ��̽� �Ӽ����� not null �� �����մϴ�. �׷��� �̹� age �Ӽ��� null �� �� �����Ͱ� �ִٸ� �Ӽ��� ������ �� ���� ������ �߻��մϴ�.

�����մϴ�.',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,5,6,null,'for ���� while ���� ��� �ݺ� �۾��� ���� �������� ���� ���ó�� ������ ���� ���� �ٸ��ϴ�.

for �� : �ݺ� Ƚ���� ��Ȯ�� �۾�
while �� : �ݺ� Ƚ���� ��Ȯ���� ���� �۾�

ũ�Ⱑ ������ �ִ� �迭�� ��Ҹ� ��ȸ �Ѵٰų�, Ƚ���� ������ �۾��� �� ���� for ���� ����Ͻø� �Ǳ���. Ƚ�� �����ϰ� Ư�� ������ �����ϴ� ���� ����ؼ� �۾��� �� ���� while ���� ����Ͻø� �˴ϴ�.',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,6,7,null,'���ڸ����̿��� ����� �α��� �ÿ� �߻��ϴ� �ش� ���� �޼����� ��Git���� ��ġ�ؾ� �Ѵٴ� �ǹ��Դϴ�.
�������� ������ ���ؼ��� Git Ŭ���̾�Ʈ�� ��ġ�ؾ��ϸ�, ���� ��ũ���� �ش� ���α׷��� �ٿ�ε��Ͽ� ��ġ�Ͻø� �˴ϴ�.
https://git-scm.com/downloads
��ġ ���� ���ڸ����� �������� Git ��θ� �������ֽŴٸ� �������� ������ ������ ���Դϴ�. ��ġ�� �Ϸ�� �� �ٽ� �õ��غ�����. ',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,7,8,null,'Querydsl SQLExpressions�� listagg �Լ��� ����Ͽ� ����� String���� �ޱ� ���ؼ��� Projection�� �ƴ� QueryResults�� ����ؾ� �մϴ�. Projections.constructor ����� DTO�� �����Ͽ� ��ȯ�ϴ� ����̱� ������ String Ÿ������ ���� ���� �� �����ϴ�.

��� QueryResults�� ����ϸ� List Ÿ������ ����� �޾ƿ� �� ������, �̸� ���� ���ϴ� �ʵ带 String���� ��ȯ�Ͽ� ����Ͻ� �� �ֽ��ϴ�.',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,8,9,null,'������ ���ͼ��Ͱ� �������� �ʴ� �����Դϴ�. �ش� �ڵ带 ���� ��, LoginInterceptor Ŭ���� ���� �ּ� ó���� @Component ������̼��� �ֽ��ϴ�. �� ������̼��� �����ϰ� @Component�� �����غ�����. �̷��� �ϸ� �������� �ش� Ŭ������ ������ ����ϰ� ���ͼ��ͷ� �����ϰ� �˴ϴ�.',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,9,9,null,'@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/*")
                .excludePathPatterns("/login");
    }
}',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,10,10,null,'���� �����ϱ�δ�, �� �ڵ�� Post ��ƼƼ�� title�� content�� PostUpdate req�� title�� content ������ �����ϴ� �޼����Դϴ�.

Editor�� ����ؼ� �����ϴ� �Ͱ��� ���̴�, Editor�� GUI�� ���� ���� ������ �� �ִ� �ݸ�, �� �ڵ�� �ڵ� �󿡼� �� ������ �����մϴ�. ���� �Է� ���Ŀ� ���� �����Ͻø� �˴ϴ�.

�߰�������, �� �ڵ�� ���� �����ڸ� ����� �ڵ��Դϴ�. ���ǹ��� ����� ���� �ٸ� ���� ��ȯ�ϴµ�, �� �ڵ忡�� title�� content �� �� �ϳ��� null�� �ƴ� ��� req�� ������, �׷��� ���� ��� ���� ������ �����ϴ� ���Դϴ�.

���ؿ� ������ �Ǿ��� �ٶ��ϴ�. �����մϴ�!',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,11,11,null,'�ڹ� 9 ���� ���� �⺻ Ŭ�������� ���� �Ǿ��ٰ� �մϴ�. �׷��� �������',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,12,12,null,'�� kim�� or ������ ���� ������ �����ͺ��̽��� ������ ��Ȳ�� ���� �� ������ �� �ֽ��ϴ�. �� �κ��� DB���� ����ȭ ���ΰ� �ٸ��� ������ ������ �����ͺ��̽��� �´� ������ �ʿ��մϴ�. �⺻������ �����ͺ��̽� ���� �÷��� ����, �����ϸ� �� �� �����ϴ�.

������ 2������ �и��ϸ� ������ ������ ���� Ǯ���� ��찡 ���ٴ� ���� �Ϲ����� ��Ȳ�� �����帰 �ſ���.

�̹� ���̽��� ������ �߿��ϴٸ� ó�� �ذ��ϼ̴� �� ó�� �������� Ǫ�� ����, ���� ���� ����̶� �����մϴ�. �׷��鿡�� ����Ƽ�� ������ ���°� �� ���� �����̶� �����մϴ�.

����� ���̹�����Ʈ�� ������ �Ժ�ŷ�� JPQL(HQL)�� ��� ������ �ذ��ϱ� ���ؼ� ���� ���� �ƴ϶�� �߽��ϴ�. ���� �ǹ����� 5% ������ ����Ƽ�� ������ ����ϰ� �ֽ��ϴ�.',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,13,12,null,'QueryDSL�� �ᱹ JPQL�� ����Ǳ� ������, JPQL�� ���࿡ ���̰� �˴ϴ�.

���� ���̹�����Ʈ ����ü�� FROM�̳� JOIN ������ ���������� ���� �� �����ϴ�.(SELECT, WHERE ���� �����մϴ�.)

�׷��� �ƽ��Ե� �ۼ����ֽ� SQL�� JOIN ���� ���������� ���� ������ JPQL�̳� QueryDSL�� �ۼ��ϴ� ���� �Ұ����մϴ�.

�ذ����� ������ �����ϴ�.

1. ������ 2�� ������ �����Ѵ�. (�������� �κ��� ������ JPQL�̳� QueryDSL�� �����ϰ� ����� �޾Ƽ�, �� ����� �Ķ���ͷ� �ѱ�� JPQL�̳� QueryDSL�� �ٽ� �����մϴ�. ���� �� ó�� ������ [2019, 11], [2020,20]�̶�� ����� �ް�, �� ������ �� ���� �Ķ���ͷ� �ѱ�� ������ �����ؼ� ���� ����� �޽��ϴ�.)

2. ����Ƽ�� ������ ����Ѵ�.

3. ������ ���� �ٸ� ������� Ǭ��. (WHERE �������� ���������� �����ϹǷ�)

select name, value from test_entity

where concat(year, value) in (

  select concat(year, max(value))

  from test_entity

  group by year

);',to_date('23/12/20','RR/MM/DD'),null,null);
Insert into CODDY.CREPLY (CREPLY_NO,MEMBER_NO,CBOARD_NO,CREPLY_PARENT,CREPLY_CONTENT,CREPLY_INSERT,CREPLY_UPDATE,CREPLY_DELETE) values (SEQ_CREPLY.NEXTVAL,13,12,null,'CREATE TABLE TEST(ID INT PRIMARY KEY,

   YEAR VARCHAR(4),

   NAME VARCHAR(255),

   VALUE DOUBLE);

COMMIT;

INSERT INTO TEST VALUES(1, ''2019'',''A'', 10);

INSERT INTO TEST VALUES(2, ''2019'',''B'', 11);

INSERT INTO TEST VALUES(3, ''2019'',''C'', 11);

INSERT INTO TEST VALUES(4, ''2020'',''D'', 9);

INSERT INTO TEST VALUES(5, ''2020'',''E'', 20);

COMMIT;

SELECT * FROM TEST;

SELECT TEST1.NAME, TEST1.VALUE

FROM TEST TEST1

INNER JOIN

(SELECT YEAR, MAX(VALUE) VALUE

FROM TEST

GROUP BY YEAR) TEST2

ON TEST1.YEAR = TEST2.YEAR

AND TEST1.VALUE=TEST2.VALUE;

������ �̰� �´��� �𸣰ڴµ�. �ϴ� ������� ������ H2���� ��� �ۼ��߽��ϴ�.

�� ������� 

CLASS TestDto{

 private name;

 private value;

 private year;

}

�� @QueryProjection�� ����ؼ� �����Ϸ� �մϴ�.
',to_date('23/12/20','RR/MM/DD'),null,null);

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

Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (1,8);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (1,6);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (2,6);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (4,1);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (5,6);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (6,6);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (7,43);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (7,6);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (8,6);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (9,9);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (10,8);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (10,9);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (11,6);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (12,6);
Insert into CODDY.CRELATION (CBOARD_NO,TAGS_NO) values (3,24);

-- ���ƾ�
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

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'Enterprise IT���� ���� ������ ����', '<div class="css-1dcto04" style="width: 722px; display: flex; flex-direction: row; -webkit-box-pack: start; justify-content: start; -webkit-box-align: center; align-items: center; gap: 0rem; margin: 0px 0px 8px; color: rgb(33, 37, 42); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif; font-size: 15px; text-align: start;"><h3 class="css-l8sxp3" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 16px; font-stretch: normal; line-height: 1.38; font-weight: bold; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">�ֿ����</h3></div><p class="css-19hzmb1" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-stretch: normal; line-height: 1.63; white-space-collapse: preserve-breaks; text-align: start; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 37, 42);">- ��� Account ���� (������������ ����)
- �� �����Ȳ, ����� ���� Needs �м��� ���� ����߱� ���� ����
- �ű� ������ȸ �߱��� ���� ���� ���� �� ���������� ����
- ������ָ� ���� ����/������Ȳ/��翪�� �ľ� ���� ���� �������� ����
- ��Ʈ�ʿ��� ������ ���� �ű� ���â��</p>', 9, TO_DATE('12-25-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('01-11-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 80000000, 'none', 'middle', '13558');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, '�鿣�� ������ (Python)', '<section class="css-15i1vgz" style="margin-bottom: 28px; color: rgb(33, 37, 42); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif; font-size: 15px; text-align: start;"><p class="css-19hzmb1" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 16px; font-stretch: normal; line-height: 1.63; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">���ַ����Ʈ �鿣�带 �����ϴ� �����
*����ȯ�� : Python, Django Rest Framework, Gunicorn, Celery
* DB : Redis, MySQL
* OS : Ubuntu
* ������ : AWS
* ����� : Gitlab, Sentry, Slack
* �ֿ� Ȱ�� ���̺귯�� : pandas, requests, redis-py</p></section><section class="css-15i1vgz" style="margin-bottom: 28px; color: rgb(33, 37, 42); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif; font-size: 15px; text-align: start;"><div class="css-1dcto04" style="width: 722px; display: flex; flex-direction: row; -webkit-box-pack: start; justify-content: start; -webkit-box-align: center; align-items: center; gap: 0rem; margin: 0px 0px 8px;"><span class="css-12z0wuy" style="margin-right: 8px;"><svg width="18" height="18" fill="none" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M12.057 3.692a.657.657 0 0 1 0 .928l-6.343 6.344a.657.657 0 0 1-.928 0L1.942 8.12a.656.656 0 0 1 .928-.927l2.38 2.38 5.88-5.88a.656.656 0 0 1 .927 0z" fill="#21252a"></path></svg></span><h3 class="css-l8sxp3" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 16px; font-stretch: normal; line-height: 1.38; font-weight: bold; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">�ڰݿ��</h3></div><p class="css-19hzmb1" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 16px; font-stretch: normal; line-height: 1.63; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">? Python, Django Rest Framework�� ����Ͽ� 1�� �̻� ���� ������ ������ ��
? ���ַ����Ʈ �鿣�带 �����ϴ� ������� ����о߿� ���� 3���� �̻��� �׸� ���� ����
? �ֵ������� ���� ã�� ������ �ذ��ϰ� �����ϴ� ��</p></section>', 10, TO_DATE('01-16-2024 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('03-14-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 28000000, 'none', 'junior', '06155');

INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, 'NAVER I&S��/��ȸ�� �� �ι� ���� ä��', '<p><a href="https://www.jobkorea.co.kr/Recruit/GI_Read/43562231?rPageCode=SL&amp;logpath=21" target="_blank">�����Ϸ�����</a><br></p>', 11, TO_DATE('12-02-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('04-20-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 60000000, 'none', 'none', '24376');
INSERT INTO HBOARD(HBOARD_NO, HBOARD_TITLE, HBOARD_CONTENT, COMPANY_NO, HBOARD_START, HBOARD_END, HBOARD_SALARY, HBOARD_EDUCATION, HBOARD_CAREER, HBOARD_LOCATION) VALUES(SEQ_HBOARD.NEXTVAL, '�κ� ���� ���� �ý��� �鿣�� ������ (5�� �̻�)', '<div class="css-1dcto04" style="width: 722px; display: flex; flex-direction: row; -webkit-box-pack: start; justify-content: start; -webkit-box-align: center; align-items: center; gap: 0rem; margin: 0px 0px 8px; color: rgb(33, 37, 42); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif; font-size: 15px; text-align: start;"><h3 class="css-l8sxp3" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 16px; font-stretch: normal; line-height: 1.38; font-weight: bold; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">�ֿ����</h3></div><p class="css-19hzmb1" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-stretch: normal; line-height: 1.63; white-space-collapse: preserve-breaks; text-align: start; word-break: break-all; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 37, 42);">? ������ �κ��� ����Ǿ� ���� � �����Ǵ� "�ָ�ũ" �ý��� �鿣�� ���࿡ �����ؿ�
? ���� ȿ������ ���� ����Ʈ, CI/CD, DevOps�� �Բ� ����ؿ�
? ����� ������ ����Ű�� ���� ����ϸ� ��ǰ�� ������
? ���� ������ ���� �پ��� ����� �Բ� �����ϰ� �⿩�ؿ�</p>', 12, TO_DATE('12-28-2023 00:00:00', 'MM-DD-YYYY HH24:MI:SS'), TO_DATE('01-19-2024 00:00:00','MM-DD-YYYY HH24:MI:SS'), 48000000, 'university', 'middle', '06187');

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
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 7, 'rk02vp1en9--LOR39kpEw.JPG', '941e639b-7349-4266-be04-8859a4292933_rk02vp1en9--LOR39kpEw.JPG', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 8, 'BbXDtD2Ifcq2krqTZiepz.png', 'f2be478c-10e0-4511-a5a9-80ea0c9371e9_BbXDtD2Ifcq2krqTZiepz.png', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 9, 'iHWiBK8K6mb-C3Dm7PHXh.jpg', '3b82204b-575b-48ce-aa00-c9bae0095ded_iHWiBK8K6mb-C3Dm7PHXh.jpg', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 10, 'JK_CO_u3ybwBo22062818070797.png', '68908c5c-f1c9-4354-9aab-bb503f9f1d42_JK_CO_u3ybwBo22062818070797.png', 'resources\file_upload\hboard\', SYSDATE, 1);
INSERT INTO HATTACHMENT VALUES(SEQ_HATTACHMENT.NEXTVAL, 11, 'PRx6kHnJ7ubsNX5MjztaL.png', '6c404b3e-58b7-4d98-a977-b4febacbdda2_PRx6kHnJ7ubsNX5MjztaL.png', 'resources\file_upload\hboard\', SYSDATE, 1);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,2,'����_ȸ��Ұ���.pdf','cae2f8d1-f474-41e1-bda9-cade5349a923_����_ȸ��Ұ���.pdf','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,1,'big-ben-houses-parliament-london-uk.jpg','15585fcc-bb2b-4f91-84c6-14aeb88cca3e_big-ben-houses-parliament-london-uk.jpg','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,3,'API�����ڷ�(������Ʈ��).zip','2e8403bb-abb5-4ee0-8e4c-96b3b7dff5ff_API�����ڷ�(������Ʈ��).zip','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,3,'spring-webmvc-5.3.18.jar','c20c7fb6-7b50-42ae-9b23-1d63687b54d1_spring-webmvc-5.3.18.jar','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,4,'ERD_���ǿ�����.png','5d0332af-5fc0-471e-8ca2-f95978de4a06_ERD_���ǿ�����.png','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,5,'4��_����4����_�ְ�ȣ�� �������Ʈ.pdf','dc89bcfa-7e87-4798-8646-76d8f70111fd_4��_����4����_�ְ�ȣ�� �������Ʈ.pdf','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,6,'putty.exe','e08c8536-93dc-43e6-802a-46f3d2ced02b_putty.exe','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,7,'knn.joblib','4464fc8f-06ba-4f56-873a-0c1e20804294_knn.joblib','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,8,'SlackSetup.exe','c461a8a3-4f5f-454c-8213-22a5318600a4_SlackSetup.exe','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,9,'cuda_10.0.130_win10_network.exe','7d21c490-8ac0-4708-bfad-7bf606336bed_cuda_10.0.130_win10_network.exe','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,10,'KakaoTalk_Setup.exe','c07f5279-5a6c-422b-a8b3-130b8b6739a3_KakaoTalk_Setup.exe','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,11,'2020�г⵵ ����л� ��������.pdf','f863f0ae-36c0-49ff-8590-c2e8b00fb1c9_2020�г⵵ ����л� ��������.pdf','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);
Insert into CODDY.HATTACHMENT (HATTACHMENT_NO,HBOARD_NO,HATTACHMENT_ORIGIN,HATTACHMENT_CHANGE,HATTACHMENT_PATH,HATTACHMENT_INSERT,HATTACHMENT_LEVEL) values (SEQ_HATTACHMENT.NEXTVAL,11,'[����] ���� ���� �� ����Ʈ����  ���� ���̵�.zip','1cc687f5-cecd-4940-a61f-fbb161aa3c71_[����] ���� ���� �� ����Ʈ����  ���� ���̵�.zip','resources\file_upload\hboard\',to_date('23/12/20','RR/MM/DD'),0);

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
INSERT INTO HRELATION VALUES(8, 77);
INSERT INTO HRELATION VALUES(9, 17);
INSERT INTO HRELATION VALUES(9, 18);
INSERT INTO HRELATION VALUES(9, 21);
INSERT INTO HRELATION VALUES(9, 40);
INSERT INTO HRELATION VALUES(9, 43);
INSERT INTO HRELATION VALUES(9, 47);
INSERT INTO HRELATION VALUES(9, 50);
INSERT INTO HRELATION VALUES(9, 95);
INSERT INTO HRELATION VALUES(10, 90);
INSERT INTO HRELATION VALUES(11, 11);
INSERT INTO HRELATION VALUES(11, 16);
INSERT INTO HRELATION VALUES(11, 20);
INSERT INTO HRELATION VALUES(11, 40);
INSERT INTO HRELATION VALUES(11, 43);
INSERT INTO HRELATION VALUES(11, 50);
INSERT INTO HRELATION VALUES(11, 56);

COMMIT;

DROP SEQUENCE SEQ_CALENDAR;

CREATE SEQUENCE SEQ_CALENDAR NOCYCLE;

CREATE TABLE CALENDAR (
	CALENDAR_NO	NUMBER	PRIMARY KEY,
	PROJECT_NO	NUMBER		NOT NULL,
	CALENDAR_TITLE	VARCHAR2(200)		NOT NULL,
	START_POINT	VARCHAR2(50)		NOT NULL,
	END_POINT	VARCHAR2(50)    NOT NULL,
    FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT(PROJECT_NO)
);

COMMIT;

CREATE TABLE RECRUITMENT_STATE (
	RECRUITMENT_NO		NUMBER		NOT NULL,
	ROLE			VARCHAR2(60)	NOT NULL,
	MAX_PERSONNEL		NUMBER		DEFAULT 1 	NOT NULL,
	FOREIGN KEY (RECRUITMENT_NO) REFERENCES RECRUITMENT (RECRUITMENT_NO)
);

Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (1,'BE',2);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (1,'Design',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (2,'ML/AI',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (2,'Project Planner',2);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (1,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (1,'FE',2);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (2,'System Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (2,'Translation',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (3,'DB Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (3,'CDN',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (3,'AOS Developer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (3,'Game Designer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (4,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (4,'Game Developer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (4,'Project Planner',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (4,'UI/UX Planner',2);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (5,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (5,'Network and Server',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (5,'UI/UX Designer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (5,'QA',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (6,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (6,'Game Designer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (6,'Web Publisher',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (7,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (7,'Game Developer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (7,'UI/UX Designer',2);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (8,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (8,'FE',2);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (8,'BE',2);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (8,'UI/UX Planner',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (9,'ML/AI',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (9,'Game Designer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (9,'UI/UX Designer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (10,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (10,'FE',2);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (10,'BE',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (10,'ML/AI',3);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (11,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (12,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (12,'Data Scientist',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (12,'ML/AI',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (13,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (13,'Game Designer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (13,'Web Server Developer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (15,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (15,'CDN',2);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (15,'3D Model',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (15,'UI/UX Planner',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (16,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (16,'ML/AI',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (16,'3D Model',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (16,'Web Server Developer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (19,'Design',2);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (20,'DB Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (20,'CDN',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (19,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (19,'Design',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (20,'3D Model',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (21,'3D Model',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (21,'ML/AI',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (21,'Project Planner',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (21,'UI/UX Designer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (22,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (22,'Network and Server',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (22,'Web Server Developer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (23,'IOS Developer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (23,'AOS Developer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (23,'Project Planner',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (24,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (24,'CDN',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (24,'AOS Developer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (25,'3D Model',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (25,'Project Planner',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (25,'Game Designer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (26,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (26,'Data Scientist',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (26,'Project Planner',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (27,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (27,'UI/UX Planner',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (28,'Project Manager',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (28,'AOS Developer',1);
Insert into CODDY.RECRUITMENT_STATE (RECRUITMENT_NO,ROLE,MAX_PERSONNEL) values (28,'Project Planner',1);

COMMIT;


CREATE TABLE CHAT_MEMBER(
	PROJECT_NO	NUMBER	NOT NULL,
	MEMBER_NO	NUMBER	NOT NULL,
	ROLE		VARCHAR2(60) NOT NULL,
	FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT(PROJECT_NO),
    	FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);
COMMIT;     