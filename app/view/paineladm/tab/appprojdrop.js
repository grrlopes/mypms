Ext.define('mypms.view.paineladm.tab.appprojdrop', {
    extend: 'Ext.container.Container',
    alias : 'widget.appprojdrop',
    requires: [
        'Ext.grid.*'
    ],    
    layout: {
        type: 'hbox',
        align: 'stretch',
        padding: 0
    },
    selType: 'checkboxmodel',
    selModel: {
      checkOnly: false,
      injectCheckbox: 0,
      allowDeselect: false,
      showHeaderCheckbox: false,
      mode:'simples'
    },      
    initComponent: function(){
        var grupo1 = this.id + 'grupo1',
            grupo2 = this.id + 'grupo2',
            columns = [
                {
                    menuDisabled: true,
                    header: "Login",
                    width: 160,
                    flex: 1,
                    dataIndex: 'login'
                }                
            ]; 
        this.items = [{
            itemId: 'grid1',
            flex: 1,
            xtype: 'grid',
            viewConfig: {
                plugins: {
                    ptype: 'gridviewdragdrop'
                },
                listeners: {
                    itemdblclick: function(){
                        console.log('kkk');
                    },
                    drop: function(node, data, dropRec, dropPosition){
                        
                    }
                }
            },
            store: 'admadlogin',
            columns: columns,
            stripeRows: true,
            title: 'Login base ldap',
            tools: [{
                type: 'refresh',
                tooltip: 'Recarrega tabela',
                scope: this,
                handler: this.Recarregar
            },{
                type: 'help',
                tooltip: 'Segure o login e arraste'          
            }],            
            margins: '0 5 0 0'
        },{
            itemId: 'grid2',
            flex: 1,
            xtype: 'grid',
            viewConfig: {
                plugins: {
                    ptype: 'gridviewdragdrop',
                    dragGroup: grupo2
                },
                listeners: {
                    drop: function(node, data, overModel, dropPosition, dropHandlers){
                        var grid = Ext.ComponentQuery.query('appproj')[0],
                        servidor = Ext.ComponentQuery.query('servidorgrid')[0],
                        selecao = grid.getSelectionModel().getSelection()[0],
                        grade = this.up('#grid2');
                        data.records.forEach(function(e){
                            e.data.seletor = 'admdrop';
                            e.data.decisao = 'criacao';
                            e.data.ambiente = selecao.get('projeto');
                            e.data.procedure = 'permisalve';
                            e.data.tabela = 'projeto';                       
                        },this);
                        this.getStore().insert(0,data.records[0].data);
                        this.getStore().sync();
                        Ext.MessageBox.show({
                            icon: Ext.MessageBox.WARNING,
                            title:'Incluir',
                            closable: false,
                            msg: 'Login: <b>'+ data.records[0].data.login +'</b> incluido!',
                            buttons: Ext.MessageBox.OK,
                            fn: function(btn, ev){
                                if(btn == 'ok'){
                                    grade.getStore().load({
                                        params:{
                                            decisao:'leitura',seletor:'appAdmdyn',ambiente:'projeto',
                                            procedure:selecao.get('projeto'),tabela:'permissao_projeto'
                                        }                            
                                    });
                                    servidor.getStore().load();
                                }
                            }
                        });                                         
                    },
                    itemdblclick: function(grid, record, item, index, e, eOpts){
                        var gridExt = Ext.ComponentQuery.query('appproj')[0],
                        selecao = gridExt.getSelectionModel().getSelection()[0],                        
                        record = grid.getSelectionModel().getSelection()[0],
                        store = grid.getStore();
                        record.data['decisao'] = 'delete';
                        record.data['seletor'] = 'admdrop';
                        record.data['ambiente'] = selecao.get('projeto');
                        record.data['procedure'] = 'permiuserdelproj';
                        store.remove(record);
                        store.sync();
                    }
                }
            },
            store: 'appprojdyn',
            columns: columns,
            stripeRows: true,
            title: 'Projeto',
            tools: [{
                type: 'help',
                tooltip: 'Click duplo, remove login !!!'
            }]
        }];
        this.callParent();
    },
   Recarregar: function(){
        this.down('#grid1').getStore().load({
            params:{
                decisao:'leitura',seletor:'activedirec'
            }            
        });
    }    
});
