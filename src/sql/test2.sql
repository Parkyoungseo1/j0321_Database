show tables;

create table insarok (
	idx 		int not null auto_increment primary key, /* 고유번호 */
	buser 	varchar(10) not null,									 /* 부서명 */
	name 		varchar(20) not null, 									 /* 부서명(성명) */
	jikwi 	varchar(10) not null default '사원', 	 /* 직위 */
	gender 	char(2) not null default '남자',  		 /* 성별 */
	age 		int default 25,                        	 /* 나이 */
	ipsail 	datetime not null default now(),      /*입사일(기본값:오늘날짜)*/
	address varchar(50)                          /* 주소(공백 허용) */  
	/*primary key(idx)*/
);
desc insarock;
--drop table insarok;

insert into insarok values (default,'인사과','홍길동','과장',default,38,'1991-1-5','서울');
insert into insarok values (default,'총무과','김말숙','부장',default,45,'2012-2-6','청주');
insert into insarok values (default,'영업과','이기자','사원',default,24,'2015-3-5','서울');
insert into insarok values (default,'자재과','강감찬','대리',default,38,'1993-4-5','부산');
insert into insarok values (default,'인사과','소나무','사원',default,45,'1855-5-7','서울');
insert into insarok values (default,'총무과','오하늘','과장',default,38,'1994-6-5','인천');
insert into insarok values (default,'영업과','탁민아','부장',default,45,'2005-1-8','울산');
insert into insarok values (default,'자재과','이재희','과장',default,21,'1996-1-5','서울');
insert into insarok values (default,'인사과','김기자','과장',default,89,'1995-7-5','경기');
insert into insarok values (default,'영업과','이순신','부장',default,38,'2007-1-5','제주');
insert into insarok values (default,'총무과','고인돌','과장',default,65,'2008-8-9','대전');
insert into insarok values (default,'자재과','나도야','사원',default,38,'1999-1-11','서울');
insert into insarok values (default,'총무과','홍길자','사장',default,37,'2004-9-10','충남');
insert into insarok values (default,'자재과','가나다','과장',default,38,'1995-1-5','서울');
insert into insarok values (default,'총무과','나다라','회장',default,38,'1990-10-5','고성');
insert into insarok values (default,'인사과','다라마','대리',default,36,'1956-1-5','전북');
insert into insarok values (default,'총무과','대나무','과장',default,38,'1977-11-30','전남');
insert into insarok values (default,'인사과','최민영','비서',default,20,'1988-1-15','서울');
insert into insarok values (default,'자재과','아사마','과장',default,38,'1789-2-5','강릉');
insert into insarok values (default,'총무과','오미자','비서',default,33,'1655-12-16','서울');
insert into insarok values (default,'총무과','피자파','과장',default,38,'1974-1-5','대천');

select * from insarok;

-- insarok테이블의 성명/직위/주소 필드만 모든 자료 표시?
select name,jikwi,address from insarok;

-- 홍길동 레코드만 출력
select * from insarok where name='홍길동';

-- 서울에 사는 홍길동 레코드만 출력
select * from insarok where adress='서울'and name='홍길동';

--  홍길동 사원만 출력?
select * from insarok where name='홍길동' and jikwi='사원';

--  서울에 사는 모든 사람 출력?
select * from insarok where address='서울';

--  서울에 살지않는 직원?
select * from insarok where address != '서울';
select * from insarok where address <> '서울';

--  입사년도가 2000년 이전에 입사한 직원을 보여주세요?
select * from insarok where ipsail < '2000-1-1';

--  입사년도가 2000년~2010년 입사한 직원을 보여주세요?
select * from insarok where ipsail >= '2000-1-1' and ipsail <= '2010-12-31';
-- 앞의 범위 연산자 대신에 between~and 변경가능
select * from insarok where ipsail between '2000-1-1' and '2010-12-31';

--30대 회사원 출력?
select * from insarok where age >=30 and age <= 39;
select * from insarok where age between 30 and 39;

-- 서울/부산 에 사는 직원?
select * from insarok where address='서울' or address='부산';
-- 앞의 or 연산자는 in()으로 변경가능
select * from insarok where address in('서울','부산');

-- 서울/부산에 사는 사원만 출력
select * from insarok where jikwi='사원' and address in('서울','부산');

-- '김'씨만 출력 (like 사용하기)
select * from insarok where name like '김%';

-- '나무'로 끝나는 이름을 가진 직원 출력?
select * from insarok where name like '%나무';

--'이규혁을'을 '이재혁'으로 이름 변경?
update insarok set name='이재혁' where name='이규혁';
update insarok set name='가재다' where name='가나다';
update insarok set name='재다라' where name='나다라';

-- 이름중에서 '재' 란 글자를 직원의 직급을 '과장'으로 변경하시오?
select * from insarok where name like '%재%';
update insarok set jikwi='과장' where name like '%재%';

--이름중 2번째 글자가 '나'인 직원은?
select * from insarock where name like '_나%';

-- 이름중에서 '재' 란 글자를 직원 중에서 '서울'에 사는 직원의  이름과 입사일과 주소?
select name,ipsail,address from insarok where name like '%재%' and address='서울';

-- 이름중에서 '재' 란 글자를 직원 중에서 '서울'에 사는 직원중 나이가 40이상인 직원을 퇴사시키시오.?
select * from insarok where name like '%재%' and address='서울';
delete from insarok where name like '%재%' and address='서울' and age >=40;

-- '이재희' 성별을 '여자'로 변경?
update insarok set gender='여자' where name='이재희';

--이름 오른차순으로 출력?(순서 : order by ~~ , 오름차순: asc(생략가능), 내림차순: desc)
select * from insarok order by name;
select * from insarok order by name desc;

-- 남자인 자료중에서 나이 오름차순으로 출력 ?
select * from insarok where gender='남자' order by age;

-- 남자인 자료중에서 나이 오름차순으로, 같은 나이면 입사일 내림차순 출력 ?
select * from insarok where gender='남자' order by age, ipsail desc;

-- 전제자료중 5명만 출력하시오. (입력순서중 앞에서 5개)
select * from insarok limit 5;

-- 뒤에서 5명 (나중에 입력한 회원)만 출력?
select * from insarok order by idx desc limit 5;

-- 남자회원 5면만 나이 내림차순으로 보여주시오.(limit 출력개수)
select * from insarok where gender='남자' order by age desc limit 5;

-- 남자회원중에서 앞에서 2명빼고, 5명만 출력하시오? (limit 인덱스번호, 출력개수)
select * from insarok where gender='남자' order by idx limit 2,5;