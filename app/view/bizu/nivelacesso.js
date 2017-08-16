Ext.define('mypms.view.bizu.nivelacesso',{
    extend: 'Ext.grid.Panel',
    alias : 'widget.bizunivel',
    store: 'nivelacesso',
    border: false,
    minHeight: 400,
    columns: [{
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
