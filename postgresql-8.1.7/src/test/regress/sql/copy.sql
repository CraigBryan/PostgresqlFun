--
-- COPY
--

-- CLASS POPULATION
--	(any resemblance to real life is purely coincidental)
--
COPY aggtest FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/agg.data';

COPY onek FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/onek.data';

COPY onek TO '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/results/onek.data';

DELETE FROM onek;

COPY onek FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/results/onek.data';

COPY tenk1 FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/tenk.data';

COPY slow_emp4000 FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/rect.data';

COPY person FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/person.data';

COPY emp FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/emp.data';

COPY student FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/student.data';

COPY stud_emp FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/stud_emp.data';

COPY road FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/streets.data';

COPY real_city FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/real_city.data';

COPY hash_i4_heap FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/hash.data';

COPY hash_name_heap FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/hash.data';

COPY hash_txt_heap FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/hash.data';

COPY hash_f8_heap FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/hash.data';

-- the data in this file has a lot of duplicates in the index key
-- fields, leading to long bucket chains and lots of table expansion.
-- this is therefore a stress test of the bucket overflow code (unlike
-- the data in hash.data, which has unique index keys).
--
-- COPY hash_ovfl_heap FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/hashovfl.data';

COPY bt_i4_heap FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/desc.data';

COPY bt_name_heap FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/hash.data';

COPY bt_txt_heap FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/desc.data';

COPY bt_f8_heap FROM '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/data/hash.data';

--- test copying in CSV mode with various styles
--- of embedded line ending characters

create temp table copytest (
	style	text,
	test 	text,
	filler	int);

insert into copytest values('DOS',E'abc\r\ndef',1);
insert into copytest values('Unix',E'abc\ndef',2);
insert into copytest values('Mac',E'abc\rdef',3);
insert into copytest values(E'esc\\ape',E'a\\r\\\r\\\n\\nb',4);

copy copytest to '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/results/copytest.csv' csv;

create temp table copytest2 (like copytest);

copy copytest2 from '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/results/copytest.csv' csv;

select * from copytest except select * from copytest2;

truncate copytest2;

--- same test but with an escape char different from quote char

copy copytest to '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/results/copytest.csv' csv quote '''' escape E'\\';

copy copytest2 from '/Users/katdrobnjakovic/Dev/CSI3130Project/postgresql-8.1.7/src/test/regress/results/copytest.csv' csv quote '''' escape E'\\';

select * from copytest except select * from copytest2;


-- test header line feature

create temp table copytest3 (
	c1 int, 
	"col with , comma" text, 
	"col with "" quote"  int);

copy copytest3 from stdin csv header;
this is just a line full of junk that would error out if parsed
1,a,1
2,b,2
\.

copy copytest3 to stdout csv header;

