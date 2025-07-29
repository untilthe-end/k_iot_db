CREATE DATABASE `my_review`;
USE `my_review`;

CREATE TABLE `users` (
	user_id bigint primary key,
    username varchar(100) unique,
    password varchar(100),
    email varchar(100) unique,
    resident_number varchar(100) unique
);

desc `users`;
INSERT INTO `users`
values
	(1, 'qwe123', 'qwe123123', 'qwe123@example.com', '123456');

INSERT INTO `users`
values
	(2, 'qwe123', 'qwe123123', 'qwe123@example.com', '123456');
    
/*
	PK(primary key) - 중복 x(고유값) & 비워둘 수 없음(null 허용 x)
    
    FK(foreign key) - 다른 테이블의 pk값을 참조하는 컬럼 (테이블 간의 연결)
    
	Unique
    : 특정 열의 값이 중복되면 안됨 
    : email, 주민번호 
    - null 허용 가능 (비워둘 수 있음)
    - 한 테이블에 여러개 지정 가능
    
*/