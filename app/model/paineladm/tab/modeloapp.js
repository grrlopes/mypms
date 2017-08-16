Ext.define('mypms.model.paineladm.tab.modeloapp', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.modeloapp',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'modelo', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}      
    ]
});
