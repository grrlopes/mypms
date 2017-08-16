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
    $delete = new delete;
    $dados = filter_input(INPUT_POST, 'dados');
    $id = filter_input(INPUT_POST, 'id');
    $data = json_decode(stripslashes($dados));
    if($data->decisao == 'criacao'){
        $leitura = new leitura;
        $leitura->FullLeitura("select id from usuario where login = '$data->login'");
        foreach ($leitura->ObterResultado() as $key => $value){
            $valor = $value['id'];
        }
        if(!isset($valor)){
            echo json_encode(array(
                "success" => false,
                "msg" => 'Efetue o primeiro login'
            ));            
            return false;
        }
        $criacao = new criacao;
        $valores = ['id_usuario' => $valor];
        $criacao->ExecutaCriacao('admin',$valores);      
    }else{
        $delete->ExecutaDelete("admin","WHERE id = :id","id=$data->id");
    }
}