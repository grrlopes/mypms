Ext.define('mypms.view.historico.gridhistorico' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.gridhistorico',
    store: 'historicosrv',
    triggerAction: 'All',
    selType: 'checkboxmodel',
    selModel: {
      checkOnly: false,
      injectCheckbox: 0,
      allowDeselect: true,
      showHeaderCheckbox: false,
      mode:'simples'
    },
    modal: true,
    border: false, 
    columns: [{
  		header: "Hostname",
  		flex:1,
  		dataIndex: 'host'
    },{
    	header: "IP",
    	flex:1,
    	dataIndex: 'ip'
    },{
      itemId: 'gridPais',
    	header: "País",
    	flex:1,
    	dataIndex: 'pais',
      hidden: true
    },{
    	header: "Serial",
    	flex:1,
    	dataIndex: 'serial',
      hidden: true
    },{
  		header: "OS",
  		flex:1,
  		dataIndex: 'os'
    },{
    	header: "Tipo",
    	flex:1,
    	dataIndex: 'tipo'
    },{
    	header: "Ambiente",
    	flex:1,
    	dataIndex: 'ambiente'
    },{
  		header: "Projeto",
  		flex:1,
  		dataIndex: 'projeto'
    },{
    	header: "Descricao",
    	flex:1,
    	dataIndex: 'descricao',
      hidden: true
    },{
    	header: "Local",
    	flex:1,
    	dataIndex: 'local',
      hidden: true
    },{
    	header: "login",
    	flex:1,
    	dataIndex: 'usuario'       
    },{
    	header: "acao",
    	flex:1,
    	dataIndex: 'acao'      
    },{
    	header: "data",
    	flex:1,
      xtype: 'datecolumn',
    	dataIndex: 'data', 
      format: 'd-m-Y H:i'       
    }],

	initComponent: function(){
		this.dockedItems = [{
        xtype: 'toolbar',     
        items: [{
          iconCls: 'icon-historico',
          itemId: 'historicoip',
          text: 'IP'
        },'->',{
          xtype: 'toolbar',
          margin: 'left',
          border: false,
          items: [{
            id: 'hpesquisa',
            xtype: 'triggerfield',
            triggerCls: 'x-form-clear-trigger',
            name: 'pesquisa',
            emptyText: 'Pesquisa',
            enableKeyEvents: true,
            onTriggerClick: function(field, trigger, e){
              Ext.getCmp('hpesquisa').setValue('');
            },             
            listeners: {
              change: {
                buffer: 1000,
                fn: function(){
                  var valores = ['host','pais','serial','os','ip','tipo','ambiente',
                  'projeto','descricao','local'], Avalores = new Object();
                  function seletor(value){
                    return Ext.ComponentQuery.query('gridhistorico [itemId='+value+']')[0];               
                  };
                  Ext.Array.each(valores, function(e){
                    if(seletor(e).checked){
                      var value = seletor(e).itemId;
                      Avalores[value] = seletor(e).itemId;
                    }
                  });                  
                  Avalores['search'] = Ext.getCmp('hpesquisa').getValue();
                  Avalores['sort'] = false;
                  var store = Ext.ComponentQuery.query('gridhistorico')[0].getStore();
                  store.clearFilter();
                  if(Ext.getCmp('hpesquisa').getValue() === ''){
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
                'tipo','ambiente','projeto','descricao','local'];
                function seletor(value){
                  return Ext.ComponentQuery.query('gridhistorico [itemId='+value+']')[0];               
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
            { itemId: 'pais', xtype: 'menucheckitem', text: 'Pais'},
            { itemId: 'serial', xtype: 'menucheckitem', text: 'Serial'},
            { itemId: 'os', xtype: 'menucheckitem', text: 'OS'},
            { itemId: 'ip', xtype: 'menucheckitem', text: 'IP', checked: true},
            { itemId: 'tipo', xtype: 'menucheckitem', text: 'Tipo'},
            { itemId: 'ambiente', xtype: 'menucheckitem', text: 'Ambiente'},
            { itemId: 'projeto', xtype: 'menucheckitem', text: 'Projeto'},
            { itemId: 'descricao', xtype: 'menucheckitem', text: 'Descrição'},
            { itemId: 'local', xtype: 'menucheckitem', text: 'Local'}
          ]
        }
      ]},
      {
        xtype: 'pagingtoolbar',
        dock:'bottom',
        store: 'historicosrv',
        displayInfo: true,
        displayMsg: 'Registros {0} - {1} de {2}',
        emptyMsg: "Nenhum registro encontrado."
      }];
		this.callParent(arguments);
  }
});
