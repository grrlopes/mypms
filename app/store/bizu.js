Ext.define('mypms.store.bizu', {
  extend: 'Ext.data.Store',
  alias : 'widget.bizu',
  model: 'mypms.model.zonaunica.bizu',
  proxy: {
    type: 'rest',
    api: {
      read: 'php/zonaunica/getbizu.php',
      create: 'php/zonaunica/setbizu.php',
      destroy: 'php/zonaunica/setbizu.php',
      update: 'php/zonaunica/setbizu.php'
    },    
    reader: {
      type: 'json',
      root: 'dados',
      successProperty: 'success',
      messageProperty: 'dados'
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
