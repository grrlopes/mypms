Ext.define('mypms.view.auditor.gridaudit',{
    extend: 'Ext.grid.Panel',
    alias : 'widget.gridauditor',
    store: 'audit',
    border: false,
    selType: 'checkboxmodel',
    selModel: {
      checkOnly: false,
      injectCheckbox: 0,
      allowDeselect: false,
      showHeaderCheckbox: false,
      mode:'simples'
    },    
    columns: [{
        header: "Login",
        flex: 1,
        dataIndex: 'login',
        editor: {
            xtype: 'textfield',
            allowBlank: false
        }        
    }],

    initComponent: function(){
      this.gridNovoaudit = Ext.create('Ext.grid.plugin.RowEditing',{
        triggerEvent: 'cellfocus',
        saveBtnText: 'Ok'
      });
      Ext.apply(this,{
        plugins: [this.gridNovoaudit]
      });        
      this.dockedItems = [{
        xtype: 'toolbar',
        dock: 'top',
        items: [{
          iconCls: 'icon-add',
          itemId: 'novo',
          text: 'Novo'
        },'-',{
          iconCls: 'icon-delete',
          itemId: 'del',
          disabled: true,
          text: 'Excluir'
        },{
          iconCls: 'icon-save',
          itemId: 'salve',
          disabled: true,
          text: 'Salvar'
        }]
      }];
      this.callParent(arguments);
    }    
});
