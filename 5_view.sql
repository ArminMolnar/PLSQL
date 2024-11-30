create or replace view view_bolt_data as

       select b.nev as bolt_nev,
              t.megnevezes as termek_nev,
              bt.egysegar as egysegar,
              (select min(bt2.egysegar)
              from bolt_termek bt2
              where bt2.termek_id = bt.termek_id) as legkisebb_ar
       from bolt_termek bt
       join bolt b
       on b.id = bt.bolt_id
       join termek t
       on t.id = bt.termek_id;
       
       select * from view_bolt_data
       order by termek_nev;
