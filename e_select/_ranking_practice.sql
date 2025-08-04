create database if not exists ranking_db;
use ranking_db;

create table brands (
	brand_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    brand_name varchar(100) not null
    );

create table products(
	product_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_name varchar(100) not null,
    price int not null,
    brand_id BIGINT,
	
    FOREIGN KEY (brand_id) references brands(brand_id) ON DELETE CASCADE 
);

-- 브랜드 데이터
insert into brands (brand_name)
values
	('삼성전자'),
	('애플'),
	('LG전자');
    
-- 상품 데이터
insert into products (product_name, price, brand_id) 
values
	-- 삼성전자 제품
    ('랠럭시 S24 Ultra', 1450000, 1),
    ('랠럭시 Z Fold5', 1990000, 1),
    ('랠럭시 Watch 6', 450000, 1),
    ('랠럭시 Buds 2 Pro', 200000, 1),
    ('랠럭시 Tab s10', 2450000, 1),
    ('랠럭시 Book 4 Pro', 3500000, 1),
    
    -- 애플 제품
    ('iPhone 15 Pro Max', 189000, 2),
    ('iPhone 15 mini', 1300000, 2),
    ('MacBook Pro 17', 3890000, 2),
    ('AirPods Pro 3', 390000, 2),
    ('Apple Watch 3', 1090000, 2),
    ('Mac Mini M2', 890000, 2),
    
	-- LG 전자 제품
    ('LG Gram 18', 2300000, 3),
    ('LG OLED TV', 5000000, 3),
    ('LG 퓨리케어 공기청정기', 850000, 3),
    ('LG 코드제로 청소기', 1100000, 3),
    ('LG 스탠바이미', 530000, 3),
    ('LG 트롬 오브제컬렉션', 2850000, 3);

select * from brands;
select * from products;

### 브랜드별 최고가 Top3 상품 추출 ###

# 서브쿼리 #
SELECT 
	# 각 브랜드 그룹 내에서 가격이 가장 비싼 상품의 순위를 매김
    ROW_NUMBER() OVER(PARTITION BY B.brand_id order by P.price DESC) as `number`,
    B.brand_id,
    B.brand_name, 
    P.product_name,
    P.price 
FROM 
	brands B
    join products P
    ON B.brand_id = P.brand_id; # 어떤 브랜드가 어떤 상품을 보유하고 있는지 연결

### 전체 쿼리 ###
SELECT * 
FROM(
	SELECT 
	# 각 브랜드 그룹 내에서 가격이 가장 비싼 상품의 순위를 매김
		ROW_NUMBER() OVER(PARTITION BY B.brand_id order by P.price DESC) as `number`,
		B.brand_id,
		B.brand_name, 
		P.product_name,
		P.price 
FROM 
	brands B
		join products P
		ON B.brand_id = P.brand_id # 어떤 브랜드가 어떤 상품을 보유하고 있는지 연결
) ranked_products
where                                                                                                                                                                            
	ranked_products.number <= 3
order by
	ranked_products.brand_id, ranked_products.`number`;


