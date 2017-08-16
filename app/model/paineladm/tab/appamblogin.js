Ext.define('mypms.model.paineladm.tab.appamblogin', {
    extend: 'Ext.data.Model',
    alias: 'model.paineladm.appamblogin',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'login', type: 'string'},
      {name: 'ambiente', type: 'string'},
      {name: 'seletor', type: 'string'},
      {name: 'procedure', type: 'string'}      
    ]
});