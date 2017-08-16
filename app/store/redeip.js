Ext.define('mypms.store.redeip', {
  extend: 'Ext.data.Store',
  alias : 'widget.redeip',
  model: 'mypms.model.redeip.redeip',
  proxy: {
    type: 'rest',
    api: {
      read: 'php/redeipnat/getredeip.php',
      create: 'php/redeipnat/setredeip.php',
      destroy: 'php/redeipnat/setredeip.php',
      update: 'php/redeipnat/setredeip.php'
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
