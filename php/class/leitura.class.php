<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
class leitura extends conexao{
    private $Select;
    private $Armazenamento;
    private $Resultado;
    private $Leitura;
    private $Conexao;

    public function ExecutaLeitura($Tabela, $termos = null, $ParseString = NULL){
        if(!empty($ParseString)){
            parse_str($ParseString, $this->Armazenamento);
        }
        $this->Select = "Select * from {$Tabela} {$termos}";
        $this->Executar();
    }

    public function ObterResultado(){
        return $this->Resultado;
    }

    public function ObterRowCount(){
        return $this->Leitura->rowCount();
    }

   public function FullLeitura($Query, $ParseString = NULL){
        $this->Select = (string) $Query;
        if(!empty($ParseString)){
        parse_str($ParseString, $this->Armazenamento);
        }
        $this->Executar();
   }

   public function SetarArmazenamento($ParseString){
        parse_str($ParseString, $this->Armazenamento);
        $this->Executar();
   }

    private function TerConexao(){
        $this->Conexao = parent::fazercon();
        $this->Leitura = $this->Conexao->prepare($this->Select);
        $this->Leitura->setFetchMode(PDO::FETCH_ASSOC);
    }

    private function TerSyntax(){
      if($this->Armazenamento){
        foreach($this->Armazenamento as $Vinculo => $Valor){
          if($Vinculo == 'limit' || $Vinculo == 'offset'){
              $Valor = (int) $Valor;
          }
          $this->Leitura->bindValue(":$Vinculo", $Valor,(is_int($Valor) ? PDO::PARAM_INT : PDO::PARAM_STR));
        }
      }
    }

    private function Executar(){
        $this->TerConexao();
        try {
            $this->TerSyntax();
            $this->Leitura->execute();
            $this->Resultado = $this->Leitura->fetchAll();
        }catch(PDOException $e){
            $this->Resultado = NULL;
            echo "Erro: ".$e->getCode(), $e->getMessage() ,$e->getLine();
        }
    }
}
