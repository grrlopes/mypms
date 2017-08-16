Ext.define('mypms.store.historicoip', {
  extend: 'Ext.data.Store',
  alias : 'widget.historicoip',
  model: 'mypms.model.historico.historicoip',
  pageSize: 5,
  proxy: {
    type: 'rest',
    api: {
      read: 'php/historico/getiphistorico.php'
    },
    reader: {
      type: 'json',
      root: 'dados'
    },
    actionMethods: {
      read: 'POST'
    }    
  }
});
