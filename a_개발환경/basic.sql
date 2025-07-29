-- MySQL 주석처리
-- 1) 주석
-- 2) 한줄 주석: 하이픈 2개 or 샾 1개

-- 이 쿼리는 모든 데이터베이스를 보여줌
SHOW DATABASES;
# 안녕하세요 주석입니다
 
/*
	줄수에　관계없이　주석처리　가능
*/

SHOW DATABASES;

-- === 2. 글자 크기 변경 ===
-- 1) CTRL + 마우스 휠 위/아래

-- 2) Edit > Preferences > Fonts & Colors 

-- === 3. 명령어 대소문자 설정 ===
-- : 문법의 대소문자 구분 x
--  >> 일관성 있는 작성을 권장!
--  1) 명령어(문법)는 대문자
--  2) 테이블 & 컬럼명 소문자 

show databases; -- MySQL Workbench는 소문자 자동완성 기본
SHOW DATABASES;

-- 대문자 변환 단축키: ctrl + shift + u
-- Edit > Format > UPCASE(대문자) / lowercase(소문자) keywords

-- === 4. 단축키 ===
# 파일 저장: ctrl + s
# 한 줄 복사: ctrl + d
# 한 줄 삭제: ctrl + l
# 새로운 SQL 탭 생성: ctrl + t
