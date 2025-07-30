USE korea_db;
select * from `members`;
select * from `purchases`;

SELECT * 
FROM `members` M
	 join `purchases` P
	 on M.member_id = P.member_id
     