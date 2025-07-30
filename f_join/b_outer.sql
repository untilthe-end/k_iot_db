-- 2. 외부 조인 (OUTER JOIN)
# : 한쪽 테이블에만 존재하는 데이터까지도 결과로 포함하는 조인 방식
# : 조건에 일치하지 않아도 기준 테이블의 행은 모두 출력
# - 일치하지 않는 열 NULL로 채워짐

# cf) 외부 조인 종류
# 1) LEFT OUTER JOIN - 제일 중요!!! 
# 	- 기준 테이블의 위치(왼쪽, FROM 뒤 테이블)
# 	- 포함 범위(왼쪽 테이블의 모든 행 + 매칭된 오른쪽 테이블)

# 2) RIGHT OUTER JOIN
# 	- 기준 테이블 위치(오른쪽, JOIN 뒤 테이블)
# 	- 포함 범위(오른쪽 테이블의 모든 행 + 매칭된 왼쪽 테이블)

# 3) FULL OUTER JOIN
# 	- 양쪽 모두, 두 테이블의 모든 행
# 	- MySQL 직접 지원 x

### 외부 조인 기본 형태 ###
/*
	SELECT 열 목록
    FROM 기준 테이블 별칭
		LEFT | RIGHT OUTER JOIN 조인할 테이블
        ON 조인될 조건
        
	[WHERE 조건식 ...];
    
    cf) OUTER 키워드 생략 가능 - LEFT JOIN, RIGHT JOIN으로도 사용 가능
*/

# 외부 조인 예제 1#
# : 왼쪽 테이블의 모든 레코드와 오른쪽 테이블의 매칭되는 레코드만 포함
SELECT
	M.member_id, M.name, P.product_code, M.area_code
FROM 
	`members` M -- 모두 출력
    LEFT OUTER JOIN `purchases` P
    On M.member_id = P.member_id;
    
# 외부 조인 예제 2 #
# : 오른쪽 테이블의 내용을 모두 출력
SELECT
	M.member_id, M.name, P.product_code, M.area_code
FROM
	`purchases` P
    RIGHT OUTER JOIN `members` M
    On M.member_id = P.member_id;
    
## left = right 는 똑같은 값 ~

# 외부 조인 예제 3 #
SELECT 
	M.member_id, P.product_code, M.name, M.contact
FROM
	`members` M -- 기준 테이블
	LEFT JOIN `purchases` P
    ON M.member_id = P.member_id
where
	P.product_code is null; -- null은 연산 불가 (=, != 사용 x)
    
# cf) MySQL은 FULL OUTER JOIN 지원 X
# 	 	>> UNION으로 대체

## 외부 조인 사용 시 주의점 ##
# 1) 기준 테이블 위치: LEFT JOIN의 경우 왼쪽 테이블 기준 (FROM 뒤의 테이블)
# 2) OUTER 키워드 생략 가능 (LEFT JOIN | RIGHT JOIN)
# 3) IS NULL 조건: 외부 조인 후 일치하지 않는 데이터를 찾을 때 사용 (차집합)

