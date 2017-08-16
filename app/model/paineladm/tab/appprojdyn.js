Ext.define('mypms.model.paineladm.tab.appprojdyn', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.appprojdyn',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'login', type: 'string'},
      {name: 'ambiente', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'},
      {name: 'tabela', type: 'string'}     
    ]
});