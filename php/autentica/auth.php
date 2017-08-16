<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
require_once '../config.inc.php';
session_start();
$msg = '.';
$user = filter_input(INPUT_POST, 'user');
$pass = filter_input(INPUT_POST, 'pass');
$leitura = new leitura;
$leitura->FullLeitura("select login from admin_audit where login = '$user'");
if(!isset($_SESSION['user']) && !isset($_SESSION['pass'])){
    $actived = new l_activedirec;
    if(!isset($user) && !isset($pass)) return;
    $actived->ValidaAuth($user."@indproj.com.br",$pass);
    $_SESSION['sucesso'] = false;
    if($actived->ObterAuth()){
        if(empty($leitura->ObterResultado()[0]['login'])){
            $_SESSION['adm'] = true;
        }else{
            $_SESSION['adm'] = false;
        }
        $msg = "Usuario ou Senha valido";
        $_SESSION['user'] = $user;
        $_SESSION['pass'] = $pass;
        $_SESSION['sucesso'] = true;
    }else{
        $msg = "Usuário ou Senha Incorreto.";
    }
    echo json_encode(array(
        "success" => $_SESSION['sucesso'],
        "adm" => $_SESSION['adm'],
        "msg" => $msg
    ));
}elseif(isset($_SESSION['user']) && isset($_SESSION['pass'])){   
    echo json_encode(array(
        "success" => $_SESSION['sucesso'],
        "adm" => $_SESSION['adm'],
        "msg" => $msg
    ));    
}else{
    echo json_encode(array(
        "success" => false,
        "adm" => false,
        "msg" => $msg
    )); 
}