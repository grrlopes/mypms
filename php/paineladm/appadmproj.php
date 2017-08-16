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
$criacao = new criacao;
$delete = new delete;
$edicao = new edicao;
$actived = new l_activedirec;
$seletor = filter_input(INPUT_POST, 'seletor');
$decisao = filter_input(INPUT_POST, 'decisao');
$projeto = filter_input(INPUT_POST, 'projeto');
$procedure = filter_input(INPUT_POST, 'procedure');
$amb = filter_input(INPUT_POST, 'ambiente');
$table = filter_input(INPUT_POST, 'tabela');

function replace_unicode_escape_sequence($match){
    return mb_convert_encoding(pack('H*', $match[1]), 'UTF-8', 'UCS-2BE');
}
function unicode_decode($str){
    return preg_replace_callback('/\\\\u([0-9a-f]{4})/i', 'replace_unicode_escape_sequence', $str);
}
$dados = filter_input(INPUT_POST, 'dados');
$data = json_decode(stripslashes(unicode_decode($dados)));
if($decisao != 'leitura' && isset($data->decisao)){
  $decisao = $data->decisao;
}
if($decisao == "leitura"){
    if($seletor == 'grid'){
        $leitura->FullLeitura('select * from appadmproj');
        echo json_encode(array(
            "success" => true,
            "dados" => $leitura->ObterResultado()
        ));
    }elseif($seletor == 'nivel'){
        $leitura->FullLeitura("select * from nivel_acesso where nivel != 'Pessoal'");
        echo json_encode(array(
            "success" => true,
            "dados" => $leitura->ObterResultado()
        ));
    }elseif($seletor == 'login'){
        $leitura->FullLeitura('select distinct login from permissao_ambiente');
        echo json_encode(array(
            "success" => true,
            "dados" => $leitura->ObterResultado()
        ));
    }elseif($seletor == 'projeto'){
        $leitura->FullLeitura('select distinct projeto from setor');
        echo json_encode(array(
            "success" => true,
            "dados" => $leitura->ObterResultado()
        ));
    }elseif($seletor == 'appAdmdyn'){
        $leitura->FullLeitura("select * from $table where $amb = '$procedure'");
        echo json_encode(array(
            "success" => true,
            "dados" => $leitura->ObterResultado()
        ));
    }elseif($seletor == 'activedirec'){
        echo json_encode(array(
            "success" => true,
            "dados" => $actived->ObterResultado('Mypms','saopaulo')
        ));
    }
}elseif($decisao == "criacao"){
    if($data->seletor == "admdrop"){
        $valores = [$data->login,'indra@indra',$data->ambiente,$data->tabela];
        $criacao->ExecProcCriacao($data->procedure,$valores);
    }else{
        $valores = [$data->nivel,$data->login,$data->projeto];
        $criacao->ExecProcCriacao($data->procedure,$valores);
        switch ($criacao->ObterResultado()){
            case 'usernoacesso':
                echo json_encode(array(
                    "success" => false
                ));            
                break;
            case 'existe':
                echo json_encode(array(
                    "success" => false
                ));            
                break;            
            default:
                echo json_encode(array(
                    "success" => true
                ));            
                break;
        }
    }
}elseif($decisao == "delete"){
    if($data->seletor == "admdrop"){
        $valores = [$data->login,$data->ambiente];
        $delete->ExecProcDelete($data->procedure,$valores);
    }else{
        $delete->ExecutaDelete($data->tabela,'WHERE id = :id',"id={$data->id}");
    }
}