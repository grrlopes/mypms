Ext.define('mypms.model.paineladm.tab.pais', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.pais',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'pais', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}      
    ]
});