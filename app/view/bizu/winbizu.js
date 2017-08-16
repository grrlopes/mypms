Ext.define('mypms.view.bizu.winbizu', {
  extend: 'Ext.window.Window',
  alias : 'widget.winbizu',
  layout: 'fit',
  width: 700,
  height: 400,
  maxWidth: 800,
  maxHeight: 500,
  minWidth: 500,
  minHeight: 300,
  autoShow: true,
  modal: true,
  plain: true,
  closable: true,
  border: false,
  titleAlign: 'center',
  items: [{
    border: true,
    xtype: 'gridbizu'
  }]
});