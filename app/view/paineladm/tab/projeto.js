Ext.define('mypms.view.paineladm.tab.projeto' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.projetotab',
    store: 'projeto',
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
    	header: "Projeto",
    	width: 160,
    	flex: 1,
    	dataIndex: 'projeto',
      editor: {
        xtype: 'textfield',
        allowBlank: false
      }
    }],  
    
    initComponent: function(){
      this.gridNovoproj = Ext.create('Ext.grid.plugin.RowEditing',{
        triggerEvent: 'cellfocus',
        saveBtnText: 'Ok'
      });
      Ext.apply(this,{
        plugins: [this.gridNovoproj]
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
          disabled: false,
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
      }];
      this.callParent(arguments);
    }
  });
