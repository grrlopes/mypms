Ext.define('mypms.store.autenticacao', {
  extend: 'Ext.data.Store',
  alias : 'widget.autenticacao',
  model: 'mypms.model.autentica.auth',
  proxy: {
    type: 'rest',
    api: {
      read: 'php/autentica/auth.php',
      update: 'php/autentica/auth.php'
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
