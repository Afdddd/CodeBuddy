# -*- coding: utf-8 -*- 
import random
import numpy as np

result = ''
password = '$2a$10$J1rPzY5.J8mb8DhHjnv4t.ncEytRQ2Y5ejOCU2Tdcrtv3mI30YR5q'
first_names = ['시큐어', '블랙', '오가닉', '워터', '에코', 'ABC', '홈', '코인', '프로', '프라임', '골드', '쇼셜', '비전', '리프레쉬', '나인', '빅', '나노', '씨드', '넥스트', '그로우', '애즈', '미스터', '블루', '아이', '스마일', '글로벌', '스파이더', '모더', '전자', '디에스', '프로텍트', '브이', '세이', '아이피', '네이티브']
last_names = ['플랜트', '가든', '트레이드', '가이드', '스터디', '화학', '데코', '유니버셜', '병원', '랩스', '쇼핑', '테크', '리서치', '네트워크', 'CD', '테이크아웃', '디자인', '뷰티', '건설', '조합', '코퍼레이션', '주식회사', '컴퍼니', '모바일', 'cs', '투어', '바이오', '파트너스', '전자', '케어', '솔루션']
for i in range(11, 100):
    result = result + 'INSERT INTO COMPANY(COMPANY_NO, COMPANY_ID, COMPANY_PWD, COMPANY_EMAIL, COMPANY_NAME, COMPANY_OWNER, COMPANY_BNO, COMPANY_INFO, COMPANY_WORKER, COMPANY_SALARY, COMPANY_PHOTO_EXTEND) VALUES(SEQ_COMPANY.NEXTVAL, \'company' + ((str)(i)).zfill(4) + '\', \'' + password + '\', \'company' + ((str)(i)).zfill(4) + '@coddy.com\', \'' + first_names[random.randint(0, len(first_names)-1)] + ' ' + last_names[random.randint(0, len(last_names)-1)] + '\', \'김인엽\', ' + ((str)(i)).zfill(4) + ', null, 50, 28000000, null);\n'
result = result + '\nCOMMIT;'
print(result)