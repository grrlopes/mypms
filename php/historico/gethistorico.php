<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
require_once '../config.inc.php';
session_start();
if(!isset($_SESSION['user']) && 
!isset($_SESSION['pass'])) return;
if(!$_SESSION['adm']){
  $leitura = new leitura;
  $start = filter_input(INPUT_POST, 'start');
  $limit = filter_input(INPUT_POST, 'limit');
  $host = filter_input(INPUT_POST, 'host');
  $pais = filter_input(INPUT_POST, 'pais');
  $serial = filter_input(INPUT_POST, 'serial');
  $os = filter_input(INPUT_POST, 'os');
  $ip = filter_input(INPUT_POST, 'ip');
  $tipo = filter_input(INPUT_POST, 'tipo');
  $ambiente = filter_input(INPUT_POST, 'ambiente');
  $projeto = filter_input(INPUT_POST, 'projeto');
  $descricao = filter_input(INPUT_POST, 'descricao');
  $local = filter_input(INPUT_POST, 'local');
  $search = filter_input(INPUT_POST, 'search');
  if(isset($search)){
    $query = array();
    $valores = [$host,$pais,$serial,$os,$ip,$tipo,
    $ambiente,$projeto,$descricao,$local];
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
    $leitura->FullLeitura("select count(id) as total from historicosrv where projeto in (select projeto from ".
    "permissao_projeto where ($eu) and login = '{$_SESSION['user']}') order by id limit ".$limit);
    $total = $leitura->ObterResultado();
    $leitura->FullLeitura("select * from historicosrv where projeto in (select projeto from ".
    "permissao_projeto where ($eu) and login = '{$_SESSION['user']}') order by id desc limit ".$limit." offset ".$start);
    echo json_encode(array(
      "success" => true,
      "total" => $total[0]['total'],
      "dados" => $leitura->ObterResultado()
    ));
  }else{
    $leitura->FullLeitura("select count(id) as total from historicosrv where ".
    "projeto in (select projeto from permissao_projeto where login = '{$_SESSION['user']}')");
    $total = $leitura->ObterResultado();
    $leitura->FullLeitura("select * from historicosrv where projeto in (select projeto from ".
    "permissao_projeto where login = '{$_SESSION['user']}') order by id desc limit ".$limit." offset ".$start);
    echo json_encode(array(
      "success" => true,
      "total" => $total[0]['total'],
      "dados" => $leitura->ObterResultado()
    ));
  }
}