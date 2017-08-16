Ext.define('mypms.model.paineladm.tab.tiposrv', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.tiposrv',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'tipo', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}      
    ]
});
