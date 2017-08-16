<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
require '../config.inc.php';
session_start();
if(!isset($_SESSION['user']) && 
!isset($_SESSION['pass'])) return;
$edicao = new edicao;
$criacao = new criacao;
$delete = new delete;
function replace_unicode_escape_sequence($match){
    return mb_convert_encoding(pack('H*', $match[1]), 'UTF-8', 'UCS-2BE');
}
function unicode_decode($str){
    return preg_replace_callback('/\\\\u([0-9a-f]{4})/i', 'replace_unicode_escape_sequence', $str);
}
$dados = filter_input(INPUT_POST,'dados');
$data = json_decode(stripslashes(unicode_decode($dados)));
if($data->decisao == 'criacao'){
    $criacao->GeraId('select id from bizu order by id desc limit 1');
    $idd = $criacao->ObterId();
    $valores = [$data->app, $data->com, $data->login, $data->senha, 
    $data->tipo, $data->id, $data->nivel, $data->ambiente,$_SESSION['user']];
    $criacao->ExecProcCriacao('bizucr', $valores);
    echo json_encode(array(
        "success" => true,
        "dados" => array(
            "id" => ++$idd
        )
    ));
}elseif($data->decisao == 'update'){
    $valores = [$data->app, $data->com, $data->login, $data->senha, 
    $data->tipo, $data->id, $data->nivel, $data->ambiente, $_SESSION['user']];
    $edicao->ExecProcEdicao($data->procedure,$valores);    
}elseif($data->decisao == 'delete'){
  $valores = [$data->id,$_SESSION['user']];
  $delete->ExecProcDelete($data->procedure,$valores);
}