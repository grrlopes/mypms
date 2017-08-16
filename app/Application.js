Ext.define('mypms.Application', {
    name: 'mypms',

    extend: 'Ext.app.Application',

    requires: [
      'Ext.toolbar.Paging',
      'Ext.form.Panel',
      'Ext.grid.plugin.RowEditing',
      'Ext.form.field.ComboBox',
      'Ext.layout.container.Accordion',
      'Ext.util.Point',
      'Ext.tab.Panel',
      'Ext.data.proxy.Rest'
    ],

    views: [],

    controllers: [
      'Servidores',
      'autentica'
    ],

    stores: [
      'servidores',
      'os',
      'descricao',
      'ambiente',
      'pais',
      'local',
      'rede',
      'tiposrv',
      'tipoapp',
      'modeloapp',
      'bizu',
      'redeip',
      'redeiptipo',
      'redeipnivel',
      'redeipsubnivel',
      'appadm',
      'appadmnivel',
      'appadmlogin',
      'appadmproj',
      'appamblogin',
      'appprojdyn',
      'appambdyn',
      'admadlogin',
      'projeto',
      'setor',
      'nivelacesso',
      'historicosrv',
      'historicoip',
      'historicobizu',
      'autenticacao',
      'audit'
    ]
});
