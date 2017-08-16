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
$host = filter_input(INPUT_POST, 'host');
$leitura->FullLeitura('select * from admin_audit');
echo json_encode(array(
    "success" => true,
    "dados" => $leitura->ObterResultado()
));