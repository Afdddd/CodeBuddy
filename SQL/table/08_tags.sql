DROP TABLE TAGS;
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
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Secure', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Block Chain', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'QA', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'R/D', 1, 1);
INSERT INTO TAGS VALUES(SEQ_TAGS.NEXTVAL, 'Marketing/Sale', 1, 1);

COMMIT;