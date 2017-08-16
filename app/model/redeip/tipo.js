Ext.define('mypms.model.redeip.tipo', {
    extend: 'Ext.data.Model',
    alias: 'model.redeip.tipo',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'tipo', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}
    ]
});