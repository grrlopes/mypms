<?php
/**
 * @autor  Gabriel Lopes
 * @email   gabrielrrlopes@gmail.com
 **/
class l_ldap_escala extends conexao{
        public  $dados;
        private $resultado;
        private $Conexao;

        private function LdapExecutar(){
            $this->Conexao = parent::Lfazercon();
        }

        public function Ldapconexao($grupo){
            $this->LdapExecutar();
            $this->resultado = ldap_search($this->Conexao, parent::$larvore, "(cn=$grupo)");
            $this->dados = ldap_get_entries($this->Conexao, $this->resultado);
        }
}
