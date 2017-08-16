Ext.define('mypms.view.paineladm.tab.tiposrv',{
    extend: 'Ext.grid.Panel',
    alias : 'widget.tiposrvtab',
    store: 'tiposrv',
    border: false,
    minHeight: 400,
    columns: [{
    	header: "Tipo servidor",
    	width: 160,
    	flex: 1,
    	dataIndex: 'tipo',
      editor: {
        xtype: 'textfield',
        allowBlank: false
      }
    }],

    initComponent: function(){
      this.gridNovoTiposrv = Ext.create('Ext.grid.plugin.RowEditing',{
        triggerEvent: 'cellfocus',
        saveBtnText: 'Ok'
      }),
      Ext.apply(this, {
        plugins: [this.gridNovoTiposrv]
      }),
      this.dockedItems = [{
        xtype: 'toolbar',
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
