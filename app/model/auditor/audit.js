Ext.define('mypms.model.auditor.audit', {
    extend: 'Ext.data.Model',
    alias: 'model.audit.auditor',
    fields: [
      {name: 'id', type: 'int'},
      {name: 'login', type: 'string'},
      {name: 'email', type: 'string'},
      {name: 'decisao', type: 'string'}
    ]
});