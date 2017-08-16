Ext.define('mypms.model.paineladm.tab.rede', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.rede',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'tipo', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}      
    ]
});