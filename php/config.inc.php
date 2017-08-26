<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
define("HOST", "192.168.1.20");
define("BANCO", "mypass");
define("PORTA", "3306");
define("USER", "root");
define("SENHA", "123456");

define("LHOST", "localhost");
define("LUSER","cn=Manager,dc=dominio,dc=com");
define("LSENHA","123456");
define("LARVORE","dc=dominio,dc=com");
define("LARVORE1","ou=Groups,dc=dominio,dc=com");
define("LPORTA","389");
define("LGRUPO","Infraestrutura");

define("ADHOST","ldap://10.130.214.252");
define("ADUSER","SERVICEMYPMS@dominio.com.br");
define("ADSENHA","senha");
define("ADARVORE","dc=dominio,dc=com,dc=br");
define("ADPORTA", "389");

function __autoload($Class){
    $dir = ['class'];
    $idir = null;
    foreach($dir as $dirnome){
        if(!$idir && file_exists(__DIR__ . "//{$dirnome}//{$Class}.class.php")){
          include_once __DIR__ . "//{$dirnome}//{$Class}.class.php";
        }
        if(!$idir && file_exists(__DIR__ . "//{$dirnome}//{$Class}.php")){
            include_once __DIR__ . "//{$dirnome}//{$Class}.php";
        }
        $idir = TRUE;
    }
}
