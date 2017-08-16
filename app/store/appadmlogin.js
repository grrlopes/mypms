Ext.define('mypms.store.appadmlogin', {
  extend: 'Ext.data.Store',
  model: 'mypms.model.paineladm.tab.appadm',
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
