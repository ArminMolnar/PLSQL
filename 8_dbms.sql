DECLARE
  bolt_list ty_bolt_statisztika_l;

BEGIN
  bolt_list := ty_bolt_stat_func();
  FOR i IN 1 .. bolt_list.count
  LOOP
    dbms_output.put_line('Bolt nev: ' || bolt_list(i).bolt_nev ||
                         ' Forgalmazott termekek szama: ' || bolt_list(i)
                         .forgalmazott_termek_szam ||
                         ' Raktarkeszlet erteke: ' || bolt_list(i)
                         .raktarkeszlet_ertek);
  END LOOP;
END;
