CREATE OR REPLACE TYPE ty_bolt_statisztika AS OBJECT
(
  bolt_nev                 VARCHAR2(250),
  forgalmazott_termek_szam NUMBER,
  raktarkeszlet_ertek      NUMBER
)
;
