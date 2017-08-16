Ext.define('mypms.view.paineladm.tab.tipoapp',{
    extend: 'Ext.grid.Panel',
    alias : 'widget.tipoapptab',
    store: 'tipoapp',
    border: false,
    minHeight: 400,
    selType: 'checkboxmodel',
    selModel: {
      checkOnly: false,
      injectCheckbox: 0,
      allowDeselect: true,
      showHeaderCheckbox: false,
      mode:'simples'
    },    
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
      this.gridNovotipoapp = Ext.create('Ext.grid.plugin.RowEditing',{
        triggerEvent: 'cellfocus',
        saveBtnText: 'Ok'
      }),
      Ext.apply(this, {
        plugins: [this.gridNovotipoapp]
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
