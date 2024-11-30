CREATE OR REPLACE PACKAGE pkg_keszlet IS

  termek_nem_forgalmazott_exc EXCEPTION;
  PRAGMA EXCEPTION_INIT(termek_nem_forgalmazott_exc, -20100);

  hibas_adat_exc EXCEPTION;
  PRAGMA EXCEPTION_INIT(hibas_adat_exc, -20101);

  FUNCTION get_keszlet(fn_bolt_id   IN NUMBER
                      ,fn_termek_id IN NUMBER) RETURN VARCHAR2;

  PROCEDURE keszlet_feltoltes(p_bolt_id   IN NUMBER
                             ,p_termek_id IN NUMBER
                             ,p_keszlet   IN NUMBER);

END pkg_keszlet;
