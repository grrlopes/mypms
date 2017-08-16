Ext.define('mypms.model.historico.historicobizu', {
    extend: 'Ext.data.Model',
    alias: 'model.historico.historicobizu',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'nivel', type: 'string'},
      {name: 'tipo', type: 'string'},
      {name: 'login', type: 'string'},
      {name: 'ambiente', type: 'string'},
      {name: 'senha', type: 'string'},
      {name: 'modelo', type: 'string'},
      {name: 'comentario', type: 'string'}
    ]
});