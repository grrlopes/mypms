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
$seletor = filter_input(INPUT_POST, 'seletor');
$decisao = filter_input(INPUT_POST, 'decisao');
$projeto = filter_input(INPUT_POST, 'projeto');
$procedure = filter_input(INPUT_POST, 'procedure');
$dados = filter_input(INPUT_POST, 'dados');
$data = json_decode(stripslashes($edicao->UnicodeDecode($dados)));
if($decisao != 'leitura'){
  $decisao = $data->decisao;
}
if($decisao == 'leitura'){
  switch($seletor){
    case 'setor_person':
      $leitura->FullLeitura("select * from permissao_projeto where login = '{$_SESSION['user']}'");
      echo json_encode(array(
        "success" => true,
        "dados" => $leitura->ObterResultado()
      ));      
      break;
    case 'useramb':
      $leitura->FullLeitura("select * from permissao_ambiente where login = '{$_SESSION['user']}'");
      echo json_encode(array(
        "success" => true,
        "dados" => $leitura->ObterResultado()
      ));      
      break;
    case 'userproj':
      $leitura->FullLeitura("select * from permissao_projeto where login = '{$_SESSION['user']}'");
      echo json_encode(array(
        "success" => true,
        "dados" => $leitura->ObterResultado()
      ));      
      break;
    default:
      $leitura->FullLeitura('select * from '.$seletor);
      echo json_encode(array(
        "success" => true,
        "dados" => $leitura->ObterResultado()
      ));
    break;
  }
}elseif($decisao == 'criacao'){
  $attr = $data->seletor;
  if($data->seletor == 'projeto'){
    $grupo = 'setor';
  }elseif($data->seletor == 'descricao'){
    $grupo = 'setor_descricao';
  }elseif($data->seletor == 'ambiente'){
    $grupo = 'ambiente';
  }elseif($data->seletor == 'pais'){
    $grupo = 'pais';
  }elseif($data->seletor == 'os'){
    $grupo = 'os';
  }elseif($data->seletor == 'local'){
    $grupo = 'local';
  }elseif($data->seletor == 'rede_tipo'){
    $grupo = 'rede_tipo';
    $attr = 'tipo';
    $data->seletor = 'rede';
  }elseif($data->seletor == 'app_modelo'){
    $grupo = 'app_modelo';
    $attr = 'modelo';
  }elseif($data->seletor == 'tipo_servidor'){
    $grupo = 'tipo_servidor';
    $attr = 'tipo';
  }elseif($data->seletor == 'nivel_acesso'){
    $grupo = 'nivel_acesso';
    $attr = 'nivel';
  }
  $criacao->GeraId('select * from '.$grupo.' order by id desc limit 1');
  $idd = $criacao->ObterId();
  $valores = [$data->seletor, $data->$attr];
  $criacao->ExecProcCriacao($data->procedure, $valores);
	echo json_encode(array(
    "success" => true,
    "dados" => array(
      "id" => ++$idd
    )
	));
}elseif($data->decisao == 'delete'){
  $valores = [$data->seletor,'null',$data->id,$data->decisao];
  $delete->ExecProcDelete($data->procedure,$valores);
}elseif($data->decisao == 'update'){
  if($data->seletor == 'rede_tipo'){
    $attr = 'tipo';
    $data->seletor = 'rede';
  }elseif($data->seletor == 'app_modelo'){
    $attr = 'modelo';
  }else{
    $attr = $data->seletor;
  }
  $valores = [$data->seletor,$data->$attr,$data->id,$data->decisao];
  $edicao->ExecProcEdicao($data->procedure,$valores);
}