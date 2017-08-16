Ext.define('mypms.model.paineladm.tab.local', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.local',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'local', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}      
    ]
});