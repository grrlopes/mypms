<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
class login extends conexao{
        private $dados;
        private $resultado;
        private $Conexao;
        private $login;
        private $senha;
        private $lconexao;
        private $auth;
        private $admin;
        private $laco;

        private function LdapExecutar(){
            $this->Conexao = parent::Lfazercon();
        }
        
        private function Lgrupo($grupo){
            $this->LdapExecutar();
            $this->resultado = @ldap_search($this->Conexao, parent::$larvore, "(cn=$grupo)");
            $this->dados = @ldap_get_entries($this->Conexao, $this->resultado);
        }
        
        private function Lprocessa(){
            $conta = $this->dados[0]['memberuid']['count'];
            for ($i=0; $i<$conta; $i++){
                if ($this->dados[0]['memberuid'][$i] != null){
                $this->laco[$i] = $this->dados[0]['memberuid'][$i]; 
                }
            }
        }
        
        public function Lautentica($login, $senha, $grupo){
            $this->Lgrupo($grupo);
            $this->login = 'uid='.$login.parent::$larvore2;
            $this->senha = $senha;
            $this->LdapExecutar();
            $this->lconexao = @ldap_bind($this->Conexao,$this->login,$this->senha);
            $this->Lprocessa();
            if($this->lconexao){
               $this->auth = "autenticado";
            }else{
               $this->auth = "nao autenticado";
            }
            if($this->auth == "autenticado" && in_array($login, $this->laco)){
               $this->admin = "admin";
            }else{
               $this->admin = "nao admin";
            }
        }
        
        public function admin(){
            return $this->admin;
        }
        
        public function auth(){
            return $this->auth;
        }
}
