Ext.application({
    name: 'mypms',

    extend: 'mypms.Application',

    controllers: [
      'Servidores',
      'autentica'
    ],
    //Ext.QuickTips.init();
    autoCreateViewport: true
});
