# korea_db 에서 구매 금액(amount)가 가장 높은 회원의
# member_id, name, 총 구매 금액을 조회
use korea_db;
select * from `members`;
select * from `purchases`;

-- '집계함수' 를 쓸때는 group by 에 넣어야 한다.
select M.member_id, M.name, SUM(P.amount) '총 금액'
from `members` M
	Join `purchases` P
    on M.member_id = P.member_id -- 두 테이블에서 공통적으로 들어있는 속성 
group by
	M.member_id -- 각 회원들이 몇개를 구매했는지 알고싶다고 하니까 그렇게 묶어야함.
order by 
	sum(P.amount) desc
limit
1;