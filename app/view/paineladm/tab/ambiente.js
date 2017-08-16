Ext.define('mypms.view.paineladm.tab.ambiente' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.ambtab',
    store: 'ambiente',
    border: false,
    selType: 'checkboxmodel',
    selModel: {
      checkOnly: false,
      injectCheckbox: 0,
      allowDeselect: true,
      showHeaderCheckbox: false,
      mode:'simples'
    },    
    columnLines: true,
    columns: [{
        menuDisabled: true,
        header: "Ambiente",
        width: 160,
        flex: 1,
        dataIndex: 'ambiente',
        editor: {
        xtype: 'textfield',
        allowBlank: false
      }
    }],

    initComponent: function(){
      this.gridNovoAmb = Ext.create('Ext.grid.plugin.RowEditing',{
        triggerEvent: 'cellfocus',
        saveBtnText: 'Ok'
      }),
      Ext.apply(this, {
        plugins: [this.gridNovoAmb]
      }),
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
          text: 'Excluir'
        },'-',{
          iconCls: 'icon-editar',
          itemId: 'editar',
          text: 'Editar'
        },'-',{
          iconCls: 'icon-save',
          itemId: 'salve',
          text: 'Salvar'
        }]
      }],
      this.callParent(arguments);
    }
  });
