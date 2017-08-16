Ext.define('mypms.model.historico.historicoip', {
    extend: 'Ext.data.Model',
    fields: [
      {name: 'tipo', type: 'string'},
      {name: 'fisico', type: 'string'},
      {name: 'nat', type: 'string'},
      {name: 'nivel', type: 'string'},
      {name: 'subnivel', type: 'string'}
    ]
});