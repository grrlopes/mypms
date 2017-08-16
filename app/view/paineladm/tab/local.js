Ext.define('mypms.view.paineladm.tab.local' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.localtab',
    store: 'local',
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
        header: "Local",
        width: 160,
        flex: 1,
        dataIndex: 'local',
        editor: {
        xtype: 'textfield',
        allowBlank: false
      }
    }],

    initComponent: function(){
      this.gridNovoLocal = Ext.create('Ext.grid.plugin.RowEditing',{
        triggerEvent: 'cellfocus',
        saveBtnText: 'Ok'
      }),
      Ext.apply(this, {
        plugins: [this.gridNovoLocal]
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
