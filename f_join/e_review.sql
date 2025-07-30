# 1 테이블 하나로 합치기
SELECT * 
FROM `members` M
	JOIN `purchases` P
    ON M.member_id = P.member_id;

# 2 조인된 결과에서 남성 회원만 필터링
SELECT * 
FROM `members` M
	JOIN `purchases` P
    ON M.member_id = P.member_id
WHERE 
	M.gender = 'Male';

# 3 필터링 된 남성 회원데이터를 지역코드를 기준으로 그룹화
SELECT M.area_code '지역 코드', sum(P.amount) '총 구매금액', count(distinct M.member_id) '회원 수'
FROM `members` M
	JOIN `purchases` P
    ON M.member_id = P.member_id
WHERE 
	M.gender = 'Male'
GROUP BY
	M.area_code;
    
# 4 남은 데이터에서 HAVING 조건 부여 (그룹화 된 데이터에 조건식 사용)
SELECT M.area_code '지역 코드', sum(P.amount) '총 구매금액', count(distinct M.member_id) '회원 수'
FROM `members` M
	JOIN `purchases` P
    ON M.member_id = P.member_id
WHERE 
	M.gender = 'Male'
GROUP BY
	M.area_code
having
	sum(P.amount) >= 30000;
    
# + 추가 조건 order by, limit
SELECT M.area_code '지역 코드', sum(P.amount) '총 구매금액', count(distinct M.member_id) '회원 수'
FROM `members` M
	JOIN `purchases` P
    ON M.member_id = P.member_id
WHERE 
	M.gender = 'Male'
GROUP BY
	M.area_code
having
	sum(P.amount) >= 30000
order by
	sum(P.amount) desc
limit 1;