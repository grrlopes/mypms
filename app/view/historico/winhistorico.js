Ext.define('mypms.view.historico.winhistorico', {
  extend: 'Ext.window.Window',
  alias : 'widget.winhistorico',
   requires:['Ext.ux.form.SearchField'],
  layout: 'fit',
  width: 950,
  height: 444,
  maxWidth: 1050,
  maxHeight: 500,
  minWidth: 500,
  minHeight: 300,
  autoShow: true,
  modal: true,
  plain: true,
  closable: true,
  border: false,
  title: 'Histórico',
  titleAlign: 'center',
  items: [{
    border: true,
    xtype: 'gridhistorico'
  }]
});