CREATE OR REPLACE FUNCTION ty_bolt_stat_func RETURN ty_bolt_statisztika_l IS

  bolt_list ty_bolt_statisztika_l;

BEGIN
  SELECT ty_bolt_statisztika(b.nev,
                             COUNT(DISTINCT bt.termek_id),
                             SUM(bt.egysegar * bt.keszlet))
  
    BULK COLLECT
    INTO bolt_list
  
    FROM bolt_termek bt
    JOIN bolt b
      ON b.id = bt.bolt_id
    JOIN termek t
      ON t.id = bt.termek_id
  
   GROUP BY b.nev;
  RETURN bolt_list;

END;
