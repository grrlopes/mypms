Ext.define('mypms.store.redeiptipo', {
  extend: 'Ext.data.Store',
  alias : 'widget.redeiptipo',
  model: 'mypms.model.redeip.redeiptipo',
  proxy: {
    type: 'rest',
    api: {
      read: 'php/redeipnat/getredeip.php',
      create: 'php/paineladm/setredeip.php',
      destroy: 'php/paineladm/setredeip.php',
      update: 'php/paineladm/setredeip.php'
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
