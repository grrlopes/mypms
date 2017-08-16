Ext.define('mypms.view.servidores.gridForm' ,{
  extend: 'Ext.window.Window',
  alias : 'widget.gridForm',
  width: 300,
  height: 320,
  layout: 'fit',
  iconCls: 'title',
  title: 'Edita/Cadastrar',
  autoShow: true,
  modal: true,
  border: false,
  closable: false,
  items: [{
    xtype: 'form',
    bodyPadding: 3,
    overflowY: 'auto',
    defaults: {
      anchor: '90%'
    },
    items: [{
      xtype: 'textfield',
      name: 'host',
      fieldLabel: 'Hostname',
      allowBlank: false
    },{
      xtype: 'textfield',
      name: 'pais',
      fieldLabel: 'País',
      allowBlank: false
    },{
      xtype: 'textfield',
      name: 'serial',
      fieldLabel: 'Serial',
      allowBlank: false
    },{
      xtype: 'textfield',
      name: 'os',
      fieldLabel: 'OS',
      allowBlank: false
    },{
      xtype: 'textfield',
      name: 'ip',
      fieldLabel: 'IP',
      allowBlank: false
    },{
      xtype: 'textfield',
      name: 'tipo',
      fieldLabel: 'Tipo',
      allowBlank: false
    },{
      xtype: 'textfield',
      name: 'ambiente',
      fieldLabel: 'Ambiente',
      allowBlank: false
    },{
      xtype: 'textfield',
      name: 'projeto',
      fieldLabel: 'Projeto',
      allowBlank: false
    },{
      xtype: 'textfield',
      name: 'descricao',
      fieldLabel: 'Descricao',
      allowBlank: false
    },{
      xtype: 'textfield',
      name: 'local',
      fieldLabel: 'Local',
      allowBlank: false
    },{
      xtype: 'textfield',
      name: 'situacao',
      fieldLabel: 'Status',
      allowBlank: false
    }],
    dockedItems: [{
        xtype: 'toolbar',
        dock: 'bottom',
        layout: {
          type: 'hbox',
          pack: 'end'
        },
        items: [{
          itemId: 'cancela',
          xtype: 'button',
          text: 'Cancelar',
          iconCls: 'icon-cancela'
        },'-',{
          itemId: 'salvar',
          xtype: 'button',
          text: 'Salvar',
          iconCls: 'icon-save'
        }]
    }]
  }]
});
