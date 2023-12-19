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

성장하고 싶은 모든 사람들이 더 나아지는 과정에 인프런이 보탬이 되기를 바랍니다.
당신의 성장을 늘 응원하겠습니다.', 51, 120000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'flitto', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'flitto@coddy.com', '플리토', '이정수', 2158772878, '플리토는 유수의 글로벌 IT 기업들과 함께 언어 장벽 없는 세계를 만들어 가고 있는 언어 플랫폼 기업입니다.', 51, 120000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'lottehealthcare', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'lottehealthcare@coddy.com', '롯데헬스케어 주식회사', '우웅조', 0000000005, '<p><span style="color: rgb(33, 37, 41); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" sans-serif;="" text-align:="" start;="" white-space-collapse:="" preserve-breaks;"="">"Every Moment of your Healthy Life"</span></p><p><img src="resources\file_upload\company\content\778f3f02-6b5d-4633-965c-e9939711f8d9_qEMEoqnOTP3AWWoKgtP8y.jpg" style="width: 384px;"><span style="color: rgb(33, 37, 41); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, " helvetica="" neue",="" "segoe="" ui",="" "apple="" sd="" gothic="" neo",="" "noto="" sans="" kr",="" "malgun="" gothic",="" sans-serif;="" text-align:="" start;="" white-space-collapse:="" preserve-breaks;"=""><br></span></p>', 51, 62000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'skcc', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'skcc@coddy.com', 'SK(주) C&C', '윤풍영', 0000000006, '<h2 class="css-3o07cf" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 20px; font-weight: bold; font-stretch: normal; line-height: 1.4; letter-spacing: -0.3px; margin: 24px 0px 16px; white-space-collapse: preserve-breaks; word-break: break-all; color: rgb(33, 37, 41); text-align: start;">회사 정보</h2><div style="color: rgb(33, 37, 41); font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, sans-serif; font-size: 15px; text-align: start;"><p class="css-1dpg5zy" style="margin: 0px; font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 16px; font-stretch: normal; white-space-collapse: preserve-breaks; overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; word-break: break-all; display: -webkit-box; line-height: 26px; -webkit-line-clamp: unset;">2025년 사업가치 50조의 Global Top 10 ICT Company
Vison Slogan
Creative ICT Factory</p></div>', 1000, 80000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'solutionquant', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'solutionquant@coddy.com', '솔루션퀀트', '김윤서', 0000000007, '<h2 class="css-17h254d" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-size: 20px; font-weight: bold; font-stretch: normal; line-height: 1.4; letter-spacing: -0.3px; white-space-collapse: preserve-breaks; word-break: break-all; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(33, 37, 42); text-align: start;">솔루션퀀트, 어떤 곳인가요?</h2><p class="css-19hzmb1" style="font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans KR&quot;, &quot;Malgun Gothic&quot;, sans-serif; font-stretch: normal; line-height: 1.63; white-space-collapse: preserve-breaks; text-align: start; word-break: break-all; margin: 0px; color: rgb(33, 37, 42);">"데이터와 시스템 기반의 투자"

솔루션퀀트는 수 많은 데이터(정형/비정형, 퍼블릭/프라이빗)와 전문적인 퀀트 시스템을 기반으로 투자하는 회사입니다.
솔루션퀀트의 운용엔진은 펀드매니저 역량에 의존하는 전통적인 운용 방식에서 벗어나 데이터를 통해 운용하는 방식으로 설계되어 있습니다.
데이터를 투자자산에 맵핑(Mapping)하고 클렌징, 최적화, 테스팅을 통해 투자하는 100% Systematic Hedge Fund를 지향합니다.</p>', 5, 28000000, 'jpg');
INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, 'naveris', '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q', 'naveris@coddy.com', 'NAVER I&S㈜', '김인엽', 0000000008, '<h3 class="various_title" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 38px; line-height: 50px; letter-spacing: -0.76px; color: rgb(0, 0, 0); font-family: Roboto, NanumSquare, 나눔스퀘어, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;Apple SD Gothic Neo&quot;, 돋움, dotum, arial, sans-serif; text-align: start;">중요한 것은 실력과 태도</h3><p class="various_text" style="margin: 33px 0px 0px; padding: 0px; font-size: 17px; line-height: 30px; letter-spacing: -0.34px; font-family: NanumSquare, 나눔스퀘어, 돋움, dotum, arial, sans-serif; text-align: start;">나이, 연차, 직급이 아니라 실력과 태도, 의지로 인정받습니다.<br class="pc_block">네이버아이앤에스에 과장, 차장, 부장 등의 직급 체계가 없는 이유이기도 합니다.<br class="pc_block">전문성과 영향력을 갖췄다면 누구나 일을 주도할 수 있고 더 크게 보상받습니다.</p>', 150, 60000000, 'jpg');

COMMIT;