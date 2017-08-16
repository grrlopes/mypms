Ext.define('mypms.store.redeipsubnivel', {
  extend: 'Ext.data.Store',
  alias : 'widget.redeipsubnivel',
  model: 'mypms.model.redeip.redeipsubnivel',
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