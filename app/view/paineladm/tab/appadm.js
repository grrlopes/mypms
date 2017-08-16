Ext.define('mypms.view.paineladm.tab.appadm' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.appadm',
    store: 'appadm',
    border: false,
    selType: 'checkboxmodel',
    selModel: {
      checkOnly: false,
      injectCheckbox: 0,
      allowDeselect: false,
      showHeaderCheckbox: false,
      mode:'simples'
    },    
    columns: [            
        {
            menuDisabled: true,
            header: "Nivel",
            flex: 1,
            dataIndex: 'nivel'
        },{
            menuDisabled: true,
            header: "Login",
            flex: 1,
            dataIndex: 'login'
        },{
            menuDisabled: true,
            header: "Projeto",
            flex: 1,
            dataIndex: 'projeto'
        }
    ],
    tbar: [
        {
            xtype: 'combobox',
            editable: false,
            name: 'nivelid',
            listeners: {
                click: {
                    element: 'el',
                    fn: function(){
                        var store = Ext.data.StoreManager.get("appadmnivel");
                        store.load({
                            params:{decisao:'leitura',seletor:'nivel'}
                        });
                    }
                }
            },
            store: 'appadmnivel',
            queryMode: 'remote',
            triggerAction: 'all',
            valueField: 'nivel',
            displayField: 'nivel',            
            emptyText: 'Nível',
            dataIndex: 'nivel'                 
        },'-',{   
            xtype: 'combobox',
            editable: false,
            name: 'loginid',
            listeners: {
                click: {
                    element: 'el',
                    fn: function(){
                        var store = Ext.data.StoreManager.get("appadmlogin");
                        store.load({
                            params:{decisao:'leitura',seletor:'login'}
                        });
                    }
                }
            },            
            store: 'appadmlogin',
            queryMode: 'remote',
            triggerAction: 'all',
            valueField: 'login',
            displayField: 'login',            
            emptyText: 'Login',
            dataIndex: 'login'
        },'-',{
            xtype: 'combobox',
            editable: false,
            name: 'projetoid',
            listeners: {
                click: {
                    element: 'el',
                    fn: function(){
                        var store = Ext.data.StoreManager.get("appadmproj");
                        store.load({
                            params:{decisao:'leitura',seletor:'projeto'}
                        });
                    }
                }
            },            
            store: 'appadmproj',
            queryMode: 'remote',
            triggerAction: 'all',
            valueField: 'projeto',
            displayField: 'projeto',            
            emptyText: 'Projeto',
            dataIndex: 'projeto'          
        },'-',{
            iconCls: 'icon-save',
            itemId: 'salve',
            disabled: false,
            text: 'Salvar'
        },'-',{
            iconCls: 'icon-delete',
            itemId: 'del',
            text: 'Excluir'
        }
    ] 
});