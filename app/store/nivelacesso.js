Ext.define('mypms.store.nivelacesso', {
  extend: 'Ext.data.Store',
  alias : 'widget.nivelacesso',
  model: 'mypms.model.zonaunica.nivelacesso',
  proxy: {
    type: 'rest',
    api: {
      read: 'php/paineladm/gruposadm.php'
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
