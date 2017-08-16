<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
require_once 'config.inc.php';
session_start();
if(!isset($_SESSION['user']) && 
!isset($_SESSION['pass'])) return;
$actived = new l_activedirec;
$actived->ObterResultado('Mypmss','saopaulos');
echo json_encode(array(
      "success" => true,
      "dados" => $actived->ObterResultado('Mypmss','ssaopaulo')
));