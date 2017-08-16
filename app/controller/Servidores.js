Ext.define('mypms.controller.Servidores', {
    extend: 'Ext.app.Controller',

    stores: [
      'mypms.store.servidores',
      'mypms.store.setor',
      'mypms.store.os',
      'mypms.store.projeto',
      'mypms.store.descricao',
      'mypms.store.ambiente',
      'mypms.store.pais',
      'mypms.store.local',
      'mypms.store.rede',
      'mypms.store.modeloapp',
      'mypms.store.tiposrv',
      'mypms.store.tipoapp',
      'mypms.store.appadm',
      'mypms.store.appamblogin',
      'mypms.store.appprojdyn',
      'mypms.store.appambdyn',
      'mypms.store.admadlogin',
      'mypms.store.bizu',
      'mypms.store.nivelacesso',
      'mypms.store.redeip',
      'mypms.store.redeipnivel',
      'mypms.store.redeipsubnivel',
      'mypms.store.historicosrv',
      'mypms.store.historicoip',
      'mypms.store.historicobizu',
      'mypms.store.audit'
    ],

    models: [
      'mypms.model.gridServidores.servidores',
      'mypms.model.gridServidores.combo.setor',
      'mypms.model.paineladm.tab.os',
      'mypms.model.paineladm.tab.projeto',
      'mypms.model.paineladm.tab.descricao',
      'mypms.model.paineladm.tab.ambiente',
      'mypms.model.paineladm.tab.pais',
      'mypms.model.paineladm.tab.local',
      'mypms.model.paineladm.tab.rede',
      'mypms.model.paineladm.tab.tiposrv',
      'mypms.model.paineladm.tab.tipoapp',
      'mypms.model.paineladm.tab.modeloapp',
      'mypms.model.paineladm.tab.appadm',
      'mypms.model.paineladm.tab.appamblogin',
      'mypms.model.paineladm.tab.appprojdyn',
      'mypms.model.paineladm.tab.appambdyn',
      'mypms.model.paineladm.tab.admadlogin',
      'mypms.model.zonaunica.bizu',
      'mypms.model.zonaunica.nivelacesso',
      'mypms.model.redeip.redeip',
      'mypms.model.redeip.redeipnivel',
      'mypms.model.historico.historicosrv',
      'mypms.model.historico.historicobizu',
      'mypms.model.historico.historicoip',
      'mypms.model.auditor.audit'
    ],

    views: [
      'mypms.view.servidores.grid',
      'mypms.view.servidores.gridForm',
      'mypms.view.paineladm.admin',
      'mypms.view.paineladm.tab.projeto',
      'mypms.view.paineladm.tab.os',
      'mypms.view.paineladm.tab.descricao',
      'mypms.view.paineladm.tab.ambiente',
      'mypms.view.paineladm.tab.pais',
      'mypms.view.paineladm.tab.local',
      'mypms.view.paineladm.tab.rede',
      'mypms.view.paineladm.tab.tiposrv',
      'mypms.view.paineladm.tab.tipoapp',
      'mypms.view.paineladm.tab.modeloapp',
      'mypms.view.paineladm.tab.appadm',
      'mypms.view.paineladm.tab.appamb',
      'mypms.view.paineladm.tab.appproj',
      'mypms.view.paineladm.tab.appprojdyn',
      'mypms.view.paineladm.tab.appambdyn',
      'mypms.view.paineladm.tab.appprojdrop',
      'mypms.view.paineladm.tab.appambdrop',
      'mypms.view.bizu.winbizu',
      'mypms.view.bizu.gridbizu',
      'mypms.view.bizu.nivelacesso',
      'mypms.view.redeip.winredeip',
      'mypms.view.redeip.gridredeip',
      'mypms.view.redeip.redetipo',
      'mypms.view.redeip.redenivel',
      'mypms.view.redeip.redesubnivel',
      'mypms.view.historico.winhistorico',
      'mypms.view.historico.gridhistorico',
      ///fazendo
      'mypms.view.historico.winhistoricoip',
      'mypms.view.historico.gridip',
      'mypms.view.historico.winhistoricobizu',
      'mypms.view.historico.gridbizu',
      'mypms.view.auditor.winaudit',
      'mypms.view.auditor.gridaudit'
    ],

    refs: [{
      ref: 'Viewwinaudit',
      selector: 'winauditor'
    },{
      ref: 'Viewgridauditor',
      selector: 'gridauditor button#novo'
    },{
      ref: 'ViewgridauditorSalve',
      selector: 'gridauditor button#salve'      
    },{
      ref: 'ViewgridauditorDel',
      selector: 'gridauditor button#del'  
    },{
      ref: 'Viewservidorgrid',
      selector: 'servidorgrid button#padm'
    },{
      ref: 'ViewpainelAdm',
      selector: 'painelAdm',
      autoCreate: true
    },{
      ref: 'Viewappadmsalve',
      selector: 'appadm button#salve' //combobox[name="nivelid"]
    },{
      ref: 'Viewappadmdel',
      selector: 'appadm button#del'      
    },{
      ref: 'Viewappadm',
      selector: 'appadm' //combobox[name="loginid"]'    
    }],    

    init: function(application){
      var me = this;
      me.control({
        "servidorgrid": {
          render: me.onGridRender,
          itemdblclick: me.ServidorDblGrid,
          itemclick: me.onClickGrid
        },
        "gridpanel pagingtoolbar *": {
          click: me.pagina
        },
        "gridForm button#cancela": {
          click: me.onCancelaClick
        },        
        "servidorgrid button#novo": {
          click: me.ServidorNovo
        },
        "servidorgrid button#del": {
          click: me.ServidorDel
        },
        "servidorgrid button#editar": {
          click: me.ServidorEdit
        },
        "servidorgrid button#salve": {
          click: me.ServidorSalve
        },
        "servidorgrid button#padm": {
          click: me.PainelAdmin
        },
        "servidorgrid button#historico": {
          click: me.Historico
        },
        "servidorgrid button#redeip": {
          click: me.ServidorRedeip
        },
        "servidorgrid button#logout": {
          click: me.ServidorLogout
        },
        "servidorgrid button#audit": {
          click: me.Audit
        },
        "gridauditor": {
          itemclick: me.AuditGrid
        },
        "gridauditor button#novo": {
          click: me.AuditNovo
        },
        "gridauditor button#salve": {
          click: me.AuditSalve
        },
        "gridauditor button#del": {
          click: me.AuditDel
        },                                                                
        /*
        # Scopo do painel de administrativo Projeto
        */               
        "projetotab": {
          itemclick: me.ProjetoGrid
        },
        "projetotab button#novo": {
          click: me.ProjetotabNovo
        },        
        "projetotab button#editar": {
          click: me.ProjetotabEdit
        },
        "projetotab button#del": {
          click: me.ProjetotabDel
        },
        "projetotab button#salve": {
          click: me.ProjetotabSalve
        },
        /*
        # Scopo do painel de administrativo OS
        */
        "ostab button#editar": {
          click: me.OstabEdit
        },        
        "ostab button#novo": {
          click: me.OstabNovo
        },
        "ostab button#del": {
          click: me.OstabDel
        },
        "ostab button#salve": {
          click: me.OstabSalve
        },
        /*
        # Scopo do painel de administrativo Descricao
        */
        "desctab button#editar": {
          click: me.DesctabEdit
        },       
        "desctab button#novo": {
          click: me.DesctabNovo
        },
        "desctab button#del": {
          click: me.DesctabDel
        },
        "desctab button#salve": {
          click: me.DesctabSalve
        },
        /*
        # Scopo do painel de administrativo Ambiente
        */
        "ambtab button#editar": {
          click: me.AmbtabEdit
        },         
        "ambtab button#novo": {
          click: me.AmbtabNovo
        },
        "ambtab button#del": {
          click: me.AmbtabDel
        },        
        "ambtab button#salve": {
          click: me.AmbtabSalve
        },
        /*
        # Scopo do painel de administrativo Pais
        */
        "paistab button#editar": {
          click: me.PaistabEdit
        },         
        "paistab button#novo": {
          click: me.PaistabNovo
        },
        "paistab button#salve": {
          click: me.PaistabSalve
        },
        "paistab button#del": {
          click: me.PaistabDel
        },
        /*
        # Scopo do painel de administrativo Local
        */
        "localtab button#editar": {
          click: me.LocaltabEdit
        },             
        "localtab button#novo": {
          click: me.LocaltabNovo
        },
        "localtab button#salve": {
          click: me.LocaltabSalve
        },
        "localtab button#del": {
          click: me.LocaltabDel
        },
        /*
        # Scopo do painel de administrativo APP
        */
        "modeloapptab button#editar": {
          click: me.ModeloapptabEdit
        },
        "modeloapptab button#novo": {
          click: me.ModeloapptabNovo
        },
        "modeloapptab button#salve": {
          click: me.ModeloapptabSalve
        },
        "modeloapptab button#del": {
          click: me.ModeloapptabDel
        },      
        /*
        # Scopo do painel de administrativo Rede
        */
        "redetab button#editar": {
          click: me.RedetabEdit
        },        
        "redetab button#novo": {
          click: me.RedetabNovo
        },
        "redetab button#salve": {
          click: me.RedetabSalve
        },
        "redetab button#del": {
          click: me.RedetabDel
        },
        "appadm": {
          itemclick: me.AppProjtabGrid
        },
        "appadm button#salve": {
          click: me.AppProjtabSalve
        },
        "appadm button#del": {
          click: me.AppProjtabDel
        },
        "appamb": {
          itemclick: me.AppAmbtabGrid
        },
        "appproj": {
          itemclick: me.AppProjtabGrid
        },
        /*
        # Scopo do window Bizu
        */
        "gridbizu button#editar": {
          click: me.BizuEdit
        },         
        "gridbizu button#novo": {
          click: me.BizuNovo
        },
        "gridbizu button#salve": {
          click: me.BizuSalve
        },           
        "gridbizu button#del": {
          click: me.BizuDel
        },
        /*
        # Scopo do window Redeip
        */
        "gridredeip": {
          itemclick: me.RedeipGrid
        },
        "gridredeip button#editar":{
          click: me.RedeipEdit
        },   
        "gridredeip button#novo": {
          click: me.RedeipNovo
        },
        "gridredeip button#salve": {
          click: me.RedeipSalve
        },
        "gridredeip button#del": {
          click: me.RedeipDel
        },
        ////
        "gridhistorico button#historicoip": {
          click: me.Historicoip
        },
        "gridhistorico": {
          itemdblclick: me.Historicobizu
        }                                                                                                                   
      });
    },
    Historicobizu: function(grid, record, item, index, e, eOpts){
      var win = Ext.create('mypms.view.historico.winhistoricobizu'),
      store = Ext.create('mypms.view.historico.gridbizu');
      store.getStore().load({
        params:{id: record.get('id')}
      });
    },
    Historicoip: function(btn, e, eOpts){
      grid = btn.up('grid'),
      record = grid.getSelectionModel().getSelection()[0],
      selecao = grid.getSelectionModel().hasSelection();
      if(selecao){
        var win = Ext.create('mypms.view.historico.winhistoricoip'),
        store = Ext.create('mypms.view.historico.gridip');
        win.setTitle(record.get('host'));
        store.getStore().load({
          params:{id: record.get('id')}
        });
      }
    },
    pagina: function(grid, eOpts){
      var botaoDel = Ext.ComponentQuery.query('servidorgrid button#del')[0],
      botaoEdit = Ext.ComponentQuery.query('servidorgrid button#editar')[0];
      botaoDel.setDisabled(true);
      botaoEdit.setDisabled(true);
    },
    onGridRender: function(grid, eOpts){
      Ext.create('mypms.view.paineladm.admin');
      grid.getStore().load();
      this.getStore('os').load({
        params:{decisao:'leitura',seletor:'os'}
      });          
    },
    ServidorRedeip: function(btn, e, eOpts){
      var gridExt = Ext.create('mypms.view.redeip.gridredeip'),
      grid = btn.up('grid'),
      record = grid.getSelectionModel().getSelection()[0],
      selecao = grid.getSelectionModel().hasSelection();
      if(selecao){
        win = Ext.create('mypms.view.redeip.winredeip');
        win.setTitle('Rede IP/NAT');
        gridExt.getStore().load({
          params:{id: record.data['id'], decisao: 'rede'}
        });
      }
    },
    ServidorNovo: function(btn, e, eOpts){
      //var win = Ext.create('mypms.view.servidores.gridForm');
      //win.setTitle('Novo servidor');
      var grid = btn.up('grid');
      var store = grid.getStore();
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var novoRegistro = Ext.create('mypms.model.gridServidores.servidores',{
          host: 'Novo Registro',
          ip: 'Novo Registro',
          projeto: 'Novo Registro',
          descricao: 'Novo Registro',
          ambiente: 'Novo Registro',
          os: 'Novo Registro',
          serial: 'Novo Registro',
          tipo: 'Novo Registro',
          pais: 'Novo Registro',
          local: 'Novo Registro',
          situacao: 'Novo Registro',
          decisao: 'criacao',
          procedure: 'cadsrv'
        });
        store.insert(0,novoRegistro);
        grid.gridNovoServer.startEdit(novoRegistro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom){
              store.remove(context.record);
            }
          },
          edit: function(editor, e){
            grid.getSelectionModel().deselectAll(true);
          }
        });
      }
    },
    ServidorDblGrid: function(grid, record, item, index, e, eOpts){
      var win = Ext.create('mypms.view.bizu.winbizu'),
      bizu = Ext.create('mypms.view.bizu.gridbizu'),
      store = bizu.getStore();
      win.setTitle('Relação de Acesso - '+record.get('host'));
      store.load({
        params:{id:record.get('id')}
      }); 
      grid.getSelectionModel().select(record);
    },
    onClickGrid: function(grid, record, item, index, e, eOpts){
      var botaoDel = Ext.ComponentQuery.query('servidorgrid button#del')[0],
      botaoEditar = Ext.ComponentQuery.query('servidorgrid button#editar')[0];
      if(botaoDel.disabled){
        botaoDel.setDisabled(false);
        botaoEditar.setDisabled(false);
      }
    },
    onCancelaClick: function(btn, e, eOpts){
      var grid = Ext.create('mypms.store.setor');
      var win = btn.up('window');
      var form = win.down('form');
      form.getForm().reset();
      win.close();
      grid.load()
    },
    ServidorDel: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var store = grid.getStore();
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record.data['decisao']='delete';
            record.data['procedure']='delappsrv'; 
            store.remove(record);
            store.sync();
          }else{
            grid.getSelectionModel().deselectAll(true);
          }
        }
      });       
    },
    ServidorEdit: function(btn, e, eOpts){
      var grid = btn.up('grid'),
      store = grid.getStore(),
      record = grid.getSelectionModel().getSelection()[0],
      selecao = grid.getSelectionModel().hasSelection();
      if(selecao){
        record.data['decisao']='update';
        record.data['procedure']='srvsalve';        
        grid.gridNovoServer.startEdit(record,1);
      }
    },
    ServidorSalve: function(btn, e, eOpts){
      var grid = btn.up('grid'),
      store = grid.getStore();
      record = grid.getSelectionModel().getSelection()[0],
      selecao = grid.getSelectionModel().hasSelection(),
      linha = grid.getSelectionModel().getSelection()[0];
      if(selecao && record.dirty){
        store.sync();
      }
    },
    ServidorLogout: function(){
      Ext.getBody().mask("Efetuando Logout ...");
      Ext.Ajax.request({
        url: 'php/autentica/logout.php',
        method: 'GET',
        success: function(response){
          var resultado = Ext.JSON.decode(
            response.responseText, true
          );
          if(resultado.success){
            window.location.reload();
          }
        }        
      });
    },
    PainelAdmin: function(grid, record, item, index, e, eOpts){
      this.getViewpainelAdm().show();
      var proj = Ext.create('mypms.view.paineladm.tab.projeto'),
      os = Ext.create('mypms.view.paineladm.tab.os'),
      amb = Ext.create('mypms.view.paineladm.tab.ambiente'),
      pais = Ext.create('mypms.view.paineladm.tab.pais'),
      local = Ext.create('mypms.view.paineladm.tab.local'),
      rede = Ext.create('mypms.view.paineladm.tab.rede'),
      appadm = Ext.create('mypms.view.paineladm.tab.appadm'),
      tiposrv = Ext.create('mypms.view.paineladm.tab.tiposrv'),
      app = Ext.create('mypms.view.paineladm.tab.modeloapp'),
      desc = Ext.create('mypms.view.paineladm.tab.descricao');
      proj.getStore().load({
        params:{decisao:'leitura',seletor:'setor'}
      });
      appadm.getStore().load({
        params:{decisao:'leitura',seletor:'grid'}
      });      
      os.getStore().load({
        params:{decisao:'leitura',seletor:'os'}
      });
      rede.getStore().load({
        params:{decisao:'leitura',seletor:'rede_tipo'}
      });      
      local.getStore().load({
        params:{decisao:'leitura',seletor:'local'}
      });      
      pais.getStore().load({
        params:{decisao:'leitura',seletor:'pais'}
      });      
      amb.getStore().load({
        params:{decisao:'leitura',seletor:'ambiente'}
      });      
      desc.getStore().load({
        params:{decisao:'leitura',seletor:'setor_descricao'}
      });
      app.getStore().load({
        params:{decisao:'leitura',seletor:'app_modelo'}
      });
      tiposrv.getStore().load({
        params:{decisao:'leitura',seletor:'tipo_servidor'}
      });
    },
    Historico: function(btn, e, eOpts){
      var win = Ext.create('mypms.view.historico.winhistorico');
      Ext.ComponentQuery.query('gridhistorico')[0].getStore().load();
    },
    /*
      #
      # Scopo do painel de administrativo Projeto
      #
    */
    ProjetoGrid: function(grid, record, item, index, e, eOpts){
      var linha = grid.getSelectionModel().hasSelection();
      console.log(record.data);
      grid.on('beforeedit', function(e) {
        console.log(e);
      })

    },
    ProjetotabEdit: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var selecao = grid.getSelectionModel().hasSelection();
      var linha = grid.getSelectionModel().getSelection()[0];
      if(selecao){
        grid.gridNovoproj.startEdit(linha,0);
        grid.on({
          cancelEdit: function(){
            grid.getSelectionModel().deselectAll(true);
          },
          edit: function(editor, e){
            record[0].data['decisao']='update';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='projeto';
          }        
        });
      }
    },
    ProjetotabNovo: function(btn, e, eOpts){
      botaoNovo = Ext.ComponentQuery.query('projetotab button#novo')[0];
      var grid = btn.up('grid');
      var store = grid.getStore();
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var novoRegistro = Ext.create('model.paineladm.projeto',{
          projeto: 'Novo registro',
          decisao: 'criacao',
          seletor: 'projeto',
          procedure: 'grpcr'
        });
        store.insert(0,novoRegistro);
        grid.gridNovoproj.startEdit(novoRegistro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom) {
              store.remove(context.record);
            }
          }
        });
      }
    },
    ProjetotabDel: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var store = grid.getStore();     
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record[0].data['decisao']='delete';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='projeto';
            store.remove(record);
            store.sync();
          }else{
            grid.getSelectionModel().deselectAll(true);
          }
        }
      });        
    },
    ProjetotabSalve: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var selecao = grid.getSelectionModel().hasSelection();
      var store = grid.getStore();
      if(record.dirty){
        store.sync();
        grid.getSelectionModel().deselectAll(true);     
      }   
    },
    /*
      #
      # Scopo do painel de administrativo OS
      #
    */
    OstabEdit: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var selecao = grid.getSelectionModel().hasSelection();
      var linha = grid.getSelectionModel().getSelection()[0];
      if(selecao){
        grid.gridNovoOS.startEdit(linha,0);
        grid.on({
          cancelEdit: function(){
            grid.getSelectionModel().deselectAll(true);
          },
          edit: function(editor, e){
            record[0].data['decisao']='update';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='os';
          }        
        });
      }
    },    
    OstabNovo: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var store = grid.getStore();
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var novoRegistro = Ext.create('model.paineladm.os',{
          os: 'Novo registro',
          decisao: 'criacao',
          seletor: 'os',
          procedure: 'grpcr'
        });
        store.insert(0,novoRegistro);
        grid.gridNovoOS.startEdit(novoRegistro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom) {
              store.remove(context.record);
            }
          }
        });
      }
    },
    OstabDel: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var store = grid.getStore();     
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record[0].data['decisao']='delete';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='os';
            store.remove(record);
            store.sync();
          }else{
            grid.getSelectionModel().deselectAll(true);
          }
        }
      });        
    },    
    OstabSalve: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var selecao = grid.getSelectionModel().hasSelection();
      var store = grid.getStore();
      if(record.dirty){
        store.sync();     
      }   
    },
    /*
      #
      # Scopo do painel de administrativo Descricao
      #
    */
    DesctabEdit: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var selecao = grid.getSelectionModel().hasSelection();
      var linha = grid.getSelectionModel().getSelection()[0];
      if(selecao){
        grid.gridNovoDesc.startEdit(linha,0);
        grid.on({
          cancelEdit: function(){
            grid.getSelectionModel().deselectAll(true);
          },
          edit: function(editor, e){
            record[0].data['decisao']='update';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='descricao';
          }        
        });
      }
    },     
    DesctabNovo: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var store = grid.getStore();
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var novoRegistro = Ext.create('model.paineladm.descricao',{
          descricao: 'Novo registro',
          decisao: 'criacao',
          seletor: 'descricao',
          procedure: 'grpcr'
        });
        store.insert(0,novoRegistro);
        grid.gridNovoDesc.startEdit(novoRegistro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom) {
              store.remove(context.record);
            }
          }
        });
      }
    },
    DesctabDel: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var store = grid.getStore();     
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record[0].data['decisao']='delete';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='descricao';
            store.remove(record);
            store.sync();
          }else{
            grid.getSelectionModel().deselectAll(true);
          }
        }
      });        
    },    
    DesctabSalve: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var selecao = grid.getSelectionModel().hasSelection();
      var store = grid.getStore();
      if(record.dirty){
        store.sync();     
      }   
    },
    /*
      #
      # Scopo do painel de administrativo Ambiente
      #
    */
    AmbtabNovo: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var store = grid.getStore();
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var novoRegistro = Ext.create('model.paineladm.ambiente',{
          ambiente: 'Novo registro',
          decisao: 'criacao',
          seletor: 'ambiente',
          procedure: 'grpcr'
        });
        store.insert(0,novoRegistro);
        grid.gridNovoAmb.startEdit(novoRegistro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom) {
              store.remove(context.record);
            }
          }
        });
      }
    },
    AmbtabEdit: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var selecao = grid.getSelectionModel().hasSelection();
      var linha = grid.getSelectionModel().getSelection()[0];
      if(selecao){
        grid.gridNovoAmb.startEdit(linha,0);
        grid.on({
          cancelEdit: function(){
            grid.getSelectionModel().deselectAll(true);
          },
          edit: function(editor, e){
            record[0].data['decisao']='update';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='ambiente';
          }        
        });
      }
    },     
    AmbtabDel: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var store = grid.getStore();     
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record[0].data['decisao']='delete';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='ambiente';
            store.remove(record);
            store.sync();
          }else{
            grid.getSelectionModel().deselectAll(true);
          }
        }
      });        
    },      
    AmbtabSalve: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var selecao = grid.getSelectionModel().hasSelection();
      var store = grid.getStore();
      if(record.dirty){
        store.sync();     
      }   
    },
    /*
      #
      # Scopo do painel de administrativo Pais
      #
    */
    PaistabEdit: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var selecao = grid.getSelectionModel().hasSelection();
      var linha = grid.getSelectionModel().getSelection()[0];
      if(selecao){
        grid.gridNovoPais.startEdit(linha,0);
        grid.on({
          cancelEdit: function(){
            grid.getSelectionModel().deselectAll(true);
          },
          edit: function(editor, e){
            record[0].data['decisao']='update';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='pais';
          }        
        });
      }
    },    
    PaistabNovo: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var store = grid.getStore();
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var novoRegistro = Ext.create('model.paineladm.pais',{
          pais: 'Novo registro',
          decisao: 'criacao',
          seletor: 'pais',
          procedure: 'grpcr'
        });
        store.insert(0,novoRegistro);
        grid.gridNovoPais.startEdit(novoRegistro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom) {
              store.remove(context.record);
            }
          }
        });
      }
    },
    PaistabDel: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var store = grid.getStore();     
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record[0].data['decisao']='delete';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='pais';
            store.remove(record);
            store.sync();
          }else{
            grid.getSelectionModel().deselectAll(true);
          }
        }
      });        
    },     
    PaistabSalve: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var selecao = grid.getSelectionModel().hasSelection();
      var store = grid.getStore();
      if(record.dirty){
        store.sync();     
      }   
    },
    /*
      #
      # Scopo do painel de administrativo Local
      #
    */
    LocaltabEdit: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var selecao = grid.getSelectionModel().hasSelection();
      var linha = grid.getSelectionModel().getSelection()[0];
      if(selecao){
        grid.gridNovoLocal.startEdit(linha,0);
        grid.on({
          cancelEdit: function(){
            grid.getSelectionModel().deselectAll(true);
          },
          edit: function(editor, e){
            record[0].data['decisao']='update';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='local';
          }        
        });
      }
    },    
    LocaltabNovo: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var store = grid.getStore();
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var novoRegistro = Ext.create('model.paineladm.local',{
          local: 'Novo registro',
          decisao: 'criacao',
          seletor: 'local',
          procedure: 'grpcr'
        });
        store.insert(0,novoRegistro);
        grid.gridNovoLocal.startEdit(novoRegistro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom) {
              store.remove(context.record);
            }
          }
        });
      }
    },
    LocaltabDel: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var store = grid.getStore();     
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record[0].data['decisao']='delete';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='local';
            store.remove(record);
            store.sync();
          }else{
            grid.getSelectionModel().deselectAll(true);
          }
        }
      });        
    },        
    LocaltabSalve: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var selecao = grid.getSelectionModel().hasSelection();
      var store = grid.getStore();
      if(record.dirty){
        store.sync();     
      }   
    },
    /*
      #
      # Scopo do painel de administrativo APP
      #
    */
    ModeloapptabEdit: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var selecao = grid.getSelectionModel().hasSelection();
      var linha = grid.getSelectionModel().getSelection()[0];
      if(selecao){
        grid.gridNovoModelo.startEdit(linha,0);
        grid.on({
          cancelEdit: function(){
            grid.getSelectionModel().deselectAll(true);
          },
          edit: function(editor, e){
            record[0].data['decisao']='update';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='app_modelo';
            console.log(record[0].data);
          }        
        });
      }
    },
    ModeloapptabNovo: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var store = grid.getStore();
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var novoRegistro = Ext.create('model.paineladm.modeloapp',{
          modelo: 'Novo registro',
          decisao: 'criacao',
          seletor: 'app_modelo',
          procedure: 'grpcr'
        });
        store.insert(0,novoRegistro);
        grid.gridNovoModelo.startEdit(novoRegistro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom) {
              store.remove(context.record);
            }
          }
        });
      }  
    },
    ModeloapptabDel: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var store = grid.getStore();     
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record[0].data['decisao']='delete';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='app_modelo';
            store.remove(record);
            store.sync();
          }else{
            grid.getSelectionModel().deselectAll(true);
          }
        }
      });        
    },     
    ModeloapptabSalve: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var selecao = grid.getSelectionModel().hasSelection();
      var store = grid.getStore();
      if(record.dirty){
        store.sync();     
      }   
    },    
    /*
      #
      # Scopo do painel de administrativo Rede
      #
    */
    RedetabEdit: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var selecao = grid.getSelectionModel().hasSelection();
      var linha = grid.getSelectionModel().getSelection()[0];
      if(selecao){
        grid.gridNovoRede.startEdit(linha,0);
        grid.on({
          cancelEdit: function(){
            grid.getSelectionModel().deselectAll(true);
          },
          edit: function(editor, e){
            record[0].data['decisao']='update';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='rede_tipo';
          }        
        });
      }
    },    
    RedetabNovo: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var store = grid.getStore();
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var novoRegistro = Ext.create('model.paineladm.rede',{
          tipo: 'Novo registro',
          decisao: 'criacao',
          seletor: 'rede_tipo',
          procedure: 'grpcr'
        });
        store.insert(0,novoRegistro);
        grid.gridNovoRede.startEdit(novoRegistro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom) {
              store.remove(context.record);
            }
          }
        });
      }
    },
    RedetabDel: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection();
      var store = grid.getStore();     
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record[0].data['decisao']='delete';
            record[0].data['procedure']='grpud';
            record[0].data['seletor']='rede';
            store.remove(record);
            store.sync();
          }else{
            grid.getSelectionModel().deselectAll(true);
          }
        }
      });        
    },       
    RedetabSalve: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var selecao = grid.getSelectionModel().hasSelection();
      var store = grid.getStore();
      if(record.dirty){
        store.sync();     
      }   
    },
    AppProjtabSalve: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var store = grid.getStore();
      var appadm = ['nivelid','loginid','projetoid'];
      function valor(value){
        var valor = Ext.ComponentQuery.query('appadm combobox[name='+value+']')[0];
        return valor.getValue();
      }
      function apaga(value){
        var valor = Ext.ComponentQuery.query('appadm combobox[name='+value+']')[0];
        valor.reset();
      }      
      var nivel = valor('nivelid'),
          login = valor('loginid'),
          projeto = valor('projetoid');
      var record = {
        nivel: nivel, 
        login: login, 
        projeto: projeto,
        decisao: 'criacao',
        procedure: 'permisalveadm'
      };
      if(Ext.isEmpty(record.nivel) || 
        Ext.isEmpty(record.login) || 
        Ext.isEmpty(record.projeto)){
        return false;
      }
      store.add(record);
      store.sync({
        success: function(){
          Ext.Array.each(appadm, function(e){
            apaga(e);
          }); 
        },
        failure: function(){
          Ext.Array.each(appadm, function(e){
            apaga(e);
          });                      
          store.load({
            params:{decisao:'leitura',seletor:'grid'}
          });
          Ext.Msg.alert('Aviso !!!', 'Login não consta no projeto ou já existe !!!');
        }
      });
    },
    AppProjtabGrid: function(grid, record, item, index, e, eOpts){
      var botaoDel = Ext.ComponentQuery.query('appadm button#del')[0];
    },
    AppProjtabDel: function(btn, e, eOpts){
      var grid = btn.up('grid'),
      store = grid.getStore(),
      selecao = grid.getSelectionModel().hasSelection(),
      record = grid.getSelectionModel().getSelection()[0];
      if(!selecao){
        return false;
      }
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record.data['decisao']='delete';
            record.data['tabela']='app_nivelacesso';
            store.remove(record);
            store.sync();
          }
        }
      }); 
    },
    AppAmbtabGrid: function(grid, record, item, index, e, eOpts){
      var storedrop = Ext.ComponentQuery.query('appprojdrop grid[itemId=grid1]')[0];
      storedrop.getStore().load({
        params:{
          decisao:'leitura',seletor:'activedirec'
        }        
      });      
      function quadro(value){
        var valor = Ext.ComponentQuery.query('painelAdm [itemId='+value+']')[0];
        return valor;
      };
      quadro('appambid').show();
      quadro('appprojid').hide();
      var record = grid.getSelectionModel().getSelection()[0];
      var store = Ext.create('mypms.view.paineladm.tab.appambdyn');
      store.getStore().load({
        params:{
          decisao:'leitura',seletor:'appAdmdyn',ambiente: 'ambiente',
          procedure:record.data.ambiente,tabela:'permissao_ambiente'
        }
      });
    },
    AppProjtabGrid: function(grid, record, item, index, e, eOpts){
      var storedrop = Ext.ComponentQuery.query('appprojdrop grid[itemId=grid1]')[0];
      storedrop.getStore().load({
        params:{
          decisao:'leitura',seletor:'activedirec'
        }        
      });
      function quadro(value){
        var valor = Ext.ComponentQuery.query('painelAdm [itemId='+value+']')[0];
        return valor;
      }
      quadro('appambid').hide();
      quadro('appprojid').show();
      var record = grid.getSelectionModel().getSelection()[0];
      var store = Ext.create('mypms.view.paineladm.tab.appprojdyn');
      store.getStore().load({
        params:{
          decisao:'leitura',seletor:'appAdmdyn',ambiente: 'projeto',
          procedure:record.data.projeto,tabela:'permissao_projeto'
        }
      });
    },
    /*
      #
      # Scopo do window Bizu
      #
    */
    BizuEdit: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var selecao = grid.getSelectionModel().hasSelection();
      var linha = grid.getSelectionModel().getSelection()[0];
      console.log(linha.data);
      if(selecao){
        if(record.data['nivel'] === 'Pessoal'){
          grid.gridNovobizu.editor.form.findField('nivel').setDisabled(true);
        }else{
          grid.gridNovobizu.editor.form.findField('nivel').setDisabled(false);
        }
        grid.gridNovobizu.startEdit(linha,0);
        grid.on({         
          cancelEdit: function(){
            grid.getSelectionModel().deselectAll(true);
          },
          edit: function(editor, e){
            record.data['decisao']='update';
            record.data['procedure']='bizualtera';
          }        
        });
      }    
    },
    BizuNovo: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var store = grid.getStore();
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var novoRegistro = Ext.create('model.zonaunica.bizu',{
          nivel: 'Ambiente',
          tipo: 'Novo registro',
          login: 'Novo registro',
          ambiente: 'Novo registro',
          senha: 'Novo registro',
          app: 'Novo registro',
          com: 'Novo registro',
          procedure: 'grpcr'
        });
        store.insert(0,novoRegistro);
        grid.gridNovobizu.startEdit(novoRegistro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom) {
              store.remove(context.record);
            }
          },
          edit: function(rowEditing, context){
            if(!context.record.dirty){
              store.remove(context.record);
            }
          }            
        });
      }      
    },
    BizuSalve: function(btn, e, eOpts){
      var grid = btn.up('grid'),
      record = grid.getSelectionModel().getSelection()[0],
      selecao = grid.getSelectionModel().hasSelection(),
      novo = false,
      store = grid.getStore();
      var botao = Ext.ComponentQuery.query('servidorgrid button#novo')[0];
      var gridExt = botao.up('grid');
      var recordExt = gridExt.getSelectionModel().getSelection()[0];
      //record.data['decisao']='update';
      //record.data['procedure']='bizucr';
      if(record.data['decisao'] !== 'update'){
        record.data['id']= recordExt.data['id'];
        record.data['decisao']='criacao';
        record.data['procedure']='bizucr';
        novo = true;
      }
      if(record.dirty){
        store.sync();
        if(novo){
          store.reload({
            sortOnLoad: false,
            sortOnFilter: false,
            params:{
              id: record.get('id')
              //sort: [{property:"id",direction:"DESC"}]
            }
          });
        }
      }
    },
    BizuDel: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var store = grid.getStore();
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record.data['decisao']='delete';
            record.data['procedure']='bizude';
            store.remove(record);
            store.sync();
          }else{
            grid.getSelectionModel().deselectAll(true);
          }
        }
      });        
    },
    /*
      #
      # Scopo do window Redeip
      #
    */
    RedeipGrid: function(){
      var botao = Ext.ComponentQuery.query('gridredeip button#salve')[0];
      botao.setDisabled(true);
    },
    RedeipEdit: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var selecao = grid.getSelectionModel().hasSelection();
      var linha = grid.getSelectionModel().getSelection()[0];
      if(selecao){
        grid.gridNovoRede.startEdit(linha,0);
        grid.on({
          cancelEdit: function(){
            grid.getSelectionModel().deselectAll(true);
          },
          edit: function(editor, e){
            record.data['decisao']='update';
            record.data['procedure']='salveredes';
          }        
        });
      }
    },      
    RedeipNovo: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var store = grid.getStore();
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var novoRegistro = Ext.create('model.redeip.redeip',{
          tipo: 'Novo registro',
          ip_fisico: 'Novo registro',
          ip_nat: 'Novo registro',
          nivel: 'Novo registro',
          subnivel: 'Novo registro',
          decisao: 'criacao',
          procedure: 'cadredes'
        });
        store.insert(0,novoRegistro);
        grid.gridNovoRede.startEdit(novoRegistro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom) {
              store.remove(context.record);
            }
          }
        });      
      }  
    },
    RedeipSalve: function(btn, e, eOpts){
      var grid = btn.up('grid'),
      record = grid.getSelectionModel().getSelection()[0],
      selecao = grid.getSelectionModel().hasSelection(),
      servidor = Ext.ComponentQuery.query('servidorgrid')[0],
      store = grid.getStore();
      var botao = Ext.ComponentQuery.query('servidorgrid button#novo')[0];
      var gridExt = botao.up('grid');
      var recordExt = gridExt.getSelectionModel().getSelection()[0]; 
      if(record.dirty && record.data['decisao'] == 'criacao'){
        store.filterBy(function(e){
          if(e.data['nivel'] == 'Primario' && e.data['id_servidor'] == recordExt.data['id']){
            e.data['nivel'] = 'Secundario';
          }
        });
        store.clearFilter('true');
        record.data['id']= recordExt.data['id'];
      }else if(record.dirty && record.data['decisao'] == 'update'){
        store.filterBy(function(e){
          if(e.data['nivel'] == 'Primario' && e.data['id'] != record.data['id']){
            e.data['nivel'] = 'Secundario';
          }
        });
        store.clearFilter('true');
      }
      if(record.dirty){
        store.sync({
          success: function(){
            servidor.getStore().load();
            store.load({
              params:{id: recordExt.data['id'], decisao: 'rede'}
            });            
          },
          failure: function(){
            store.load({
              params:{id: recordExt.data['id'], decisao: 'rede'}
            });            
          }
        });
      }
    },
    RedeipDel: function(btn, e, eOpts){
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var store = grid.getStore();
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            record.data['decisao']='delete';
            record.data['procedure']='delredes';
            store.remove(record);
            store.sync();
            grid.getSelectionModel().deselectAll(true);
          }else{
            grid.getSelectionModel().deselectAll(true);
          }
        }
      });       
    },
    Audit: function(grid, eOpts){
      var win = Ext.create('mypms.view.auditor.winaudit');
      this.getStore('audit').load();
      //this.getViewgridauditor().setDisabled(true);
    },
    AuditGrid: function(grid, record, item, index, e, eOpts){
      var selecao = grid.getSelectionModel();
      if(selecao.hasSelection()){
        this.getViewgridauditorDel().setDisabled(false);
      }
    },
    AuditNovo: function(btn, e, eOpts){
      var me = this;
      var grid = btn.up('grid');
      var store = grid.getStore();
      grid.getSelectionModel().deselectAll(true);
      var selecao = grid.getSelectionModel().hasSelection();
      var record = grid.getSelectionModel().getSelection();
      if(!selecao){
        var registro = Ext.create('model.audit.auditor', {
          login: 'Novo registro'
        });
        store.insert(0,registro);
        grid.gridNovoaudit.startEdit(registro,0);
        grid.on({
          cancelEdit: function(rowEditing, context){
            if(context.record.phantom) {
              store.remove(context.record);
            }
          },
          Edit: function(rowEditing, context){
            if(context.record.get('login') === 'Novo registro'){
              store.remove(context.record);
            }else{
              me.getViewgridauditorSalve().setDisabled(false);
            }
          }
        });
      }
      this.getViewgridauditorDel().setDisabled(true);  
    },
    AuditSalve: function(btn, e, eOpts){
      var me = this;
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var selecao = grid.getSelectionModel().hasSelection();
      var store = grid.getStore();
      if(!selecao){
        return false;
      }
      if(record.dirty){
        record.data['decisao']='criacao';
        store.sync({
          failure: function(){
            store.remove(record);
            Ext.MessageBox.show({
              icon: Ext.Msg.WARNING,
              buttons: Ext.Msg.OK,
              closable: false,
              title: 'Atenção',
              msg: 'Login não existe ou não pertence à nenhum projeto',
              buttons: Ext.MessageBox.OK,
              fn: function(btn, env){
                if(btn == 'ok'){
                  me.getViewgridauditorSalve().setDisabled(true);
                }
              }
            })
          }
        });        
      }       
    },
    AuditDel: function(btn, e, eOpts){
      var me = this;
      var grid = btn.up('grid');
      var record = grid.getSelectionModel().getSelection()[0];
      var store = grid.getStore();
      Ext.MessageBox.show({
        icon: Ext.MessageBox.QUESTION,
        title:'Excluir',
        msg: 'Tem certeza que deseja excluir ?',
        buttons: Ext.MessageBox.YESNO,
        fn: function(btn, ev){
          if(btn == 'yes'){
            me.getViewgridauditorDel().setDisabled(true);
            record.data['decisao']='delete';
            store.remove(record);
            store.sync();
          }else{
            me.getViewgridauditorDel().setDisabled(true);
            grid.getSelectionModel().deselectAll(true);
          }
        }
      }); 
    }
});
