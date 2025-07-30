USE `baseball_league`;
SELECT * FROM `players`;
SELECT * FROM `teams`;

# 1
SELECT *
FROM `players`
WHERE
	year(birth_date) > 1990;

# 2
SELECT * FROM `players`
WHERE 
	position = '외야수' and year(birth_date) <= 1995;
	
# 3
SELECT * FROM `players`
order by
	 birth_date;
     
# 4
SELECT * FROM `teams`
ORDER BY
	founded_year;

# 5 
SELECT DISTINCT name from `teams`; -- 데이터 삽입 순서로 출력
# 6
SELECT DISTINCT position from `players`;

# 7

select position, count(*) player_count
from `players`
group by
	position
having
	player_count >= 2; # alias 별칭 값으로 조건 처리 가능 (그룹화 시)