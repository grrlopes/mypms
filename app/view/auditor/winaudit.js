Ext.define('mypms.view.auditor.winaudit', {
  extend: 'Ext.window.Window',
  alias : 'widget.winauditor',
  layout: 'fit',
  width: 350,
  height: 254,
  resizable: false,
  autoShow: true,
  modal: true,
  plain: true,
  closable: true,
  border: false,
  title: 'Administrador',
  titleAlign: 'center',
  items: [{
    border: true,
    xtype: 'gridauditor'
  }]
});