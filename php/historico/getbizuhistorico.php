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
$id = filter_input(INPUT_POST, 'id');
$leitura->FullLeitura("select * from historicoapp "
."where id_historico_servidor = $id");
echo json_encode(array(
"success" => true,
"dados" => $leitura->ObterResultado()
));