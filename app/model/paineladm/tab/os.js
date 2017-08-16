Ext.define('mypms.model.paineladm.tab.os', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.os',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'os', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}      
    ]
});
