Ext.define('mypms.view.historico.winhistoricoip', {
  extend: 'Ext.window.Window',
  alias : 'widget.winhistoricoip',
  layout: 'fit',
  width: 450,
  height: 200,
  maxWidth: 450,
  maxHeight: 200,
  autoShow: true,
  plain: true,
  closable: true,
  border: false,
  titleAlign: 'center',
  items: [{
    border: true,
    xtype: 'gridhistoricoip'
  }]
});