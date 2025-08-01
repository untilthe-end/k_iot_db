#  1) 내부 조인(INNER JOIN)
#	: 조건에 일치하는 데이터만 결합 (교집합)
#   - 정확히 일치하는 데이터만 보고 싶을 때

use korea_db;
select * from members;
select * from purchases;
# 내부 조인 예제1 #
# : 특정 회원이 구매한 상품 확인
select * from purchases
where member_id = 1;

# +) 해당 특정 회원의 정보까지 포함 (내부 조인 필요)
select * 
from purchases P
	join members M
    on P.member_id = M.member_id
where 
	P.member_id = 1;


# 내부 조인 예제 2 #
# : 금액이 20000원 이상인 모든 구매 내역 조회 
select * from purchases
where 
	amount >= 20000;

# +) 회원 이름, 구매 날짜, 금액
select 
	M.name '회원 이름', P.purchase_date '구매 날짜', P.amount '금액'
from 
	purchases P
    join members M
    on P.member_id = M.member_id --
where amount >=20000;

# 내부 조인 예제 3 #
# 회원별 총 구매 금액을 내림차순 정렬
select M.name, sum(P.amount) -- 집계함수 쓸때는 group by 써야함!!
from purchases P
	join members M
	on P.member_id = M.member_id
group by
	M.name -- 회원별로 묶어서 
order by
	sum(P.amount) desc;
    
# 내부 조인 예제 4 #
# : 구매 이력이 있는 회원만 조회    
select distinct M.name, M.contact -- contact 연락처 가져오면 동명이인 이여도 구분 가능 
from purchases P
	join members M
	on P.member_id = M.member_id




