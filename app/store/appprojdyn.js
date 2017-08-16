Ext.define('mypms.store.appprojdyn', {
  extend: 'Ext.data.Store',
  model: 'mypms.model.paineladm.tab.appprojdyn',
  proxy: {
    type: 'rest',
    api: {
      read: 'php/paineladm/appadmproj.php',
      create: 'php/paineladm/appadmproj.php',
      destroy: 'php/paineladm/appadmproj.php'
    },    
    reader: {
      type: 'json',
      root: 'dados',
      successProperty: 'success'
    },
    writer: {
      type: 'json',
      writeAllFields: true,
      root: 'dados',
      encode: true
    },    
    actionMethods: {
      read: 'POST'
    }
  }
});
