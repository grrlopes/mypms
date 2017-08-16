Ext.define('mypms.view.servidores.grid' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.servidorgrid',
    store: 'servidores',
    requires:['Ext.ux.form.SearchField'],
    title : '<img id="titleIMG" src="resources/images/default/titulo.png" width="900" height="50" />',
    //titleAlign: 'center',
    selType: 'checkboxmodel',
    selModel: {
      checkOnly: false,
      injectCheckbox: 0,
      allowDeselect: true,
      showHeaderCheckbox: false,
      mode:'simples'
    },
    modal: true,
    border: true,
    //header: true,
    listeners : {
      afterrender : function(panel) {
        //var header = panel.header;
        //header.setHeight(15);
      }
    },
    //allowDeselect: false,
    //columnLines: true,
    columns: [{
  		header: "Hostname",
  		width: 160,
  		flex:1,
  		dataIndex: 'host',
      editor: {
        xtype: 'textfield',
        allowBlank: false
      }
    },{
    	header: "IP",
    	width: 170,
    	flex:1,
    	dataIndex: 'ip',
      editor: 'textfield'
    },{
      itemId: 'gridPais',
    	header: "País",
    	width: 170,
    	flex:1,
    	dataIndex: 'pais',
      editor: {        
        xtype: 'combobox',
        queryMode: 'local',
        triggerAction: 'all',
        store: 'pais',
        valueField: 'pais',
        displayField: 'pais',         
        editable: false,
        listeners: {
          click: {
            element: 'el',
            fn: function(){
              var pais = Ext.create('mypms.view.paineladm.tab.pais');
              pais.getStore().load({
                params:{decisao:'leitura',seletor:'pais'}
              });
            }
          }
        }
      } 
    },{
    	header: "Serial",
    	width: 170,
    	flex:1,
    	dataIndex: 'serial',
      editor: 'textfield'
    },{
      itemId: 'gridOs',
  		header: "OS",
  		width: 160,
  		flex:1,
  		dataIndex: 'os',
      editor: {        
        xtype: 'combobox',
        queryMode: 'local',
        triggerAction: 'all',
        store: 'os',
        valueField: 'os',
        displayField: 'os',         
        editable: false,
        listeners: {
          click: {
            element: 'el',
            fn: function(){
              var os = Ext.create('mypms.view.paineladm.tab.os');
              os.getStore().load({
                params:{decisao:'leitura',seletor:'os'}
              });
            }
          }
        }       
      }     
    },{
    	header: "Tipo",
    	width: 170,
    	flex:1,
    	dataIndex: 'tipo',
      editor: {        
        xtype: 'combobox',
        queryMode: 'local',
        triggerAction: 'all',
        store: 'tiposrv',
        valueField: 'tipo',
        displayField: 'tipo',         
        editable: false,
        listeners: {
          click: {
            element: 'el',
            fn: function(){
              var amb = Ext.create('mypms.view.paineladm.tab.tiposrv');
              amb.getStore().load({
                params:{decisao:'leitura',seletor:'tipo_servidor'}
              });  
            }
          }
        }       
      }
    },{
    	header: "Ambiente",
    	width: 170,
    	flex:1,
    	dataIndex: 'ambiente',    
      editor: {        
        xtype: 'combobox',
        queryMode: 'remote',
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
      itemId: 'gridProj',
  		header: "Projeto",
  		width: 160,
  		flex:1,
  		dataIndex: 'projeto',
      editor: {
        xtype: 'combobox',
        queryMode: 'remote',
        triggerAction: 'all',
        store: 'projeto',
        valueField: 'projeto',
        displayField: 'projeto',          
        editable: false,
        listeners: {
          click: {
            element: 'el',
            fn: function(){
              var proj = Ext.create('mypms.view.paineladm.tab.projeto');
              proj.getStore().load({
                params:{decisao:'leitura',seletor:'userproj'}
              });           
            }
          }
        }      
      }
    },{
    	header: "Descricao",
    	width: 170,
    	flex:1,
    	dataIndex: 'descricao',
      editor: {        
        xtype: 'combobox',
        queryMode: 'local',
        triggerAction: 'all',
        store: 'descricao',
        valueField: 'descricao',
        displayField: 'descricao',         
        editable: false,
        listeners: {
          click: {
            element: 'el',
            fn: function(){
              var desc = Ext.create('mypms.view.paineladm.tab.descricao');
              desc.getStore().load({
                params:{decisao:'leitura',seletor:'setor_descricao'}
              });    
            }
          }
        }       
      } 
    },{
    	header: "Local",
    	width: 170,
    	flex:1,
    	dataIndex: 'local',
      editor: {        
        xtype: 'combobox',
        queryMode: 'local',
        triggerAction: 'all',
        store: 'local',
        valueField: 'local',
        displayField: 'local',         
        editable: false,
        listeners: {
          click: {
            element: 'el',
            fn: function(){
              var local = Ext.create('mypms.view.paineladm.tab.local');
              local.getStore().load({
                params:{decisao:'leitura',seletor:'local'}
              });    
            }
          }
        }       
      } 
    },{
    	header: "Situação",
    	width: 170,
    	flex:1,
    	dataIndex: 'situacao',
      editor: {
        xtype: 'combobox',
        store: [['Ativo','Ativo'],['Inativo','Inativo']],
        queryMode: 'local',
        editable:false           
      }
    }],
    /*selType: 'rowmodel',
    plugins: [
      Ext.create('Ext.grid.plugin.RowEditing',{
        clicksToEdit: 2,
      })
    ],*/
	initComponent: function(){
    this.gridNovoServer = Ext.create('Ext.grid.plugin.RowEditing',{
        triggerEvent: 'cellfocus',
        saveBtnText: 'Ok'
    }),
    Ext.apply(this, {
      plugins: [this.gridNovoServer]
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
          disabled: true,
          text: 'Excluir'
        },'-',{
          iconCls: 'icon-editar',
          itemId: 'editar',
          disabled: true,
          text: 'Editar'
        },'-',{
          iconCls: 'icon-save',
          itemId: 'salve',
          text: 'Salvar'
        },'-',{
          iconCls: 'iconrede',
          itemId: 'redeip',
          text: 'IP'
        },'->',{
          tooltip: 'Privilégio administrativo',
          iconCls: 'iconadmin',
          itemId: 'audit',
          text: 'Adm'            
        },'-',{
          iconCls: 'icon-lock',
          itemId: 'padm',
          text: 'Painel Adm'
        },'-',{
          iconCls: 'icon-historico',
          itemId: 'historico',
          text: 'Histórico'
        },'->',{
          xtype: 'toolbar',
          margin: 'left',
          border: false,
          items: [{
            id: 'pesquisa',
            xtype: 'triggerfield',
            triggerCls: 'x-form-clear-trigger',
            name: 'pesquisa',
            emptyText: 'Pesquisa',
            //queryMode: 'remote',
            //triggerAction: 'all',
            enableKeyEvents: true,
            onTriggerClick: function(field, trigger, e){
              Ext.getCmp('pesquisa').setValue('');
            },                       
            listeners: {
              change: {
                buffer: 1000,
                fn: function(){
                  var valores = ['host','pais','serial','os','ip','tipo','ambiente',
                  'projeto','descricao','local','situacao'], Avalores = new Object();
                  function seletor(value){
                    return Ext.ComponentQuery.query('servidorgrid [itemId='+value+']')[0];               
                  };
                  Ext.Array.each(valores, function(e){
                    if(seletor(e).checked){
                      var value = seletor(e).itemId;
                      Avalores[value] = seletor(e).itemId;
                    }
                  });                  
                  Avalores['search'] = Ext.getCmp('pesquisa').getValue();
                  Avalores['sort'] = false;
                  var store = Ext.ComponentQuery.query('servidorgrid')[0].getStore();
                  store.clearFilter();
                  if(Ext.getCmp('pesquisa').getValue() === ''){
                    store.proxy.extraParams = null;
                    //Avalores['page'] = 1;
                    store.clearFilter();
                    store.load({
                      params: Avalores
                    });
                    store.clearFilter();                
                  }else{
                    store.proxy.extraParams = Avalores;
                    store.load({
                      params: Avalores
                    });
                    store.clearFilter();
                  }
                }
              }
            }
          }]
        },{
          iconCls: 'iconsearch',
          height: 22,         
          menu: [
            { xtype: 'menucheckitem', text: 'Selecione todos',
              handler: function(item, e){
                if(item.checked){
                  item.setText('Desselecionar todos');
                }else{
                  item.setText('Selecionar todos');
                }
                var valores = ['pais','serial','os','ip',
                'tipo','ambiente','projeto','descricao','local','situacao'];
                function seletor(value){
                  return Ext.ComponentQuery.query('servidorgrid [itemId='+value+']')[0];               
                };
                Ext.Array.each(valores, function(e){
                  if(item.checked){
                    seletor(e).setChecked(true);
                  }else{
                    seletor(e).setChecked(false);
                  }
                });
              }
            },'-',
            { itemId: 'host', xtype: 'menucheckitem', text: 'Hostname', checked: true, disabled: true},
            { itemId: 'pais', xtype: 'menucheckitem', text: 'Pais', checked: true},
            { itemId: 'serial', xtype: 'menucheckitem', text: 'Serial'},
            { itemId: 'os', xtype: 'menucheckitem', text: 'OS'},
            { itemId: 'ip', xtype: 'menucheckitem', text: 'IP', checked: true},
            { itemId: 'tipo', xtype: 'menucheckitem', text: 'Tipo'},
            { itemId: 'ambiente', xtype: 'menucheckitem', text: 'Ambiente'},
            { itemId: 'projeto', xtype: 'menucheckitem', text: 'Projeto'},
            { itemId: 'descricao', xtype: 'menucheckitem', text: 'Descrição', checked: true},
            { itemId: 'local', xtype: 'menucheckitem', text: 'Local'},
            { itemId: 'situacao', xtype: 'menucheckitem', text: 'Status'}
          ]
        },{
          iconCls: 'iconlogout',
          itemId: 'logout',
          text: 'Logout'          
        }
      ]
      },
      {
        xtype: 'pagingtoolbar',
        dock:'bottom',
        store: 'servidores',
        displayInfo: true,
        displayMsg: 'Registros {0} - {1} de {2}',
        emptyMsg: "Nenhum registro encontrado."
      }];
		this.callParent(arguments);
	}
});
