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
$seletor = filter_input(INPUT_POST, 'seletor');
$decisao = filter_input(INPUT_POST, 'decisao');
$projeto = filter_input(INPUT_POST, 'projeto');
$procedure = filter_input(INPUT_POST, 'procedure');
$dados = filter_input(INPUT_POST, 'dados');
$data = json_decode(stripslashes($dados));
if($decisao == 'leitura'){
  switch($seletor){
    case 'ambiente':
      $leitura->FullLeitura("select * from permissao_ambiente where login = '{$_SESSION['user']}'");
      echo json_encode(array(
        "success" => true,
        "dados" => $leitura->ObterResultado()
      ));      
      break;
    
    default:
      $leitura->FullLeitura('select * from projeto');
      echo json_encode(array(
        "success" => true,
        "dados" => $leitura->ObterResultado()
      ));
    break;
  }
}