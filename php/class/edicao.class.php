<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
class edicao extends conexao{
    private $Tabela;
    private $Dados;
    private $Termos;
    private $Armazenamento;
    private $Resultado;
    private $Edicao;
    private $Procedure;
    private $ProcValores;    
    private $Conexao;

    public function ExecutaEdicao($Tabela, array $Dados, $Termos, $ParseString){
        $this->Tabela = (string) $Tabela;
        $this->Dados = $Dados;
        $this->Termos = $Termos;
        parse_str($ParseString, $this->Armazenamento);
        $this->TerSyntax();
        $this->Executar();
    }

    public function ExecProcEdicao($Procedure, array $ProcValores){
        $this->Procedure = (string) $Procedure;
        $this->ProcValores = $ProcValores;
        $this->TerSyntaxProc();
        $this->ExecProc();
    }    

    public function ObterResultado(){
        return $this->Resultado;
    }

    public function ObterRowCount(){
        return $this->Edicao->rowCount();
    }

    public function SetarArmazenamento($ParseString){
        parse_str($ParseString, $this->Armazenamento);
        $this->TerSyntax();
        $this->Executar();
    }

    public function UnicodeDecode($valor){
        function Decodex($match){
            return mb_convert_encoding(pack('H*', $match[1]), 'UTF-8', 'UCS-2BE');
        }
        return preg_replace_callback('/\\\\u([0-9a-f]{4})/i', 'Decodex', $valor);
    }

    private function TerConexao(){
        $this->Conexao = parent::fazercon();
        $this->Edicao = $this->Conexao->prepare($this->Edicao);
    }

    private function TerSyntax(){
        foreach($this->Dados as $Key => $Valores){
            $Valor[] = $Key . '= :' . $Key;
        }
        $Valor = implode(', ',$Valor);
        $this->Edicao = "UPDATE {$this->Tabela} SET {$Valor} {$this->Termos}";
    }

    private function TerSyntaxProc(){
        $Procbind = array();
        foreach($this->ProcValores as $key => $valor){
            array_push($Procbind, "?");
        }
        $this->Dados = $Procbind;
        $campos = implode(', ', array_values($this->Dados));
        $this->Edicao = "CALL {$this->Procedure}({$campos})";
    }    

    private function ExecProc(){
        $this->TerConexao();
        try {
            foreach($this->ProcValores as $key => &$valor){
                $this->Edicao->bindParam((int) $key+1, $valor, PDO::PARAM_STR||PDO::PARAM_INPUT);
            }
            $this->Edicao->execute();
        }catch(PDOException $e){
            echo "Error: ".$e->getCode(), $e->getMessage() ,$e->getLine();
            die();
        }
    }    

    private function Executar(){
        $this->TerConexao();
        try {
            $this->Edicao->execute(array_merge($this->Dados, $this->Armazenamento));
            $this->Resultado = TRUE;
        }catch(PDOException $e){
            $this->Resultado = NULL;
            echo "Erro: ".$e->getCode(), $e->getMessage() ,$e->getLine();
        }
    }

}
