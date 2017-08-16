Ext.define('mypms.model.redeip.redeiptipo', {
    extend: 'Ext.data.Model',
    alias: 'model.redeip.redeiptipo',
    fields: [
        {name: 'id', type: 'int'},
        {name: 'tipo', type: 'string'},
        {name: 'decisao', type: 'string'},
        {name: 'procedure', type: 'string'}
    ]
});
