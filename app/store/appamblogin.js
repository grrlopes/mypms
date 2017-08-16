Ext.define('mypms.store.appamblogin', {
  extend: 'Ext.data.Store',
  model: 'mypms.model.paineladm.tab.appamblogin',
  proxy: {
    type: 'rest',
    api: {
      read: 'php/paineladm/appadmproj.php'
    },    
    reader: {
      type: 'json',
      root: 'dados',
      successProperty: 'success'
    },
    actionMethods: {
      read: 'POST'
    }   
  }
});