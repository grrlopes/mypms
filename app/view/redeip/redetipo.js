Ext.define('mypms.view.redeip.redetipo' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.redetipo',
    store: 'redeiptipo',
    columns: [{
        menuDisabled: true,
        header: "Tipo",
        width: 160,
        flex: 1,
        dataIndex: 'tipo',
        editor: {
        xtype: 'textfield',
        allowBlank: false
      }
    }]
});