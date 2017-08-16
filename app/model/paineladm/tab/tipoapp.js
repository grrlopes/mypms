Ext.define('mypms.model.paineladm.tab.tipoapp', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.tipoapp',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'tipo', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}      
    ]
});
