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
$leitura = new leitura;
$idd = filter_input(INPUT_POST, 'id');
$leitura->FullLeitura("select * from bizu where id_servidor = $idd and ambiente ".
"in(select ambiente from permissao_ambiente where login = '{$_SESSION['user']}') and nivel ".
"in(select nivel from appadmproj where login = '{$_SESSION['user']}' and projeto ".
"in(select projeto from permissao_projeto where login = '{$_SESSION['user']}' ".
"and projeto = (select projeto from home where id = $idd))) or id ".
"in(select id_app from senhapessoal where login = '{$_SESSION['user']}') and id_servidor = $idd");
echo json_encode(array(
    "success" => true,
    "dados" => $leitura->ObterResultado()    
));