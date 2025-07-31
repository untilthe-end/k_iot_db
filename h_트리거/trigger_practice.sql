USE `baseball_league`;

SELECT * FROM players;
SELECT * FROM teams;

-- 로그 테이블 생성 (문제1)
 create table if not exists player_delete_logs(
	log_id INT auto_increment PRIMARY KEY,
    player_name varchar(100),
    deleted_time datetime
 );
 
-- 로그 테이블 생성 (문제2)
 create table if not exists player_position_logs(
	log_id INT auto_increment PRIMARY KEY,
    player_name varchar(100),
    old_position varchar(20),
    new_position varchar(20),
    changed_time datetime
 );
 
select * from player_delete_logs;
-- 기존 트리거 삭제
drop trigger if exists after_player_delete;
 
-- 트리거 생성
delimiter $$ 
create trigger after_player_delete
	after delete
    on players   -- delete 가 이루어진 다음 , 아래 것을 하여라 
    for each row 
begin
	insert into player_delete_logs (player_name, deleted_time) 
    values
		(OLD.name, now());
end $$
delimiter ;
 

 -- 기존 트리거 삭제
 drop trigger if exists after_player_position_update;
 
 -- 트리거 생성
delimiter $$ 
create trigger after_player_position_update
		after update
        on players
        for each row
begin
	if OLD.position != NEW.position then
			insert into player_position_logs (player_name, old_position, new_position, changed_time)
            values (NEW.name, OLD.position, NEW.position, now());
	end if;
 end $$
 delimiter ;
 

