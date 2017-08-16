<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
 abstract class conexao {

    private static $Host = HOST;
    private static $User = USER;
    private static $Pass = SENHA;
    private static $Db = BANCO;
    private static $Porta = PORTA;
    private static $Conexao = null;

    private static $lhost = LHOST;
    private static $luser = LUSER;
    private static $lsenha = LSENHA;
    private static $lporta = LPORTA;
    protected static $larvore = LARVORE;
    protected static $larvore1 = LARVORE1;
    private static $lconexao;
    private static $lconexao1;
    private static $lacesso;

    private static $adhost = ADHOST;
    private static $aduser = ADUSER;
    private static $adsenha = ADSENHA;
    protected static $adarvore = ADARVORE;
    private static $adporta = ADPORTA;
    private static $adconexao;
    private static $adconexao1;
    private static $adacesso;    


    private static function conectar(){
        try {
            if(self::$Conexao == null){
                $dsn = 'mysql:host='. self::$Host. ';port='. self::$Porta. ';dbname='. self::$Db;
                $options = [ PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES UTF8'];
                self::$Conexao = new PDO($dsn, self::$User, self::$Pass, $options);
            }
        }catch (PDOException $e){
            echo "Erro: ".$e->getCode(), $e->getMessage() ,$e->getLine();
            die();
        }
        self::$Conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return self::$Conexao;
    }

    public static function fazercon(){
        return self::conectar();
    }


    private static function Lconectar(){
        self::$lconexao = ldap_connect(self::$lhost,self::$lporta);
        ldap_set_option(self::$lconexao, LDAP_OPT_SIZELIMIT, 10000);
        if(self::$lacesso){
            return self::$lconexao;
        }else{
            self::$lconexao;
        }
    }

    public static function Lfazercon(){
        self::Lconectar();
        self::$lconexao1 = ldap_bind(self::$lconexao,self::$luser,self::$lsenha);
        if(self::$lconexao1){
         self::$lacesso = TRUE;
         return self::Lconectar();
        }else{
            return 'Falha na autenticacao';
        }
    }

    private static function Adconectar(){
        self::$adconexao = ldap_connect(self::$adhost,self::$adporta);
        if(self::$adacesso){
            ldap_set_option(self::$adconexao, LDAP_OPT_SIZELIMIT, 0);
            ldap_set_option(self::$adconexao, LDAP_OPT_PROTOCOL_VERSION, 3);
            ldap_set_option(self::$adconexao, LDAP_OPT_REFERRALS, 0);           
            ldap_bind(self::$adconexao,self::$aduser,self::$adsenha);
            return self::$adconexao;
        }else{
            self::$adconexao;
        }
    }

    public static function Adfazercon(){
        self::Adconectar();
        self::$adconexao1 = ldap_bind(self::$adconexao,self::$aduser,self::$adsenha);
        if(self::$adconexao1){
         self::$adacesso = TRUE;
         return self::Adconectar();
        }else{
            return 'Falha na autenticacao';
        }
    }
}
