Ext.define('mypms.view.redeip.redesubnivel' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.redesubnivel',
    store: 'redeipsubnivel',
    columns: [{
        menuDisabled: true,
        header: "Sub-nivel",
        width: 160,
        flex: 1,
        dataIndex: 'subnivel',
        editor: {
        xtype: 'textfield',
        allowBlank: false
      }
    }]
});