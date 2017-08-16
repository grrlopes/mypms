Ext.define('mypms.view.bizu.gridbizu',{
    extend: 'Ext.grid.Panel',
    alias : 'widget.gridbizu',
    store: 'bizu',
    border: false, 
    selType: 'checkboxmodel',
    selModel: {
      checkOnly: false,
      injectCheckbox: 0,
      allowDeselect: true,
      showHeaderCheckbox: false,
      mode:'simples'
    },
    columns: [{
    	header: "Nivel",
    	flex: 1,
    	dataIndex: 'nivel',
      editor: {   
        xtype: 'combobox',
        queryMode: 'local',
        triggerAction: 'all',
        store: 'nivelacesso',
        autoSelect: true,
        valueField: 'nivel',
        displayField: 'nivel',         
        editable: false,
        listeners: {
          click: {
            element: 'el',
            fn: function(){
              var nivelacesso = Ext.create('mypms.view.bizu.nivelacesso');
              nivelacesso.getStore().load({
                params:{decisao:'leitura',seletor:'nivel_acesso'}
              });
            }
          }
        }
      } 
    },{
    	header: "Tipo",
    	flex: 1,
    	dataIndex: 'tipo',
      editor: {        
        xtype: 'combobox',
        queryMode: 'local',
        triggerAction: 'all',
        store: 'tipoapp',
        valueField: 'tipo',
        displayField: 'tipo',         
        editable: false,
        listeners: {
          click: {
            element: 'el',
            fn: function(){
              var nivelacesso = Ext.create('mypms.view.paineladm.tab.tipoapp');
              nivelacesso.getStore().load({
                params:{decisao:'leitura',seletor:'tipo_app'}
              });
            }
          }
        }       
      } 
    },{
    	header: "Login",
    	flex: 1,
    	dataIndex: 'login',
      editor: {
        xtype: 'textfield',
        allowBlank: false
      }
    },{
    	header: "Ambiente",
    	flex: 1,
    	dataIndex: 'ambiente',
      editor: {        
        xtype: 'combobox',
        queryMode: 'local',
        triggerAction: 'all',
        store: 'ambiente',
        valueField: 'ambiente',
        displayField: 'ambiente',        
        editable: false,
        listeners: {
          click: {
            element: 'el',
            fn: function(){
              var amb = Ext.create('mypms.view.paineladm.tab.ambiente');
              amb.getStore().load({
                params:{decisao:'leitura',seletor:'useramb'}
              });  
            }
          }
        }       
      } 
    },{
    	header: "Senha",
    	flex: 1,
    	dataIndex: 'senha',
      editor: {
        xtype: 'textfield',
        allowBlank: false
      }
    },{
    	header: "Aplicação",
    	flex: 1,
    	dataIndex: 'app',
      editor: {        
        xtype: 'combobox',
        queryMode: 'local',
        triggerAction: 'all',
        store: 'modeloapp',
        valueField: 'modelo',
        displayField: 'modelo',         
        editable: false,
        listeners: {
          click: {
            element: 'el',
            fn: function(){
              var amb = Ext.create('mypms.view.paineladm.tab.modeloapp');
              amb.getStore().load({
                params:{decisao:'leitura',seletor:'app_modelo'}
              });  
            }
          }
        }
      } 
    },{
    	header: "Comentário",
    	flex: 1,
    	dataIndex: 'com',
      editor: {
        xtype: 'textfield',
        allowBlank: false
      }
    }],

    initComponent: function(){
      this.gridNovobizu = Ext.create('Ext.grid.plugin.RowEditing',{
        triggerEvent: 'cellfocus',
        saveBtnText: 'Ok'
      });
      Ext.apply(this,{
        plugins: [this.gridNovobizu]
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
