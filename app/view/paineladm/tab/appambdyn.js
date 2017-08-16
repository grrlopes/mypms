Ext.define('mypms.view.paineladm.tab.appambdyn' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.appambdyn',
    store: 'appambdyn',
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