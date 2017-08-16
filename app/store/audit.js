Ext.define('mypms.store.audit', {
  extend: 'Ext.data.Store',
  model: 'mypms.model.auditor.audit',
  proxy: {
    type: 'rest',
    api: {
      read: 'php/audit/getauditor.php',
      create: 'php/audit/setauditor.php',
      destroy: 'php/audit/setauditor.php'
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
      read: 'POST', update: 'POST'
    }   
  }
});
