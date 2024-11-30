insert into bolt (NEV, CIM)
values ('Aqua', '1117 Budapest, Karinthy Frigyes út 17. ');

insert into bolt (NEV, CIM)
values ('iPon', '1134 Budapest, Tüzér utca 13. ');

insert into termek (MEGNEVEZES, RESZLETEK)
values ('AMD Ryzen 7 5700X', 'AMD Ryzen 7 5700X processzor hûtõ nélkül.');

insert into termek (MEGNEVEZES, RESZLETEK)
values ('INTEL Core i3-12100F', 'INTEL Core i3-12100F 3.30GHz 1700 dobozos processzor Intel hûtõ ventilátorral.');

insert into termek (MEGNEVEZES, RESZLETEK)
values ('SAMSUNG 500GB 870 EVO', 'Samsung 500 GB SSD');

insert into bolt_termek (BOLT_ID, TERMEK_ID, EGYSEGAR, KESZLET)
values ((select b.id from bolt b where b.nev = 'iPon'), (select t.id from termek t where t.megnevezes = 'AMD Ryzen 7 5700X'), 70990, 16);

insert into bolt_termek (BOLT_ID, TERMEK_ID, EGYSEGAR, KESZLET)
values ((select b.id from bolt b where b.nev = 'iPon'), (select t.id from termek t where t.megnevezes = 'INTEL Core i3-12100F'), 37490, 14);

insert into bolt_termek (BOLT_ID, TERMEK_ID, EGYSEGAR, KESZLET)
values ((select b.id from bolt b where b.nev = 'iPon'), (select t.id from termek t where t.megnevezes = 'SAMSUNG 500GB 870 EVO'), 15991, 4);

insert into bolt_termek (BOLT_ID, TERMEK_ID, EGYSEGAR, KESZLET)
values ((select b.id from bolt b where b.nev = 'Aqua'), (select t.id from termek t where t.megnevezes = 'AMD Ryzen 7 5700X'), 69000, 0);

insert into bolt_termek (BOLT_ID, TERMEK_ID, EGYSEGAR, KESZLET)
values ((select b.id from bolt b where b.nev = 'Aqua'), (select t.id from termek t where t.megnevezes = 'SAMSUNG 500GB 870 EVO'), 17230, 10);
