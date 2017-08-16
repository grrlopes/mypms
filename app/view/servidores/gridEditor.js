Ext.define('mypms.view.servidores.gridEditor' ,{
      extend: 'Ext.grid.Panel',
      alias : 'widget.gridEditor',
      //store : 'Taxclass',
      //border: false,
      plugins: [{
           clicksToMoveEditor: 1,
           autoCancel: false,
           ptype: 'rowediting',
           pluginId: 'rowediting'
       }],
      columns: [
          {header: 'Name',  dataIndex: 'name', editor: 'textfield'},
          {header: 'Email', dataIndex: 'email', flex:1,
              editor: {
                  xtype: 'textfield',
                  allowBlank: false
              }
          },
          {header: 'Phone', dataIndex: 'phone'}
      ],

      height: 200,
      width: 400

  });
