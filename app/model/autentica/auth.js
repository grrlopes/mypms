Ext.define('mypms.model.autentica.auth', {
    extend: 'Ext.data.Model',
    alias: 'model.autentica.auth',
    fields: [
      {name: 'user', type: 'string'},
      {name: 'pass', type: 'string'}
    ]
});