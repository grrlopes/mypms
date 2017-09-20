/* View index e indexpg da app*/
drop view home;
create view home as select s.id, s.hostname as host, p.pais as pais, s.serial, o.os
as os, s.endereco_ip as ip, ts.tipo, amb.ambiente,
str.projeto, strdes.descricao, lc.local from servidor s INNER JOIN pais p
ON s.id_pais = p.id INNER JOIN os o ON s.id_os = o.id INNER JOIN tipo_servidor
ts ON s.id_tipo_servidor = ts.id INNER JOIN ambiente amb ON s.id_ambiente = amb.id
INNER JOIN setor str ON s.id_setor = str.id INNER JOIN local lc ON s.id_local = lc.
id INNER JOIN setor_descricao strdes ON s.id_setor_descricao = strdes.id;

/* VERSAO 2
View index e indexpg da app */
drop view home;
create view home as select s.id, s.hostname as host, p.pais as pais, s.serial, o.os as os, 
raux.ip_fisico as ip, ts.tipo, amb.ambiente, str.projeto, strdes.descricao, lc.local from servidor s 
INNER JOIN pais p ON s.id_pais = p.id INNER JOIN os o ON s.id_os = o.id INNER JOIN tipo_servidor ts 
ON s.id_tipo_servidor = ts.id INNER JOIN ambiente amb ON s.id_ambiente = amb.id INNER JOIN setor str 
ON s.id_setor = str.id INNER JOIN local lc ON s.id_local = lc.id INNER JOIN setor_descricao strdes 
ON s.id_setor_descricao = strdes.id LEFT OUTER JOIN home_rede_aux raux ON s.id = raux.id_servidor;

/* VERSAO 3
View HOME index e indexpg da app */
drop view home;
create view home as select s.id, s.hostname as host, p.pais as pais, s.serial, o.os as os, raux.ip_chaveado 
as ip, ts.tipo, amb.ambiente, str.projeto, strdes.descricao, lc.local, situ.situacao from servidor s 
INNER JOIN pais p ON s.id_pais = p.id INNER JOIN os o ON s.id_os = o.id INNER JOIN tipo_servidor ts 
ON s.id_tipo_servidor = ts.id INNER JOIN ambiente amb ON s.id_ambiente = amb.id INNER JOIN setor str 
ON s.id_setor = str.id INNER JOIN local lc ON s.id_local = lc.id INNER JOIN setor_descricao strdes 
ON s.id_setor_descricao = strdes.id LEFT OUTER JOIN rede_aux raux ON s.id = raux.id_servidor
LEFT OUTER JOIN situacao situ ON s.id_situacao = situ.id;

/* Select modal bizu inicial */
create view bizu as select a.id, appm.modelo as app, a.comentario as com,
logapp.login as login, a.senha, tapp.tipo as tipo, s.hostname as host, id_servidor
from app a INNER JOIN login_app logapp ON a.id_login = logapp.id INNER JOIN
tipo_app tapp ON a.id_tipo_app = tapp.id INNER JOIN servidor s ON a.id_servidor = s.id INNER
JOIN app_modelo appm ON a.id_app_modelo = appm.id;
/* Select modal bizu inicial versao 2 */
drop view bizu;
create view bizu as select a.id, appm.modelo as app, a.comentario as com,
logapp.login as login, a.senha, tapp.tipo as tipo, s.hostname as host, id_servidor, nacesso.nivel,
amb.ambiente from app a INNER JOIN login_app logapp ON a.id_login = logapp.id INNER JOIN
tipo_app tapp ON a.id_tipo_app = tapp.id INNER JOIN servidor s ON a.id_servidor = s.id INNER
JOIN app_modelo appm ON a.id_app_modelo = appm.id
INNER JOIN nivel_acesso nacesso ON a.id_nivel_acesso = nacesso.id
INNER JOIN ambiente amb ON a.id_ambiente = amb.id;

/* depois de alterado os campos na modal bizu, volta pra tag td, com os valores atualizados */
drop view bizumc;
create view bizumc as select a.id, appm.modelo as app, a.comentario as com,
logapp.login as login, a.senha, tapp.tipo as tipo, s.hostname as id_servidor, amb.ambiente,
nacesso.nivel from app a INNER JOIN login_app logapp ON a.id_login = logapp.id INNER JOIN
tipo_app tapp ON a.id_tipo_app = tapp.id INNER JOIN servidor s ON a.id_servidor = s.id INNER
JOIN app_modelo appm ON a.id_app_modelo = appm.id
INNER JOIN nivel_acesso nacesso ON a.id_nivel_acesso = nacesso.id
INNER JOIN ambiente amb ON a.id_ambiente = amb.id;

/* Permissões de acesso por projeto */
drop view permissao_projeto;
create view permissao_projeto as select p.id,u.login,s.projeto from permissao p INNER JOIN usuario 
u ON p.id_usuario = u.id INNER JOIN setor s ON p.id_setor = s.id;

/* TESTE NO MOMENTO VIEW DO NIVEL DE ACESSO */
/* versao 1*/
drop view appadmproj;
create view appadmproj as select appnacesso.id,nlacesso.nivel,pp.login,pp.projeto,appnacesso.id_servidor
from app_nivelacesso appnacesso INNER JOIN nivel_acesso nlacesso ON appnacesso.id_nivel_acesso = nlacesso.id 
INNER JOIN permissao_projeto pp ON appnacesso.id_permissao = pp.id;
/* versao 2
Removi o appnacesso.id_servidor que valida a permissao por servidor. */
drop view appadmproj;
create view appadmproj as select appnacesso.id,nlacesso.nivel,pp.login,pp.projeto
from app_nivelacesso appnacesso INNER JOIN nivel_acesso nlacesso ON appnacesso.id_nivel_acesso = nlacesso.id 
INNER JOIN permissao_projeto pp ON appnacesso.id_permissao = pp.id;

/* Teste 1 */
drop view appnivelacesso;
create view appnivelacesso as select a.id, appm.modelo as app, a.comentario as com, logapp.login 
as login, a.senha, tapp.tipo as tipo, s.hostname as id_servidor, nacesso.nivel 
from app a INNER JOIN login_app logapp ON a.id_login = logapp.id INNER JOIN tipo_app tapp 
ON a.id_tipo_app = tapp.id INNER JOIN servidor s ON a.id_servidor = s.id INNER JOIN app_modelo appm 
ON a.id_app_modelo = appm.id INNER JOIN nivel_acesso nacesso ON a.id_nivel_acesso = nacesso.id;
/* Versao 2 do teste1 */
drop view appnivelacesso; 
create view appnivelacesso as select a.id, appm.modelo as app, a.comentario as com, a.login, 
a.senha, tapp.tipo as tipo, s.hostname as id_servidor, nacesso.nivel 
from app a INNER JOIN tipo_app tapp ON a.id_tipo_app = tapp.id INNER JOIN servidor s ON a.id_servidor = s.id 
INNER JOIN app_modelo appm ON a.id_app_modelo = appm.id INNER JOIN nivel_acesso nacesso ON a.id_nivel_acesso = nacesso.id;

/* Teste 2 */
drop view senhapessoal;
create view senhapessoal as select ap.id, ap.id_app, u.login, ap.id_servidor from app_pessoal ap
INNER JOIN usuario u ON ap.id_usuario = u.id;
/* Teste 3 */
drop view permissao_ambiente;
create view permissao_ambiente as select useramb.id, u.login, amb.ambiente from usuario_ambiente useramb 
INNER JOIN usuario u ON useramb.id_usuario = u.id INNER JOIN ambiente amb ON useramb.id_ambiente = amb.id;

/* View da tabela historico_servidor */
drop view historicosrv;
create view historicosrv as select s.id, s.hostname as host, p.pais as pais, s.serial, o.os as os, 
s.endereco_ip as ip, ts.tipo, amb.ambiente, str.projeto, strdes.descricao, u.login, lc.local, s.acao, 
data from historico_servidor s INNER JOIN pais p ON s.id_pais = p.id INNER JOIN os o ON s.id_os = o.id 
INNER JOIN tipo_servidor ts ON s.id_tipo_servidor = ts.id INNER JOIN ambiente amb ON s.id_ambiente = amb.id 
INNER JOIN setor str ON s.id_setor = str.id INNER JOIN local lc ON s.id_local = lc. id 
INNER JOIN setor_descricao strdes ON s.id_setor_descricao = strdes.id INNER JOIN usuario u 
ON s.id_usuario = u.id;

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

use mypass;
drop view historicoapp;
create view historicoapp as select happ.id,appm.modelo,happ.comentario,lapp.login,senha,tapp.tipo,
happ.id_historico_servidor,amb.ambiente,usr.login as usuario,happ.acao from historico_app happ INNER JOIN 
app_modelo appm ON happ.id_app_modelo = appm.id INNER JOIN login_app lapp ON happ.id_login = lapp.id 
INNER JOIN tipo_app tapp ON happ.id_tipo_app = tapp.id INNER JOIN ambiente amb ON happ.id_ambiente = amb.id 
INNER JOIN usuario usr ON happ.id_usuario = usr.id;

/* View da tabela user/mail/projeto */
drop view permissao_email;
create view permissao_email as select e.id, u.login, s.projeto, u.email from email e INNER JOIN usuario u 
ON e.id_usuario = u.id INNER JOIN setor s ON e.id_setor = s.id;

/* View da tabela REDES IPS */
drop view home_rede;
create view home_rede as select rede.id,rf.ip_fisico,rn.ip_nat,rt.tipo,rnivel.nivel,rsub.subnivel,rede.id_servidor from rede 
INNER JOIN rede_fisica rf ON rede.id_rede_fisica = rf.id LEFT JOIN rede_nat rn ON rede.id_rede_nat = rn.id 
INNER JOIN rede_tipo rt ON rede.id_rede_tipo = rt.id INNER JOIN rede_nivel rnivel ON 
rede.id_rede_nivel = rnivel.id INNER JOIN rede_subnivel rsub ON rede.id_rede_subnivel = rsub.id;

/* View HOME rede Auxiliar REDES IPS */
drop view rede_aux;
/*create view home_rede_aux as select ip_fisico,id_servidor from home_rede where nivel = 'Primario';
select id_servidor,
	case
		when nivel = "Primario" and subnivel = "Origem"
			then ip_fisico
				end as ip_fisico,
	case
		when nivel = "Primario" and subnivel = "Nat"
			then ip_nat
				else null
				end as ip_nat
        from home_rede where id_servidor = 9; */
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