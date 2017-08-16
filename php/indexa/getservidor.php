<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
require_once '../config.inc.php';
session_start();
if(!isset($_SESSION['user']) && 
!isset($_SESSION['pass'])) return;
$start = filter_input(INPUT_GET, 'start');
$limit = filter_input(INPUT_GET, 'limit');
$page = filter_input(INPUT_GET, 'page');
$leitura = new leitura;
$dados = filter_input(INPUT_POST, 'dados');
$host = filter_input(INPUT_GET, 'host');
$pais = filter_input(INPUT_GET, 'pais');
$serial = filter_input(INPUT_GET, 'serial');
$os = filter_input(INPUT_GET, 'os');
$ip = filter_input(INPUT_GET, 'ip');
$tipo = filter_input(INPUT_GET, 'tipo');
$ambiente = filter_input(INPUT_GET, 'ambiente');
$projeto = filter_input(INPUT_GET, 'projeto');
$descricao = filter_input(INPUT_GET, 'descricao');
$local = filter_input(INPUT_GET, 'local');
$situacao = filter_input(INPUT_GET, 'situacao');
$search = filter_input(INPUT_GET, 'search');
$data = json_decode(stripslashes($dados));
if(isset($search)){
  $query = array();
  $valores = [$host,$pais,$serial,$os,$ip,$tipo,
  $ambiente,$projeto,$descricao,$local,$situacao];
  foreach ($valores as $value) {
    if(isset($value)){
      array_push($query,"or ".$value." like '$search%'");
    }
  }
  $teste = explode(" ",$query[0]);
  unset($teste[0]);
  $ttt = implode(" ", $teste);
  array_unshift($query, $ttt);
  $eu = implode(' ', array_values($query));
  $leitura->FullLeitura("select count(id) as total from home where projeto in (select projeto from ".
  "permissao_projeto where ($eu) and login = '{$_SESSION['user']}') order by id limit ".$limit);
  $total = $leitura->ObterResultado();
  $leitura->FullLeitura("select * from home where projeto in (select projeto from permissao_projeto ".
  "where ($eu) and login = '{$_SESSION['user']}') order by id limit ".$limit." offset ".$start);
  echo json_encode(array(
    "success" => true,
    "total" => $total[0]['total'],
    "dados" => $leitura->ObterResultado()
  ));
}else{
  $leitura->FullLeitura("select count(id) as total from home where ".
  "projeto in (select projeto from permissao_projeto where ". 
  "login = '{$_SESSION['user']}' and login = '{$_SESSION['user']}')");
  $total = $leitura->ObterResultado();
  $leitura->FullLeitura(" select * from home where projeto in (select projeto from ".
  "permissao_projeto where login = '{$_SESSION['user']}') order by id limit ".$limit." offset ".$start);
  echo json_encode(array(
    "success" => true,
    "total" => $total[0]['total'],
    "dados" => $leitura->ObterResultado()
  ));
}