Ext.define('mypms.model.redeip.redeipsubnivel', {
    extend: 'Ext.data.Model',
    alias: 'model.redeip.redeipsubnivel',
    fields: [
        {name: 'id', type: 'int'},
        {name: 'subnivel', type: 'string'},
        {name: 'decisao', type: 'string'},
        {name: 'procedure', type: 'string'}
    ]
});
