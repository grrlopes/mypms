Ext.define('mypms.store.tipoapp', {
  extend: 'Ext.data.Store',
  alias : 'widget.paineladmtipoapp',
  model: 'mypms.model.paineladm.tab.tipoapp',
  proxy: {
    type: 'rest',
    api: {
      read: 'php/paineladm/gruposadm.php',
      create: 'php/paineladm/gruposadm.php',
      destroy: 'php/paineladm/gruposadm.php',
      update: 'php/paineladm/gruposadm.php'
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