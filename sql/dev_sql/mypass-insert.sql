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
insert into mypass.login_app (login)values('root');
insert into mypass.login_app (login)values('infra');
insert into mypass.login_app (login)values('weblogic');
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
insert into mypass.situacao (situacao)values('Ativo');
insert into mypass.situacao (situacao)values('Inativo');

insert into mypass.rede_tipo (tipo)values('Fisico/Real');
insert into mypass.rede_tipo (tipo)values('Nat/Sigres');
insert into mypass.rede_tipo (tipo)values('nat/TCU');
insert into mypass.rede_tipo (tipo)values('nat/Moderna');
insert into mypass.rede_nivel (nivel)values('Primario');
insert into mypass.rede_nivel (nivel)values('Secundario');
insert into mypass.rede_nivel (nivel)values('Origem');
insert into mypass.rede_nivel (nivel)values('Nat');

insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'YHTY343','3','40.130.214',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'21zvret','1','10.130.214',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'ty34yhu','2','20.130.214',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, endereco_ip, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'hjhj321','3','30.130.214',3 ,2 ,1, 1, 4);

insert into mypass.servidor (hostname, id_pais, serial, id_os, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('smb02',1,'xxxxx','1',1, 1 ,1, 3, 1);
insert into mypass.servidor (hostname, id_pais, serial, id_os, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr',2,'xxxxx','2',4 ,3 ,2, 2, 3);
insert into mypass.servidor (hostname, id_pais, serial, id_os, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('cmbr2',3,'xxxxx','3',3 ,2 ,1, 1, 4);
insert into mypass.servidor (hostname, id_pais, serial, id_os, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('infra01',3,'xxxxx','3',2 ,2 ,1, 1, 6);
insert into mypass.servidor (hostname, id_pais, serial, id_os, id_tipo_servidor, id_ambiente, id_setor, id_local, id_setor_descricao) 
values('namerota',3,'xxxxx','3',2 ,2 ,1, 1, 6);

insert into mypass.app (id_app_modelo, comentario, id_login, senha, id_tipo_app, id_servidor)
values(1,'htt://localhost:7001','1','123456',2 ,2);
insert into mypass.app (id_app_modelo, comentario, id_login, senha, id_tipo_app, id_servidor)
values(9,'htt://localhost:8080','2','123mudar',2 ,3);
insert into mypass.app (id_app_modelo, comentario, id_login, senha, id_tipo_app, id_servidor)
values(8,'htt://localhost:8081','2','54321#',1 ,4);
insert into mypass.app (id_app_modelo, comentario, id_login, senha, id_tipo_app, id_servidor)
values(7,'Acesso total',2 ,'123mudar' ,1 ,4);
insert into mypass.app (id_app_modelo, comentario, id_login, senha, id_tipo_app, id_servidor)
values(7,'blah blah',2 ,'xyzSENHA' ,1 ,4);

/* NO MOMENTO TESTE###--> Inserção dos acessos no servidor app 
com validação permissões pessoal todos adm*/
insert into app (id_app_modelo, comentario, id_login, senha, id_tipo_app, 
id_servidor, id_app_nivelacesso) values(5,'htt://localhost:8080','1','#@$gf',2 ,2,3);
insert into app_nivelacesso(id_nivel_acesso,id_permissao)values('3','4');

insert into mypass.app (id_app_modelo, comentario, id_login, senha, id_tipo_app, id_servidor, 
id_nivel_acesso, id_ambiente)values(2,'meunome',1,'kkkjjjj' ,1 ,1, 2, 2);