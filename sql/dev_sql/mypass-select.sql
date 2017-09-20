/* QUERY DA VERSÃO 6 DA MODELAGEM *

use mypass;
select s.id, s.hostname, p.pais as id_pais, s.serial, o.os as id_os, s.endereco_ip, 
ts.tipo, s.id_permissao from servidor s INNER JOIN pais p ON s.id_pais = p.id INNER JOIN 
os o ON s.id_os = o.id INNER JOIN tipo_servidor ts ON s.id_tipo_servidor = ts.id;

use mypass;
select a.id, a.app, a.comentario, logapp.login as id_login, a.senha, tapp.tipo as id_tipo_app, 
s.hostname as id_servidor from app a INNER JOIN login_app logapp ON a.id_login = logapp.id INNER JOIN 
tipo_app tapp ON a.id_tipo_app = tapp.id INNER JOIN servidor s ON a.id_servidor = s.id;

use mypass;
select s.id, s.hostname, p.pais as id_pais, s.serial, o.os as id_os, s.endereco_ip, ts.tipo, 
s.id_permissao, amb.ambiente, str.projeto, str.descricao, lc.local from servidor s INNER JOIN 
pais p ON s.id_pais = p.id INNER JOIN os o ON s.id_os = o.id INNER JOIN tipo_servidor ts ON 
s.id_tipo_servidor = ts.id INNER JOIN ambiente amb ON s.id_ambiente = amb.id INNER JOIN setor str 
ON s.id_setor = str.id INNER JOIN local lc ON s.id_local = lc.id;
*/
/*use mypass;*/
select s.id, s.hostname, p.pais as pais, s.serial, o.os as os, s.endereco_ip, ts.tipo, 
amb.ambiente, str.projeto, strdes.descricao, lc.local from servidor s INNER JOIN pais p ON 
s.id_pais = p.id INNER JOIN os o ON s.id_os = o.id INNER JOIN tipo_servidor ts 
ON s.id_tipo_servidor = ts.id INNER JOIN ambiente amb ON s.id_ambiente = amb.id INNER JOIN setor 
str ON s.id_setor = str.id INNER JOIN local lc ON s.id_local = lc.id INNER JOIN setor_descricao 
strdes ON s.id_setor_descricao = strdes.id order by id;

/* visualização da senha/login de cada servidor */
use mypass;
select a.id, appm.modelo as app, a.comentario as com, logapp.login as login, a.senha, 
tapp.tipo as tipo, s.hostname as id_servidor from app a INNER JOIN login_app logapp 
ON a.id_login = logapp.id INNER JOIN tipo_app tapp ON a.id_tipo_app = tapp.id 
INNER JOIN servidor s ON a.id_servidor = s.id INNER JOIN app_modelo appm ON 
a.id_app_modelo = appm.id where a.id_servidor = 1 order by a.id;
/*
insert into app (id_app_modelo,comentario,id,login,senha,id_tipo_app,id_servidor)
select id from app_modelo where modelo = 'Mysql','kkkk',1,'123321','App',2;
*/

/* Query onde libera a visualização de cada usuario por grupo de projeto*/
use mypass;
select * from home where projeto in (select s.projeto from permissao p INNER JOIN usuario 
u ON p.id_usuario = u.id INNER JOIN setor s ON p.id_setor = s.id where u.login = 'grrodrigues');

/* LEMBRETE NO MOMENTO TESTE####-->> Seleção dos acessos via select na modal bizu */
select appnacesso.id,nlacesso.nivel,pp.login,pp.projeto 
from app_nivelacesso appnacesso INNER JOIN nivel_acesso nlacesso ON 
appnacesso.id_nivel_acesso = nlacesso.id INNER JOIN permissao_projeto pp ON 
appnacesso.id_permissao = pp.id;
/* Teste 1 */
select a.id, appm.modelo as app, a.comentario as com, logapp.login as login, a.senha, tapp.tipo 
as tipo, s.hostname as id_servidor, nacesso.nivel from app a INNER JOIN login_app logapp 
ON a.id_login = logapp.id INNER JOIN tipo_app tapp ON a.id_tipo_app = tapp.id 
INNER JOIN servidor s ON a.id_servidor = s.id INNER JOIN app_modelo appm 
ON a.id_app_modelo = appm.id INNER JOIN nivel_acesso nacesso ON a.id_nivel_acesso = nacesso.id
INNER JOIN app_pessoal apessoal ON a.id_nivel_acesso = apessoal.id_app;
/* Teste 2 */
select a.id, appm.modelo as app, a.comentario as com, logapp.login as login, a.senha, tapp.tipo 
as tipo, s.hostname as id_servidor, nacesso.nivel from app a INNER JOIN login_app logapp 
ON a.id_login = logapp.id INNER JOIN tipo_app tapp ON a.id_tipo_app = tapp.id 
INNER JOIN servidor s ON a.id_servidor = s.id INNER JOIN app_modelo appm 
ON a.id_app_modelo = appm.id INNER JOIN nivel_acesso nacesso ON a.id_nivel_acesso = nacesso.id
INNER JOIN app_pessoal apessoal;
/* Teste 3 */
select * from appnivelacesso where id in(select id_app from app_pessoal where id_usuario = 1) 
or nivel = 'Todos';
select * from appnivelacesso where id in(select id_app from app_pessoal where id_usuario = 1) 
or nivel = 'Todos' or nivel = (select nivel from appadm where login = 'grrodrigues');
 select * from bizu where id in(select id_app from app_pessoal where id_usuario = 2) or nivel = 'Todos' 
 or nivel = (select nivel from appadmproj where login = 'alazaroc');
 select * from bizu where id in(select id_app from senhapessoal where login = 'grrodrigues') 
 or nivel = 'Todos' or nivel = (select nivel from appadmproj where login = 'grrodrigues');
/* Teste 4 */
select * from bizu where id in(select id_app from senhapessoal where login = 'grrodrigues') 
or nivel = 'Todos' or nivel = (select nivel from appadmproj where login = 'grrodrigues' 
and projeto in (select projeto from permissao_projeto where login = 'grrodrigues'));

select * from bizu where id in(select id_app from senhapessoal where login = 'alazaroc') 
or nivel = 'Todos' or nivel = (select nivel from appadmproj where login = 'alazaroc' 
and projeto in (select projeto from permissao_projeto where login = 'alazaroc'));