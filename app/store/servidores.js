Ext.define('mypms.store.servidores', {
  extend: 'Ext.data.Store',
  alias : 'widget.servidores',
  model: 'mypms.model.gridServidores.servidores',
  pageSize: 23,
  /*loadPage( page ){
    console.log(page);
    this.callParent(arguments);
  },*/
  proxy: {
    type: 'rest',
    api: {
      create: 'php/indexa/gridservidor.php',
      read: 'php/indexa/getservidor.php',
      update: 'php/indexa/gridservidor.php',
      destroy: 'php/indexa/gridservidor.php'
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
      read: 'GET', update: 'POST'
    } 
  },
  remoteFilter: true,
  filterParam: 'query'
});
