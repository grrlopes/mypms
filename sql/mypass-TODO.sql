/* ############		PROCEDURE 	######################*/
/* Cadastra os login na tabela app relacionada ao servidor.*/
drop procedure bizucr;
DELIMITER //
CREATE PROCEDURE bizucr(IN vapp_modelo varchar(255), IN vcomentario TEXT(150),
IN vlogin varchar(255), IN vsenha varchar(255), IN vtipo_app varchar(255),
IN vservidor INT, IN vnivel_acesso varchar(255), IN vambiente varchar(255),
IN vloginad varchar(255))
BEGIN
declare idapp INT;
declare idtipoapp INT;
declare idnivel_acesso INT;
declare idambiente INT;
declare idloginad INT;

select id into idapp from app_modelo where modelo = vapp_modelo;
select id into idtipoapp from tipo_app where tipo = vtipo_app;
select id into idnivel_acesso from nivel_acesso where nivel = vnivel_acesso;
select id into idambiente from ambiente where ambiente = vambiente;
select id into idloginad from usuario where login = vloginad;

if vnivel_acesso = 'Pessoal' then
	insert into app (id_app_modelo, comentario, login, senha,
	id_tipo_app, id_servidor, id_nivel_acesso, id_ambiente)
	values(idapp,vcomentario,vlogin,vsenha,idtipoapp,vservidor,idnivel_acesso,idambiente);
	insert into app_pessoal(id_app,id_usuario,id_servidor)values(last_insert_id(),idloginad,vservidor);
else
	insert into app (id_app_modelo, comentario, login, senha,
	id_tipo_app, id_servidor, id_nivel_acesso, id_ambiente)
	values(idapp,vcomentario,vlogin,vsenha,idtipoapp,vservidor,idnivel_acesso,idambiente);
end if;
END //
DELIMITER ;

drop procedure bizualtera;
DELIMITER //
CREATE PROCEDURE bizualtera(IN vapp_modelo varchar(255), IN vcomentario TEXT(150),
IN vlogin varchar(255), IN vsenha varchar(255), IN vtipo_app varchar(255),
IN vservidor INT, IN vnivel_acesso varchar(255), IN vambiente varchar(255), IN _user varchar(255))
BEGIN
declare idappmodelo INT;
declare idtipoapp INT;
declare idnivel_acesso INT;
declare idambiente INT;
declare vPessoal varchar(15);
declare idsrv INT;
select id into @tmpbizuloginalt from usuario where login = _user;
select id into idappmodelo from app_modelo where modelo = vapp_modelo;
select id into idtipoapp from tipo_app where tipo = vtipo_app;
select id into idnivel_acesso from nivel_acesso where nivel = vnivel_acesso;
select id into idambiente from ambiente where ambiente = vambiente;
select nivel into vPessoal from bizu where nivel in (select nivel from 
nivel_acesso where nivel = 'Pessoal' or nivel = 'Admin') and id = vservidor;
select id_servidor into idsrv from app where id = vservidor;
if vPessoal = 'Pessoal' then
	update app set id_app_modelo=idappmodelo,comentario=vcomentario,
	senha=vsenha,id_tipo_app=idtipoapp,id_nivel_acesso=idnivel_acesso,
	id_ambiente=idambiente where id = vservidor;
elseif vPessoal = 'Admin' and vnivel_acesso = 'Pessoal' then
	update app set id_app_modelo=idappmodelo,comentario=vcomentario,
	senha=vsenha,id_tipo_app=idtipoapp,id_nivel_acesso=idnivel_acesso,
	id_ambiente=idambiente where id = vservidor;
	insert into app_pessoal(id_app,id_usuario,id_servidor)values
    (vservidor,(select id from usuario where login=_user),idsrv);
elseif vnivel_acesso = 'Pessoal' then
	update app set id_app_modelo=idappmodelo,comentario=vcomentario,
	senha=vsenha,id_tipo_app=idtipoapp,id_nivel_acesso=idnivel_acesso,
	id_ambiente=idambiente where id = vservidor;
	insert into app_pessoal(id_app,id_usuario,id_servidor)values
    (vservidor,(select id from usuario where login=_user),idsrv);
else
	update app set id_app_modelo=idappmodelo,comentario=vcomentario,
	senha=vsenha,id_tipo_app=idtipoapp,id_nivel_acesso=idnivel_acesso,
	id_ambiente=idambiente where id = vservidor;
end if;
END //
DELIMITER ;

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

/*Remove as contas agregada ao servidor*/
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

/* selecionado users relacionados ao grupo de envio email */
drop procedure bizusendmail;
DELIMITER //
CREATE PROCEDURE bizusendmail(IN _id INT, IN _projeto varchar(255)) 
BEGIN
declare valor varchar(15);
select nivel into valor from bizu where id = _id;
if valor != 'Pessoal' then
	 select email from permissao_email where projeto in (select projeto from 
     home where id = (select id_servidor from bizu where id = _id));
end if;
END //
DELIMITER ;

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
OUT _serial varchar(255), OUT _id_os INT, OUT _id_tipo_servidor INT, 
OUT _id_ambiente INT, OUT _id_setor INT, OUT _id_local INT, OUT _id_setor_descricao INT, IN idd INT)
BEGIN
select hostname, id_pais, serial, id_os, id_tipo_servidor, id_ambiente, 
id_setor, id_local, id_setor_descricao into _hostname, _id_pais, _serial, _id_os, 
_id_tipo_servidor, _id_ambiente, _id_setor, _id_local, _id_setor_descricao
from servidor where id = idd;
END //
DELIMITER ;

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
    
 when 'rede' then
 select count(id) into conta from local where local = valor;
	if conta = 0 then
		insert into rede_tipo(tipo)values(valor);
		select id,tipo as rede from rede_tipo order by tipo;
	else
		select 'existe';
	end if;
    
 when 'app_modelo' then
 select count(id) into conta from app_modelo where modelo = valor;
	if conta = 0 then
		insert into app_modelo(modelo)values(valor);
		select id,modelo as modelo from app_modelo order by modelo;
	else
		select 'existe';
	end if;     
END CASE;
END //
DELIMITER ;

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
 when 'rede' then
	case ud
     when 'update' then
		update rede_tipo set tipo = valor where id = _id;
	 when 'delete' then
		delete from rede_tipo where id = _id;
	end case;
when 'app_modelo' then
	case ud
    when 'update' then
		update app_modelo set modelo = valor where id = _id;
	when 'delete' then
		delete from app_modelo where id = _id;
	end case;
END CASE;
END //
DELIMITER ;

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
or local like concat('%',pesquisa,'%') or usuario like concat('%',pesquisa,'%') or acao like concat('%',pesquisa,'%')) 
and login = _user) order by id desc limit total offset pag;
END //
DELIMITER ;

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

drop procedure cadredes;
DELIMITER //
CREATE PROCEDURE cadredes(IN idsrv INT, IN ipfisico varchar(32), IN ipnat varchar(32), 
IN _nivel varchar(20), IN _subnivel varchar(20), IN _tipo varchar(20), IN _loginuser varchar(40))
BEGIN
declare idfisico int;
declare idnat int;
set @trcadrede = 1;
set @tr_salveredelogin = _loginuser;
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

/* ############	VIEW	###################### */
/* VERSAO 2
View HOME index e indexpg da app */
drop view home;
create view home as select s.id, s.hostname as host, p.pais as pais, s.serial, o.os as os, raux.ip_chaveado 
as ip, ts.tipo, amb.ambiente, str.projeto, strdes.descricao, lc.local, situ.situacao from servidor s 
INNER JOIN pais p ON s.id_pais = p.id INNER JOIN os o ON s.id_os = o.id INNER JOIN tipo_servidor ts 
ON s.id_tipo_servidor = ts.id INNER JOIN ambiente amb ON s.id_ambiente = amb.id INNER JOIN setor str 
ON s.id_setor = str.id INNER JOIN local lc ON s.id_local = lc.id INNER JOIN setor_descricao strdes 
ON s.id_setor_descricao = strdes.id LEFT OUTER JOIN rede_aux raux ON s.id = raux.id_servidor
LEFT OUTER JOIN situacao situ ON s.id_situacao = situ.id;

/* Select modal bizu inicial versao 2 */
drop view bizu;
create view bizu as select a.id, appm.modelo as app, a.comentario as com, a.login, a.senha, tapp.tipo 
as tipo, s.hostname as host, id_servidor, nacesso.nivel, amb.ambiente from app a INNER JOIN tipo_app tapp 
ON a.id_tipo_app = tapp.id INNER JOIN servidor s ON a.id_servidor = s.id INNER JOIN app_modelo appm 
ON a.id_app_modelo = appm.id INNER JOIN nivel_acesso nacesso ON a.id_nivel_acesso = nacesso.id 
INNER JOIN ambiente amb ON a.id_ambiente = amb.id;

/* Permissões de acesso por projeto */
drop view permissao_projeto;
create view permissao_projeto as select p.id,u.login,s.projeto from permissao p INNER JOIN usuario 
u ON p.id_usuario = u.id INNER JOIN setor s ON p.id_setor = s.id;

/* VIEW DO NIVEL DE ACESSO */
/* versao 2
Removi o appnacesso.id_servidor que valida a permissao por servidor. */
drop view appadmproj;
create view appadmproj as select appnacesso.id,nlacesso.nivel,pp.login,pp.projeto
from app_nivelacesso appnacesso INNER JOIN nivel_acesso nlacesso ON appnacesso.id_nivel_acesso = nlacesso.id 
INNER JOIN permissao_projeto pp ON appnacesso.id_permissao = pp.id;

drop view appnivelacesso; 
create view appnivelacesso as select a.id, appm.modelo as app, a.comentario as com, a.login, 
a.senha, tapp.tipo as tipo, s.hostname as id_servidor, nacesso.nivel 
from app a INNER JOIN tipo_app tapp ON a.id_tipo_app = tapp.id INNER JOIN servidor s ON a.id_servidor = s.id 
INNER JOIN app_modelo appm ON a.id_app_modelo = appm.id INNER JOIN nivel_acesso nacesso ON a.id_nivel_acesso = nacesso.id;

drop view senhapessoal;
create view senhapessoal as select ap.id, ap.id_app, u.login, ap.id_servidor from app_pessoal ap
INNER JOIN usuario u ON ap.id_usuario = u.id;

drop view permissao_ambiente;
create view permissao_ambiente as select useramb.id, u.login, amb.ambiente from usuario_ambiente useramb 
INNER JOIN usuario u ON useramb.id_usuario = u.id INNER JOIN ambiente amb ON useramb.id_ambiente = amb.id;

/* VERSAO 2 
View da tabela historico_servidor */
drop view historicosrv;
create view historicosrv as select s.id, s.hostname as host, p.pais as pais, s.serial, o.os as os, 
s.endereco_ip as ip, ts.tipo, amb.ambiente, str.projeto, strdes.descricao, u.login as usuario, lc.local, s.acao, 
data from historico_servidor s INNER JOIN pais p ON s.id_pais = p.id INNER JOIN os o ON s.id_os = o.id 
INNER JOIN tipo_servidor ts ON s.id_tipo_servidor = ts.id INNER JOIN ambiente amb ON s.id_ambiente = amb.id 
INNER JOIN setor str ON s.id_setor = str.id INNER JOIN local lc ON s.id_local = lc. id 
INNER JOIN setor_descricao strdes ON s.id_setor_descricao = strdes.id INNER JOIN usuario u 
ON s.id_usuario = u.id;

/* View da tabela historico_APP */
drop view historicoapp;
create view historicoapp as select happ.id,appm.modelo,happ.comentario,happ.login,senha,tapp.tipo,
happ.id_historico_servidor,amb.ambiente,usr.login as usuario,happ.acao from historico_app happ INNER JOIN 
app_modelo appm ON happ.id_app_modelo = appm.id INNER JOIN tipo_app tapp ON happ.id_tipo_app = tapp.id 
INNER JOIN ambiente amb ON happ.id_ambiente = amb.id INNER JOIN usuario usr ON happ.id_usuario = usr.id;

/* View da tabela user/mail/projeto */
drop view permissao_email;
create view permissao_email as select e.id, u.login, s.projeto, u.email from email e INNER JOIN usuario u 
ON e.id_usuario = u.id INNER JOIN setor s ON e.id_setor = s.id;

/* View da tabela REDES IPS */
drop view home_rede;
create view home_rede as select rede.id,rf.ip_fisico,rn.ip_nat,rt.tipo,rnivel.nivel,rsub.subnivel,rede.id_servidor from rede 
LEFT OUTER JOIN rede_fisica rf ON rede.id_rede_fisica = rf.id LEFT OUTER JOIN rede_nat rn ON rede.id_rede_nat = rn.id 
INNER JOIN rede_tipo rt ON rede.id_rede_tipo = rt.id INNER JOIN rede_nivel rnivel ON 
rede.id_rede_nivel = rnivel.id INNER JOIN rede_subnivel rsub ON rede.id_rede_subnivel = rsub.id;

/* View HOME rede Auxiliar REDES IPS */
drop view rede_aux;
create view rede_aux as select id_servidor,
	case
		when nivel = "Primario" and subnivel = "Fisico"
			then ip_fisico
		when nivel = "Primario" and subnivel = "Nat"
			then ip_nat
		else null
		end as ip_chaveado
		from home_rede having ip_chaveado is not null;
        
/* Auditor para visualizar a liberação admin da aplicacao */
drop view admin_audit;       
create view admin_audit as select admin.id,usr.login,usr.email from admin 
INNER JOIN usuario usr ON admin.id_usuario = usr.id;        

/* ############### TRIGGER ##################### */
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
declare idsrv int;
insert into historico_servidor (
hostname, id_pais, serial, 
id_os, endereco_ip, 
id_tipo_servidor, 
id_ambiente, id_setor, 
id_local, id_setor_descricao, 
id_usuario, acao, data) values 
(old.hostname, old.id_pais, old.serial, old.id_os, 
@tmprede, old.id_tipo_servidor, old.id_ambiente, 
old.id_setor, old.id_local, old.id_setor_descricao,(select @tmpuserbizudel),'Removido', now());
insert into historico_app (
id_app_modelo, comentario, login, senha, 
id_tipo_app, id_historico_servidor, id_ambiente, id_usuario, acao)
select id_app_modelo, comentario, login, senha, id_tipo_app, 
last_insert_id(), id_ambiente,(select @tmpuserbizudel),'Removido' from tmp_app;
END //
DELIMITER ;

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
DROP TRIGGER app_audit_del;
DELIMITER //
CREATE TRIGGER app_audit_del
    BEFORE delete ON app 
    FOR EACH ROW
BEGIN
declare idd int;
declare _user varchar(45);
if @triggerdelsrv is null then
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
@_id_setor_descricao, _user, 'subRegistro', now());

insert into historico_app (
id_app_modelo, comentario, login, senha, 
id_tipo_app, id_historico_servidor, id_ambiente, id_usuario, acao) 
values
(old.id_app_modelo, old.comentario, old.login, old.senha, old.id_tipo_app, 
h_idservidor(), old.id_ambiente, _user, 'Removido');
end if;
END //
DELIMITER ;

/* Grava registro na tabela histórico, quando a tabela rede sofre alteração */
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

/* Grava registro na table historico_rede e historico_servidor, quando
a tabela rede sofrer removação */
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
@_id_setor_descricao, 1, 'subRegistro', now());
insert into historico_rede(rede_fisica, rede_nat, id_rede_tipo, 
id_rede_nivel, id_rede_subnivel, id_historico_servidor,acao)
value((select ip_fisico from rede_fisica where id = old.id_rede_fisica),
(select ip_nat from rede_nat where id = old.id_rede_nat),old.id_rede_tipo,
old.id_rede_nivel,old.id_rede_subnivel, last_insert_id(), 'Removido');
END //
DELIMITER ;

/* ############### FUNCTION ##################### */
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

/* #############  INSERE VALORES TABELAS AUXILIARES ################# */

insert into mypass.pais (pais)values('Brasil');
insert into mypass.pais (pais)values('Africa');
insert into mypass.pais (pais)values('Canada');
insert into mypass.os (os)values('Linux');
insert into mypass.os (os)values('Windows');
insert into mypass.os (os)values('Solaris');
insert into mypass.tipo_servidor (tipo)values('Fisico');
insert into mypass.tipo_servidor (tipo)values('Vmware');
insert into mypass.tipo_servidor (tipo)values('Proxmox');
insert into mypass.tipo_servidor (tipo)values('LPAR');
insert into mypass.tipo_app (tipo)values('OpSys');
insert into mypass.tipo_app (tipo)values('App');
insert into mypass.ambiente (ambiente)values('Produção');
insert into mypass.ambiente (ambiente)values('Desenvolvimento');
insert into mypass.ambiente (ambiente)values('Homologação');
insert into mypass.setor (projeto)values('Sigres');
insert into mypass.setor (projeto)values('Moderna');
insert into mypass.setor (projeto)values('Indproj');
insert into mypass.setor (projeto)values('Sap');
insert into mypass.setor (projeto)values('Caixa');
insert into mypass.local (local)values('Xavier Curado');
insert into mypass.local (local)values('Guido Caloi');
insert into mypass.local (local)values('Sant. Parnaiba');
insert into mypass.setor_descricao (descricao)values('Massiva');
insert into mypass.setor_descricao (descricao)values('Ativação e Upload');
insert into mypass.setor_descricao (descricao)values('Thinkcat');
insert into mypass.setor_descricao (descricao)values('Ativação');
insert into mypass.setor_descricao (descricao)values('Upload');
insert into mypass.setor_descricao (descricao)values('Falhas');
insert into mypass.app_modelo (modelo)values('Mysql');
insert into mypass.app_modelo (modelo)values('Oracle');
insert into mypass.app_modelo (modelo)values('CMexcel');
insert into mypass.app_modelo (modelo)values('Weblogic');
insert into mypass.app_modelo (modelo)values('Proxmox');
insert into mypass.app_modelo (modelo)values('Pfsense');
insert into mypass.app_modelo (modelo)values('ActiveDirectory');
insert into mypass.app_modelo (modelo)values('Jetty');
insert into mypass.app_modelo (modelo)values('TomCat');
insert into mypass.nivel_acesso (nivel)values('Admin');
insert into mypass.nivel_acesso (nivel)values('Ambiente');
insert into mypass.nivel_acesso (nivel)values('Pessoal');
insert into mypass.rede_tipo (tipo)values('Adm/Console');
insert into mypass.rede_tipo (tipo)values('Fisico');
insert into mypass.rede_tipo (tipo)values('Nat/Sigres');
insert into mypass.rede_tipo (tipo)values('Nat/TCU');
insert into mypass.rede_tipo (tipo)values('Nat/Moderna');
insert into mypass.rede_nivel (nivel)values('Primario');
insert into mypass.rede_nivel (nivel)values('Secundario');
insert into mypass.rede_subnivel (subnivel)values('Fisico');
insert into mypass.rede_subnivel (subnivel)values('Nat');
insert into mypass.situacao (situacao)values('Ativo');
insert into mypass.situacao (situacao)values('Inativo');
