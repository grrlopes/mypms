Ext.define('mypms.view.autentica.winlogin', {
  extend: 'Ext.window.Window',
  alias : 'widget.winlogin',
  layout: 'fit',
  width: 300,
  height: 150,
  resizable: false,
  autoShow: true,
  plain: true,
  closable: false,
  border: true,
  titleAlign: 'left',
  title: 'Credencial Indproj',
  items: [{
    border: true,
    xtype: 'authlogin'
  }]
});