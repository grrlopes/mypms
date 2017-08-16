Ext.define('mypms.store.historicobizu', {
  extend: 'Ext.data.Store',
  alias : 'widget.historicobizu',
  model: 'mypms.model.historico.historicobizu',
  pageSize: 5,
  proxy: {
    type: 'rest',
    api: {
      read: 'php/historico/getbizuhistorico.php'
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
