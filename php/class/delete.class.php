<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
class delete extends conexao{
    private $Tabela;
    private $Termos;
    private $Armazenamento;
    private $Resultado;
    private $Delete;
    private $Procedure;
    private $ProcValores;
    private $Conexao;

    public function ExecutaDelete($Tabela, $Termos, $ParseString){
        $this->Tabela = (string) $Tabela;
        $this->Termos = (string) $Termos;
        parse_str($ParseString, $this->Armazenamento);
        $this->TerSyntax();
        $this->Executar();
    }

    public function ExecProcDelete($Procedure, array $ProcValores){
        $this->Procedure = (string) $Procedure;
        $this->ProcValores = $ProcValores;
        $this->TerSyntaxProc();
        $this->ExecProc();
    }    

    public function ObterResultado(){
        return $this->Resultado;
    }

    public function ObterRowCount(){
        return $this->Delete->rowCount();
    }

   public function SetarArmazenamento($ParseString){
        parse_str($ParseString, $this->Armazenamento);
        $this->TerSyntax();
        $this->Executar();
   }

    private function TerConexao(){
        $this->Conexao = parent::fazercon();
        $this->Delete = $this->Conexao->prepare($this->Delete);
    }

    private function TerSyntax(){
        $this->Delete = "DELETE FROM {$this->Tabela} {$this->Termos}";
    }

    private function TerSyntaxProc(){
        $Procbind = array();
        foreach($this->ProcValores as $key => $valor){
            array_push($Procbind, "?");
        }
        $this->Dados = $Procbind;
        $campos = implode(', ', array_values($this->Dados));
        $this->Delete = "CALL {$this->Procedure}({$campos})";
    }

    private function ExecProc(){
        $this->TerConexao();
        try {
            foreach($this->ProcValores as $key => &$valor){
                $this->Delete->bindParam((int) $key+1, $valor, PDO::PARAM_STR||PDO::PARAM_INPUT);
            }
            $this->Delete->execute();
        }catch(PDOException $e){
            echo "Error: ".$e->getCode(), $e->getMessage() ,$e->getLine();
            die();
        }
    }      

    private function Executar(){
        $this->TerConexao();
        try {
            $this->Delete->execute($this->Armazenamento);
            $this->Resultado = TRUE;
        }catch(PDOException $e){
            $this->Resultado = NULL;
            echo "Erro: ".$e->getCode(), $e->getMessage() ,$e->getLine();
        }
    }

}
