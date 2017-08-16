<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
require 'config.inc.php';
$servidores = new leitura;
$combo = filter_input(INPUT_GET, 'seletor');
$servidores->FullLeitura("select projeto from setor");
echo json_encode(array(
  "success" => true,
  "dados" => $servidores->ObterResultado()
));
