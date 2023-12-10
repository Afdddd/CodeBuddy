DROP TABLE COMPANY;
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

INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY) VALUES(SEQ_COMPANY.NEXTVAL, 'company', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'company@coddy.com', 'company', '���ο�', 8164700297, 'company����', 23, 46000000);
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY) VALUES(SEQ_COMPANY.NEXTVAL, 'enliple', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'enliple@coddy.com', '�ζ�����', '�Ѱ���', 0000000001, '�� ȸ�� Ȩ������ : http://www.enliple.com/', 201, 50000000);
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY) VALUES(SEQ_COMPANY.NEXTVAL, 'nhnkcp', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'nhnkcp@coddy.com', 'NHN KCP', '���ؼ�', 0000000002, 'NHN KCP�� ���ڰ������� ����, �¡��������� ī�� VAN ����, ����� ���� ���� �� ���� ������ ���հ��� ���� ������ ���Ͽ�
���ڰ��� ����� ���� ���۴϶�� �ںν� �ӿ� �����ϰ� ���� ������ �����ϱ� ���� ����ϰ� �ֽ��ϴ�.

�̿� �� ���ư� NHN KCP�� ���� �¡����������� ������ O2O ���� �ý��� ���� �� �۷ι� ���ڻ�ŷ� ����� ���� �޺��ϴ� ���ڰ��� ���忡 ���������� �����԰� ���ÿ� ���ο� �ؿܽ��� ��ô���� �ּ��� ���ϰ� �ֽ��ϴ�.

�ֱ� ���� ���ڰ��� ���忡�� ȭ�η� ������ ������� �о߿�����, NHN KCP�� ö���� ���� �غ�� �������� �ؿ� ������ PG�� ��� ����� ������ �� �� �ִ� �۷ι� ���ڰ��� ��ü�� ������ ���� Ȯ���մϴ�.

"���� ����� �������۴� ������ġ���ѱ����̹������� �Բ� ���� ����� ��ȭ�� ������ ������ �����ִ� ���縦 ��ٸ��ϴ�."', 201, 72000000);
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY) VALUES(SEQ_COMPANY.NEXTVAL, 'soomgo', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'soomgo@coddy.com', 'Soomgo', 'KIM ROBIN H', 0000000003, '(��)�극�̺������� ����Ǹ��߰��ڷμ� ����Ǹ��� ����ڰ� �ƴϸ� ���� �Ǹ��ڰ� �����ϴ� ���񽺿� ���� ����, ������ ��� ������ �ǹ��� å���� �ŷ�����ڿ��� �ֽ��ϴ�.', 51, 60000000);

COMMIT;