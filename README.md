# Code Buddy
<br>

진행기간: 2023년 11월 10일 → 2023년 12월 20일

🔗Links
<br>

---
![title](https://github.com/Afdddd/CodeBuddy/assets/109032883/1a3d33f8-4668-434c-93b7-07eb3005b9b4)
<br>

# 📖프로젝트 소개

---
<br>
Coddy란 Code 와 Buddy의 합성어로 프로젝트 개발을 위한 팀 모집 사이트입니다.

사용자가 보다 쉽게 프로젝트에 참여하고 다양한 프로젝트를 개발할 수 있는 사이트를 구현 하는것을 목표로 두었습니다.

Coddy에서 제공하는 **핵심 기능**들 입니다.

1. 관심분야에 맞는 프로젝트에 원하는 직군으로 지원하기 기능
2. 자신의 관심 분야와 기술 스택에 맞는 프로젝트 검색 기능
3. 프로젝트를 효율적으로 진행할수 있는 프로젝트 대기방
4. 다양한 기업들의 채용공고 제공
5. 정보를 공유하고 소통할 수 있는 커뮤니티 기능

<br>

# 🛠 기술 스택

---
Java, Spring, Maven, MyBatis, Javascript, Jsp

<br>
<br>


# 💡 아키텍처 / ERD

---

![coddy drawio](https://github.com/Afdddd/CodeBuddy/assets/109032883/419c8205-d2d4-4f2a-a2b2-1af37636d1fa)

<br>

![erd](https://github.com/Afdddd/CodeBuddy/assets/109032883/fbd6d504-1757-4cf2-8cc3-50b42d9f02a3)
🔗Link https://www.erdcloud.com/d/xeA8PWwQkF7TvK7iD


<br>

# 📜프로젝트 기능

---
<br>

- **1.** **회원 관련 기능**
    - 일반용 회원 가입
    - 기업용 회원 가입
    - 로그인 & 로그아웃
    - 카카오 로그인
    - 아이디 & 비밀번호 찾기
    - 프로필 이미지 조회,수정
    - 작성한 게시글 조회
    - 참여한 프로젝트 조회
    - 찜한 채용공고 조회, 삭제
    - 신고기능

<br>

- **2. 모집 게시판**
    - 게시판 CRUD
    - 프로젝트 검색
    - 신규 프로젝트 및 인기 프로젝트top3를 조회 기능
    - 프로젝트 모집 지원 및 현황 조회 기능
    - 프로젝트에 참여한 팀원 프로필 조회 기능
    - 프로젝트 현황 조회(모집중, 진행중) 기능
    - 조회수, 좋아요 기능

<br>

- **3. 코드리뷰 게시판**
    - 게시판 CRUD
    - 코드블럭 및 다양한 툴을 이용한 게시글 작성
    - 댓글 CRUD

<br>

- **4. 자유 & 공지게시판**
    - 게시글 CRUD
    - 댓글 CRUD

<br>

- **5. 소개 게시판**
    - 게시글 CRUD
    - 댓글 CRUD

<br>

- **6. 채용 공고 게시판**
    - 게시글 CRUD
    - 다양한 검색 조건(경력,학력, 지역, 기술, 직군, 모집중 )으로 채용공고 검색 기능
    - 최신순, 마감순, 조회순, 연봉순으로 정렬 기능
    - 찜하기, 조회수 기능
    - 회사 위치 조회 기능
    - 사업번호를 통한 채용공고 등록

<br>

- **7. 프로젝트 대기실**
    - 입장 제한 기능
    - 실시간 채팅기능
    - 카카오 맵을 이용한 만남 장소 선정 및 길찾기 기능
    - FullCalendar를 이용한 프로젝트 일정 관리 기능
    - 대기실 참여한 인원 조회 기능
    - 프로젝트 카운트다운 조회기능
    - 추방하기 기능

<br>

- **8. 관리자 페이지**
    - 회원관리
    - 게시글 관리
    - 사용 기술/직군 태그 관리
    - 신고 관리

<br>

## 서비스 화면

- **모집 게시판 전체 조회**
    
    ![recuritment](https://github.com/Afdddd/CodeBuddy/assets/109032883/3a20f66a-bed4-4138-924a-b717f592639a)

    
- **다양한 검색 조건(직군, 기술, 제목, 작성자, 모집중)과 ajax를 이용한 비동기 검색할 수 있습니다.**
    
    ![search](https://github.com/Afdddd/CodeBuddy/assets/109032883/ab805331-267f-49ec-9669-045a9d439693)

- **프로젝트에서 사용하는 기술과 포지션을 쉽게 확인 가능합니다.**
    
    ![skillposition](https://github.com/Afdddd/CodeBuddy/assets/109032883/9c6aef4b-0bad-4a3f-b583-7a8532d57d08)

    
<br>

### 프로젝트 대기실

- **지원하기 기능**
    
   ![recruit](https://github.com/Afdddd/CodeBuddy/assets/109032883/4b841228-c253-45c2-9ae1-3fb5f2356a42)

- **실시간 채팅 기능**
    
    ![chat](https://github.com/Afdddd/CodeBuddy/assets/109032883/56a70859-4178-4eab-99a7-459c015b2d30)
    
- **악성 유저 추방 기능**
    
    ![exile](https://github.com/Afdddd/CodeBuddy/assets/109032883/090750c1-9945-4c8d-b067-ed36129c9108)
    
- **Full-Calenadar를 활용한 일정관리 기능**
    
   ![calendar](https://github.com/Afdddd/CodeBuddy/assets/109032883/988e63f9-2a63-4617-aa57-67a5f223689c)
    
- **Kakao Map을 활용한 만남 장소 정하기 기능**
    
    ![map7](https://github.com/Afdddd/CodeBuddy/assets/109032883/91590482-a169-44ee-8e65-e54f6657317d)

    
### 코드리뷰 게시판
![codereview](https://github.com/Afdddd/CodeBuddy/assets/109032883/93f3d07d-2aa1-4018-ad0f-92dfad330f9b)


### 채용공고 게시판
![공고](https://github.com/Afdddd/CodeBuddy/assets/109032883/fba0ff62-8380-4b38-97a3-89bae383bdae)



