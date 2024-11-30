CREATE OR REPLACE PACKAGE BODY pkg_keszlet IS

  FUNCTION get_keszlet(fn_bolt_id   IN NUMBER
                      ,fn_termek_id IN NUMBER) RETURN VARCHAR2 IS
  
    fn_bolt_nev          VARCHAR2(250);
    fn_termek_megnevezes VARCHAR2(250);
    fn_keszlet           NUMBER;
    fn_eredmeny          VARCHAR2(500);
  
  BEGIN
    BEGIN
      SELECT b.nev
            ,t.megnevezes
            ,bt.keszlet
      
        INTO fn_bolt_nev
            ,fn_termek_megnevezes
            ,fn_keszlet
      
        FROM bolt_termek bt
        JOIN bolt b
          ON b.id = bt.bolt_id
        JOIN termek t
          ON t.id = bt.termek_id
       WHERE fn_bolt_id = bt.bolt_id
         AND fn_termek_id = bt.termek_id;
         
    EXCEPTION
      WHEN no_data_found THEN
        RAISE termek_nem_forgalmazott_exc;
    END;
  
    fn_eredmeny := ' Bolt nev: ' || fn_bolt_nev || ' Termek megnevezes: ' ||
                   fn_termek_megnevezes || ' Keszlet(db): ' || fn_keszlet;
  
    RETURN fn_eredmeny;
  
  EXCEPTION
    WHEN termek_nem_forgalmazott_exc THEN
      raise_application_error(-20100, 'Termek nincs forgalmazva');
    
  END get_keszlet;

  PROCEDURE keszlet_feltoltes(p_bolt_id   IN NUMBER
                             ,p_termek_id IN NUMBER
                             ,p_keszlet   IN NUMBER) IS
  
    pr_keszlet  NUMBER;
    pr_egysegar NUMBER;
  
  BEGIN
    
    IF p_keszlet <= 0
    THEN
      RAISE pkg_keszlet.hibas_adat_exc;
    END IF;
    
    BEGIN
      SELECT bt.keszlet
            ,bt.egysegar
        INTO pr_keszlet
            ,pr_egysegar
      
        FROM bolt_termek bt
      
       WHERE bt.bolt_id = p_bolt_id
         AND bt.termek_id = p_termek_id;
    
      UPDATE bolt_termek bt
         SET bt.keszlet = pr_keszlet + p_keszlet
       WHERE bt.bolt_id = p_bolt_id
         AND bt.termek_id = p_termek_id;
    
    EXCEPTION
      WHEN no_data_found THEN
      
        SELECT bt.egysegar
          INTO pr_egysegar
          FROM bolt_termek bt
         WHERE bt.termek_id = p_termek_id;
      
        INSERT INTO bolt_termek
          (bolt_id
          ,termek_id
          ,egysegar
          ,keszlet)
        VALUES
          (p_bolt_id
          ,p_termek_id
          ,pr_egysegar
          ,p_keszlet);
    END;
  
  EXCEPTION
    WHEN pkg_keszlet.hibas_adat_exc THEN
      raise_application_error(-20101, 'Hiba');
    
  END keszlet_feltoltes;

END pkg_keszlet;
