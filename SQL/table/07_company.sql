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
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'naveris', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'naveris@coddy.com', 'NAVER I&S��', '���ο�', 0000000008, '<h3 class="various_title" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 38px; line-height: 50px; letter-spacing: -0.76px; color: rgb(0, 0, 0); font-family: Roboto, NanumSquare, ����������, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;Apple SD Gothic Neo&quot;, ����, dotum, arial, sans-serif; text-align: start;">�߿��� ���� �Ƿ°� �µ�</h3><p class="various_text" style="margin: 33px 0px 0px; padding: 0px; font-size: 17px; line-height: 30px; letter-spacing: -0.34px; font-family: NanumSquare, ����������, ����, dotum, arial, sans-serif; text-align: start;">����, ����, ������ �ƴ϶� �Ƿ°� �µ�, ������ �����޽��ϴ�.<br class="pc_block">���̹����̾ؿ����� ����, ����, ���� ���� ���� ü�谡 ���� �����̱⵵ �մϴ�.<br class="pc_block">�������� ������� ����ٸ� ������ ���� �ֵ��� �� �ְ� �� ũ�� ����޽��ϴ�.</p>', 150, 60000000, 'jpg');

COMMIT;