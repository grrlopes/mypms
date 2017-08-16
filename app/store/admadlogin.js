Ext.define('mypms.store.admadlogin', {
  extend: 'Ext.data.Store',
  model: 'mypms.model.paineladm.tab.admadlogin',
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
