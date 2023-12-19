# -*- coding: utf-8 -*- 
import random
import numpy as np

result = ''
password = '$2a$10$x30BjSzHW9D8hEjGewA.oOgTSBo0qFx/i.W4rIaOhkvUSNXoqHxsG'
first_names = '김이박최강구기공노남나라류마문서성신소송손유윤우은지조주한하홍차'
last_names = '가강건경고관광구규근기길나남노누다단달담대덕도동두라래로루리마만명무문미민바박백범별병보사산상새서석선설섭성세소솔수숙순숭슬승시신아안애엄여연영예오옥완요용우원월위유윤율으은의이익인일자잔장재전정제조종주준중지진찬창채천철초춘충치탐태택판하한해혁현형혜호홍화환회효훈휘희운모배부림봉혼황량린을비솜공면탁온디항후려균묵송욱휴언들견추걸삼열웅분변양출타흥겸곤번식란더손술반빈실직악람권복심헌엽학개평늘랑향울련'
for i in range(13, 100):
    result = result + 'INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_EMAIL, MEMBER_NAME) VALUES(SEQ_MEMBER.NEXTVAL, \'user' + ((str)(i)).zfill(2) + '\', \'' + password + '\', \'user' + ((str)(i)).zfill(2) + '@coddy.com\', \'' + first_names[random.randint(0, len(first_names)-1)] + last_names[random.randint(0, len(last_names)-1)] + last_names[random.randint(0, len(last_names)-1)] + '\');\n'
result = result + '\nCOMMIT;'
print(result)