Ext.define('mypms.view.Viewport', {
  extend: 'Ext.container.Viewport',
  requires:[
    'Ext.layout.container.Border',
    'mypms.view.servidores.grid',
    'mypms.view.autentica.login'
  ],
  layout: {
    type: 'border'
  }/*
  items: [{
    region: 'center',
    xtype: 'winlogin',
    margins: {
      top: 2, bottom: 2,
      left: 2, right: 2
    },
  }] */
});
