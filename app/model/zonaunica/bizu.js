Ext.define('mypms.model.zonaunica.bizu', {
    extend: 'Ext.data.Model',
    alias: 'model.zonaunica.bizu',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'nivel', type: 'string'},
      {name: 'tipo', type: 'string'},
      {name: 'login', type: 'string'},
      {name: 'ambiente', type: 'string'},
      {name: 'senha', type: 'string'},
      {name: 'app', type: 'string'},
      {name: 'com', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'procedure', type: 'string'}
    ]
});
