Ext.define('mypms.store.redeipnivel', {
  extend: 'Ext.data.Store',
  alias : 'widget.redeipnivel',
  model: 'mypms.model.redeip.redeipnivel',
  proxy: {
    type: 'rest',
    api: {
      read: 'php/redeipnat/getredeip.php'
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
