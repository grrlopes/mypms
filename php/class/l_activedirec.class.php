<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
class l_activedirec extends conexao{
        private $Dados;
        private $Valores;
        private $Resultado;
        private $Conexao;
        private $Filtro;
        private $Grupo;
        private $Ou;
        private $Auth;

        public function ObterResultado($grupo,$ou){
            $this->Grupo = $grupo;
            $this->Ou = $ou;            
            $this->AdExecuta();
            return $this->Resultado;
        }

        public function ObterAuth(){
            return $this->Auth;
        }

        public function ValidaAuth($login,$senha){
            $this->ValidaAd($login,$senha);
        }

        private function AdConexao(){
            $this->Conexao = parent::Adfazercon();
        }

        private function TerSyntax(){
            $this->AdConexao();
            $attr = array("cn");
            $filtro = "(&(objectClass=group)(!(objectClass=computer))
            (memberOf=cn={$this->Grupo},ou={$this->Ou},".parent::$adarvore."))";
            $this->Valores = ldap_search($this->Conexao,parent::$adarvore,$filtro,$attr);
            $this->Dados = ldap_get_entries($this->Conexao, $this->Valores);
            $FiltroSyntax = array();
            for($i = 0; $i<$this->Dados['count']; $i++){
                $valor = $this->Dados[$i]['cn'][0];
                array_push($FiltroSyntax,"(memberOf=cn={$valor},ou={$this->Ou},".parent::$adarvore.")");
            }
            return $this->Filtro = "(&(!(objectClass=computer))
            (!(objectClass=group))(|".implode($FiltroSyntax)."))";
        }

        private function ValidaAd($login,$senha){
            $this->AdConexao();
            $this->Auth = @ldap_bind($this->Conexao,$login,$senha);
        }        

        private function AdExecuta(){
            $this->Resultado = array();
            $this->AdConexao();
            $attr = array("sAMAccountName","mail");        
            $this->Valores = ldap_search($this->Conexao,parent::$adarvore,$this->TerSyntax(),$attr);
            $this->Dados = ldap_get_entries($this->Conexao, $this->Valores);
            for($i=0; $i<$this->Dados["count"]; $i++){
                $this->Dados[$i]['samaccountname']['login'] = $this->Dados[$i]['samaccountname'][0];
                if(isset($this->Dados[$i]['mail'][0])){
                    $this->Dados[$i]['samaccountname']['mail'] = $this->Dados[$i]['mail'][0];
                }else{
                    $this->Dados[$i]['samaccountname']['mail'] = 'null';
                }
                unset($this->Dados[$i]['samaccountname'][0]);
                unset($this->Dados[$i]['samaccountname']['count']);
                array_push($this->Resultado, $this->Dados[$i]['samaccountname']);
            }
        }
}