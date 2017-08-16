Ext.define('mypms.view.paineladm.tab.appprojdyn' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.appprojdynn',
    store: 'appprojdyn',
    border: false,
    columnLines: true,
    columns: [            
        {
            menuDisabled: true,
            header: "Login",
            width: 160,
            flex: 1,
            dataIndex: 'login'
        }
    ]
});