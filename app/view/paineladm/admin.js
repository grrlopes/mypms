Ext.define('mypms.view.paineladm.admin', {
  extend: 'Ext.window.Window',
  alias : 'widget.painelAdm',
  layout: 'fit',
  width: 700,
  height: 400,
  maxWidth: 800,
  maxHeight: 500,
  minWidth: 500,
  minHeight: 300,
  //autoShow: true,
  modal: true,
  plain: true,
  closable: true,
  closeAction:'hide',
  border: false,
  title: 'Painel Administrativo',
  titleAlign: 'center',
  bbar: [
    {
      text: 'Close',
      align: 'right',
      handler: function () {
        var kkk = this.up('window');
        //this.up('window').destroy();
        //kkk.hide();
        //window.location.reload();
      }
    }
  ],  
  items: [{
    activeTab: 8,
    xtype: 'tabpanel',
    defaults: {
      //autoScroll: true,
      //overflowY: 'auto'
    },
    items: [
      {
        title: 'Projeto',
        xtype: 'projetotab'
      },{
        title: 'OS',
        items: [{
          xtype: 'ostab'
        }]
      },{
        title: 'Descricao',
        xtype: 'desctab'
      },{
        title: 'App',
        xtype: 'modeloapptab'
      },{
        title: 'Ambiente',
        xtype: 'ambtab'
      },{
        title: 'País',
        xtype: 'paistab'
      },{
        title: 'Local',
        xtype: 'localtab'
      },{
        title: 'Rede',
        xtype: 'redetab'
      },{
        title: 'Amb/Proj',
        tooltip: 'Concede permissão de \
        visualização de senhas por projeto e nível',
        xtype: 'appadm'
      },{
        //#######
        title: 'AmbProj/Adm',
        layout: {
          type: 'border',
          border: false
        },
        items: [{
            region: 'south',
            xtype: 'panel',
            height: 200,
            split: true,
            layout: 'fit',
            margins: '0 3 3 3',
            items: [{
              layout: {
                  type: 'hbox',
                  align: 'stretch',
                  border: false
              },
              items: [{
                //teste dragdrop --> agora
                  hidden: true,
                  itemId: 'appprojid',
                  xtype: 'appprojdrop',
                  padding: '2 2 2 2',
                  flex: 1            
              },{
                  hidden: true,
                  itemId: 'appambid',
                  xtype: 'appambdrop',
                  padding: '2 2 2 2',
                  flex: 1
              }/*,{
                  hidden: true,
                  itemId: 'appprojid',
                  xtype: 'appprojdynn',
                  padding: '2 2 2 2',
                  flex: 1
              }*/]    
            }]
        },{
            region:'west',
            xtype: 'panel',
            width: 0
        },{
            region: 'center',
            xtype: 'panel',
            layout: 'fit',
            margins: '5 5 0 0',
            items: [{
              layout: {
                  type: 'accordion',
                  titleCollapse: true,
                  animate: true,
                  activeOnTop: true
              },
              items: [{
                  title: 'Ambiente',
                  xtype: 'appamb'
              },{
                  title: 'Projeto',
                  xtype: 'appproj'
              }]              
            }]
        }]
        //####
      }
    ]
  }]
});
