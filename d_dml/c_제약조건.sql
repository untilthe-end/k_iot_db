### d_dml >>> c_제약조건 ###

/*
	1. PK(primary key) - 중복 X(고유값) & 비워둘 수 없음(null 허용 X)
    2. FK(foreign key) - 다른 테이블의 PK값을 참조하는 컬럼 (테이블 간의 연결)

	3. Unique
    : 특정 열의 값이 중복되면 안됨
    - null 허용 가능 (비워둘 수 있음)
    - 한 테이블에 여러 개 지정 가능 
    EX) 아이디, 이메일, 주민번호 등에 사용
*/

create table `users` (
	user_id bigint primary key,
    usernmae varchar(100) unique,
    passowrd varchar(100),
    email varchar(100) unique,
    resident_nubmer varchar(100) unique
);

insert into `users`
values
	(1, 'qwe123', 'qwe123123', 'qwe123@example.com', '123456');

-- insert into `users`
-- values
-- 	(2, 'wer234', 'wer234234', 'qwe123@example.com', '654321');
# Duplicate entry 'qwe123@example.com' for key 'users.email'	0.000 sec

insert into `users`
values
	(2, 'wer234', 'wer234234', null, '654321');
-- unique는 null값 삽입 가능!

/*
	4. Check 제약 조건
    : 입력 값이 특정 조건을 만족해야만 삽입    
*/

create table employees (
	employee_id bigint primary key,
    name varchar(100),
    age int, 
    # check 제약 조건 사용 방법
    # check(조건 작성 - 조건식은 다양한 연산자 사용)
    check(age >= 20)
);

insert into `employees`
values
	(1, '이상은', 30),
	(2, '홍기수', 20),
-- (3, '배혜진', 10), 
	(4, '김태양', 30);
# Error Code: 3819. Check constraint 'employees_chk_1' is violated.

insert into `employees`
values
	(5, '안미향', null); -- check 제약 조건은 null 여부 확인 X

/*
	5. NOT NULL 제약 조건
    : 특정 열에 NULL 값을 허용하지 X
    - 비워질 수 X
*/
create table `contacts` (
	contact_id bigint primary key, -- PK은 자동 not null  
    name varchar(100) not null,
    phone varchar(100) not null
);

insert into `contacts`
values
	(1, '권민현', '010-1111-2222'),
	-- (2, '김세훈', null);
	(2, '김세훈', '010-2222-3333');
# Error Code: 1048. Column 'phone' cannot be null

/*
	6. default 제약조건
	: 테이블의 열에 값이 입력되지 않으면 자동으로 기본값을 넣어주는 제약 조건
    - 선택적 필드에 대한 입력을 단순화 (데이터 무결성 유지)
*/

create table `carts` (
	cart_id bigint primary key,
    product_name varchar(100),
    # default 제약조건 
    # 컬럼명 데이터타입 default 기본값(데이터타입 지키기!)
	quantity int default 1
);

insert into `carts`
values
	(1, '노트북', 3),
    (2, '스마트폰', null),
    (3, '태블릿', 2);
    -- default 설정 컬럼을 비워둘 수는 없음! 
    -- null값 입력 시 null 값이 지정 가능 (기본값 설정 X)
    
select * from `carts`;
    
# default 값 사용 방법
# 컬럼 자체에 값 대입 X
insert into `carts`
values
	# carts의 컬럼을 정의 순서대로 데이터 전달
    # : quantity 수량을 제외한 데이터를 전달할 경우
    #		> 테이블 명 옆에 (삽입하고자 하는 컬럼명만 나열)
	();
    
insert into `carts` (cart_id, product_name)
values
	(4, '이어폰'),
    (5, '스마트폰');
    
select * from `carts`;
    
# ----------------------------------------- #
# +) 제약 조건 사용 시 여러 개 동시 지정 가능
# EX) NOT NULL + CHECK
create table `multiple` (
	multiple_col int not null check(multiple_col > 10)
);

insert into `multiple`
values 
	(11);








    
    

