Ext.define('mypms.model.gridServidores.servidores', {
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
      {name: 'situacao', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'procedure', type: 'string'}
    ]
});
