Ext.define('mypms.view.redeip.redenivel' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.redenivel',
    store: 'redeipnivel',
    columns: [{
        menuDisabled: true,
        header: "Nivel",
        width: 160,
        flex: 1,
        dataIndex: 'nivel',
        editor: {
        xtype: 'textfield',
        allowBlank: false
      }
    }]
});