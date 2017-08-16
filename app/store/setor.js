Ext.define('mypms.store.setor', {
  extend: 'Ext.data.Store',
  alias : 'widget.storeSetor',
  model: 'mypms.model.gridServidores.combo.setor',
  //autoLoad: true,
  proxy: {
    type: 'ajax',
    url: 'php/projeto.php',
    reader: {
      type: 'json',
      root: 'dados'
    },
    actionMethods :{
      //read: 'POST'
    }
  }
});
