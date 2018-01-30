MyPMS
============

<p align="center">
  <img src="https://i.imgur.com/7lKWsKM.png">
</p>

Objetivo
-------

MyPMS tem como objetivo, provisionar servidores por IP, hostname, localidade, projeto, ambiente, pais, serial, descrição e situação(ativo/disativado). Armazenamento de credenciais tanto individual como compartilha com base na regra de niveis de acesso.

Funcionalidades
---------------

1. Armazenar credencias de acesso, compartilhada e individual e as credenciais das aplicações.
	- Regras de credencias:
		- Flag **Pessoal** Torna o login/senha e demais atributos restrito apenas ao login que cadastrou
		- Flag **Admin** Torna o login/senha e demais atributos restrito aos administadores
		- Flag **Ambiente** Torna o login/senha e demais atributos restritos apenas aos membros do ambiente. EX: Produção, Desenvolvimento e Homologação 
2. Regras de niveis de acessos baseado em grupos de projetos. Ex: Membro do projeto exemplo1 não visualizada servidores/credenciais do projeto exemplo2. 
3. Histórico dos atributos que fora alterados. Ex: senha, ip de servidor, localidade e etc. Obs: **Somente membros Admins tem acesso ao recurso Histórico**


Requisitos
----------

1. Servidor Apache2.x
2. PHP 5.6+
	- PDO
	- MYSQL
	- LDAP
3. MYSQL 5.7+
4. Microsoft Active Directory 2008

Instalação
----------

Descompactar o arquivo, dentro da pasta htdocs do servidor HTTP

1. Download http://xxxxx
2. tar -xzvf xxxx.tar.gz

Configuração
------------

Efetuar alteração do arquivo de configuração **config.inc.php**.

```
define("HOST", "192.168.1.20");
define("BANCO", "mypass");
define("PORTA", "3306");
define("USER", "root");
define("SENHA", "123456");

define("ADHOST","ldap://10.130.214.252");
define("ADUSER","SERVICEMYPMS@dominio.com.br");
define("ADSENHA","senha");
define("ADARVORE","dc=dominio,dc=com,dc=br");
define("ADPORTA", "389");
```

Ex:

FIXO   | VALOR
------ | ------
HOST   | "IP do Servidor de banco de dados"
BANCO  | "Nome do schema"
ADHOST | "ldap://IP do Servidor Active Directory"

<p align="center">
  <a href="https://imgur.com/zDuBnnO"><img src="https://i.imgur.com/zDuBnnO.png" title="source: imgur.com" /></a>
</p>