SET SQL_SAFE_UPDATES=0;
use mypass;
update app set id_app_modelo=(select id from app_modelo where modelo = 'Tomcat'),
comentario='kk31231k',id_login=(select id from login_app where login = 'infra'),senha='123321',
id_tipo_app=(select id from tipo_app where tipo = 'App') where id = 6;
select * from app where id = 6;