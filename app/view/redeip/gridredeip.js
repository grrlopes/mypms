Ext.define('mypms.view.redeip.gridredeip',{
    extend: 'Ext.grid.Panel',
    alias : 'widget.gridredeip',
    store: 'redeip',
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
    	header: "Tipo",
    	flex: 1,
    	dataIndex: 'tipo',
        editor: {    
            xtype: 'combobox',
            triggerAction: 'all',
            queryMode: 'remote',
            store: 'redeiptipo',
            valueField: 'tipo',
            displayField: 'tipo',         
            editable: false,             
            listeners: {
                click: {
                    element: 'el',
                    fn: function(){
                        var store = Ext.create('mypms.view.redeip.redetipo');
                        store.getStore().load({
                            params:{decisao: 'tipo'}
                        });
                    }
                }
            }     
        } 
    },{
    	header: "Fisico",
    	flex: 1,
    	dataIndex: 'ip_fisico',
        editor: {
            xtype: 'textfield',
            allowBlank: true
        }
    },{
    	header: "Nat",
    	flex: 1,
    	dataIndex: 'ip_nat',
        editor: {
            xtype: 'textfield',
            allowBlank: true
        }
    },{
    	header: "Nivel",
    	flex: 1,
    	dataIndex: 'nivel',
        editor: {
            xtype: 'combobox',
            triggerAction: 'all',
            queryMode: 'remote',
            store: 'redeipnivel',
            valueField: 'nivel',
            displayField: 'nivel',         
            editable: false,             
            listeners: {
                click: {
                    element: 'el',
                    fn: function(){
                        var store = Ext.create('mypms.view.redeip.redenivel');
                        store.getStore().load({
                            params:{decisao: 'nivel'}
                        });
                    }
                }
            }     
        }
    },{
    	header: "Sub-nivel",
    	flex: 1,
    	dataIndex: 'subnivel',
        editor: {
            xtype: 'combobox',
            triggerAction: 'all',
            queryMode: 'remote',
            store: 'redeipsubnivel',
            valueField: 'subnivel',
            displayField: 'subnivel',         
            editable: false,             
            listeners: {
                click: {
                    element: 'el',
                    fn: function(){
                        var store = Ext.create('mypms.view.redeip.redesubnivel');
                        store.getStore().load({
                            params:{decisao: 'subnivel'}
                        });
                    }
                }
            }     
        }
    }],

    initComponent: function(){
      this.gridNovoRede = Ext.create('Ext.grid.plugin.RowEditing',{
        triggerEvent: 'cellfocus',
        saveBtnText: 'Ok'
      });
      Ext.apply(this,{
        plugins: [this.gridNovoRede]
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
          disabled: false,
          text: 'Salvar'
        }]
      }];
      this.callParent(arguments);
    }
});