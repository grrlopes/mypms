Ext.define('mypms.model.paineladm.tab.descricao', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.descricao',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'descricao', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}      
    ]
});