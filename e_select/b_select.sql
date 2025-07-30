select * from `members`;

-- grade 그룹으로 묶어서 갯수 세줘 
select grade, count(*) from `members`
group by
	grade;
    
# 지역별 평균 포인트 계산
select
	area_code, avg(points)
from
	`members`
group by
	area_code;
    
# having - group by와 함께 사용! 
# 인원이 2명 이상인 등급 조회
select grade, count(*) from `members`
group by grade
having count(*) >=2;

# 지역 평균 포인트가 200이 넘는 지역 조회
select 
	area_code, avg(points)
from 
	`members`
group by
	area_code
having 
	avg(points) > 200;
    
# 데이터 정렬
select * from `members`;

select * from `members`
order by
	join_date;
    
select * from `members`
order by
	name desc;
    
select * from `members`
order by
	grade desc, points desc;
    
select * from `members`;
select * from `members`
limit 5;

select * from `members`
limit 5 offset 2;

select * from `members`
order by
	grade desc
limit 3;

select distinct area_code from `members`;
select distinct grade from `members`;


