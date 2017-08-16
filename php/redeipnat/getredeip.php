<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
require_once '../config.inc.php';
session_start();
if(!isset($_SESSION['user']) && 
!isset($_SESSION['pass'])) return;
$leitura = new leitura;
$idd = filter_input(INPUT_POST, 'id');
$decisao = filter_input(INPUT_POST, 'decisao');
if($decisao == 'rede'){
    $leitura->FullLeitura("select * from home_rede where id_servidor = $idd");
    echo json_encode(array(
        "success" => true,
        "dados" => $leitura->ObterResultado()    
    ));
}elseif($decisao == 'tipo'){
    $leitura->FullLeitura("select * from rede_tipo");
    echo json_encode(array(
        "success" => true,
        "dados" => $leitura->ObterResultado()
    ));
}elseif($decisao == 'nivel'){
    $leitura->FullLeitura("select * from rede_nivel");
    echo json_encode(array(
        "success" => true,
        "dados" => $leitura->ObterResultado()
    ));
}elseif($decisao == 'subnivel'){
    $leitura->FullLeitura("select * from rede_subnivel");
    echo json_encode(array(
        "success" => true,
        "dados" => $leitura->ObterResultado()
    ));
}