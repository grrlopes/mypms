Ext.define('mypms.model.paineladm.tab.appadm', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.appadm',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'nivel', type: 'string'},
      {name: 'login', type: 'string'},
      {name: 'projeto', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'procedure', type: 'string'},
      {name: 'tabela', type: 'string'} 
    ]
});