create table bolt (
       id number primary key,
       nev varchar2(250) not null,
       cim varchar2(500) not null
       )tablespace users;

create table termek (
       id number primary key,
       megnevezes varchar2(250),
       reszletek varchar2(2000)
       )tablespace users;

create table bolt_termek (
       id number primary key,
       bolt_id number not null,
       termek_id number not null,
       egysegar number not null,
       keszlet number not null
       )tablespace users;
       
       
       alter table bolt_termek
       add constraint bolt_fk foreign key (bolt_id) references bolt(id);
       
       alter table bolt_termek
         add constraint termek_fk foreign key (termek_id) references termek(id);
         
         alter table bolt_termek
         add constraint egyedi_bolt_termek unique (bolt_id, termek_id);
           
         
         select * from bolt;
         select * from termek;
         select * from bolt_termek;
         
         delete from bolt_termek where id = 10010;
         
