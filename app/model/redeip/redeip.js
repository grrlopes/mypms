Ext.define('mypms.model.redeip.redeip', {
    extend: 'Ext.data.Model',
    alias: 'model.redeip.redeip',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'ip_fisico', type: 'string'},
      {name: 'ip_nat', type: 'string'},
      {name: 'tipo', type: 'string'},
      {name: 'nivel', type: 'string'},
      {name: 'subnivel', type: 'string'},
      {name: 'id_servidor', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'procedure', type: 'string'}
    ]
});
