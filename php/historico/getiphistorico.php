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
$leitura->FullLeitura("select hrede.rede_fisica as fisico, hrede.rede_nat as nat, rt.tipo,". 
"rn.nivel, rb.subnivel, hrede.acao from historico_rede hrede INNER JOIN rede_tipo rt ON "
."hrede.id_rede_tipo = rt.id INNER JOIN rede_nivel rn ON hrede.id_rede_nivel = rn.id INNER".
" JOIN rede_subnivel rb ON hrede.id_rede_subnivel = rb.id where id_historico_servidor = $id");
echo json_encode(array(
"success" => true,
"dados" => $leitura->ObterResultado()
));