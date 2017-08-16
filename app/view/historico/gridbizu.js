Ext.define('mypms.view.historico.gridbizu',{
    extend: 'Ext.grid.Panel',
    alias : 'widget.gridhistoricobizu',
    store: 'historicobizu',
    border: false, 
    columns: [{
    	header: "Tipo",
    	flex: 1,
    	dataIndex: 'tipo'
    },{
    	header: "Login",
    	flex: 1,
    	dataIndex: 'login'
    },{
    	header: "Ambiente",
    	flex: 1,
    	dataIndex: 'ambiente'
    },{
    	header: "Senha",
    	flex: 1,
    	dataIndex: 'senha'
    },{
    	header: "Aplicação",
    	flex: 1,
    	dataIndex: 'modelo'
    },{
    	header: "Comentário",
    	flex: 1,
    	dataIndex: 'comentario'
    }]
});
