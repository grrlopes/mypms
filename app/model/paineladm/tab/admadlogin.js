Ext.define('mypms.model.paineladm.tab.admadlogin', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.admadlogin',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'login', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'decisao', type: 'string'},
      {name: 'procedure', type: 'string'}      
    ]
});