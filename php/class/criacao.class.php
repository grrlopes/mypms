<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
class criacao extends conexao{

    private $Tabela;
    private $Dados;
    private $Resultado;
    private $Select;
    private $Leitura;
    private $Armazenamento;
    private $Criacao;
    private $Procedure;
    private $ProcValores;
    private $Con;
    private $Id;

    public function ExecutaCriacao($Tabela, array $Dados){
        $this->Tabela = (string) $Tabela;
        $this->Dados = $Dados;      
        $this->TerSyntax();
        $this->Executar();
    }

    public function ExecProcCriacao($Procedure, array $ProcValores){
        $this->Procedure = (string) $Procedure;
        $this->ProcValores = $ProcValores;
        $this->TerSyntaxProc();
        $this->ExecProc();
    }

    public function ObterResultado(){
        return $this->Resultado;
    }

    public function GeraID($Query, $ParseString = NULL){
        $this->Select = (string) $Query;
        if(!empty($ParseString)){
            parse_str($ParseString, $this->Armazenamento);
        }
        $this->ExecId();
    }

    public function ObterId(){
        foreach($this->Resultado as $key => $value) {
            $this->Id = (int) $value['id'];
        }
        return $this->Id;
    }    

    private function TerConexao(){
        $this->Con = parent::fazercon();
        $this->Criacao = $this->Con->prepare($this->Criacao);
    }

    private function TerConexaoId(){
        $this->Conexao = parent::fazercon();
        $this->Leitura = $this->Conexao->prepare($this->Select);
        $this->Leitura->setFetchMode(PDO::FETCH_ASSOC);
    }    

    private function TerSyntax(){
        $campos = implode(', ',  array_keys($this->Dados));
        $lugar =  ':' . implode(', :', array_keys($this->Dados));
        $this->Criacao = "INSERT INTO {$this->Tabela} ({$campos}) VALUES ({$lugar})";
    }

    private function TerSyntaxProc(){
        $Procbind = array();
        foreach($this->ProcValores as $key => $valor){
            array_push($Procbind, "?");
        }
        $this->Dados = $Procbind;
        $campos = implode(', ', array_values($this->Dados));
        $this->Criacao = "CALL {$this->Procedure}({$campos})";
    }

    private function ExecProc(){
        $this->TerConexao();
        try {
            foreach($this->ProcValores as $key => &$valor){
                $this->Criacao->bindParam((int) $key+1, $valor, PDO::PARAM_STR||PDO::PARAM_INPUT);
            }
            $this->Criacao->execute();
            $this->Resultado = $this->Criacao->fetchColumn();
        }catch(PDOException $e){
            die();
        }
    }

    private function ExecId(){
        $this->TerConexaoId();
        try {
            $this->Leitura->execute();
            $this->Resultado = $this->Leitura->fetchAll();
        }catch(PDOException $e){
            $this->Resultado = NULL;
            echo "Erro: ".$e->getCode(), $e->getMessage() ,$e->getLine();
        }
    }    

    private function Executar(){
        $this->TerConexao();
        try {
            $this->Criacao->execute($this->Dados);
            $this->Resultado = $this->Con->lastInsertId();
        }catch(PDOException $e){
            echo "Error: ".$e->getCode(), $e->getMessage() ,$e->getLine();
            die();
        }
    }

}