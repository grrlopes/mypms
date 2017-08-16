Ext.define('mypms.store.appadmproj', {
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