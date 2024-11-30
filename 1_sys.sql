DECLARE
  user_count NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO user_count
    FROM dba_users t
   WHERE t.username = 'apad';
  IF user_count = 1
  THEN
    EXECUTE IMMEDIATE 'drop user apad cascade';
  END IF;
END;

CREATE USER apad 
identified BY 123 
DEFAULT tablespace users 
quota unlimited ON users;

grant CREATE session TO apad;
grant CREATE PROCEDURE TO apad;
grant CREATE TABLE TO apad;
grant CREATE view TO apad;
grant CREATE sequence TO apad;
grant CREATE TRIGGER TO apad;
grant CREATE TYPE TO apad;
