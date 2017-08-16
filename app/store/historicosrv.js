Ext.define('mypms.store.historicosrv', {
  extend: 'Ext.data.Store',
  alias : 'widget.historicosrv',
  model: 'mypms.model.historico.historicosrv',
  pageSize: 15,
  proxy: {
    type: 'rest',
    api: {
      read: 'php/historico/gethistorico.php'
    },
    reader: {
      type: 'json',
      root: 'dados'
    },
    writer: {
      type: 'json',
      root: 'dados',
      encode: true
    },
    actionMethods: {
      read: 'POST'
    } 
  },
  filterParam: 'query',
  remoteFilter : true
});
