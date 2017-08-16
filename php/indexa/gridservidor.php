<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
require_once '../config.inc.php';
$edicao = new edicao;
$criacao = new criacao;
$delete = new delete;
session_start();
if(!isset($_SESSION['user']) && 
!isset($_SESSION['pass'])) return;
$dados = filter_input(INPUT_POST, 'dados');
$data = json_decode(stripslashes($edicao->UnicodeDecode($dados)));
if($data->decisao == 'update'){
    $valores = [$data->host,$data->pais,$data->serial,$data->os,$data->ip,$data->tipo,$data->ambiente,
    $data->projeto,$data->local,$data->descricao,$data->id,$_SESSION['user'],$data->situacao];
    $edicao->ExecProcEdicao($data->procedure,$valores);
}elseif($data->decisao == 'criacao'){
    $criacao->GeraId('select * from home order by id desc limit 1');
    $idd = $criacao->ObterId();    
    $valores = [$data->host,$data->pais,$data->serial,$data->os,$data->ip,$data->tipo,$data->ambiente,
    $data->projeto,$data->local,$data->descricao];
    $criacao->ExecProcCriacao($data->procedure,$valores);
    echo json_encode(array(
    "success" => true,
    "dados" => array(
        "id" => ++$idd
    )
    ));       
}elseif($data->decisao == 'delete'){
    $valores = [$data->id,$_SESSION['user']];
    $delete->ExecProcDelete($data->procedure,$valores);
}