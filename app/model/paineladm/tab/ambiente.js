Ext.define('mypms.model.paineladm.tab.ambiente', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.ambiente',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'ambiente', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}      
    ]
});