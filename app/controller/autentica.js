Ext.define('mypms.controller.autentica', {
    extend: 'Ext.app.Controller',
    stores: [
        'mypms.store.autenticacao'
    ],
    models: [
        'mypms.model.autentica.auth'
    ],
    views: [
        'mypms.view.servidores.grid',
        'mypms.view.autentica.winlogin',
        'mypms.view.autentica.login'
    ],

    refs : [{
        ref: 'Viewwinlogin',
        selector: 'winlogin'
    },{
        ref: 'Viewauthlogin',
        selector: 'authlogin'        
    },{
        ref: 'Viewservidorgridpadm',
        selector: 'servidorgrid button#padm'
    },{
        ref: 'Viewservidorgridhist',
        selector: 'servidorgrid button#historico'
    }],

    init: function(application){
        this.control({
            'viewport': {
                render: this.viewlogin
            },
            "authlogin button#logar": {
                click: this.autentica,
                specialkey: this.autentica
            }
        })
    },
    viewlogin: function(view){
        var store = this.getStore('autenticacao'),
        me = this;
        Ext.Ajax.request({
            url: 'php/autentica/auth.php',
            success: function(conn, response, options, eOpts){
                var result = Ext.JSON.decode(conn.responseText, true);
                if(!result){
                    result = {};
                    result.success = false;
                    result.msg = conn.responseText;
                }
                if(result.success){                
                    view.removeAll();
                    view.add({
                        region: 'center',
                        xtype:'servidorgrid',
                        margins: {
                            top: 3, bottom: 3,
                            left: 3, right: 3
                        }                
                    });
                    me.getViewservidorgridpadm().setDisabled(result.adm);
                    me.getViewservidorgridhist().setDisabled(result.adm);
                }else{                  
                    view.removeAll();
                    view.add({
                        region: 'center',
                        xtype:'winlogin',
                        margins: {
                            top: 2, bottom: 2,
                            left: 2, right: 2
                        }               
                    });                                       
                }
            }
        });
    },
    autentica: function(btn, e, eOpts){
        if(e.getKey() === e.ENTER){};
        var win = btn.up('window'),
        me = this,
        form = win.down('form'),
        valores = form.getValues(),
        store = this.getStore('autenticacao');
        var mask = new Ext.LoadMask(Ext.getBody(), {msg:"Aguarde..."});
        mask.show();
        Ext.Ajax.request({
            url: 'php/autentica/auth.php',
            params: {
                user: valores.user,
                pass: valores.pass
            },
            success: function(conn, response, options, eOpts){
                var result = Ext.JSON.decode(conn.responseText, true);
                if(!result){
                    result = {};
                    result.success = false;
                    result.msg = conn.responseText;
                }
                if(result.success){
                    mask.hide();
                    me.getViewwinlogin().hide();
                    Ext.viewport = Ext.create('Ext.container.Viewport', {
                        layout: {
                            type: 'border'
                        },
                        items: [{
                            region: 'center',
                            xtype: 'servidorgrid',
                            margins: {
                            top: 2, bottom: 2,
                            left: 2, right: 2
                            }
                        }]             
                    });
                }else{
                    mask.hide();
                    Ext.Msg.show({
                        title:'Falha na credencial !!!',
                        msg: result.msg,
                        icon: Ext.Msg.ERROR,
                        buttons: Ext.Msg.OK,
                        fn: function(btn, ev){
                            if(btn === 'ok'){
                                
                            }
                        }
                    });
                }
            },
            failure: function(conn, response, options, eOpts){
                Ext.Msg.show({
                    title:'Erro - Contate Administrador do sistema!',
                    msg: conn.responseText,
                    icon: Ext.Msg.ERROR,
                    buttons: Ext.Msg.OK
                });
            }
        });
    }
});