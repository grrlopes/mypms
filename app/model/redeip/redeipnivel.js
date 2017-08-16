Ext.define('mypms.model.redeip.redeipnivel', {
    extend: 'Ext.data.Model',
    alias: 'model.redeip.redeipnivel',
    fields: [
        {name: 'id', type: 'int'},
        {name: 'nivel', type: 'string'},
        {name: 'decisao', type: 'string'},
        {name: 'procedure', type: 'string'}
    ]
});
