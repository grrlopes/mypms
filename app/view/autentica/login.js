Ext.define('mypms.view.autentica.login', {
    extend: 'Ext.form.Panel',
    alias: 'widget.authlogin',
    frame:  false,
    modal: true,
    bodyPadding: 10,
    defaultType: 'textfield',
    defaults: {
        anchor: '100%'
    },
    initComponent: function(){
        var me = this;
        Ext.applyIf(me, {
            items: [{
                xtype: 'textfield',
                itemId: 'user',
                name: 'user',
                fieldLabel: 'Login',
                allowBlank: false
            },
            {
                xtype: 'textfield',
                itemId: 'pass',
                name: 'pass',
                fieldLabel: 'Senha',
                inputType: 'password',
                allowBlank: false
            }],
            dockedItems: [{
                xtype: 'toolbar',
                dock: 'bottom',
                ui: 'footer',
                layout: {
                    pack: 'end',
                    type: 'hbox'
                },
                items: [{
                    xtype: 'button',
                    formBind: true,
                    itemId: 'logar',
                    text: 'Logar',
                    action: 'submit'
                }]
            }]
        });
            me.callParent(arguments);
    }
});