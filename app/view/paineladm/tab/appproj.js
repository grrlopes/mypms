Ext.define('mypms.view.paineladm.tab.appproj' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.appproj',
    store: 'projeto',
    border: true,
    selType: 'checkboxmodel',
    selModel: {
      checkOnly: false,
      injectCheckbox: 0,
      allowDeselect: false,
      showHeaderCheckbox: false,
      mode:'simples'
    },    
    columns: [            
        {
            menuDisabled: true,
            header: "projeto",
            flex: 1,
            dataIndex: 'projeto'
        }
    ]
});