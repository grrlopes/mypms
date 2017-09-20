use mypass;
DROP function h_idservidor;
DELIMITER //
CREATE FUNCTION h_idservidor() RETURNS INT DETERMINISTIC
BEGIN
DECLARE h_servidor INT;
SET h_servidor = (SELECT id FROM historico_servidor ORDER BY id DESC LIMIT 1);
if h_servidor is null then
	SET h_servidor = 1;
	RETURN h_servidor;
else
	RETURN h_servidor;
end if; 
END //
DELIMITER ;

select h_servidor();