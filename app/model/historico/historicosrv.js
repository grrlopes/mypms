Ext.define('mypms.model.historico.historicosrv', {
    extend: 'Ext.data.Model',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'host', type: 'string'},
      {name: 'ip', type: 'string'},
      {name: 'projeto', type: 'string'},
      {name: 'descricao', type: 'string'},
      {name: 'ambiente', type: 'string'},
      {name: 'os', type: 'string'},
      {name: 'serial', type: 'string'},
      {name: 'tipo', type: 'string'},
      {name: 'pais', type: 'string'},
      {name: 'local', type: 'string'},
      {name: 'usuario', type: 'string'},
      {name: 'acao', type: 'string'},
      {name: 'data', type: 'date'},
      {name: 'situacao', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'procedure', type: 'string'}
    ]
});
