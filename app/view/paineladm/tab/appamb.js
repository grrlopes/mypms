Ext.define('mypms.view.paineladm.tab.appamb',{
    extend: 'Ext.grid.Panel',
    alias : 'widget.appamb',
    store: 'ambiente',
    border: true,
    selType: 'checkboxmodel',
    selModel: {
      checkOnly: false,
      injectCheckbox: 0,
      allowDeselect: false,
      showHeaderCheckbox: false,
      mode:'simples'
    },    
    columnLines: true,
    columns: [{
        menuDisabled: true,
        header: "ambiente",
        flex: 1,
        dataIndex: 'ambiente'
    }]
});