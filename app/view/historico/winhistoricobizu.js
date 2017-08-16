Ext.define('mypms.view.historico.winhistoricobizu', {
  extend: 'Ext.window.Window',
  alias : 'widget.winhistoricobizu',
  layout: 'fit',
  width: 450,
  height: 200,
  maxWidth: 450,
  maxHeight: 200,
  autoShow: true,
  plain: true,
  closable: true,
  floating: true,
  border: false,
  titleAlign: 'center',
  items: [{
    border: true,
    xtype: 'gridhistoricobizu'
  }],
              initComponent: function(){
                var me = this;
                me.callParent(arguments);
                me.mon(Ext.getBody(), 'click', function(el, e) {
                    me.close(me.closeAction);
                }, me, {
                    delegate: '.x-mask'
                });
            }
});