Ext.define('mypms.model.paineladm.tab.projeto', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.projeto',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'projeto', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}
    ]
});