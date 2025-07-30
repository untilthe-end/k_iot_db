USE korea_db;


#1. 기본 조회 
select `name` from `korea_db`.`members`;

# 전체 컬럼 조회
select * from `korea_db`.`members`;
select * from `korea_db`.`purchases`;

# 두 개 이상의 컬럼 조회 , 
select 
	`member_id`, `name`, `gender`
from
	`members`;
    
# alias 별칭 부여 조회
select
	`member_id` '고유 번호', `name` '회원 이름', `contact` '회원 연락처' -- as 생략 가능
from 
	`members`;
    
## 2. 특정 조건에 부합하는 데이터 조회
select
	`member_id`, `name`, `points`
from
	`members`
where
	points > 200;

# 1) 관계 연산자
select * from `members` 
where 
	name = 'Minji';

# 2) 논리 연산자
select * from `members`
where
	area_code = 'Jeju' and points >= 400;
    
select * from `members`
where
	area_code = 'Busan' or area_code = 'Seoul';

select * from `members`
where
	not area_code = 'Busan';
    
select * from `members`
where 
	points = null;
    
select * from `members`
where
	points is null;
    
select * from `members`
where
	points is not null;
    
# between A and B (숫자, 날짜형 데이터)
select * from `members`
where
	points between 200 and 400;
    
select * from `members`
where
	join_date between '2021-12-31' and '2022-01-09';

# in 연산자 (지정된 리스트 중에서 일치하는 값 있으면 true)
select * from `members`
where 
	area_code in('Seoul', 'Busan', 'Jeju');
    
select * from `members`;

select * from `members`
where
	 name like 'J%';
     
select * from `members`
where
	name like 'J___';
    
select * from `members`
where
	name like '%un%';
    
select * from `members`
where
	name like '_u%';
    
select * from `members`
where 
	name like '____';
    
select * from `members`
where
	join_date > '2022-01-02';
    
select * from `members`
where
	year(join_date) = '2024';
     
select * from `members`
where
	join_date < curdate();
     
select curdate();
select now();
     
    