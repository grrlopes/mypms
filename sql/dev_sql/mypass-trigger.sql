use mypass;
/*
TRIGGER QUE GRAVA OS SERVIDORES MODIFICADOS NA TABELA HISTÓRICO
*/
DROP TRIGGER servidor_audit_alt;
DELIMITER //
CREATE TRIGGER servidor_audit_alt 
    BEFORE update ON servidor
    FOR EACH ROW
BEGIN
insert into historico_servidor (
hostname, id_pais, serial,
id_os, endereco_ip,
id_tipo_servidor,
id_ambiente, id_setor,
id_local, id_setor_descricao,
id_usuario, acao, data) values 
(old.hostname, old.id_pais, old.serial, old.id_os, 
old.endereco_ip, old.id_tipo_servidor, old.id_ambiente, 
old.id_setor, old.id_local, old.id_setor_descricao,(select @tmploginalt),'Alterado', now());
set @tmploginalt = null;
END //
DELIMITER ;
/* VERSAO 2
TRIGGER QUE GRAVA OS SERVIDORES MODIFICADOS NA TABELA HISTÓRICO
*/
DROP TRIGGER servidor_audit_alt;
DELIMITER //
CREATE TRIGGER servidor_audit_alt 
    BEFORE update ON servidor
    FOR EACH ROW
BEGIN
insert into historico_servidor (
hostname, id_pais, serial,
id_os, endereco_ip,
id_tipo_servidor,
id_ambiente, id_setor,
id_local, id_setor_descricao,
id_usuario, acao, data) values 
(old.hostname, old.id_pais, old.serial, old.id_os, 
(select ip_chaveado from rede_aux where id_servidor = old.id), old.id_tipo_servidor, old.id_ambiente, 
old.id_setor, old.id_local, old.id_setor_descricao,(select @tmploginalt),'Alterado', now());
END //
DELIMITER ;

DROP TRIGGER servidor_audit_del;
DELIMITER //
CREATE TRIGGER servidor_audit_del 
    BEFORE delete ON servidor
    FOR EACH ROW
BEGIN
insert into historico_servidor (
hostname, id_pais, serial, 
id_os, endereco_ip, 
id_tipo_servidor, 
id_ambiente, id_setor, 
id_local, id_setor_descricao, 
id_usuario, acao, data) values 
(old.hostname, old.id_pais, old.serial, old.id_os, 
old.endereco_ip, old.id_tipo_servidor, old.id_ambiente, 
old.id_setor, old.id_local, old.id_setor_descricao,(select @tmplogindel),'Removido', now());
set @tmplogindel = null;
END //
DELIMITER ;

/*
DROP TRIGGER app_audit_del;
DELIMITER //
CREATE TRIGGER app_audit_del
    BEFORE delete ON app 
    FOR EACH ROW
BEGIN
insert into historico_app (
id_app_modelo, comentario, id_login, senha, 
id_tipo_app, id_historico_servidor, id_ambiente, id_usuario, acao) 
values
(old.id_app_modelo, old.comentario, old.id_login, old.senha, old.id_tipo_app, 
h_idservidor(), old.id_ambiente, (select @tmpapplogindel), 'Removido');
set @tmpapplogindel = null;
END //
DELIMITER ;
*/

/* Ao atualizar registro da tabela app, o mesmo será inserido na tabela 
historico_app, junto com o servidor, que será inserido na tabela historico_servidor */
DROP TRIGGER app_audit_alt;
DELIMITER //
CREATE TRIGGER app_audit_alt
    BEFORE update ON app 
    FOR EACH ROW
BEGIN
declare idd int;
select id_servidor into idd from app where id = old.id;
call happdel(@_hostname, @_id_pais, @_serial, @_id_os, @_endereco_ip, 
@_id_tipo_servidor, @_id_ambiente, @_id_setor, @_id_local, @_id_setor_descricao, idd);
insert into historico_servidor (
hostname, id_pais, serial, 
id_os, endereco_ip, 
id_tipo_servidor, 
id_ambiente, id_setor, 
id_local, id_setor_descricao, 
id_usuario, acao, data) values 
(@_hostname, @_id_pais, @_serial, @_id_os, @_endereco_ip, 
@_id_tipo_servidor, @_id_ambiente, @_id_setor, @_id_local, 
@_id_setor_descricao, (select @tmpbizuloginalt), 'subRegistro', now());

insert into historico_app (
id_app_modelo, comentario, id_login, senha, 
id_tipo_app, id_historico_servidor, id_ambiente, id_usuario, acao) 
values
(old.id_app_modelo, old.comentario, old.id_login, old.senha, old.id_tipo_app, 
h_idservidor(), old.id_ambiente, (select @tmpbizuloginalt), 'Alterado');
set @tmpappbizuloginalt = null;
END //
DELIMITER ;
/* VERSAO 2
Ao atualizar registro da tabela app, o mesmo será inserido na tabela 
historico_app, junto com o servidor, que será inserido na tabela historico_servidor */
DROP TRIGGER app_audit_alt;
DELIMITER //
CREATE TRIGGER app_audit_alt
    BEFORE update ON app 
    FOR EACH ROW
BEGIN
declare idd int;
select id_servidor into idd from app where id = old.id;
call happdel(@_hostname, @_id_pais, @_serial, @_id_os,@_id_tipo_servidor, 
@_id_ambiente, @_id_setor, @_id_local, @_id_setor_descricao, idd);
insert into historico_servidor (
hostname, id_pais, serial, 
id_os, endereco_ip, 
id_tipo_servidor, 
id_ambiente, id_setor, 
id_local, id_setor_descricao, 
id_usuario, acao, data) values 
(@_hostname, @_id_pais, @_serial, @_id_os, 
(select ip_chaveado from rede_aux where id_servidor = old.id_servidor), 
@_id_tipo_servidor, @_id_ambiente, @_id_setor, @_id_local, 
@_id_setor_descricao, (select @tmpbizuloginalt), 'subRegistro', now());

insert into historico_app (
id_app_modelo, comentario, login, senha, 
id_tipo_app, id_historico_servidor, id_ambiente, id_usuario, acao) 
values
(old.id_app_modelo, old.comentario, old.login, old.senha, old.id_tipo_app, 
h_idservidor(), old.id_ambiente, (select @tmpbizuloginalt), 'Alterado');
END //
DELIMITER ;

/* Ao remover registro da tabela app, o mesmo será inserido na tabela 
historico_app, junto com o servidor, que será inserido na tabela historico_servidor */
DROP TRIGGER app_audit_del; /* DROPEI 28/09/2016 PARA FINS TESTE */
DELIMITER //
CREATE TRIGGER app_audit_del
    BEFORE delete ON app 
    FOR EACH ROW
BEGIN
declare idd int;
select id_servidor into idd from app where id = old.id;
call happdel(@_hostname, @_id_pais, @_serial, @_id_os, @_endereco_ip, 
@_id_tipo_servidor, @_id_ambiente, @_id_setor, @_id_local, @_id_setor_descricao, idd);
insert into historico_servidor (
hostname, id_pais, serial, 
id_os, endereco_ip, 
id_tipo_servidor, 
id_ambiente, id_setor, 
id_local, id_setor_descricao, 
id_usuario, acao, data) values 
(@_hostname, @_id_pais, @_serial, @_id_os, @_endereco_ip, 
@_id_tipo_servidor, @_id_ambiente, @_id_setor, @_id_local, 
@_id_setor_descricao, (select @tmpuserbizudel), 'subRegistro', now());

insert into historico_app (
id_app_modelo, comentario, id_login, senha, 
id_tipo_app, id_historico_servidor, id_ambiente, id_usuario, acao) 
values
(old.id_app_modelo, old.comentario, old.id_login, old.senha, old.id_tipo_app, 
h_idservidor(), old.id_ambiente, (select @tmpuserbizudel), 'Removido');
END //
set @tmpuserbizudel = null;
DELIMITER ;

/* VERSAO 2
Ao remover registro da tabela app, o mesmo será inserido na tabela 
historico_app, junto com o servidor, que será inserido na tabela historico_servidor */
DROP TRIGGER app_audit_del;
DELIMITER //
CREATE TRIGGER app_audit_del
    BEFORE delete ON app 
    FOR EACH ROW
BEGIN
declare idd int;
declare _user varchar(45);
select id_servidor into idd from app where id = old.id;
if(select @tmpuserbizudel is not null) then 
	select @tmpuserbizudel into _user;
end if;
call happdel(@_hostname, @_id_pais, @_serial, @_id_os, @_id_tipo_servidor, 
@_id_ambiente, @_id_setor, @_id_local, @_id_setor_descricao, idd);
insert into historico_servidor (
hostname, id_pais, serial, 
id_os, endereco_ip, 
id_tipo_servidor, 
id_ambiente, id_setor, 
id_local, id_setor_descricao, 
id_usuario, acao, data) values 
(@_hostname, @_id_pais, @_serial, @_id_os, 
(select ip_chaveado from rede_aux where id_servidor = idd), 
@_id_tipo_servidor, @_id_ambiente, @_id_setor, @_id_local, 
@_id_setor_descricao, @tmpuserbizudel, 'subRegistro', now());

insert into historico_app (
id_app_modelo, comentario, login, senha, 
id_tipo_app, id_historico_servidor, id_ambiente, id_usuario, acao) 
values
(old.id_app_modelo, old.comentario, old.login, old.senha, old.id_tipo_app, 
h_idservidor(), old.id_ambiente, @tmpuserbizudel, 'Removido');
END //
DELIMITER ;

/* VERSAO 1
Fazendo trigger redes */
DROP TRIGGER rede_audit_alt;
DELIMITER //
CREATE TRIGGER rede_audit_alt
    BEFORE update ON rede 
    FOR EACH ROW
BEGIN
if @tr_salverede is null then
call happdel(@_hostname, @_id_pais, @_serial, @_id_os,@_id_tipo_servidor, 
@_id_ambiente, @_id_setor, @_id_local, @_id_setor_descricao, old.id_servidor);
insert into historico_servidor (
hostname, id_pais, serial, 
id_os, endereco_ip, 
id_tipo_servidor, 
id_ambiente, id_setor, 
id_local, id_setor_descricao, 
id_usuario, acao, data) values 
(@_hostname, @_id_pais, @_serial, @_id_os, 
(select ip_chaveado from rede_aux where id_servidor = old.id_servidor), 
@_id_tipo_servidor, @_id_ambiente, @_id_setor, @_id_local, 
@_id_setor_descricao, 1, 'subRegistro', now());
insert into historico_rede(id_rede_fisica, id_rede_nat, id_rede_tipo, 
id_rede_nivel, id_rede_subnivel, id_historico_servidor, acao)
value((select ip_fisico from rede_fisica where id = @_tmpfisico),
(select ip_nat from rede_nat where id = @_tmpnat),@_tmptipo,
 @_tmpnivel, @_tmpsubnivel, last_insert_id(), 'Alterado');
end if;
END //
DELIMITER ;

/* VERSAO 2
Fazendo trigger redes */
DROP TRIGGER rede_audit_alt;
DELIMITER //
CREATE TRIGGER rede_audit_alt
    BEFORE update ON rede 
    FOR EACH ROW
BEGIN
if @tr_salverede is null OR @tr_cadredes is not null then
call happdel(@_hostname, @_id_pais, @_serial, @_id_os,@_id_tipo_servidor, 
@_id_ambiente, @_id_setor, @_id_local, @_id_setor_descricao, old.id_servidor);
insert into historico_servidor (
hostname, id_pais, serial, 
id_os, endereco_ip, 
id_tipo_servidor, 
id_ambiente, id_setor, 
id_local, id_setor_descricao, 
id_usuario, acao, data) values 
(@_hostname, @_id_pais, @_serial, @_id_os, 
(select ip_chaveado from rede_aux where id_servidor = old.id_servidor), 
@_id_tipo_servidor, @_id_ambiente, @_id_setor, @_id_local, 
@_id_setor_descricao, (select id from usuario where login = @tr_salveredelogin), 'subRegistro', now());
insert into historico_rede(rede_fisica, rede_nat, id_rede_tipo, 
id_rede_nivel, id_rede_subnivel, id_historico_servidor, acao)
value(@_tmpfisico, @_tmpnat, 
(select id from rede_tipo where tipo = @_tmptipo), 
(select id from rede_nivel where nivel = @_tmpnivel), 
(select id from rede_subnivel where subnivel = @_tmpsubnivel), last_insert_id(), 'Alterado');
end if;
set @tr_cadredes = null;
END //
DELIMITER ;

DROP TRIGGER rede_audit_del;
DELIMITER //
CREATE TRIGGER rede_audit_del
    BEFORE delete ON rede 
    FOR EACH ROW
BEGIN
call happdel(@_hostname, @_id_pais, @_serial, @_id_os,@_id_tipo_servidor, 
@_id_ambiente, @_id_setor, @_id_local, @_id_setor_descricao, old.id_servidor);
insert into historico_servidor (
hostname, id_pais, serial, 
id_os, endereco_ip, 
id_tipo_servidor, 
id_ambiente, id_setor, 
id_local, id_setor_descricao, 
id_usuario, acao, data) values 
(@_hostname, @_id_pais, @_serial, @_id_os, 
(select ip_chaveado from rede_aux where id_servidor = old.id_servidor), 
@_id_tipo_servidor, @_id_ambiente, @_id_setor, @_id_local, 
@_id_setor_descricao, (select id from usuario where login = tr_delredelogin), 'subRegistro', now());
insert into historico_rede(rede_fisica, rede_nat, id_rede_tipo, 
id_rede_nivel, id_rede_subnivel, id_historico_servidor,acao)
value((select ip_fisico from rede_fisica where id = old.id_rede_fisica),
(select ip_nat from rede_nat where id = old.id_rede_nat),old.id_rede_tipo,
old.id_rede_nivel,old.id_rede_subnivel, last_insert_id(), 'Removido');
END //
DELIMITER ;


CREATE temporary TABLE IF NOT EXISTS `mypass`.`tmp_altrede` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_rede_fisica` VARCHAR(45) NULL,
  `id_rede_nat` VARCHAR(45) NULL,
  `id_rede_tipo` INT NULL,
  `id_rede_nivel` INT NULL,
  `id_rede_subnivel` INT NULL,
  `id_historico_servidor` INT NULL,
  `acao` VARCHAR(40) NULL,
  PRIMARY KEY (`id`));