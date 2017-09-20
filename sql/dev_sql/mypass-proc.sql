/* Cadastra os login na tabela app relacionada ao servidor.*/
drop procedure bizucr;
DELIMITER //
CREATE PROCEDURE bizucr(IN vapp_modelo varchar(255), IN vcomentario TEXT(150),
IN vlogin varchar(255), IN vsenha varchar(255), IN vtipo_app varchar(255),
IN vservidor INT, IN vnivel_acesso varchar(255), IN vambiente varchar(255),
IN vloginad varchar(255))
BEGIN
declare idapp INT;
declare idloginapp INT;
declare idtipoapp INT;
declare idnivel_acesso INT;
declare idambiente INT;
declare idloginad INT;

select id into idapp from app_modelo where modelo = vapp_modelo;
select id into idloginapp from login_app where login = vlogin;
select id into idtipoapp from tipo_app where tipo = vtipo_app;
select id into idnivel_acesso from nivel_acesso where nivel = vnivel_acesso;
select id into idambiente from ambiente where ambiente = vambiente;
select id into idloginad from usuario where login = vloginad;

if vnivel_acesso = 'Pessoal' then
	insert into app (id_app_modelo, comentario, id_login, senha,
	id_tipo_app, id_servidor, id_nivel_acesso, id_ambiente)
	values(idapp,vcomentario,idloginapp,vsenha,idtipoapp,vservidor,idnivel_acesso,idambiente);
	insert into app_pessoal(id_app,id_usuario,id_servidor)values(last_insert_id(),idloginad,vservidor);
else
	insert into app (id_app_modelo, comentario, id_login, senha,
	id_tipo_app, id_servidor, id_nivel_acesso, id_ambiente)
	values(idapp,vcomentario,idloginapp,vsenha,idtipoapp,vservidor,idnivel_acesso,idambiente);
end if;
END //
DELIMITER ;
call bizucr('TomCat','comentario5','root','senha5','app',1,'Pessoal','Produção','grrodrigues');

drop procedure bizualtera;
DELIMITER //
CREATE PROCEDURE bizualtera(IN vapp_modelo varchar(255), IN vcomentario TEXT(150),
IN vlogin varchar(255), IN vsenha varchar(255), IN vtipo_app varchar(255),
IN vservidor INT, IN vnivel_acesso varchar(255), IN vambiente varchar(255), IN _user varchar(255))
BEGIN
declare idappmodelo INT;
declare idloginapp INT;
declare idtipoapp INT;
declare idnivel_acesso INT;
declare idambiente INT;
select id into @tmpbizuloginalt from usuario where login = _user;
select id into idappmodelo from app_modelo where modelo = vapp_modelo;
select id into idloginapp from login_app where login = vlogin;
select id into idtipoapp from tipo_app where tipo = vtipo_app;
select id into idnivel_acesso from nivel_acesso where nivel = vnivel_acesso;
select id into idambiente from ambiente where ambiente = vambiente;

update app set id_app_modelo=idappmodelo,comentario=vcomentario,
senha=vsenha,id_tipo_app=idtipoapp,id_nivel_acesso=idnivel_acesso,
id_ambiente=idambiente where id = vservidor;
END //
DELIMITER ;
call bizualtera('Mysql','JJJMMMM','root','senha5','app',35,'Pessoal','Produção','grrodrigues');

drop procedure permisalveadm;
DELIMITER //
CREATE PROCEDURE permisalveadm(IN vnivel varchar(255), 
IN vlogin varchar(255), IN vprojeto varchar(255))
BEGIN
declare valor INT;
declare idnivel INT;
declare idlogin INT;
declare idprojeto INT;
declare idpermissao INT;
declare exit handler for sqlexception select 'usernoacesso';
select id into idlogin from usuario where login = vlogin;
select id into idnivel from nivel_acesso where nivel = vnivel;
select id into idprojeto from setor where projeto = vprojeto;
select id into idpermissao from permissao_projeto where login = vlogin and projeto = vprojeto;
select count(id) into valor from app_nivelacesso where id_nivel_acesso = idnivel and id_permissao = idpermissao;
if valor = 0 then
insert into app_nivelacesso(id_nivel_acesso,id_permissao)values(idnivel,idpermissao);
select * from appadmproj;
else
select 'existe';
end if;
END //
DELIMITER ;
call permisalveadm('Admin','grrodrigues','Indprojj');

drop procedure bizuvisual;
DELIMITER //
CREATE PROCEDURE bizuvisual(IN vlogin varchar(255), IN idsrv INT)
BEGIN
select * from bizu where id_servidor = idsrv and ambiente in(select ambiente 
from permissao_ambiente where login = vlogin) or nivel 
in(select nivel from appadmproj where login = vlogin) or id 
in(select id_app from senhapessoal where login = vlogin and id_servidor = idsrv);
END //
DELIMITER ;

/* Cadastro de novo servidor cadastro */
drop procedure cadsrv;
DELIMITER //
CREATE PROCEDURE cadsrv(IN hostname varchar(255), IN paiss varchar(255), IN serials varchar(255), 
IN oss varchar(255), IN ip varchar(255), IN tipos varchar(255), IN ambientes varchar(255), IN projetos varchar(255),
IN locals varchar(255), IN descricaos varchar(255))
BEGIN
declare idpais int;
declare idos int;
declare idtipo int;
declare idamb int;
declare idproj int;
declare iddesc int;
declare idlocal int;
select id into idpais from pais where pais = paiss;
select id into idos from os where os = oss;
select id into idtipo from tipo_servidor where tipo = tipos;
select id into idamb from ambiente where ambiente = ambientes;
select id into idproj from setor where projeto = projetos;
select id into iddesc from setor_descricao where descricao = descricaos;
select id into idlocal from local where local = locals;
insert into servidor (hostname, id_pais, serial, id_os, endereco_ip, 
id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao,id_situacao)
values(hostname,idpais,serials,idos,ip,idtipo,idamb,idproj,idlocal,iddesc);
select * from home order by id desc limit 1;
END //
DELIMITER ;

/* VERSAO 2
Cadastro de novo servidor cadastro */
drop procedure cadsrv;
DELIMITER //
CREATE PROCEDURE cadsrv(IN hostname varchar(255), IN paiss varchar(255), IN serials varchar(255), 
IN oss varchar(255), IN ip varchar(255), IN tipos varchar(255), IN ambientes varchar(255), IN projetos varchar(255),
IN locals varchar(255), IN descricaos varchar(255))
BEGIN
declare idpais int;
declare idos int;
declare idtipo int;
declare idamb int;
declare idproj int;
declare iddesc int;
declare idlocal int;
select id into idpais from pais where pais = paiss;
select id into idos from os where os = oss;
select id into idtipo from tipo_servidor where tipo = tipos;
select id into idamb from ambiente where ambiente = ambientes;
select id into idproj from setor where projeto = projetos;
select id into iddesc from setor_descricao where descricao = descricaos;
select id into idlocal from local where local = locals;
insert into servidor (hostname, id_pais, serial, id_os, 
id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao)
values(hostname,idpais,serials,idos,idtipo,idamb,idproj,idlocal,iddesc);
insert into rede_fisica (id_servidor,ip_fisico)values(last_insert_id(),ip);
insert into rede (id_rede_fisica, id_rede_tipo, id_rede_nivel, id_rede_subnivel, id_servidor)
values(last_insert_id(),1,1,3,(select id_servidor from rede_fisica where id = last_insert_id()));
select * from home order by id desc limit 1;
END //
DELIMITER ;
call cadsrv('sap','Brasil','JJKKUi567','Solaris','221.130.214','Vmware','Produção','Itau','Guido Caloi','Upload');

/* VERSAO 3
Cadastro de novo servidor cadastro */
drop procedure cadsrv;
DELIMITER //
CREATE PROCEDURE cadsrv(IN hostname varchar(255), IN paiss varchar(255), IN serials varchar(255), 
IN oss varchar(255), IN ip varchar(255), IN tipos varchar(255), IN ambientes varchar(255), IN projetos varchar(255),
IN locals varchar(255), IN descricaos varchar(255))
BEGIN
declare idpais int;
declare idos int;
declare idtipo int;
declare idamb int;
declare idproj int;
declare iddesc int;
declare idlocal int;
declare valida int;
select id into idpais from pais where pais = paiss;
select id into idos from os where os = oss;
select id into idtipo from tipo_servidor where tipo = tipos;
select id into idamb from ambiente where ambiente = ambientes;
select id into idproj from setor where projeto = projetos;
select id into iddesc from setor_descricao where descricao = descricaos;
select id into idlocal from local where local = locals;
insert into servidor (hostname, id_pais, serial, id_os, id_tipo_servidor, 
id_ambiente, id_setor, id_local, id_setor_descricao, id_situacao)
values(hostname,idpais,serials,idos,idtipo,idamb,idproj,idlocal,iddesc,
(select id from situacao where situacao = 'Ativo'));
select id into valida from rede_fisica where id_servidor = last_insert_id() and ip_fisico = ip;
if valida is null then
	insert into rede_fisica (id_servidor,ip_fisico)values(last_insert_id(),ip);   
	insert into rede (id_rede_fisica, id_rede_tipo, id_rede_nivel, id_rede_subnivel, id_servidor)
	values(last_insert_id(),2,1,1,(select id_servidor from rede_fisica where id = last_insert_id()));
	select * from home order by id desc limit 1;
else
	insert into rede (id_rede_fisica, id_rede_tipo, id_rede_nivel, id_rede_subnivel, id_servidor)
	values(valida,2,1,1,(select id_servidor from rede_fisica where id = last_insert_id()));
	select * from home order by id desc limit 1;
end if;
END //
DELIMITER ;

/* Atualiza o cadastro de servidores*/
drop procedure srvsalve;
DELIMITER //
CREATE PROCEDURE srvsalve(IN hostname varchar(255), IN paiss varchar(255), IN serials varchar(255), 
IN oss varchar(255), IN ip varchar(255), IN tipos varchar(255), IN ambientes varchar(255), IN projetos varchar(255),
IN locals varchar(255), IN descricaos varchar(255), IN idd INT, IN _user varchar(255))
BEGIN
declare idpais int;
declare idos int;
declare idtipo int;
declare idamb int;
declare idproj int;
declare iddesc int;
declare idlocal int;
select id into idpais from pais where pais = paiss;
select id into idos from os where os = oss;
select id into idtipo from tipo_servidor where tipo = tipos;
select id into idamb from ambiente where ambiente = ambientes;
select id into idproj from setor where projeto = projetos;
select id into iddesc from setor_descricao where descricao = descricaos;
select id into idlocal from local where local = locals;
select id into @tmploginalt from usuario where login = _user;
update servidor set hostname=hostname,id_pais=idpais,serial=serials,id_os=idos,endereco_ip=ip,
id_tipo_servidor=idtipo,id_ambiente=idamb,id_setor=idproj,id_local=idlocal,id_setor_descricao=iddesc where id = idd;
END //
DELIMITER ;

/* VERSAO 2
Atualiza o cadastro de servidores*/
drop procedure srvsalve;
DELIMITER //
CREATE PROCEDURE srvsalve(IN hostname varchar(255), IN paiss varchar(255), IN serials varchar(255), 
IN oss varchar(255), IN ip varchar(255), IN tipos varchar(255), IN ambientes varchar(255), IN projetos varchar(255),
IN locals varchar(255), IN descricaos varchar(255), IN idd INT, IN _user varchar(255))
BEGIN
declare idpais int;
declare idos int;
declare idtipo int;
declare idamb int;
declare idproj int;
declare iddesc int;
declare idlocal int;
declare rnivel varchar(15);
select id into idpais from pais where pais = paiss;
select id into idos from os where os = oss;
select id into idtipo from tipo_servidor where tipo = tipos;
select id into idamb from ambiente where ambiente = ambientes;
select id into idproj from setor where projeto = projetos;
select id into iddesc from setor_descricao where descricao = descricaos;
select id into idlocal from local where local = locals;
select id into @tmploginalt from usuario where login = _user;
select subnivel into rnivel from home_rede where nivel = "Primario" and id_servidor = idd;
update servidor set hostname=hostname,id_pais=idpais,serial=serials,id_os=idos,id_tipo_servidor=idtipo,
id_ambiente=idamb,id_setor=idproj,id_local=idlocal,id_setor_descricao=iddesc where id = idd;
case rnivel
 when 'Origem' then
	update rede_fisica set ip_fisico = ip where id_servidor = idd and id = (select id_rede_fisica from rede 
    where id_rede_nivel = (select id from rede_nivel where nivel = "Primario") and id_servidor = idd);
 when 'Nat' then
	update rede_nat set ip_nat = ip where id_servidor = idd and id = (select id_rede_nat from rede 
	where id_rede_nivel = (select id from rede_nivel where nivel = "Primario") and id_servidor = idd);
end case; 
END //
DELIMITER ;

/* VERSAO 3
Atualiza o cadastro de servidores*/
drop procedure srvsalve;
DELIMITER //
CREATE PROCEDURE srvsalve(IN hostname varchar(255), IN paiss varchar(255), IN serials varchar(255), 
IN oss varchar(255), IN ip varchar(255), IN tipos varchar(255), IN ambientes varchar(255), IN projetos varchar(255),
IN locals varchar(255), IN descricaos varchar(255), IN idd INT, IN _user varchar(255), IN _situacao varchar(20))
BEGIN
declare idpais int;
declare idos int;
declare idtipo int;
declare idamb int;
declare idproj int;
declare iddesc int;
declare idlocal int;
declare rnivel varchar(15);
select id into idpais from pais where pais = paiss;
select id into idos from os where os = oss;
select id into idtipo from tipo_servidor where tipo = tipos;
select id into idamb from ambiente where ambiente = ambientes;
select id into idproj from setor where projeto = projetos;
select id into iddesc from setor_descricao where descricao = descricaos;
select id into idlocal from local where local = locals;
select id into @tmploginalt from usuario where login = _user;
select subnivel into rnivel from home_rede where nivel = "Primario" and id_servidor = idd;
update servidor set hostname=hostname,id_pais=idpais,serial=serials,id_os=idos,id_tipo_servidor=idtipo,
id_ambiente=idamb,id_setor=idproj,id_local=idlocal,id_setor_descricao=iddesc, 
id_situacao=(select id from situacao where situacao = _situacao) where id = idd;
case rnivel
 when 'Fisico' then
	update rede_fisica set ip_fisico = ip where id_servidor = idd and id = (select id_rede_fisica from rede 
    where id_rede_nivel = (select id from rede_nivel where nivel = "Primario") and id_servidor = idd);
 when 'Nat' then
	update rede_nat set ip_nat = ip where id_servidor = idd and id = (select id_rede_nat from rede 
	where id_rede_nivel = (select id from rede_nivel where nivel = "Primario") and id_servidor = idd);
end case; 
END //
DELIMITER ;
call srvsalve('Navida','Brasil','JJKKUi567','Linux','200.130.214','Vmware','Produção','Sigres','Guido Caloi','Upload', 1, 'grrodrigues');
select @tmploginalt;

/*Remove as contas agregada ao servidor*/
drop procedure delappsrv;
DELIMITER //
CREATE PROCEDURE delappsrv(IN idd INT, IN _user varchar(255)) 
BEGIN
declare res int;
select count(*) into res from app where id_servidor = idd;
select id into @tmplogindel from usuario where login = _user;
select id into @tmpapplogindel from usuario where login = _user;
if res > 0 then
delete from app_pessoal where id_servidor = idd;
delete from app where id_servidor = idd;
delete from servidor where id = idd;
else
delete from servidor where id = idd;
end if;
END //
DELIMITER ;
/* VERSAO 2
Remove as contas agregada ao servidor*/
drop procedure delappsrv;
DELIMITER //
CREATE PROCEDURE delappsrv(IN idd INT, IN _user varchar(45)) 
BEGIN
select ip_chaveado into @tmprede from rede_aux where id_servidor = idd;
select id into @tmpuserbizudel from usuario where login = _user;
drop temporary table if exists tmp_app;
create temporary table if not exists tmp_app as (select * from app where id_servidor = idd);
delete from app_pessoal where id_servidor = idd;
delete from app where id_servidor = idd;
delete from rede where id_servidor = idd;
delete from rede_fisica where id_servidor = idd;
delete from rede_nat where id_servidor = idd;
delete from servidor where id = idd;
END //
DELIMITER ;

/*Adiciona usuario no projeto || OBS: ALTERADO DO PROJ = projeto e amb = ambiente*/ 
drop procedure permisalve;
DELIMITER //
CREATE PROCEDURE permisalve(IN usuarios varchar(255), IN _email varchar(45), 
IN projamb varchar(255), IN divisor varchar(255))
BEGIN
declare iduser int;
declare idproj int;
declare idamb int;
declare val int;
select count(id) into val from usuario where login = usuarios;
if val = 0 then
insert into usuario(login,email)values(usuarios,_email);
end if;
select id into iduser from usuario where login = usuarios;
case divisor
 when 'projeto' then
 select id into idproj from setor where projeto = projamb;
 select count(id) into val from permissao where id_usuario = iduser and id_setor = idproj;
	if val = 0 then
		insert into permissao(id_usuario,id_setor)values(iduser,idproj);
        select login from permissao_projeto where projeto = projamb order by id desc;
	end if;
 when 'ambiente' then
 select id into idamb from ambiente where ambiente = projamb;
 select count(id) into val from usuario_ambiente where id_usuario = iduser and id_ambiente = idamb;
	if val = 0 then
		insert into usuario_ambiente(id_usuario,id_ambiente)values(iduser,idamb);
        select login from permissao_ambiente where ambiente = projamb order by id desc;
	end if;
END CASE;
END //
DELIMITER ;
call permisalve('gferreirap','Sap','proj');
select * from usuario_ambiente;

use mypass;
drop procedure permiuserdelproj;
DELIMITER //
CREATE PROCEDURE permiuserdelproj(IN vusuarios varchar(255), IN vprojetos varchar(255))
BEGIN
declare idlogin int;
declare idprojeto int;
declare idpermissao int;
select id into idlogin from usuario where login = vusuarios;
select id into idprojeto from setor where projeto = vprojetos;
select id into idpermissao from permissao where id_usuario = idlogin and id_setor = idprojeto;
delete from app_nivelacesso where id_permissao = idpermissao;
delete from permissao where id_usuario = idlogin and id_setor = idprojeto;
select login from permissao_projeto where projeto = vprojetos order by login;
END //
DELIMITER ;
call permiuserdelproj('grrodrigues','sigres');

drop procedure permiuserdelamb;
DELIMITER //
CREATE PROCEDURE permiuserdelamb(IN vusuarios varchar(255), IN vambiente varchar(255))
BEGIN
declare idlogin int;
declare idambiente int;
select id into idlogin from usuario where login = vusuarios;
select id into idambiente from ambiente where ambiente = vambiente;
delete from usuario_ambiente where id_usuario = idlogin and id_ambiente = idambiente;
select login from permissao_ambiente where ambiente = vambiente order by login;
END //
DELIMITER ;
call permiuserdelamb('grrodrigues','desenv');

/*Cadastra user/projeto/email na tabela envio email*/
drop procedure permiuserprojmail;
DELIMITER //
CREATE PROCEDURE permiuserprojmail(IN _user varchar(255), IN _projeto varchar(255)) 
BEGIN
declare valor int;
declare res int;
select count(id) into res from usuario where login = _user;
select count(id) into valor from permissao_email where login = _user and projeto = _projeto;
if valor = 0 and res != 0 then
	insert into email(id_usuario,id_setor)values((select id from usuario where login = _user),
    (select id from setor where projeto = _projeto));
    select * from permissao_email order by id desc limit 1;
else
	select 'existe';
end if;
END //
DELIMITER ;

/* Proc remove login/senha tanto pessoal como de ambiente/adm */
drop procedure bizude;
DELIMITER //
CREATE PROCEDURE bizude(IN idd INT, IN _user varchar(255))
BEGIN
declare _nivel varchar(255);
select nivel into _nivel from bizu where id = idd;
select id into @tmpuserbizudel from usuario where login = _user;
if _nivel = 'Pessoal' then
delete from app_pessoal where id_app = idd;
delete from app where id = idd;
else
delete from app where id = idd;
end if;
END //
DELIMITER ;
call bizude(121);

/* Proc generica para inserir servidor na tabela historico_servidor */
drop procedure hcadservidor;
DELIMITER //
CREATE PROCEDURE hcadservidor(IN hostname varchar(255), IN id_pais INT, IN _serial varchar(255), IN id_os INT, 
IN endereco_ip varchar(255), IN id_tipo_servidor INT, IN id_ambiente INT, IN id_setor INT, IN id_local INT, 
IN id_setor_descricao INT, IN usuario INT, IN acao varchar(255), IN _data datetime)
BEGIN
insert into historico_servidor (
hostname, id_pais, serial, 
id_os, endereco_ip, 
id_tipo_servidor, 
id_ambiente, id_setor, 
id_local, id_setor_descricao, 
id_usuario, acao, data) values 
(hostname, id_pais, _serial, id_os, endereco_ip, 
id_tipo_servidor, id_ambiente, id_setor, id_local, 
id_setor_descricao, usuario, acao, _data);
END //
DELIMITER ;

/* Proc para retornar os valores, que ira inserir na tabela historico_servidor */
drop procedure happdel;
DELIMITER //
CREATE PROCEDURE happdel(OUT _hostname varchar(255), OUT _id_pais INT, 
OUT _serial varchar(255), OUT _id_os INT, OUT _endereco_ip varchar(255), OUT _id_tipo_servidor INT, 
OUT _id_ambiente INT, OUT _id_setor INT, OUT _id_local INT, OUT _id_setor_descricao INT, IN idd INT)
BEGIN
select hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, 
id_setor, id_local, id_setor_descricao into _hostname, _id_pais, _serial, _id_os, 
_endereco_ip, _id_tipo_servidor, _id_ambiente, _id_setor, _id_local, _id_setor_descricao
from servidor where id = idd;
END //
DELIMITER ;

/* VERSAO 2
Proc para retornar os valores, que ira inserir na tabela historico_servidor */
drop procedure happdel;
DELIMITER //
CREATE PROCEDURE happdel(OUT _hostname varchar(255), OUT _id_pais INT, 
OUT _serial varchar(255), OUT _id_os INT, OUT _id_tipo_servidor INT, 
OUT _id_ambiente INT, OUT _id_setor INT, OUT _id_local INT, OUT _id_setor_descricao INT, IN idd INT)
BEGIN
select hostname, id_pais, serial, id_os, id_tipo_servidor, id_ambiente, 
id_setor, id_local, id_setor_descricao into _hostname, _id_pais, _serial, _id_os, 
_id_tipo_servidor, _id_ambiente, _id_setor, _id_local, _id_setor_descricao
from servidor where id = idd;
END //
DELIMITER ;
call happdel(@_hostname, @_id_pais, @_serial, @_id_os,@_id_tipo_servidor, 
@_id_ambiente, @_id_setor, @_id_local, @_id_setor_descricao, 1);
select @_hostname, @_id_pais, @_serial, @_id_os,@_id_tipo_servidor, @_id_ambiente, 
@_id_setor, @_id_local, @_id_setor_descricao;

/* Cadastra pais local os etc*/
drop procedure grpcr;
DELIMITER //
CREATE PROCEDURE grpcr(IN grupo varchar(255), IN valor varchar(255))
BEGIN
declare conta INT;
case grupo
 when 'projeto' then
 select count(id) into conta from setor where projeto = valor;
	if conta = 0 then
		insert into setor(projeto)value(valor);
		select * from setor order by projeto;
	else
		select 'existe';
	end if;
    
 when 'descricao' then
 select count(id) into conta from setor_descricao where descricao = valor;
	if conta = 0 then
		insert into setor_descricao(descricao)value(valor);
		select * from setor_descricao order by descricao;
	else
		select 'existe';
	end if;

 when 'ambiente' then
 select count(id) into conta from ambiente where ambiente = valor;
	if conta = 0 then
		insert into ambiente(ambiente)value(valor);
		select * from ambiente order by ambiente;
	else
		select 'existe';
	end if;
    
 when 'os' then
 select count(id) into conta from os where os = valor;
	if conta = 0 then
		insert into os(os)values(valor);
		select * from os order by os;
	else
		select 'existe';
	end if;
    
 when 'tipo' then
 select count(id) into conta from tipo_servidor where tipo = valor;
	if conta = 0 then
		insert into tipo_servidor(tipo)values(valor);
		select * from tipo_servidor order by tipo;
	else
		select 'existe';
	end if;
        
 when 'pais' then
 select count(id) into conta from pais where pais = valor;
	if conta = 0 then
		insert into pais(pais)values(valor);
		select * from pais order by pais;
	else
		select 'existe';
	end if;
    
 when 'local' then
 select count(id) into conta from local where local = valor;
	if conta = 0 then
		insert into local(local)values(valor);
		select * from local order by local;
	else
		select 'existe';
	end if;
END CASE;
END //
DELIMITER ;

/* VERSAO 2
Cadastra pais local os etc*/
drop procedure grpcr;
DELIMITER //
CREATE PROCEDURE grpcr(IN grupo varchar(255), IN valor varchar(255))
BEGIN
declare conta INT;
case grupo
 when 'projeto' then
 select count(id) into conta from setor where projeto = valor;
	if conta = 0 then
		insert into setor(projeto)value(valor);
		select * from setor order by projeto;
	else
		select 'existe';
	end if;
    
 when 'descricao' then
 select count(id) into conta from setor_descricao where descricao = valor;
	if conta = 0 then
		insert into setor_descricao(descricao)value(valor);
		select * from setor_descricao order by descricao;
	else
		select 'existe';
	end if;

 when 'ambiente' then
 select count(id) into conta from ambiente where ambiente = valor;
	if conta = 0 then
		insert into ambiente(ambiente)value(valor);
		select * from ambiente order by ambiente;
	else
		select 'existe';
	end if;
    
 when 'os' then
 select count(id) into conta from os where os = valor;
	if conta = 0 then
		insert into os(os)values(valor);
		select * from os order by os;
	else
		select 'existe';
	end if;
    
 when 'tipo' then
 select count(id) into conta from tipo_servidor where tipo = valor;
	if conta = 0 then
		insert into tipo_servidor(tipo)values(valor);
		select * from tipo_servidor order by tipo;
	else
		select 'existe';
	end if;
        
 when 'pais' then
 select count(id) into conta from pais where pais = valor;
	if conta = 0 then
		insert into pais(pais)values(valor);
		select * from pais order by pais;
	else
		select 'existe';
	end if;
    
 when 'local' then
 select count(id) into conta from local where local = valor;
	if conta = 0 then
		insert into local(local)values(valor);
		select * from local order by local;
	else
		select 'existe';
	end if;
    
 when 'rede' then
 select count(id) into conta from local where local = valor;
	if conta = 0 then
		insert into rede_tipo(tipo)values(valor);
		select id,tipo as rede from rede_tipo order by tipo;
	else
		select 'existe';
	end if;    
END CASE;
END //
DELIMITER ;
call grpcr('descricao', 'Overload');

/* Altera e apaga pais local os etc*/
drop procedure grpud;
DELIMITER //
CREATE PROCEDURE grpud(IN grupo varchar(255), IN valor varchar(255), IN _id INT, IN ud varchar(255))
BEGIN
case grupo
 when 'projeto' then
	case ud
     when 'update' then
		update setor set projeto = valor where id = _id;
	 when 'delete' then
		delete from setor where id = _id; 
	end case;	
 when 'descricao' then
	case ud
     when 'update' then
		update setor_descricao set descricao = valor where id = _id;
	 when 'delete' then
		delete from setor_descricao where id = _id;
	end case;    
 when 'ambiente' then
	case ud
     when 'update' then
		update ambiente set ambiente = valor where id = _id;
	 when 'delete' then
		delete from ambiente where id = _id;
	end case;      
 when 'os' then
	case ud
     when 'update' then
		update os set os = valor where id = _id;
	 when 'delete' then
		delete from os where id = _id;
	end case;      
 when 'tipo' then
	case ud
     when 'update' then
		update tipo_servidor set tipo = valor where id = _id;
	 when 'delete' then
		delete from tipo_servidor where id = _id;
	end case;      
 when 'pais' then
	case ud
     when 'update' then
		update pais set pais = valor where id = _id;
	 when 'delete' then
		delete from pais where id = _id;
	end case;      
 when 'local' then
	case ud
     when 'update' then
		update local set local = valor where id = _id;
	 when 'delete' then
		delete from local where id = _id;
	end case;  
END CASE;
END //
DELIMITER ;

/* VERSAO 2
Altera e apaga pais local os etc*/
drop procedure grpud;
DELIMITER //
CREATE PROCEDURE grpud(IN grupo varchar(255), IN valor varchar(255), IN _id INT, IN ud varchar(255))
BEGIN
case grupo
 when 'projeto' then
	case ud
     when 'update' then
		update setor set projeto = valor where id = _id;
	 when 'delete' then
		delete from setor where id = _id; 
	end case;	
 when 'descricao' then
	case ud
     when 'update' then
		update setor_descricao set descricao = valor where id = _id;
	 when 'delete' then
		delete from setor_descricao where id = _id;
	end case;    
 when 'ambiente' then
	case ud
     when 'update' then
		update ambiente set ambiente = valor where id = _id;
	 when 'delete' then
		delete from ambiente where id = _id;
	end case;      
 when 'os' then
	case ud
     when 'update' then
		update os set os = valor where id = _id;
	 when 'delete' then
		delete from os where id = _id;
	end case;      
 when 'tipo' then
	case ud
     when 'update' then
		update tipo_servidor set tipo = valor where id = _id;
	 when 'delete' then
		delete from tipo_servidor where id = _id;
	end case;      
 when 'pais' then
	case ud
     when 'update' then
		update pais set pais = valor where id = _id;
	 when 'delete' then
		delete from pais where id = _id;
	end case;      
 when 'local' then
	case ud
     when 'update' then
		update local set local = valor where id = _id;
	 when 'delete' then
		delete from local where id = _id;
	end case;
 when 'rede' then
	case ud
     when 'update' then
		update rede_tipo set tipo = valor where id = _id;
	 when 'delete' then
		delete from rede_tipo where id = _id;
	end case;    
END CASE;
END //
DELIMITER ;
call grpud('projeto','molog',3,'delete');

drop procedure hpesquisasize;
DELIMITER //
CREATE PROCEDURE hpesquisasize(IN pesquisa varchar(255), IN _user varchar(255))
BEGIN
select count(id) as conta from historicosrv where projeto in (select projeto from permissao_projeto where 
(host like concat('%',pesquisa,'%') or pais like concat('%',pesquisa,'%') or serial like concat('%',pesquisa,'%') 
or os like concat('%',pesquisa,'%') or ip like concat('%',pesquisa,'%') or tipo like concat('%',pesquisa,'%') 
or ambiente like concat('%',pesquisa,'%') or ambiente like concat('%',pesquisa,'%') or projeto like concat('%',pesquisa,'%') 
or descricao like concat('%',pesquisa,'%') or local like concat('%',pesquisa,'%') 
or acao like concat('%',pesquisa,'%')) and login = _user);
END //
DELIMITER ;

/* VERSAO 2 - 
inclui OR USUARIO LIKE concat('%',pesquisa,'%') */
drop procedure hpesquisasize;
DELIMITER //
CREATE PROCEDURE hpesquisasize(IN pesquisa varchar(255), IN _user varchar(255))
BEGIN
select count(id) as conta from historicosrv where projeto in (select projeto from permissao_projeto where 
(host like concat('%',pesquisa,'%') or pais like concat('%',pesquisa,'%') or serial like concat('%',pesquisa,'%') 
or os like concat('%',pesquisa,'%') or ip like concat('%',pesquisa,'%') or tipo like concat('%',pesquisa,'%') 
or ambiente like concat('%',pesquisa,'%') or ambiente like concat('%',pesquisa,'%') or projeto like concat('%',pesquisa,'%') 
or descricao like concat('%',pesquisa,'%') or local like concat('%',pesquisa,'%') or usuario like concat('%',pesquisa,'%') 
or acao like concat('%',pesquisa,'%')) and login = _user);
END //
DELIMITER ;

drop procedure hpesquisa;
DELIMITER //
CREATE PROCEDURE hpesquisa(IN pesquisa varchar(255), 
IN _user varchar(255), IN total INT)
BEGIN
select * from historicosrv where projeto in (select projeto from permissao_projeto where (host like concat('%',pesquisa,'%') 
or pais like concat('%',pesquisa,'%') or serial like concat('%',pesquisa,'%') or os like concat('%',pesquisa,'%') 
or ip like concat('%',pesquisa,'%') or tipo like concat('%',pesquisa,'%') or ambiente like concat('%',pesquisa,'%') 
or ambiente like concat('%',pesquisa,'%') or projeto like concat('%',pesquisa,'%') or descricao like concat('%',pesquisa,'%') 
or local like concat('%',pesquisa,'%') or login like concat('%',pesquisa,'%') or acao like concat('%',pesquisa,'%')) 
and login = _user) order by id desc limit total offset 0;
END //
DELIMITER ;

/* VERSAO 2 - 
inclui OR USUARIO LIKE concat('%',pesquisa,'%') */
drop procedure hpesquisa;
DELIMITER //
CREATE PROCEDURE hpesquisa(IN pesquisa varchar(255),
IN _user varchar(255), IN total INT)
BEGIN
select * from historicosrv where projeto in (select projeto from permissao_projeto where (host like concat('%',pesquisa,'%')
or pais like concat('%',pesquisa,'%') or serial like concat('%',pesquisa,'%') or os like concat('%',pesquisa,'%')
or ip like concat('%',pesquisa,'%') or tipo like concat('%',pesquisa,'%') or ambiente like concat('%',pesquisa,'%')
or ambiente like concat('%',pesquisa,'%') or projeto like concat('%',pesquisa,'%') or descricao like concat('%',pesquisa,'%')
or local like concat('%',pesquisa,'%') or usuario like concat('%',pesquisa,'%') or acao like concat('%',pesquisa,'%'))
and login = _user) order by id desc limit total offset 0;
END //
DELIMITER ;

drop procedure hpesquisapgsize;
DELIMITER //
CREATE PROCEDURE hpesquisapgsize(IN pesquisa varchar(255), IN _user varchar(255))
BEGIN
select count(id) as conta from historicosrv where projeto in (select projeto from permissao_projeto 
where (host like concat('%',pesquisa,'%') or pais like concat('%',pesquisa,'%') or serial like concat('%',pesquisa,'%') 
or os like concat('%',pesquisa,'%') or ip like concat('%',pesquisa,'%') or tipo like concat('%',pesquisa,'%') 
or ambiente like concat('%',pesquisa,'%') or ambiente like concat('%',pesquisa,'%') or projeto like concat('%',pesquisa,'%') 
or descricao like concat('%',pesquisa,'%') or local like concat('%',pesquisa,'%') or login like concat('%',pesquisa,'%') 
or acao like concat('%',pesquisa,'%')) and login = _user);
END //
DELIMITER ;

/* VERSAO 2 - 
inclui OR USUARIO LIKE concat('%',pesquisa,'%') */
drop procedure hpesquisapgsize;
DELIMITER //
CREATE PROCEDURE hpesquisapgsize(IN pesquisa varchar(255), IN _user varchar(255))
BEGIN
select count(id) as conta from historicosrv where projeto in (select projeto from permissao_projeto 
where (host like concat('%',pesquisa,'%') or pais like concat('%',pesquisa,'%') or serial like concat('%',pesquisa,'%') 
or os like concat('%',pesquisa,'%') or ip like concat('%',pesquisa,'%') or tipo like concat('%',pesquisa,'%') 
or ambiente like concat('%',pesquisa,'%') or ambiente like concat('%',pesquisa,'%') or projeto like concat('%',pesquisa,'%') 
or descricao like concat('%',pesquisa,'%') or local like concat('%',pesquisa,'%') or usuario like concat('%',pesquisa,'%') 
or acao like concat('%',pesquisa,'%')) and login = _user);
END //
DELIMITER ;

drop procedure hpesquisapg;
DELIMITER //
CREATE PROCEDURE hpesquisapg(IN pesquisa varchar(255), 
IN _user varchar(255), IN total INT, IN pag INT)
BEGIN
select * from historicosrv where projeto in (select projeto from permissao_projeto where (host like concat('%',pesquisa,'%') 
or pais like concat('%',pesquisa,'%') or serial like concat('%',pesquisa,'%') or os like concat('%',pesquisa,'%') 
or ip like concat('%',pesquisa,'%') or tipo like concat('%',pesquisa,'%') or ambiente like concat('%',pesquisa,'%') 
or ambiente like concat('%',pesquisa,'%') or projeto like concat('%',pesquisa,'%') or descricao like concat('%',pesquisa,'%') 
or local like concat('%',pesquisa,'%') or login like concat('%',pesquisa,'%') or acao like concat('%',pesquisa,'%')) 
and login = _user) order by id desc limit total offset pag;
END //
DELIMITER ;

/* VERSAO 2 - 
inclui OR USUARIO LIKE concat('%',pesquisa,'%') */
drop procedure hpesquisapg;
DELIMITER //
CREATE PROCEDURE hpesquisapg(IN pesquisa varchar(255), 
IN _user varchar(255), IN total INT, IN pag INT)
BEGIN
select * from historicosrv where projeto in (select projeto from permissao_projeto where (host like concat('%',pesquisa,'%') 
or pais like concat('%',pesquisa,'%') or serial like concat('%',pesquisa,'%') or os like concat('%',pesquisa,'%') 
or ip like concat('%',pesquisa,'%') or tipo like concat('%',pesquisa,'%') or ambiente like concat('%',pesquisa,'%') 
or ambiente like concat('%',pesquisa,'%') or projeto like concat('%',pesquisa,'%') or descricao like concat('%',pesquisa,'%') 
or local like concat('%',pesquisa,'%') or usuario like concat('%',pesquisa,'%') or acao like concat('%',pesquisa,'%')) 
and login = _user) order by id desc limit total offset pag;
END //
DELIMITER ;
call hpesquisapg('grr','grrodrigues',17,0);

/* Tabela atualiza registros referente a tabela rede */
drop procedure salveredes;
DELIMITER //
CREATE PROCEDURE salveredes(IN _id INT, IN idsrv INT, IN ipfisico varchar(32), 
IN ipnat varchar(32), IN _nivel varchar(20), IN _subnivel varchar(20), IN _tipo varchar(20))
BEGIN
declare valida int;
declare valida1 int;
declare idredenat int;
declare idredefisica int;
if _nivel = 'Primario' then
update rede set id_rede_nivel = (select id from rede_nivel where nivel = "Secundario") 
where id_rede_nivel = (select id from rede_nivel where nivel = "Primario") and id_servidor = idsrv;
end if;
update rede_fisica set ip_fisico = ipfisico where id = (select id_rede_fisica from rede where id = _id);
update rede set id_rede_nivel = (select id from rede_nivel where nivel = _nivel) where id = _id;
if ipnat is not null then
	select id_rede_nat into valida from rede where id = _id;
	if valida is not null then
		update rede_nat set ip_nat = ipnat where id = (select id_rede_nat from rede where id = _id);
	else
		insert into rede_nat(id_servidor,ip_nat)value(idsrv,ipnat);
        update rede set id_rede_nat = last_insert_id() where id = _id;
	end if;
else
	select id_rede_nat into idredenat from rede where id = _id;
	update rede set id_rede_nat = NULL where id = _id;
	delete from rede_nat where id = idredenat;
end if;
if ipfisico is not null then
	select id_rede_fisica into valida1 from rede where id = _id;
	if valida1 is not null then
		update rede_fisica set ip_fisico = ipfisico where id = (select id_rede_fisica from rede where id = _id);
	else
		insert into rede_fisica(id_servidor,ip_fisico)value(idsrv,ipfisico);
        update rede set id_rede_fisica = last_insert_id() where id = _id;
	end if;
else
	select id_rede_fisica into idredefisica from rede where id = _id;
	update rede set id_rede_fisica = NULL where id = _id;
	delete from rede_fisica where id = idredefisica;
end if;
update rede set id_rede_subnivel = (select id from rede_subnivel where subnivel = _subnivel),
id_rede_tipo = (select id from rede_tipo where tipo = _tipo) where id = _id;
select * from home_rede where id_servidor = idsrv;
END //
DELIMITER ;

/* VERSÃO 2 
Tabela atualiza registros referente a tabela rede */
drop procedure salveredes;
DELIMITER //
CREATE PROCEDURE salveredes(IN _id INT, IN idsrv INT, IN ipfisico varchar(32), 
IN ipnat varchar(32), IN _nivel varchar(20), IN _subnivel varchar(20), IN _tipo varchar(20))
BEGIN
declare valida int;
declare valida1 int;
declare idredenat int;
declare idredefisica int;
set @tmpsrvrede = idsrv;
drop temporary table if exists tmp_altrede;
create temporary table tmp_altrede select * from rede where id_servidor = idsrv;
set @tr_salverede = 1;
if _nivel = 'Primario' then
update tmp_altrede set id_rede_nivel = (select id from rede_nivel where nivel = "Secundario") 
where id_rede_nivel = (select id from rede_nivel where nivel = "Primario") and id_servidor = idsrv;
update rede set id_rede_nivel = (select id from rede_nivel where nivel = "Secundario") 
where id_rede_nivel = (select id from rede_nivel where nivel = "Primario") and id_servidor = idsrv;
end if;
update rede_fisica set ip_fisico = ipfisico where id = (select id_rede_fisica from tmp_altrede where id = _id);
update tmp_altrede set id_rede_nivel = (select id from rede_nivel where nivel = _nivel) where id = _id;
if ipnat is not null then
	select id_rede_nat into valida from tmp_altrede where id = _id;
	if valida is not null then
		update rede_nat set ip_nat = ipnat where id = (select id_rede_nat from tmp_altrede where id = _id);
	else
		insert into rede_nat(id_servidor,ip_nat)value(idsrv,ipnat);
        update tmp_altrede set id_rede_nat = last_insert_id() where id = _id;
	end if;
else
	select id_rede_nat into idredenat from tmp_altrede where id = _id;
	update tmp_altrede set id_rede_nat = NULL where id = _id;
    update rede set id_rede_nat = NULL where id = _id;
	delete from rede_nat where id = idredenat;
end if;
if ipfisico is not null then
	select id_rede_fisica into valida1 from tmp_altrede where id = _id;
	if valida1 is not null then
		update rede_fisica set ip_fisico = ipfisico where id = (select id_rede_fisica from tmp_altrede where id = _id);
	else
		insert into rede_fisica(id_servidor,ip_fisico)value(idsrv,ipfisico);
        update tmp_altrede set id_rede_fisica = last_insert_id() where id = _id;
	end if;
else
	select id_rede_fisica into idredefisica from tmp_altrede where id = _id;
	update tmp_altrede set id_rede_fisica = NULL where id = _id;
    update rede set id_rede_fisica = NULL where id = _id;
	delete from rede_fisica where id = idredefisica;
end if;
update tmp_altrede set id_rede_subnivel = (select id from rede_subnivel where subnivel = _subnivel),
id_rede_tipo = (select id from rede_tipo where tipo = _tipo) where id = _id;
set @tr_salverede = null;
Update rede t1 join
   (select id, id_rede_fisica, id_rede_nat, 
   id_rede_tipo, id_rede_nivel, id_rede_subnivel
	from tmp_altrede t2
	group by id
   ) t2
   on t1.id = _id
set t1.id_rede_fisica = t2.id_rede_fisica,
 t1.id_rede_nat = t2.id_rede_nat,
 t1.id_rede_tipo = t2.id_rede_tipo,
 t1.id_rede_nivel = t2.id_rede_nivel,
 t1.id_rede_subnivel = t2.id_rede_subnivel;
select * from home_rede where id_servidor = idsrv;
END //
DELIMITER ;

/* VERSÃO 3
Tabela atualiza registros referente a tabela rede */
drop procedure salveredes;
DELIMITER //
CREATE PROCEDURE salveredes(IN _id INT, IN idsrv INT, IN ipfisico varchar(32), 
IN ipnat varchar(32), IN _nivel varchar(20), IN _subnivel varchar(20), 
IN _tipo varchar(20), IN _loginuser varchar(40))
BEGIN
declare valida int;
declare valida1 int;
declare idredenat int;
declare idredefisica int;
set @tr_salverede = 1;
set @tr_salveredelogin = _loginuser;
call hsalverede(@_tmpfisico, @_tmpnat, @_tmptipo, 
@_tmpnivel, @_tmpsubnivel, @_tmpidsrv, _id);
if _nivel = 'Primario' then
update rede set id_rede_nivel = (select id from rede_nivel where nivel = "Secundario") 
where id_rede_nivel = (select id from rede_nivel where nivel = "Primario") and id_servidor = idsrv;
end if;
update rede_fisica set ip_fisico = ipfisico where id = (select id_rede_fisica from rede where id = _id);
update rede set id_rede_nivel = (select id from rede_nivel where nivel = _nivel) where id = _id;
if ipnat is not null then
	select id_rede_nat into valida from rede where id = _id;
	if valida is not null then
		update rede_nat set ip_nat = ipnat where id = (select id_rede_nat from rede where id = _id);
	else
		insert into rede_nat(id_servidor,ip_nat)value(idsrv,ipnat);
        update rede set id_rede_nat = last_insert_id() where id = _id;
	end if;
else
	select id_rede_nat into idredenat from rede where id = _id;
	update rede set id_rede_nat = NULL where id = _id;
	delete from rede_nat where id = idredenat;
end if;
if ipfisico is not null then
	select id_rede_fisica into valida1 from rede where id = _id;
	if valida1 is not null then
		update rede_fisica set ip_fisico = ipfisico where id = (select id_rede_fisica from rede where id = _id);
	else
		insert into rede_fisica(id_servidor,ip_fisico)value(idsrv,ipfisico);
        update rede set id_rede_fisica = last_insert_id() where id = _id;
	end if;
else
	select id_rede_fisica into idredefisica from rede where id = _id;
	update rede set id_rede_fisica = NULL where id = _id;
	delete from rede_fisica where id = idredefisica;
end if;
set @tr_salverede = null;
update rede set id_rede_subnivel = (select id from rede_subnivel where subnivel = _subnivel),
id_rede_tipo = (select id from rede_tipo where tipo = _tipo) where id = _id;
select * from home_rede where id_servidor = idsrv;
END //
DELIMITER ;
call salveredes(5,10,"192.168.1.201",'',"Secundario","Origem","Nat");

drop procedure cadredes;
DELIMITER //
CREATE PROCEDURE cadredes(IN idsrv INT, IN ipfisico varchar(32), 
IN ipnat varchar(32), IN _nivel varchar(20), IN _subnivel varchar(20), IN _tipo varchar(20))
BEGIN
declare idfisico int;
declare idnat int;
set @tr_cadredes = 1;
if _nivel = 'Primario' then
update rede set id_rede_nivel = (select id from rede_nivel where nivel = "Secundario") 
where id_rede_nivel = (select id from rede_nivel where nivel = "Primario") and id_servidor = idsrv;
end if;
if ipfisico is not null then
	insert into rede_fisica(id_servidor,ip_fisico)value(idsrv,ipfisico);
	select id into idfisico from rede_fisica where id = last_insert_id();
else
	set ipfisico = NULL;
end if;
if ipnat is not null then
	insert into rede_nat(id_servidor,ip_nat)value(idsrv,ipnat);
	select id into idnat from rede_nat where id = last_insert_id();
else
	set ipnat = NULL;
end if;
insert into rede(id_rede_fisica, id_rede_nat, id_rede_tipo, id_rede_nivel, id_rede_subnivel, id_servidor)
value(idfisico,idnat,(select id from rede_tipo where tipo = _tipo),(select id from rede_nivel where nivel = _nivel),
(select id from rede_subnivel where subnivel = _subnivel), idsrv);
select * from home_rede where id_servidor = idsrv order by id desc limit 1;
END //
DELIMITER ;

drop procedure delredes;
DELIMITER //
CREATE PROCEDURE delredes(IN _id INT, IN idsrv INT, IN _loginuser varchar(40))
BEGIN
declare idredenat int;
declare idredefisica int;
set @tr_delredelogin = _loginuser;
select id_rede_fisica into idredefisica from rede where id = _id;
select id_rede_nat into idredenat from rede where id = _id;
delete from rede where id = _id;
delete from rede_nat where id = idredenat;
delete from rede_fisica where id = idredefisica;
select * from home_rede where id_servidor = idsrv;
END //
DELIMITER ;
call delredes(5, 'grrodrigues');

/* VERSAO 1
PROC QUE RECOLHE VALOR ANTIGO DO HOME_REDE
*/
drop procedure hsalverede;
DELIMITER //
CREATE PROCEDURE hsalverede(OUT _tmpfisico varchar(20), 
OUT _tmpnat varchar(20), OUT _tmptipo varchar(20), OUT _tmpnivel varchar(20), 
OUT _tmpsubnivel varchar(20), OUT _tmpidsrv varchar(20), IN idd INT)
BEGIN
select id_rede_fisica, id_rede_nat, id_rede_tipo, id_rede_nivel, id_rede_subnivel, id_servidor
into _tmpfisico, _tmpnat, _tmptipo, _tmpnivel, _tmpsubnivel, _tmpidsrv from rede where id = idd;
END //
DELIMITER ;

/* VERSAO 2 
PROC QUE RECOLHE VALOR ANTIGO DO HOME_REDE
*/
drop procedure hsalverede;
DELIMITER //
CREATE PROCEDURE hsalverede(OUT _tmpfisico varchar(20), 
OUT _tmpnat varchar(20), OUT _tmptipo varchar(20), OUT _tmpnivel varchar(20), 
OUT _tmpsubnivel varchar(20), OUT _tmpidsrv varchar(20), IN idd INT)
BEGIN
select ip_fisico, ip_nat ,tipo ,nivel ,subnivel ,id_servidor
into _tmpfisico, _tmpnat, _tmptipo, _tmpnivel, _tmpsubnivel, _tmpidsrv from home_rede where id = idd;
END //
DELIMITER ;
call hsalverede(@_tmpfisico, @_tmpnat, @_tmptipo, @_tmpnivel, @_tmpsubnivel, @_tmpidsrv,13);
select @_tmpfisico, @_tmpnat, @_tmptipo, @_tmpnivel, @_tmpsubnivel, @_tmpidsrv;


