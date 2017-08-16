<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
require_once '../config.inc.php';
session_start();
if(!isset($_SESSION['user']) && 
!isset($_SESSION['pass'])) return;
$edicao = new edicao;
$criacao = new criacao;
$delete = new delete;
$dados = filter_input(INPUT_POST, 'dados');
$data = json_decode(stripslashes($dados));
if($data->decisao == 'criacao'){
    $valores = [$data->id,$data->ip_fisico,$data->ip_nat,
    $data->nivel,$data->subnivel,$data->tipo,$_SESSION['user']];
    $criacao->ExecProcCriacao($data->procedure,$valores); 
}elseif($data->decisao == 'delete'){
    $valores = [$data->id,$data->id_servidor,$_SESSION['user']];
    $delete->ExecProcDelete($data->procedure,$valores);
}elseif($data->decisao == 'update'){
    $valores = [$data->id,$data->id_servidor,$data->ip_fisico,$data->ip_nat,$data->nivel,
    $data->subnivel,$data->tipo,$_SESSION['user']];
    $edicao->ExecProcEdicao($data->procedure,$valores);
}