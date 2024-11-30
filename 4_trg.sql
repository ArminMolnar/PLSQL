CREATE OR REPLACE TRIGGER bolt_seq_trg
  BEFORE INSERT ON bolt
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := bolt_seq.nextval;
  END IF;
END;

CREATE OR REPLACE TRIGGER termek_seq_trg
  BEFORE INSERT ON termek
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := termek_seq.nextval;
  END IF;
END;

CREATE OR REPLACE TRIGGER bolt_termek_seq_trg
  BEFORE INSERT ON bolt_termek
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := bolt_termek_seq.nextval;
  END IF;
END;
